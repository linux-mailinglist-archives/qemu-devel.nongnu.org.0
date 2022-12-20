Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBF0652290
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:29:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dZA-00038v-Ls; Tue, 20 Dec 2022 09:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dYm-0002kM-SQ
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:25:36 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dYl-0007Bq-7U
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:25:36 -0500
Received: by mail-wr1-x430.google.com with SMTP id o5so11910270wrm.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2fp1/YYUdGWYu3hiUNYQ+xzlt+cNGmiBsfUbTz1rcI=;
 b=ljfl/pppcwKBkleG4/Dc9kPUqxm13XD2Mrleelh/o4EvQlB25zBUaVbKbZN2K39es+
 rxsTFvUA2Ja9O3dDuGUjTDvbxALW81tK7PftZmmOF1pLk6n2pLVAqgEkWln8aoyPI7Sh
 preX8qvQ3se3zFHFenaHRl3s0EQIURiZuDpHkfwj/LGZtSnSz+4oFW9+Ha5dUrJULXZ1
 FMRqipFjb30yFUzqAi/1/NJwaW2ZBL5QDmyVkngqGsQ2pVq1P5wQZQDaJ/r137oyXkzi
 2I8JlDlXGAoJKNpKfoR62suk6/GO+tRJUci6Zi1cSSnet6ehDB73hOzwVHgx45i7rrxy
 sEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F2fp1/YYUdGWYu3hiUNYQ+xzlt+cNGmiBsfUbTz1rcI=;
 b=mGb+HMYEwZHUXybw0/57/A0q9epcUhxVwJddNfqmgCkPrTH6v6e9ggWUbh4hZOdirQ
 gsRoGPE3GbUG5J4eBqT3nMrHkNfD14E2xKSssL7l5ns0UJVSEjWltrURceLskyvH9dYx
 /5e9WtAbultirri1scRL/wdAu+qDnBDP3s7tPC1wRYwgo5hm74gWrJ0fkDFQDGv5WLJX
 lA42YYhIetysNT3W7mgUYkB6Hgu78YMYyraAQ/PEr9eZEf3Nxs5QSnEGzLy5uRxiOPmd
 7/xfTnFYSPQ682GQaHkg/xd22QonB6EqOIE19wZIuXqYFl+aNXM40CxTezDyYI3o8FpF
 Na2A==
X-Gm-Message-State: ANoB5pksxnQEDjCA0xy1f+LUS4OVAyXhyBFWe4AOca16+94zNCuD2lAA
 RZc+7STQdCDFDO5RITm74UqVstUxYxeOJpLXFWw=
X-Google-Smtp-Source: AA0mqf4p6Ix7hYUzTp2TljhLNbqVrfde5FqeC8IXiPkgsgY9374MoSeZS/TIEjoUFbFAoSIFuAyESQ==
X-Received: by 2002:adf:ea8f:0:b0:242:70f1:2134 with SMTP id
 s15-20020adfea8f000000b0024270f12134mr38863853wrm.60.1671546333661; 
 Tue, 20 Dec 2022 06:25:33 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bq1-20020a5d5a01000000b00236545edc91sm12853530wrb.76.2022.12.20.06.25.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:25:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/3] hw/arm/nseries: Constify various read-only arrays
Date: Tue, 20 Dec 2022 15:25:19 +0100
Message-Id: <20221220142520.24094-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220142520.24094-1-philmd@linaro.org>
References: <20221220142520.24094-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/nseries.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index b151113c27..2ff29f52e2 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -230,13 +230,13 @@ static void n8x0_i2c_setup(struct n800_s *s)
 }
 
 /* Touchscreen and keypad controller */
-static MouseTransformInfo n800_pointercal = {
+static const MouseTransformInfo n800_pointercal = {
     .x = 800,
     .y = 480,
     .a = { 14560, -68, -3455208, -39, -9621, 35152972, 65536 },
 };
 
-static MouseTransformInfo n810_pointercal = {
+static const MouseTransformInfo n810_pointercal = {
     .x = 800,
     .y = 480,
     .a = { 15041, 148, -4731056, 171, -10238, 35933380, 65536 },
@@ -334,7 +334,7 @@ static void n810_key_event(void *opaque, int keycode)
 
 #define M	0
 
-static int n810_keys[0x80] = {
+static const int n810_keys[0x80] = {
     [0x01] = 16,	/* Q */
     [0x02] = 37,	/* K */
     [0x03] = 24,	/* O */
@@ -810,7 +810,7 @@ static void n8x0_usb_setup(struct n800_s *s)
 /* Setup done before the main bootloader starts by some early setup code
  * - used when we want to run the main bootloader in emulation.  This
  * isn't documented.  */
-static uint32_t n800_pinout[104] = {
+static const uint32_t n800_pinout[104] = {
     0x080f00d8, 0x00d40808, 0x03080808, 0x080800d0,
     0x00dc0808, 0x0b0f0f00, 0x080800b4, 0x00c00808,
     0x08080808, 0x180800c4, 0x00b80000, 0x08080808,
@@ -1060,7 +1060,7 @@ static void n8x0_boot_init(void *opaque)
 #define OMAP_TAG_CBUS		0x4e03
 #define OMAP_TAG_EM_ASIC_BB5	0x4e04
 
-static struct omap_gpiosw_info_s {
+static const struct omap_gpiosw_info_s {
     const char *name;
     int line;
     int type;
@@ -1102,7 +1102,7 @@ static struct omap_gpiosw_info_s {
     { NULL }
 };
 
-static struct omap_partition_info_s {
+static const struct omap_partition_info_s {
     uint32_t offset;
     uint32_t size;
     int mask;
@@ -1125,15 +1125,15 @@ static struct omap_partition_info_s {
     { 0, 0, 0, NULL }
 };
 
-static uint8_t n8x0_bd_addr[6] = { N8X0_BD_ADDR };
+static const uint8_t n8x0_bd_addr[6] = { N8X0_BD_ADDR };
 
 static int n8x0_atag_setup(void *p, int model)
 {
     uint8_t *b;
     uint16_t *w;
     uint32_t *l;
-    struct omap_gpiosw_info_s *gpiosw;
-    struct omap_partition_info_s *partition;
+    const struct omap_gpiosw_info_s *gpiosw;
+    const struct omap_partition_info_s *partition;
     const char *tag;
 
     w = p;
-- 
2.38.1


