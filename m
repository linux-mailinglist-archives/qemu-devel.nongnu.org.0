Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE0669E5E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:41:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMFU-00010t-PX; Fri, 13 Jan 2023 10:45:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFR-0000zL-PY
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:45:41 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFQ-0005iA-40
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:45:41 -0500
Received: by mail-wm1-x32b.google.com with SMTP id ja17so15549655wmb.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kd2EgP6wBxFIrRNK4hZL/+MuF+0goUK0A/2Kn0YM2Kg=;
 b=y1lancV7vLfcw01RNKhgQ8Oqzbp6XQPkXddF+T5eZOx8cKw00kdzG95dSB9faMsGRj
 sShMLbGU+MTHNjJi6WFGWRWPg+Xu01+GxyqowBeOHCD4Hqk67hduDjD+v/OE58ipFMsJ
 aeMRtXUANcyMr/CjgI1YDaT73TrMxEaaxgYS1EM9E/G3BrBFquD9eaNr//YnXzRb/qwK
 YX7XFVzZGtxQmdZTHfrOzpnTmEbuchJgAAHNkJH3b+cYBKaah4YWONYdQyxSU+LbW5RW
 W2O3N2VZThcoJG/SE0Hwlhma4NxHn4Yd6k3y0G06QS4Xt93Cjf3vs6IBYSxKabVYNbpZ
 1hxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kd2EgP6wBxFIrRNK4hZL/+MuF+0goUK0A/2Kn0YM2Kg=;
 b=gxJdAMxTtsIhEuDz7AkqTOE07qevZdr5WdrOQGqwobsq/+6mPiZr7IS0ERZfK7yxtb
 qaqj44Ll6rc7SXGTacmPDNgHGBgXN3mOniO82ySXevp9/aRDQ1NdMBtNeU+zg1NnYl9I
 6ALx5vNtQRHTbtXuZol4DSdxkHHwZK+RLtZYu0LYWO7HstrsVU1MertNMq1OIyiGXONt
 wdBjsjUirgdn9eNdxvdIAKP+jwnvE0VZu/7fwriN5rp9MM8n6j2jhdAKXaBVs7v7jQId
 SfWUOXhq/apHdcfF+eMrIgtqAIYJZgfB1OY8NHdCkuIgrcQpxwurR6Sdmw1MoXw5eKO6
 jLRA==
X-Gm-Message-State: AFqh2krXsvQvOnMgpZo/Za5Y8fOaF7eAZ0TtFtYxe5aRSoUtJHppDGFp
 Qjsk0tS9hQu3V05TIHmH9DqPQw9GM/TghMvO
X-Google-Smtp-Source: AMrXdXtxXfUkOsG+JEyoC1U43ugSc7zfSf+nYcUL4eLSggR6lKXLxn391xa1BLY+cYG6DiNSRHnQJA==
X-Received: by 2002:a1c:770b:0:b0:3cf:a18d:399c with SMTP id
 t11-20020a1c770b000000b003cfa18d399cmr61175328wmi.1.1673624739147; 
 Fri, 13 Jan 2023 07:45:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a05600c354800b003cf894dbc4fsm27550085wmq.25.2023.01.13.07.45.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:45:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 01/46] hw/mips/malta: Split FPGA LEDs/ASCII display updates
Date: Fri, 13 Jan 2023 16:44:47 +0100
Message-Id: <20230113154532.49979-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

No need to refresh the ASCII bar when a LED is toggled
(and vice versa).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230104133935.4639-3-philmd@linaro.org>
---
 hw/mips/malta.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index c0a2e0ab04..e9424150aa 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -106,11 +106,10 @@ static struct _loaderparams {
 } loaderparams;
 
 /* Malta FPGA */
-static void malta_fpga_update_display(void *opaque)
+static void malta_fpga_update_display_leds(MaltaFPGAState *s)
 {
     char leds_text[9];
     int i;
-    MaltaFPGAState *s = opaque;
 
     for (i = 7 ; i >= 0 ; i--) {
         if (s->leds & (1 << i)) {
@@ -123,6 +122,10 @@ static void malta_fpga_update_display(void *opaque)
 
     qemu_chr_fe_printf(&s->display, "\e[H\n\n|\e[32m%-8.8s\e[00m|\r\n",
                        leds_text);
+}
+
+static void malta_fpga_update_display_ascii(MaltaFPGAState *s)
+{
     qemu_chr_fe_printf(&s->display, "\n\n\n\n|\e[31m%-8.8s\e[00m|",
                        s->display_text);
 }
@@ -457,13 +460,13 @@ static void malta_fpga_write(void *opaque, hwaddr addr,
     /* LEDBAR Register */
     case 0x00408:
         s->leds = val & 0xff;
-        malta_fpga_update_display(s);
+        malta_fpga_update_display_leds(s);
         break;
 
     /* ASCIIWORD Register */
     case 0x00410:
         snprintf(s->display_text, 9, "%08X", (uint32_t)val);
-        malta_fpga_update_display(s);
+        malta_fpga_update_display_ascii(s);
         break;
 
     /* ASCIIPOS0 to ASCIIPOS7 Registers */
@@ -476,7 +479,7 @@ static void malta_fpga_write(void *opaque, hwaddr addr,
     case 0x00448:
     case 0x00450:
         s->display_text[(saddr - 0x00418) >> 3] = (char) val;
-        malta_fpga_update_display(s);
+        malta_fpga_update_display_ascii(s);
         break;
 
     /* SOFTRES Register */
-- 
2.38.1


