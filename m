Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AB033D5F2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:40:40 +0100 (CET)
Received: from localhost ([::1]:59208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAsB-0005Nq-2d
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMApz-0003eD-8Y
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMApx-0002B3-6C
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615905500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+u63sTPzR7LblPkkRfEgX7Zhaq6BoG8nUhQdSKoMXo=;
 b=IV2B9ZhwF1C/cx80+yodH2PozCG0pBoWHvKgOQxfWCcgAEDKD+yaV6KjH+YxQ2/j5/KIfo
 d9knVyQmQX4I68bqfwFhJzBKtxPgJBuIJnTX6tsTwWL+f70Ma+ijq6GmWNu2LRxpD2wn7B
 f3MjymIN1nKFNx/gv50Iv5x4YM0YKt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-I_XcUJdnMJGot2dHpTqRgw-1; Tue, 16 Mar 2021 10:38:18 -0400
X-MC-Unique: I_XcUJdnMJGot2dHpTqRgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 869B6A0C02
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 14:38:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAB18104C517;
 Tue, 16 Mar 2021 14:38:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4CFFA1800628; Tue, 16 Mar 2021 15:38:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] edid: edid_desc_next
Date: Tue, 16 Mar 2021 15:38:05 +0100
Message-Id: <20210316143812.2363588-3-kraxel@redhat.com>
In-Reply-To: <20210316143812.2363588-1-kraxel@redhat.com>
References: <20210316143812.2363588-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add helper function to find the next free desc block.
Needed when we start to use the dta descriptor entries.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/edid-generate.c | 41 ++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index 1665b7cbb29a..ef7a70fc9654 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -143,6 +143,17 @@ static void edid_checksum(uint8_t *edid)
     }
 }
 
+static uint8_t *edid_desc_next(uint8_t *edid, uint8_t *dta, uint8_t *desc)
+{
+    if (desc == NULL) {
+        return NULL;
+    }
+    if (desc + 18 + 18 < edid + 127) {
+        return desc + 18;
+    }
+    return NULL;
+}
+
 static void edid_desc_type(uint8_t *desc, uint8_t type)
 {
     desc[0] = 0;
@@ -299,7 +310,7 @@ uint32_t qemu_edid_dpi_to_mm(uint32_t dpi, uint32_t res)
 void qemu_edid_generate(uint8_t *edid, size_t size,
                         qemu_edid_info *info)
 {
-    uint32_t desc = 54;
+    uint8_t *desc = edid + 54;
     uint8_t *xtra3 = NULL;
     uint8_t *dta = NULL;
     uint32_t width_mm, height_mm;
@@ -400,32 +411,32 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
 
     /* =============== descriptor blocks =============== */
 
-    edid_desc_timing(edid + desc, info->prefx, info->prefy,
+    edid_desc_timing(desc, info->prefx, info->prefy,
                      width_mm, height_mm);
-    desc += 18;
+    desc = edid_desc_next(edid, dta, desc);
 
-    edid_desc_ranges(edid + desc);
-    desc += 18;
+    edid_desc_ranges(desc);
+    desc = edid_desc_next(edid, dta, desc);
 
     if (info->name) {
-        edid_desc_text(edid + desc, 0xfc, info->name);
-        desc += 18;
+        edid_desc_text(desc, 0xfc, info->name);
+        desc = edid_desc_next(edid, dta, desc);
     }
 
     if (info->serial) {
-        edid_desc_text(edid + desc, 0xff, info->serial);
-        desc += 18;
+        edid_desc_text(desc, 0xff, info->serial);
+        desc = edid_desc_next(edid, dta, desc);
     }
 
-    if (desc < 126) {
-        xtra3 = edid + desc;
+    if (desc) {
+        xtra3 = desc;
         edid_desc_xtra3_std(xtra3);
-        desc += 18;
+        desc = edid_desc_next(edid, dta, desc);
     }
 
-    while (desc < 126) {
-        edid_desc_dummy(edid + desc);
-        desc += 18;
+    while (desc) {
+        edid_desc_dummy(desc);
+        desc = edid_desc_next(edid, dta, desc);
     }
 
     /* =============== finish up =============== */
-- 
2.30.2


