Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AD842B2E6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:50:29 +0200 (CEST)
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maULc-0004Z4-Jj
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHh-0004U5-LL
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:25 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:40821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHg-0004tE-01
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:25 -0400
Received: by mail-pg1-x52a.google.com with SMTP id q5so880405pgr.7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xZtb0PPzu6cBb+iC7eRYJW+bmlWER7T8m0GFx24utaE=;
 b=yLNsAHDUYOEHlKr8d8bwavKTYKbnMTWTmewqMijoNTgoG1lnUrrXPE0Wv0438Qst3O
 hTJS1q9bhk93rs6CZOgAKLEy9isOwYbTdQuUxkY22QoSH/IvK1kY/Lzvru3nut2vNvTq
 gXEPWczFT+EkjJQNjIPLM/0EBTJYXpLWSPvGn9frjozcyKAldOxJRNF9wJnoTiMuKXqP
 qqN+TOl0KzuSSHDCnv2yzT5yAhw4xgRO81sdtwUEEv3rFg9Hv4H8lBfAVsqSsTDTv32K
 6zA6r0Oqs+EKC5TkiBercE5d+BI9DGUd3ERFeQYkPGb3IL5zn5irAO58gRqNTt+WFEVm
 kZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xZtb0PPzu6cBb+iC7eRYJW+bmlWER7T8m0GFx24utaE=;
 b=GUF0/1AxE/yF7oBZ9uv6b9plGkQaVyJdq7XhVOOfFMLCSnkNqBrsOkGUU9QIKcwgih
 hz9yw3NykSzW1bNQYPD2Bq4XvRruKkQQoLC09M6DPYgqRnz8KoXie7u6HnGlRyQTkpt4
 7hGvXqdczwOGoJbtkawdCBJeWrzZ6mSphQhpCnbjj/kh5NWJNxhs4g1UzMnSfqtovbdi
 1L+5lgRDGfrEEs55fQx+1FDPnai5ZpMEL7lMzf/BMyYB67jvlvAxD63b6pAcG55+FYRt
 HOKygrbSSzTAwctW9nTkdyjv95tIlQlXL/uIsWUkx48KkMNWQSaX/dpy/MDH9gLrRAUa
 jvKg==
X-Gm-Message-State: AOAM532SOAHxS/73KTrdVaGNKyoB9p5y/AufCyQSuScHucxvehlkapRh
 X0HTSto1DTOj7RDv9VTVknwhkuQeIefoFQ==
X-Google-Smtp-Source: ABdhPJytkqb++ZJTGJYqpe0nECvC5rRSXxhv9JssektNj0qEL10Jz7Rkbp6OS9/RixcMuXEWGFNjVg==
X-Received: by 2002:a05:6a00:1707:b0:44d:47e1:9ffe with SMTP id
 h7-20020a056a00170700b0044d47e19ffemr4712868pfc.53.1634093182616; 
 Tue, 12 Oct 2021 19:46:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/48] target/sparc: Remove DEBUG_UNALIGNED
Date: Tue, 12 Oct 2021 19:45:32 -0700
Message-Id: <20211013024607.731881-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The printf should have been qemu_log_mask, the parameters
themselves no longer compile, and because this is placed
before unwinding the PC is actively wrong.

We get better (and correct) logging on the other side of
raising the exception, in sparc_cpu_do_interrupt.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/ldst_helper.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index abe2889d27..2d0d180ea6 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -27,7 +27,6 @@
 
 //#define DEBUG_MMU
 //#define DEBUG_MXCC
-//#define DEBUG_UNALIGNED
 //#define DEBUG_UNASSIGNED
 //#define DEBUG_ASI
 //#define DEBUG_CACHE_CONTROL
@@ -364,10 +363,6 @@ static void do_check_align(CPUSPARCState *env, target_ulong addr,
                            uint32_t align, uintptr_t ra)
 {
     if (addr & align) {
-#ifdef DEBUG_UNALIGNED
-        printf("Unaligned access to 0x" TARGET_FMT_lx " from 0x" TARGET_FMT_lx
-               "\n", addr, env->pc);
-#endif
         cpu_raise_exception_ra(env, TT_UNALIGNED, ra);
     }
 }
@@ -1968,10 +1963,6 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
 
-#ifdef DEBUG_UNALIGNED
-    printf("Unaligned access to 0x" TARGET_FMT_lx " from 0x" TARGET_FMT_lx
-           "\n", addr, env->pc);
-#endif
     cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
 }
 #endif
-- 
2.25.1


