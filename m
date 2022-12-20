Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4B5652292
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:29:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dZA-000399-UF; Tue, 20 Dec 2022 09:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dYs-0002tT-PC
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:25:46 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dYr-0007Di-7M
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:25:42 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h7so11897034wrs.6
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wS5CxhmEHaWzfXfeaPCFtcR9LUEn6cDWq+iuQTZsc7I=;
 b=l1jlxIsvfSo8PNFA5hwP6NUH44msHURNTzOD27kGZjcfS8tz04zr5cB0/gSRh3MzOn
 bIakl97bmFtQ4EYKu5r7BRTia9siCUhuA8ATdoMz1RWjaH4MzOmskkbanHr8fQAc5G2k
 Bqh/ZbSlwj2Cu7e59dFPp/7jBGyhCUDz8QpxmgRgYdCcsLzrEz7yZluLtPp+jg+3MlNy
 7Pn/K5ZTnzKfR/6+2G75pgtgRpZGBlNLFEH1B4xHNqga6zjKD683KC4A1NSNttQxPo7Z
 prccLjlBNnIjaPNsJ6gwOeYwwFKLk60j7eqWfWS8Ly4z6LOCSacFsKO4Y8CG0KCyQqW9
 S/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wS5CxhmEHaWzfXfeaPCFtcR9LUEn6cDWq+iuQTZsc7I=;
 b=rCoftwkh5aQSEZ0bH5/LwL3rtgndNhnuDlWgGHd7rj3e6wKliAw2xN00BZO08R9Ovz
 3xY01PeKoPaeHOID9BCnNbcx5b8eXw0jjKaYtCBG382Lw8T3D8aH88iIbvauYmMu8A1h
 yiaxU8nlxH3fYaiU8v99XwCRe0/50pM4MkCD6fwptkdm29a6Zs5eeQcISdrscLkyXwm9
 HjUAh8zCO3JxZm6Q6fUS0lVNtNM/FFz0Nt3yUjIRkOtpaX5WikhWLZeJg3iMVkYIcrEQ
 jAygbk8XhaE6W8ubXSjOcxT3CTqaK8584eyH8ZXm7965aaxfSn0aBFtP8yGUMpysqP7E
 oIIg==
X-Gm-Message-State: AFqh2koKlYe+jB59zF3mAr6taLoLq52vkjWNKCpEOguK5cN3sF8J8MbG
 mWBzNVUCgzLf9HaFiEDn8p41WgJEeH+LUQ8aHEw=
X-Google-Smtp-Source: AMrXdXv3t0Iw1NOoMLyblTa4Ds+IB7eHrjGCPWI/sn/1asUwog8HEIbFdEnSPDPljwt0fPyv4+Rjjw==
X-Received: by 2002:adf:a15b:0:b0:242:61ab:5979 with SMTP id
 r27-20020adfa15b000000b0024261ab5979mr2302875wrr.71.1671546338972; 
 Tue, 20 Dec 2022 06:25:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003d351a9db76sm11175015wmq.30.2022.12.20.06.25.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:25:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/3] hw/arm/nseries: Silent -Wmissing-field-initializers
 warning
Date: Tue, 20 Dec 2022 15:25:20 +0100
Message-Id: <20221220142520.24094-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220142520.24094-1-philmd@linaro.org>
References: <20221220142520.24094-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Silent when compiling with -Wextra:

  ../hw/arm/nseries.c:1081:12: warning: missing field 'line' initializer [-Wmissing-field-initializers]
      { NULL }
             ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/nseries.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 2ff29f52e2..c9df063a08 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1078,7 +1078,7 @@ static const struct omap_gpiosw_info_s {
         "headphone", N8X0_HEADPHONE_GPIO,
         OMAP_GPIOSW_TYPE_CONNECTION | OMAP_GPIOSW_INVERTED,
     },
-    { NULL }
+    { /* end of list */ }
 }, n810_gpiosw_info[] = {
     {
         "gps_reset", N810_GPS_RESET_GPIO,
@@ -1099,7 +1099,7 @@ static const struct omap_gpiosw_info_s {
         "slide", N810_SLIDE_GPIO,
         OMAP_GPIOSW_TYPE_COVER | OMAP_GPIOSW_INVERTED,
     },
-    { NULL }
+    { /* end of list */ }
 };
 
 static const struct omap_partition_info_s {
@@ -1113,16 +1113,14 @@ static const struct omap_partition_info_s {
     { 0x00080000, 0x00200000, 0x0, "kernel" },
     { 0x00280000, 0x00200000, 0x3, "initfs" },
     { 0x00480000, 0x0fb80000, 0x3, "rootfs" },
-
-    { 0, 0, 0, NULL }
+    { /* end of list */ }
 }, n810_part_info[] = {
     { 0x00000000, 0x00020000, 0x3, "bootloader" },
     { 0x00020000, 0x00060000, 0x0, "config" },
     { 0x00080000, 0x00220000, 0x0, "kernel" },
     { 0x002a0000, 0x00400000, 0x0, "initfs" },
     { 0x006a0000, 0x0f960000, 0x0, "rootfs" },
-
-    { 0, 0, 0, NULL }
+    { /* end of list */ }
 };
 
 static const uint8_t n8x0_bd_addr[6] = { N8X0_BD_ADDR };
-- 
2.38.1


