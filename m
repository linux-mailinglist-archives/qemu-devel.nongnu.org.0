Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0F753B14C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:38:17 +0200 (CEST)
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZmy-0005hW-HA
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZjM-0002jM-Si
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:32 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZjJ-0005IU-S3
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:32 -0400
Received: by mail-pf1-x434.google.com with SMTP id 15so3479152pfy.3
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IPe9v04jpSOnM1YqKXysVjOVagzaKcyYJ8pPspoxKJ4=;
 b=KLGBU8uibNZIo+WGaor6RMr1kjNUFZUCv7ItcJT01nBneqfG6A0yC/10tT1cMDwrDH
 pmA/KWgEdiapfuy5AGRdUub5XGGGj3Rcqp76d28SIAuB244ClQSTQR+mjSYlldqWCeVZ
 WeqcFmU6mG/atr4gF5rpvP1ahAj3LzcSX5pWulM1/4AQjP/WeUpnDbiXjkWNBPYSJ2/N
 Zp3akOan5ZckcY4MM8ep0Oyg4fGt7Iy/jax0i1tCse4g7tftLP2HmPoFOeq+K3vuqIea
 2xAxdEJSy+1V1GxAlnp10lA6qk+OjmIcobLFqJ9pTgiomOgaJneGl1tqYqwLtaMf0GMx
 Sh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IPe9v04jpSOnM1YqKXysVjOVagzaKcyYJ8pPspoxKJ4=;
 b=rVin2d0N9ieSgr53WDMFYZk52eC7zU1p0Hx+rnj1uS2QSyVW+ywz/dXBLiNCbGAime
 wcsocazsrpskzAs6M0YkfhlaeMPIV+DU5RHwnzgIOCgHm3xG2jy7M5IOuK4kmnqRpVSQ
 ROoeyL39JULtFzO9wLdpwICFG/Bqyy2Ncxh42oxpSxfGqBCZvVAVVKCwBntdvv70V9fH
 R34kk51v3zEpnlq6hFzMkTj5H8B9NWH/caLEp8QAlW4XpuDrdN7X7DQzb08hhowqk9EU
 0FJ4aSUiS+L64KdI3QmeT60TS2L7a7ndHhCcXpfbRGjqZepaUWqTyBn8KRE5dWbXicax
 0yWQ==
X-Gm-Message-State: AOAM532tcoArwnllVHMZiahBCSC37bpMOD1FdcBSQ+2/AvHPJ38MBWis
 OrGrGJY3d7840JY6s9IFhOPMJSodqDlqzw==
X-Google-Smtp-Source: ABdhPJxqy/dGNz7bCMgNOMzTKmtl+ROsppe0aliSjCISHBqxyXDjth21bZ0R2KDeC69dGHh7m2RyJg==
X-Received: by 2002:a63:8842:0:b0:3fc:64b0:cacd with SMTP id
 l63-20020a638842000000b003fc64b0cacdmr2009607pgd.490.1654133664380; 
 Wed, 01 Jun 2022 18:34:24 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 17/17] target/m68k: Mark helper_raise_exception as noreturn
Date: Wed,  1 Jun 2022 18:34:01 -0700
Message-Id: <20220602013401.303699-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also mark raise_exception_ra and raise_exception, lest we
generate a warning about helper_raise_exception returning.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/helper.h    | 2 +-
 target/m68k/op_helper.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/m68k/helper.h b/target/m68k/helper.h
index f016c4c1c2..c9bed2b884 100644
--- a/target/m68k/helper.h
+++ b/target/m68k/helper.h
@@ -109,7 +109,7 @@ DEF_HELPER_3(set_mac_extu, void, env, i32, i32)
 DEF_HELPER_2(flush_flags, void, env, i32)
 DEF_HELPER_2(set_ccr, void, env, i32)
 DEF_HELPER_FLAGS_1(get_ccr, TCG_CALL_NO_WG_SE, i32, env)
-DEF_HELPER_2(raise_exception, void, env, i32)
+DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 DEF_HELPER_FLAGS_3(bfffo_reg, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 61948d92bb..d9937ca8dc 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -532,7 +532,8 @@ bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
 #endif /* !CONFIG_USER_ONLY */
 
-static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
+G_NORETURN static void
+raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
 {
     CPUState *cs = env_cpu(env);
 
@@ -540,7 +541,7 @@ static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
     cpu_loop_exit_restore(cs, raddr);
 }
 
-static void raise_exception(CPUM68KState *env, int tt)
+G_NORETURN static void raise_exception(CPUM68KState *env, int tt)
 {
     raise_exception_ra(env, tt, 0);
 }
-- 
2.34.1


