Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6F0440B46
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:33:09 +0200 (CEST)
Received: from localhost ([::1]:49818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgtAC-0005pC-JM
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1v-0001Yx-LE
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:32 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:38681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1r-0002DO-Ud
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:31 -0400
Received: by mail-pf1-x434.google.com with SMTP id l1so5883362pfu.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P+LiSx7CkE3blKbhg5ALaxOT08dtFOhalcqlNc9ibvc=;
 b=Os4XC7xz6OE376lMGaw9BdNtb0/eK6y4plZLVIEqixEnuGmuzbgFQ8CbmcF/M1BYy1
 uHaTqevjdhlADWORORgQwL7rzVf0S9txLdsouVEzE+yOPWCKD04NvrlWNSKWJPQybOEQ
 zzaDdooye3tbLPZIZqW/aGooaVla6hdpmdOdF6CAJDqP+OTnvdY5ufsdcKZvv8w869sM
 yGxkpGKeliwLQVVAOkTa+tG3JISQsj3a6nGy9VGUsid9BnaQgZ31kaW3KpgO6PhZ/RYY
 00/qOiSo0MC00u8FTEtfl09kwAfWOPeVnNpvSE8m0pzXkfYmFrB6LyWZVuEjNK+JeH2D
 gRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P+LiSx7CkE3blKbhg5ALaxOT08dtFOhalcqlNc9ibvc=;
 b=HAOsRrJjfxZ0ysOMPC8aCNPZKrNwe0cPub1HPBtxfgkj5da8ShDy3879ZXMUiKCMgc
 ezVCfStSAHVl8qc/ApcSMVRLbCN1yhxIoJvx+XLrCUkGwSYn4x/rZmOcgXu3+8kr+jqZ
 +9FkREjrnLywRHaz9Fb7S0Y90rIoLVsBPyRoUB517eUtHD7ThnW9B+hYA143XfcNipWz
 TEn3m/NijFZFGr5q0/Fc9MrDW2jqFMl6JHgQnUcDNyLbPQqXFOuFRKpM43RbKTv3cbyo
 PVYsCbMOKPrg2ykQ+XEv3HRRCVj/cXGc1KI0Y4hbwI4xjOSGmW+yta++D2E+z4nLNFW9
 0N2g==
X-Gm-Message-State: AOAM531eyouKbU4GXrgMYeh38rMViUGqn6Un3RGwM17Hf/N6zScIuf9T
 UinkBcr40Fembhv6Z+i4v6/ZWxGre3uv2w==
X-Google-Smtp-Source: ABdhPJwUTkL16rELXy/79sKpiHfodxi4mJ6QvuBSRCyFBSFZbCopGt/t1jPU8m4ZlMf3RQAypyLL6w==
X-Received: by 2002:a62:e901:0:b0:47b:f1bc:55e4 with SMTP id
 j1-20020a62e901000000b0047bf1bc55e4mr18596171pfh.0.1635614426387; 
 Sat, 30 Oct 2021 10:20:26 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 54/66] target/sparc: Remove DEBUG_UNALIGNED
Date: Sat, 30 Oct 2021 10:16:23 -0700
Message-Id: <20211030171635.1689530-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
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
index bbf3601cb1..0549b6adf1 100644
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


