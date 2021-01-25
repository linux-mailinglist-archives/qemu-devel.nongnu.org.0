Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC73302999
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:08:49 +0100 (CET)
Received: from localhost ([::1]:51042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46IC-00070s-IV
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l46Bn-0001Ut-4Z
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:02:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l46Bb-0006lN-2A
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:02:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611597718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fO5l1H3AbgtIwouR0SgflLH80EvMaF1QouU7dek2TzA=;
 b=HjiqF/XgmIn3SYrpx+mbSYrzl350TWXaHSNa/rR7zs17h+j+Nzh8jgK/mAta2Q3TYjfGhf
 kOWS2HotRtZ+iJk6xUV5Rx2RFX3rG6vfuwZrcJaJjGU7ox7o6QmnFL3DGOSCFEDuizFzTQ
 U8fSS++NWEQ5drrxxKL4MFbXrepJfJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-xI261GXVPcygLOWFo4Cr_Q-1; Mon, 25 Jan 2021 13:01:56 -0500
X-MC-Unique: xI261GXVPcygLOWFo4Cr_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54DCE8049C5
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 18:01:55 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-119.rdu2.redhat.com [10.10.116.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A105319D7D;
 Mon, 25 Jan 2021 18:01:38 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 313F822054F; Mon, 25 Jan 2021 13:01:38 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [RFC PATCH 0/6] vhost-user: Shutdown/Flush slave channel properly
Date: Mon, 25 Jan 2021 13:01:09 -0500
Message-Id: <20210125180115.22936-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

We are working on DAX support in virtiofs and have some patches out of
the tree hosted here.

https://gitlab.com/virtio-fs/qemu/-/commits/virtio-fs-dev

These patches have not been proposed for merge yet, becasue David
Gilbert noticed that we can run into a deadlock during an emergency
reboot of guest kernel. (echo b > /proc/sysrq-trigger).

I have provided details of deadlock in 4th path of the series with
subject "qemu, vhost-user: Extend protocol to start/stop/flush slave
channel".

Basic problem seems to be that we don't have a proper mechanism to
shutdown slave channel when vhost-user device is stopping. This means
there might be pending messages in slave channel and slave is blocked
and waiting for response.

This is an RFC patch series to enhance vhost-user protocol to 
properly shutdown/flush slave channel and avoid the deadlock. Though
we faced the issue in the context of virtiofs, any vhost-user
device using slave channel can potentially run into issues and
can benefit from these patches.

Any feedback is welcome. Currently patches are based on out of
tree code but after I get some feedback, I can only take pieces
which are relevant to upstream and post separately.

Thanks
Vivek

Vivek Goyal (6):
  virtiofsd: Drop ->vu_dispatch_rwlock while waiting for thread to exit
  libvhost-user: Use slave_mutex in all slave messages
  vhost-user: Return error code from slave_read()
  qemu, vhost-user: Extend protocol to start/stop/flush slave channel
  libvhost-user: Add support to start/stop/flush slave channel
  virtiofsd: Opt in for slave start/stop/shutdown functionality

 hw/virtio/vhost-user.c                    | 151 +++++++++++++++++++++-
 subprojects/libvhost-user/libvhost-user.c | 147 +++++++++++++++++----
 subprojects/libvhost-user/libvhost-user.h |   8 +-
 tools/virtiofsd/fuse_virtio.c             |  20 +++
 4 files changed, 294 insertions(+), 32 deletions(-)

-- 
2.25.4


