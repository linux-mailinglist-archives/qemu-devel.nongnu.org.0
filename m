Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED193BBB6D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:43:58 +0200 (CEST)
Received: from localhost ([::1]:33492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0M4z-00011v-SA
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m0M3h-0000Hp-Ce
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:42:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m0M3f-0005Jx-Sg
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625481755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yp0whBIksGQ4pYrcA+UJmK8CZgA6M/ipt+7+/6NGPD8=;
 b=WGKEnfokS5XS2aANGQeSEyM53rbp1b+sbQiUDkFyKLbEr6Fzd47unh0pq3ZNTU/oac4kOs
 fnwhJUso3cfxd8f2TmbpTrSCqBlrSLYorjX91zgmvQYEtn6PP3A65x6G8Jq/tCngcFIMd1
 ytQ+vomFcfZcp/j8AtE/vbFnnFZMMKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-dVet1roSPjSl30q1QGzr1w-1; Mon, 05 Jul 2021 06:42:31 -0400
X-MC-Unique: dVet1roSPjSl30q1QGzr1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BE881084F54;
 Mon,  5 Jul 2021 10:42:30 +0000 (UTC)
Received: from localhost (unknown [10.36.110.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F2291981C;
 Mon,  5 Jul 2021 10:42:20 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/display: fail early when multiple virgl devices are
 requested
Date: Mon,  5 Jul 2021 14:42:18 +0400
Message-Id: <20210705104218.1161101-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 mark.cave-ayland@ilande.co.uk, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This avoids failing to initialize virgl and crashing later on, and clear
the user expectations.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/display/virtio-gpu-gl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index aea9700d5c..bc55c4767e 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -113,6 +113,11 @@ static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
     return;
 #endif
 
+    if (!object_resolve_path_type("", TYPE_VIRTIO_GPU_GL, NULL)) {
+        error_setg(errp, "at most one %s device is permitted", TYPE_VIRTIO_GPU_GL);
+        return;
+    }
+
     if (!display_opengl) {
         error_setg(errp, "opengl is not available");
         return;
-- 
2.29.0


