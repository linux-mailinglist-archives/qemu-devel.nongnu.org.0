Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304B928237B
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Oct 2020 12:03:18 +0200 (CEST)
Received: from localhost ([::1]:49642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOeNo-00058W-Uq
	for lists+qemu-devel@lfdr.de; Sat, 03 Oct 2020 06:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kOeMW-0004Mb-0E
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 06:01:56 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:34447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kOeMT-0002wX-UI
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 06:01:55 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-uNrKKprfMHOGpQcR7fbb3Q-1; Sat, 03 Oct 2020 06:01:48 -0400
X-MC-Unique: uNrKKprfMHOGpQcR7fbb3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D849B801ADE;
 Sat,  3 Oct 2020 10:01:46 +0000 (UTC)
Received: from bahia.lan (ovpn-112-192.ams2.redhat.com [10.36.112.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C6135D9D3;
 Sat,  3 Oct 2020 10:01:41 +0000 (UTC)
Subject: [PATCH v3 0/3] vhost: Skip access checks on GIOVAs
From: Greg Kurz <groug@kaod.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Date: Sat, 03 Oct 2020 12:01:40 +0200
Message-ID: <160171888144.284610.4628526949393013039.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/03 06:01:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series addresses some misuse around vring addresses provided by
userspace when using an IOTLB device. The misuse cause failures of
the VHOST_SET_VRING_ADDR ioctl on POWER, which in turn causes QEMU
to crash at migration time.

Jason suggested that we should use vhost_get_used_size() during the
review of v2. Fixed this in a preliminary patch (patch 2) and rebased
the vq_log_used_access_ok() helper on top (patch 3).

Note that I've also posted a patch for QEMU so that it skips the used
structure GIOVA when allocating the log bitmap. Otherwise QEMU fails to
allocate it because POWER puts GIOVAs very high in the address space (ie.
over 0x800000000000000ULL).

https://patchwork.ozlabs.org/project/qemu-devel/patch/160105498386.68108.21=
45229309875282336.stgit@bahia.lan/

v3:
 - patch 1: added Jason's ack
 - patch 2: new patch to use vhost_get_used_size()
 - patch 3: rebased patch 2 from v2

v2:
 - patch 1: move the (vq->ioltb) check from vhost_vq_access_ok() to
            vq_access_ok() as suggested by MST
 - patch 2: new patch

---

Greg Kurz (3):
      vhost: Don't call access_ok() when using IOTLB
      vhost: Use vhost_get_used_size() in vhost_vring_set_addr()
      vhost: Don't call log_access_ok() when using IOTLB


 drivers/vhost/vhost.c |   33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

--
Greg


