Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3899A378CB9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:25:33 +0200 (CEST)
Received: from localhost ([::1]:50600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5ue-0003J2-2a
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5r1-0003yn-SL
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5qx-0002m7-I6
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620652902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzV8MZiocegV4ElMa8QpvTDwIYVbwogt9vm2gfoE2eo=;
 b=jDHqQ38QEi/Zzs2o2lqXBG3ZUepgyZ2HoE5ZIwdvlMkhoSdP8GJg4ntxB19wNge6wDTpEf
 czaQm7CuIGlOoXKd7t7IVkCU2bVyE6BJskeG7pLJdPIrp4kYFX2bJ/C9nsRvvkP6nTxb6b
 iwVu8SxeOYp77tef+kCKcdIsW5inDO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-eQXfVR-cODmJr4wDgcB96Q-1; Mon, 10 May 2021 09:21:40 -0400
X-MC-Unique: eQXfVR-cODmJr4wDgcB96Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB2A2192780F;
 Mon, 10 May 2021 13:21:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 070DA19EF1;
 Mon, 10 May 2021 13:21:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4D35B18003B0; Mon, 10 May 2021 15:20:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/25] edid: Make refresh rate configurable
Date: Mon, 10 May 2021 15:20:31 +0200
Message-Id: <20210510132051.2208563-6-kraxel@redhat.com>
In-Reply-To: <20210510132051.2208563-1-kraxel@redhat.com>
References: <20210510132051.2208563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210427150824.638359-1-kraxel@redhat.com
Message-Id: <20210427150824.638359-6-kraxel@redhat.com>
---
 include/hw/display/edid.h  | 12 +++++++-----
 hw/display/edid-generate.c |  9 +++++----
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/hw/display/edid.h b/include/hw/display/edid.h
index 1f8fc9b37500..520f8ec20279 100644
--- a/include/hw/display/edid.h
+++ b/include/hw/display/edid.h
@@ -11,6 +11,7 @@ typedef struct qemu_edid_info {
     uint32_t    prefy;
     uint32_t    maxx;
     uint32_t    maxy;
+    uint32_t    refresh_rate;
 } qemu_edid_info;
 
 void qemu_edid_generate(uint8_t *edid, size_t size,
@@ -21,10 +22,11 @@ void qemu_edid_region_io(MemoryRegion *region, Object *owner,
 
 uint32_t qemu_edid_dpi_to_mm(uint32_t dpi, uint32_t res);
 
-#define DEFINE_EDID_PROPERTIES(_state, _edid_info)              \
-    DEFINE_PROP_UINT32("xres", _state, _edid_info.prefx, 0),    \
-    DEFINE_PROP_UINT32("yres", _state, _edid_info.prefy, 0),    \
-    DEFINE_PROP_UINT32("xmax", _state, _edid_info.maxx, 0),     \
-    DEFINE_PROP_UINT32("ymax", _state, _edid_info.maxy, 0)
+#define DEFINE_EDID_PROPERTIES(_state, _edid_info)                         \
+    DEFINE_PROP_UINT32("xres", _state, _edid_info.prefx, 0),               \
+    DEFINE_PROP_UINT32("yres", _state, _edid_info.prefy, 0),               \
+    DEFINE_PROP_UINT32("xmax", _state, _edid_info.maxx, 0),                \
+    DEFINE_PROP_UINT32("ymax", _state, _edid_info.maxy, 0),                \
+    DEFINE_PROP_UINT32("refresh_rate", _state, _edid_info.refresh_rate, 0)
 
 #endif /* EDID_H */
diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index 42a130f0ff5c..8662218822f6 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -223,7 +223,7 @@ static void edid_desc_dummy(uint8_t *desc)
     edid_desc_type(desc, 0x10);
 }
 
-static void edid_desc_timing(uint8_t *desc,
+static void edid_desc_timing(uint8_t *desc, uint32_t refresh_rate,
                              uint32_t xres, uint32_t yres,
                              uint32_t xmm, uint32_t ymm)
 {
@@ -236,9 +236,9 @@ static void edid_desc_timing(uint8_t *desc,
     uint32_t ysync  = yres *  5 / 1000;
     uint32_t yblank = yres * 35 / 1000;
 
-    uint32_t clock  = 75 * (xres + xblank) * (yres + yblank);
+    uint64_t clock  = (uint64_t)refresh_rate * (xres + xblank) * (yres + yblank);
 
-    stl_le_p(desc, clock / 10000);
+    stl_le_p(desc, clock / 10000000);
 
     desc[2] = xres   & 0xff;
     desc[3] = xblank & 0xff;
@@ -323,6 +323,7 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
     uint8_t *xtra3 = NULL;
     uint8_t *dta = NULL;
     uint32_t width_mm, height_mm;
+    uint32_t refresh_rate = info->refresh_rate ? info->refresh_rate : 75000;
     uint32_t dpi = 100; /* if no width_mm/height_mm */
 
     /* =============== set defaults  =============== */
@@ -420,7 +421,7 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
 
     /* =============== descriptor blocks =============== */
 
-    edid_desc_timing(desc, info->prefx, info->prefy,
+    edid_desc_timing(desc, refresh_rate, info->prefx, info->prefy,
                      width_mm, height_mm);
     desc = edid_desc_next(edid, dta, desc);
 
-- 
2.31.1


