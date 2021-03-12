Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B671338886
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:24:15 +0100 (CET)
Received: from localhost ([::1]:58842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKe1m-0001oI-Aj
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKe0E-00007E-Oy
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:38 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:24241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKe0C-0003xV-Oe
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:38 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-WloVzSO6NmuNRIa17LPhfQ-1; Fri, 12 Mar 2021 04:22:24 -0500
X-MC-Unique: WloVzSO6NmuNRIa17LPhfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE8151898286;
 Fri, 12 Mar 2021 09:22:23 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 805F260C9B;
 Fri, 12 Mar 2021 09:22:13 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] virtiofsd: Avoid potential deadlocks
Date: Fri, 12 Mar 2021 10:22:05 +0100
Message-Id: <20210312092212.782255-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A deadlock condition potentially exists if a vhost-user process needs=0D
to request something to QEMU on the slave channel while processing a=0D
vhost-user message.=0D
=0D
This doesn't seem to affect any vhost-user implementation so far, but=0D
this is currently biting the upcoming enablement of DAX with virtio-fs.=0D
The issue is being observed when the guest does an emergency reboot while=
=0D
a mapping still exits in the DAX window, which is very easy to get with=0D
a busy enough workload (e.g. as simulated by blogbench [1]) :=0D
=0D
- QEMU sends VHOST_USER_GET_VRING_BASE to virtiofsd.=0D
=0D
- In order to complete the request, virtiofsd then asks QEMU to remove=0D
  the mapping on the slave channel.=0D
=0D
All these dialogs are synchronous, hence the deadlock.=0D
=0D
Another deadlock condition exists in the virtiofsd code itself, related=0D
to the use of the vu_dispatch rwlock.=0D
=0D
This series supercedes Vivek's previous tentative [1] to fix the deadlocks.=
=0D
Basically, instead of introducing new vhost-user protocol message to=0D
specifically shutdown the slave channel, this series introduces a nested=0D
event loop in vhost_user_read() as suggested by Stefan Hajnoczi. This=0D
allows to monitor and service requests on the slave channel while=0D
waiting for virtiofsd to answer to a vhost-user request.=0D
=0D
This was tested with the latest DAX patchset posted to the virtio-fs=0D
list [2], rebased on top of the present series [3]. Testing scenario=0D
is:=0D
1) start VM with DAX capable vhost-user-fs device=0D
2) mount -o dax in the guest=0D
3) run Blogbench [4] in virtiofs mount=0D
4) wait 10s, which is enough to have active mappings=0D
5) echo b > /proc/sysrq-trigger=0D
6) wait for the guest to reboot and start over from step 2=0D
=0D
Without this series, only a couple of reboots ( < 5) are needed to=0D
hit a deadlock. With this series applied, an overnight test could=0D
reboot the guest 1500+ times without any issues.=0D
=0D
[1] https://listman.redhat.com/archives/virtio-fs/2021-January/msg00073.htm=
l=0D
=0D
[2] https://listman.redhat.com/archives/virtio-fs/2021-February/msg00058.ht=
ml=0D
=0D
[3] Tree with this series + DAX available at:=0D
=0D
    https://gitlab.com/gkurz/qemu/-/commits/virtio-fs-dax-no-deadlock=0D
=0D
[4] https://github.com/jedisct1/Blogbench=0D
=0D
Changes since v2:=0D
 - added some preliminary fixes and cleanups for the slave channel code=0D
 - re-factored some code and addressed comments (see individual patches)=0D
 - more testing=0D
=0D
Greg Kurz (7):=0D
  vhost-user: Drop misleading EAGAIN checks in slave_read()=0D
  vhost-user: Fix double-close on slave_read() error path=0D
  vhost-user: Factor out duplicated slave_fd teardown code=0D
  vhost-user: Convert slave channel to QIOChannelSocket=0D
  vhost-user: Introduce nested event loop in vhost_user_read()=0D
  vhost-user: Monitor slave channel in vhost_user_read()=0D
  virtiofsd: Release vu_dispatch_lock when stopping queue=0D
=0D
 hw/virtio/vhost-user.c        | 217 +++++++++++++++++++++-------------=0D
 tools/virtiofsd/fuse_virtio.c |   6 +=0D
 2 files changed, 144 insertions(+), 79 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


