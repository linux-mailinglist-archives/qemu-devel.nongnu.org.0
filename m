Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB8865F23A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:08:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMZ-00017U-Ar; Thu, 05 Jan 2023 11:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMF-0000lJ-FX
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:49 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM9-0007Ov-6n
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:45 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so1759513wms.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2P8f8Xydl4tMqTJeKBieZcm7XuJfXk+zzcjb3vTLYAA=;
 b=WF7p91kgVmszzdRqUJPNybNM342/MLauVvN5Fp9f7OTN2alPX7UQKQTtMpg1wnHxQU
 nuBj8DpScU5gZuoHPEZXxobzgq0/e4pANBTbohwjzL7XpUR4BirersBMB9S/VpiUdQcp
 /AS9iKyb8S7M6JVyniPHqTpHjHpIgYyNmjD59NMCvJnYrcrXTkheLb0SlDgCQXbGtCCm
 dpmAiCVoEDvGl11n+6QPgBRjWDGkh+OchecK2RWtncXUlPS3Le2vQ1ckTyHYL/oSIf55
 A4iFHYqXL7CfmZztB/sIkPZsFVcTdVYVnQBqkZ7xCLC5rNWB52oslpnENdCPDx0CtktN
 z/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2P8f8Xydl4tMqTJeKBieZcm7XuJfXk+zzcjb3vTLYAA=;
 b=ng+VkTyi4eP31/YL9Q2TRHVwJLFALxNRwRBqe/bfj1f5t7dGwp8oVInDNiR+vMqGEg
 gtZC3Q2MsKR/lTqaNn+23li0sze+0LgmW1nZ3rh4QZEw8J29oTmfOFjz1RFx4Lvjbu3J
 MuVS/Ck2yY+iETBH9Kt0wDxM3CcsmLlMwfxthhLVzzdYxkRthIgoiKsHfMCXiHRHAbZC
 t+5J5uoAvI01trANuqbK75WP52jIEu1VnHPNtc7hx4WCfUOKDX+DFpIBYPtmsqaJK9j5
 OWIJihbTngg+FnejZwChhzP54mklGDf2niBPmPGYLKx9hCesPalbNzCKnUDPFnLbMp6T
 agrg==
X-Gm-Message-State: AFqh2kpCZjsh6E2XVqW0w6RsSu/xR5RW9TTMBO4ZuKaC3yQGTfSoSl2L
 yroZ8JiGbG71jVE+Fu72U2ddwKrf17+Efpvf
X-Google-Smtp-Source: AMrXdXukms6IFFecOnPM6LN6RSWyiXQ+auUYEbKdy2g6qmwdGoIrck4XXnl7BMe5hBIM+74gnrK/jQ==
X-Received: by 2002:a05:600c:3485:b0:3d0:761b:f86 with SMTP id
 a5-20020a05600c348500b003d0761b0f86mr36267396wmq.28.1672937080158; 
 Thu, 05 Jan 2023 08:44:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/34] hw/arm/nseries: Constify various read-only arrays
Date: Thu,  5 Jan 2023 16:44:08 +0000
Message-Id: <20230105164417.3994639-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221220142520.24094-3-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/nseries.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index b151113c275..2ff29f52e2d 100644
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
2.25.1


