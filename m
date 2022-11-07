Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324D7620468
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 01:02:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osC0v-0004EK-Qf; Mon, 07 Nov 2022 18:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC0u-0004EC-Qs
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:58:48 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC0s-0001Cc-5g
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:58:48 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso8090958wmp.5
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sVw69YQUrrPB4X3PpjsCj0UZM2xfPQqEeOeuKXhJayQ=;
 b=yjfEny0EGxwT8mwZOyfWVwU+bxJvl9fEgOs1l6MNqZ8OBuZw53TnI/A9QtcaGfh8+n
 M900QSoh+8fXDqYYRmleXvBAUn7RszrJDBbbf/ectoCt+cJkYoOGRpuQzl420UZz4IC7
 Nn+So0FtwrCjStLJNawRjR/l2foA3sH1L4cQmh0kvyFP3eg2gQyS1OwUwg8bQjs1OcAQ
 gH7g7rMOkJHjvjpAfIyGLbjNmijrbbod/k8F31rRQ/Kq6+QNXV6AaQGVXPC5qs8euLkD
 tGYZnI3zXjNa2viTand6fN0XlBL60c2aatAaeU9skj7fuA/9Zs0nNHjOUwQ72950e7lD
 XxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVw69YQUrrPB4X3PpjsCj0UZM2xfPQqEeOeuKXhJayQ=;
 b=Bl28DRtO20Dy3SY9D855a7G8RfDcGm8BQNnowFqoSrLm1VSh3oCogheF1voZnzEFmi
 sERgUP2M78BoJa0T6gQGTC4R+EVcgE8Xhgac6SQuHNbpb0dwzsmZ4OfZocD68mrSDVWf
 tY69YCECpdrA4pb/+OgKvXETVgQZMpWQJIFV31MSbTZE/t16vwT9K5T4MaQ+yx22rNCk
 SR/nsv2X4IFgMRa4IHXXQb0hOkr3pf3hiMi+ZOgh/OFns0bmlj2CYjK6i6ioMx19aOda
 TozqXcA+uh24+tgLqEWaKsXg6DXh9O/tGrtJjT+WTOlU9FS4edSgW4RSuqGZNqMXHKuL
 WENw==
X-Gm-Message-State: ACrzQf0i+VNgVCDtr02bMnnzMVte8fY18Ho8v+HIjF2JSrK9sc/zNh2h
 HtKYM73qhNa7zMCUuQGyDMNL6E6VbWpJrg==
X-Google-Smtp-Source: AMsMyM7p9wANgjp87JxSg5efjiYqRAdO22hDGkgFpJeRIBPEfwsNHZDwWLfJ6mtVipTPpM5CU1KZhA==
X-Received: by 2002:a05:600c:1d2a:b0:3cf:7332:946 with SMTP id
 l42-20020a05600c1d2a00b003cf73320946mr29055677wms.126.1667865523652; 
 Mon, 07 Nov 2022 15:58:43 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a5d59c1000000b0023c508a1c24sm8369532wry.26.2022.11.07.15.58.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 15:58:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Subject: [PULL 04/14] target/mips: Disable DSP ASE for Octeon68XX
Date: Tue,  8 Nov 2022 00:58:12 +0100
Message-Id: <20221107235822.71458-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235822.71458-1-philmd@linaro.org>
References: <20221107235822.71458-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

I don't have access to Octeon68XX hardware but according
to my investigation Octeon never had DSP ASE support.

As per "Cavium Networks OCTEON Plus CN50XX Hardware Reference
Manual" CP0C3_DSPP is reserved bit and read as 0. Also I do have
access to a Ubiquiti Edgerouter 4 which has Octeon CN7130 processor
and I can confirm CP0C3_DSPP is read as 0 on that processor.

Further more, in linux kernel:
arch/mips/include/asm/mach-cavium-octeon/cpu-feature-overrides.h
cpu_has_dsp is overridden as 0.

So I believe we shouldn't emulate DSP in QEMU as well.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <20221031132531.18122-4-jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/cpu-defs.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index 7f53c94ec8..480e60aeec 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -934,7 +934,7 @@ const mips_def_t mips_defs[] =
                        (1 << CP0C1_DS) | (4 << CP0C1_DL) | (1 << CP0C1_DA) |
                        (1 << CP0C1_PC) | (1 << CP0C1_WR) | (1 << CP0C1_EP),
         .CP0_Config2 = MIPS_CONFIG2,
-        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_LPA) | (1 << CP0C3_DSPP) ,
+        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_LPA),
         .CP0_Config4 = MIPS_CONFIG4 | (1U << CP0C4_M) |
                        (0x3c << CP0C4_KScrExist) | (1U << CP0C4_MMUExtDef) |
                        (3U << CP0C4_MMUSizeExt),
@@ -946,7 +946,7 @@ const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x12F8FFFF,
         .SEGBITS = 42,
         .PABITS = 49,
-        .insn_flags = CPU_MIPS64R2 | INSN_OCTEON | ASE_DSP,
+        .insn_flags = CPU_MIPS64R2 | INSN_OCTEON,
         .mmu_type = MMU_TYPE_R4000,
     },
 
-- 
2.38.1


