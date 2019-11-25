Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EC4109136
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 16:46:33 +0100 (CET)
Received: from localhost ([::1]:45572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZGZL-0005Fm-TA
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 10:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33945)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1iZGTQ-0000C0-Ro
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 10:40:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1iZGTP-0002OC-Bn
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 10:40:24 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27820
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1iZGTP-0002N2-7U
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 10:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574696422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/r48QDVkIew/2iuv/vLqFDvHS62as2rMwRzoaxrIwbM=;
 b=XgNCCi4Qsz6VFJBWPMCL3DB3UNvo7FZv452jtenotAVeJd8D22pA7gpbElunlR4Jq8I1WU
 40LQOoIcasLQtJlN/Itywgy0iDAE3AFQD09VFjiZopb8+WtP4VNgzcGJccXvSz2ykXcmea
 Fcxu9mw/7ynkx2nSqlJKf34IOx8Q2K4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-gTf_oTU9M3KT0l9EDZvcJg-1; Mon, 25 Nov 2019 10:40:18 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5633DBB0;
 Mon, 25 Nov 2019 15:40:17 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-31.pek2.redhat.com
 [10.72.12.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 054845D9CA;
 Mon, 25 Nov 2019 15:40:15 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 2/4] net/virtio: return early when failover primary alread added
Date: Mon, 25 Nov 2019 23:40:05 +0800
Message-Id: <1574696407-4188-3-git-send-email-jasowang@redhat.com>
In-Reply-To: <1574696407-4188-1-git-send-email-jasowang@redhat.com>
References: <1574696407-4188-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: gTf_oTU9M3KT0l9EDZvcJg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Jason Wang <jasowang@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jens Freimann <jfreimann@redhat.com>

Bail out when primary device was already added before.
This avoids printing a wrong warning message during reboot.

Fixes: 9711cd0dfc3f ("net/virtio: add failover support")
Signed-off-by: Jens Freimann <jfreimann@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 946039c..ac4d191 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -759,6 +759,10 @@ static void failover_add_primary(VirtIONet *n, Error *=
*errp)
 {
     Error *err =3D NULL;
=20
+    if (n->primary_dev) {
+        return;
+    }
+
     n->primary_device_opts =3D qemu_opts_find(qemu_find_opts("device"),
             n->primary_device_id);
     if (n->primary_device_opts) {
--=20
2.5.0


