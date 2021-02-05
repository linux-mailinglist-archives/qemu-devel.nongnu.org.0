Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A1D3105BA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:21:04 +0100 (CET)
Received: from localhost ([::1]:38738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vQN-00021v-EM
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v3A-0001WG-Hd
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v38-0001Fa-Mg
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uo4HJEhqMpYFkCa32XgQU8FGUj/c7CCsvBNSV9bVz3I=;
 b=Wk1kc0Zm2DW7/yEGkOTJQ/SozSBaW6FGtDVz1jfMFW3yMEdmvlvX73C4UEwpNfnL0KaFYm
 +4wQ5k/u2BtX8YOdb5uMkk46iUZMEMTG7H6eCQhxWIDDcNGMUxwTWwh1AXqNKwJrvMnhwP
 EdGw7BGNx+BoPMJdJVokeokxwStS65s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-ASRp6VeKNcOtFcaMPHyZzw-1; Fri, 05 Feb 2021 01:56:59 -0500
X-MC-Unique: ASRp6VeKNcOtFcaMPHyZzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22991100A8E8
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCA9210016FE;
 Fri,  5 Feb 2021 06:56:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9F4FA18003B0; Fri,  5 Feb 2021 07:56:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/24] vhost-user-gpu: check backend for EDID support
Date: Fri,  5 Feb 2021 07:56:01 +0100
Message-Id: <20210205065620.1726554-6-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

EDID has been enabled by default, but the backend may not implement
it (such as the contrib backend). This results in extra warnings and
potentially other issues in the guest.

The option shouldn't probably have been added to VIRTIO_GPU_BASE, but
it's a bit too late now, report an error and disable EDID when it's
not available.

Fixes: 0a7196625 ("edid: flip the default to enabled")

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210204105232.834642-2-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/vhost-user-gpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 51f1747c4a41..55b0ed15f250 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -555,6 +555,12 @@ vhost_user_gpu_device_realize(DeviceState *qdev, Error **errp)
     if (virtio_has_feature(g->vhost->dev.features, VIRTIO_GPU_F_VIRGL)) {
         g->parent_obj.conf.flags |= 1 << VIRTIO_GPU_FLAG_VIRGL_ENABLED;
     }
+    if (virtio_has_feature(g->vhost->dev.features, VIRTIO_GPU_F_EDID)) {
+        g->parent_obj.conf.flags |= 1 << VIRTIO_GPU_FLAG_EDID_ENABLED;
+    } else {
+        error_report("EDID requested but the backend doesn't support it.");
+        g->parent_obj.conf.flags &= ~(1 << VIRTIO_GPU_FLAG_EDID_ENABLED);
+    }
 
     if (!virtio_gpu_base_device_realize(qdev, NULL, NULL, errp)) {
         return;
-- 
2.29.2


