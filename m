Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EEF44ED6E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 20:40:38 +0100 (CET)
Received: from localhost ([::1]:49866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlcPd-0008DY-Cm
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 14:40:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mlcKJ-0003Wg-4s
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 14:35:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mlcKG-0007z6-Uq
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 14:35:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636745700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3NlTKCv+dB2uLiS+nu6ZWpM01wn+xk+NhHBbif2PWUE=;
 b=BuyePA1h9ILeytKtiTI/V7V1OauNmZSfWn8g3F28YECXVa9z1GIb7AZixrdA4RnyzV53UB
 gDC/lxyMKsMWRbSaEQbGZynISUNzNvhATG99u/qMiNG0+uMciGk9kIa8pdJTuNE4yjsYt6
 x7npCu2bGojdkDIdjOFrSph6o5j6XTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-x2k6HkZrMLm8leF4R445WA-1; Fri, 12 Nov 2021 14:34:57 -0500
X-MC-Unique: x2k6HkZrMLm8leF4R445WA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AF7315722;
 Fri, 12 Nov 2021 19:34:56 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE6F419723;
 Fri, 12 Nov 2021 19:34:50 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] vdpa: Check for existence of opts.vhostdev
Date: Fri, 12 Nov 2021 20:34:31 +0100
Message-Id: <20211112193431.2379298-3-eperezma@redhat.com>
In-Reply-To: <20211112193431.2379298-1-eperezma@redhat.com>
References: <20211112193431.2379298-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since net_init_vhost_vdpa is trying to open it. Not specifying it in the
command line crash qemu.

Fixes: 7327813d17 ("vhost-vdpa: open device fd in net_init_vhost_vdpa()")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 6ffb29f4da..bbd3576f23 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -260,6 +260,10 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
+    if (!opts->vhostdev) {
+        error_setg(errp, "vdpa character device not specified with vhostdev");
+        return -1;
+    }
 
     vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
     if (vdpa_device_fd == -1) {
-- 
2.27.0


