Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3F362045F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 01:00:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osC0r-0004BK-LP; Mon, 07 Nov 2022 18:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC0p-0004B4-Sg
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:58:43 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC0d-00005u-C4
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:58:43 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bk15so18471251wrb.13
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NSxc66Fm/34b2nxJZ5QbpZSZKGj6yqN6NZyd5TCHUxQ=;
 b=dsC1oSDlOD15/529xDLe1V0yCa25ADRM3otJbXCKDueymzLfm/UhETNInmmmtGowk9
 +YJi7T75vLxsZJR6nKmYCZgFWYbtL9utL6W9eJcB+xhdVlAjvfUdWxS9/Z79GeGDlA/F
 aJINZWyDbh6HoeoJ2Aegw69UWaZ+8PhB0DHTRni34/osGj8Dbp+C/GFnJSy/XjOI+2Ln
 nx5nh84wZxJhOsEi19i4bnAjbqE4rY4+3TQ7s8Ppartggbp0+VAe0359YP0BycCuRgbj
 9fl5HQW3cHN5OjCzQXRcy7SxnOuPDLW+G4lAnHEQGPGgDZkJRP6Y0nrycvCaTTBg/+9G
 1y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NSxc66Fm/34b2nxJZ5QbpZSZKGj6yqN6NZyd5TCHUxQ=;
 b=isaLw5wurrBTV0Dqvs3Cxm10JxElgntEAOXBI52ytwxnVov+xm6dCY4UaoV7ck3ttN
 4YiH1zi8xe+EIWUbkEzPpkYDZbaau5DyY4SuPPRz3KQE8le3TFThCndEmSYc3SH5YgN1
 fkLUs16YNn6D9HnP8nyo3gVh5MLXMNCn7cLQ5nHchK5fV+6fwoto/b3GS+fW5HxUHUHB
 sg0Qu0g2rU0w0UxbwQrxzS/Vorhcon+uuGgTk+uPYYhxLi1nrduYBG/GIifzU+zRpU5x
 pjwvzhniQuICrs+P5A89HRRAQw6o4FqfXrGaYn4AsexP3GgaYYLSooovr1lEN9cwM0n5
 ttzQ==
X-Gm-Message-State: ACrzQf0kLDOt2YHTErmFSx4GPGArO4ZaVKwjrnv7hkQRc+FJ4F5ux7iP
 ftb+R5idU1TsKi/pgMquBMAtO6wy+V0SRg==
X-Google-Smtp-Source: AMsMyM679MsX2Ddk79Mmv57AYEyft46IMz5ly/hKtfCa1AXNo8TrdWBhQNd674Zxo+wZxXFCH4olXw==
X-Received: by 2002:adf:d4d2:0:b0:236:594f:4a2c with SMTP id
 w18-20020adfd4d2000000b00236594f4a2cmr32728960wrk.705.1667865508886; 
 Mon, 07 Nov 2022 15:58:28 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l27-20020a05600c1d1b00b003b95ed78275sm10101767wms.20.2022.11.07.15.58.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 15:58:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 01/14] target/mips: Set CP0St_{KX, SX, UX} for Loongson-2F
Date: Tue,  8 Nov 2022 00:58:09 +0100
Message-Id: <20221107235822.71458-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235822.71458-1-philmd@linaro.org>
References: <20221107235822.71458-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

As per an unpublished document, in later reversion of chips
CP0St_{KX, SX, UX} is not writeable and hardcoded to 1.

Without those bits set, kernel is unable to access XKPHYS address
segment. So just set them up on CPU reset.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221031132531.18122-2-jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index e997c1b9cb..7a565466cb 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -302,6 +302,12 @@ static void mips_cpu_reset(DeviceState *dev)
     env->CP0_EntryHi_ASID_mask = (env->CP0_Config5 & (1 << CP0C5_MI)) ?
             0x0 : (env->CP0_Config4 & (1 << CP0C4_AE)) ? 0x3ff : 0xff;
     env->CP0_Status = (1 << CP0St_BEV) | (1 << CP0St_ERL);
+    if (env->insn_flags & INSN_LOONGSON2F) {
+        /* Loongson-2F has those bits hardcoded to 1 */
+        env->CP0_Status |= (1 << CP0St_KX) | (1 << CP0St_SX) |
+                            (1 << CP0St_UX);
+    }
+
     /*
      * Vectored interrupts not implemented, timer on int 7,
      * no performance counters.
-- 
2.38.1


