Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93E7652291
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:29:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dYw-0002qN-Qq; Tue, 20 Dec 2022 09:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dYh-0002jQ-Vs
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:25:36 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dYg-00077H-FI
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:25:31 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m5-20020a7bca45000000b003d2fbab35c6so8923687wml.4
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZacuc6hkXuywYHHFZgq2CU0UxEHNQQJhCq+mOWh6sc=;
 b=oK90c5EMFqv9gleN3CJ9GTFswxADLz1WoH7MV9oKWkECdkw9D3mfmpSY/zKO28OsZW
 LJpqB/Oq5owlBGdje5kthNYVHwRi6Wc3zQCUjQRlgUPB3Xa0uH3csLCS9h9rnOpPCezt
 1F9IS30DxtaMELeod4B7k5Ysf7rPHuy7JJo8yl7jYkZDMaFbt+hjVAco/rcTEKbvyy5F
 UQhhatKoDxMXzzDooP2pi55ASEjpB5NmE0/tisFbFw57tVrsyQIvybpKH72QXCmpzbgw
 iKvCdttEqtry7gZVahF64ADPde2hNITkyvWeozSEDLDTCBA8YTT3msRrZkPqod43Fi9r
 QQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZacuc6hkXuywYHHFZgq2CU0UxEHNQQJhCq+mOWh6sc=;
 b=LaPVXgRTVv8wRr3Ue58FI7hE+Lr1G8F4c7IlznZ54yP3EH/PaijFwMyy4Um5DbJ0S5
 GPWaZrGSH5R8+TfL9jymc5nRZIbHda0GDAlw5DMuvhe6dhXiqFSaVo15BWQeUIzmu/rP
 iN13D9kSK1MwATWlJ0jRwkyop3AhlodtmgVZNFRRjTh2AM+73ZFCbhrT/01Hmdl7X9aj
 3X+fela8cZVb/aPlXNLAmpLB+aoq0lNCr7F9CyMcc8LircJuTZ6CNjk9EfrHQSbXDIPv
 4yaTtq99iB52dNnBARdnae51oBAm26mhKb0bPFOI6OhBIQYcJMiZCAcJJe35GzEWC4PG
 sG6Q==
X-Gm-Message-State: ANoB5pnvq52giTgHsFTYgHalzzoOBwlX/tHsFm3u29Q6wgHKH4QsD+FD
 +nPOqazGERxdOjPyh+s7GkGWnIVvZ/vHIkYMGOY=
X-Google-Smtp-Source: AA0mqf6VJopN9onlFZi2UaXIe2B7LfpM7unciiiaKwJQTYKR/z0LHSZYU3KtnPF+NgSGZqcpgMNGag==
X-Received: by 2002:a7b:ca45:0:b0:3d2:fbab:3609 with SMTP id
 m5-20020a7bca45000000b003d2fbab3609mr14806088wml.27.1671546328774; 
 Tue, 20 Dec 2022 06:25:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 189-20020a1c02c6000000b003cfd58409desm23303881wmc.13.2022.12.20.06.25.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:25:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/3] hw/input/tsc2xxx: Constify set_transform()'s
 MouseTransformInfo arg
Date: Tue, 20 Dec 2022 15:25:18 +0100
Message-Id: <20221220142520.24094-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220142520.24094-1-philmd@linaro.org>
References: <20221220142520.24094-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

The pointed MouseTransformInfo structure is accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/input/tsc2005.c         | 2 +-
 hw/input/tsc210x.c         | 3 +--
 include/hw/input/tsc2xxx.h | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 14698ce109..555b677173 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -523,7 +523,7 @@ void *tsc2005_init(qemu_irq pintdav)
  * from the touchscreen.  Assuming 12-bit precision was used during
  * tslib calibration.
  */
-void tsc2005_set_transform(void *opaque, MouseTransformInfo *info)
+void tsc2005_set_transform(void *opaque, const MouseTransformInfo *info)
 {
     TSC2005State *s = (TSC2005State *) opaque;
 
diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index df7313db5d..fdd5ff87d9 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -1176,8 +1176,7 @@ I2SCodec *tsc210x_codec(uWireSlave *chip)
  * from the touchscreen.  Assuming 12-bit precision was used during
  * tslib calibration.
  */
-void tsc210x_set_transform(uWireSlave *chip,
-                MouseTransformInfo *info)
+void tsc210x_set_transform(uWireSlave *chip, const MouseTransformInfo *info)
 {
     TSC210xState *s = (TSC210xState *) chip->opaque;
 #if 0
diff --git a/include/hw/input/tsc2xxx.h b/include/hw/input/tsc2xxx.h
index 5b76ebc177..00eca17674 100644
--- a/include/hw/input/tsc2xxx.h
+++ b/include/hw/input/tsc2xxx.h
@@ -30,12 +30,12 @@ uWireSlave *tsc2102_init(qemu_irq pint);
 uWireSlave *tsc2301_init(qemu_irq penirq, qemu_irq kbirq, qemu_irq dav);
 I2SCodec *tsc210x_codec(uWireSlave *chip);
 uint32_t tsc210x_txrx(void *opaque, uint32_t value, int len);
-void tsc210x_set_transform(uWireSlave *chip, MouseTransformInfo *info);
+void tsc210x_set_transform(uWireSlave *chip, const MouseTransformInfo *info);
 void tsc210x_key_event(uWireSlave *chip, int key, int down);
 
 /* tsc2005.c */
 void *tsc2005_init(qemu_irq pintdav);
 uint32_t tsc2005_txrx(void *opaque, uint32_t value, int len);
-void tsc2005_set_transform(void *opaque, MouseTransformInfo *info);
+void tsc2005_set_transform(void *opaque, const MouseTransformInfo *info);
 
 #endif
-- 
2.38.1


