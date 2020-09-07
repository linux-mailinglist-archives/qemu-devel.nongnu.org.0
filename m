Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B3D2603F5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 19:57:46 +0200 (CEST)
Received: from localhost ([::1]:37930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLOj-0008NW-R3
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 13:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kFLIV-00054Y-Q2
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 13:51:19 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kFLIU-0000ln-4s
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 13:51:19 -0400
Received: by mail-pg1-x536.google.com with SMTP id m5so8318762pgj.9
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 10:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7UoRMIgCTJBIlKqoLjr+lb+MPy+eDOOMr1BDXkFiVtI=;
 b=zdJPIdMuX6qycgq5VTtCWFBPhnGAQI4gYoafHhceH2zCXgrlN/uSJED7TP1zvzNP/y
 uvpzzDaoTD9uhkoMCbBhLofov/naPf0JPKZr1+LckdxnEhy6uTeWnI2CsRy1Lsl+KTQi
 BmEXT+vXjPv4j75fqRGrkNn32cYUnO0KLGKcNUWYz7No4kdRWJn/YUNpnJvFvFyYoN+g
 f7jNHGF5N1K2VOk/oJDC/PZZhr7+AD3BnbSsOPoeWW4BxkgM5o+T4qPYMieOdRw6yk57
 uY0diH6Aml1/uj32dzaikUFgcfaP0PZFuuzuIvgIuDwtnUfA0PNOhfX/mft+2MRhzGT7
 VsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7UoRMIgCTJBIlKqoLjr+lb+MPy+eDOOMr1BDXkFiVtI=;
 b=pQXe782v+8KDG3jo+cpCzWlAOx7K+zATeoHkeCY0VS2ylVAUwDCSpKP9fwa0h+XlNP
 jqLbv68cR+IUtTCSab/w476jEwTWPzePlxDjPCQNrVxCdmdpgDV3nzzGCHpPFl9cjbxw
 Pp9zUGLbK/ujy6BPM1AWhrwD2en1ea5cl9nwVfY6ko8OcOXORBQDHoa+8tRQkl/GRaJR
 2UDgkSwEKG2TzKamDpNXvRJ7pIEVaCYqkgdEVQ0fSHh+VYrfa7LmeMBcEYThwoYehuIB
 nMIJ2T/uP4bJyKAdLkTKB7venzfvjrCDV0Yv+9AqZYRNrqITX3nf1cgX3UKIXCvy0vI6
 Mdeg==
X-Gm-Message-State: AOAM531aZAvWprd5246qMrJgZt/xg+6SbBq33ISlzuxMJ3cuOdKddqEl
 OM4OwqlfCoBp0TjmuIVhUjqShgRdIVSd1A==
X-Google-Smtp-Source: ABdhPJzMJeWMWeNrusY2/Z5i5Hlca90ta0CofdwF787Xcd+s995K1OV9mQsp+Mee0FZVUvblgv6IsQ==
X-Received: by 2002:a62:7cc3:: with SMTP id x186mr8161445pfc.229.1599501076365; 
 Mon, 07 Sep 2020 10:51:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id ga3sm1651496pjb.18.2020.09.07.10.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 10:51:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/19] target/microblaze: Force rtid, rted, rtbd to exit
Date: Mon,  7 Sep 2020 10:50:52 -0700
Message-Id: <20200907175102.28027-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907175102.28027-1-richard.henderson@linaro.org>
References: <20200907175102.28027-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These return-from-exception type instructions have modified
MSR to re-enable various forms of interrupt.  Force a return
to the main loop.

Consolidate the cleanup of tb_flags into mb_tr_translate_insn.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 608d413c83..da84fdb20b 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1518,7 +1518,6 @@ static void do_rti(DisasContext *dc)
     tcg_gen_or_i32(cpu_msr, cpu_msr, tmp);
 
     tcg_temp_free_i32(tmp);
-    dc->tb_flags &= ~DRTI_FLAG;
 }
 
 static void do_rtb(DisasContext *dc)
@@ -1531,7 +1530,6 @@ static void do_rtb(DisasContext *dc)
     tcg_gen_or_i32(cpu_msr, cpu_msr, tmp);
 
     tcg_temp_free_i32(tmp);
-    dc->tb_flags &= ~DRTB_FLAG;
 }
 
 static void do_rte(DisasContext *dc)
@@ -1545,7 +1543,6 @@ static void do_rte(DisasContext *dc)
     tcg_gen_or_i32(cpu_msr, cpu_msr, tmp);
 
     tcg_temp_free_i32(tmp);
-    dc->tb_flags &= ~DRTE_FLAG;
 }
 
 /* Insns connected to FSL or AXI stream attached devices.  */
@@ -1700,12 +1697,16 @@ static void mb_tr_translate_insn(DisasContextBase *dcb, CPUState *cs)
          * Finish any return-from branch.
          * TODO: Diagnose rtXd in delay slot of rtYd earlier.
          */
-        if (dc->tb_flags & DRTI_FLAG) {
-            do_rti(dc);
-        } else if (dc->tb_flags & DRTB_FLAG) {
-            do_rtb(dc);
-        } else if (dc->tb_flags & DRTE_FLAG) {
-            do_rte(dc);
+        uint32_t rt_ibe = dc->tb_flags & (DRTI_FLAG | DRTB_FLAG | DRTE_FLAG);
+        if (unlikely(rt_ibe != 0)) {
+            dc->tb_flags &= ~(DRTI_FLAG | DRTB_FLAG | DRTE_FLAG);
+            if (rt_ibe & DRTI_FLAG) {
+                do_rti(dc);
+            } else if (rt_ibe & DRTB_FLAG) {
+                do_rtb(dc);
+            } else {
+                do_rte(dc);
+            }
         }
 
         /* Complete the branch, ending the TB. */
@@ -1723,8 +1724,12 @@ static void mb_tr_translate_insn(DisasContextBase *dcb, CPUState *cs)
              */
             break;
         case DISAS_NEXT:
-            /* Normal insn a delay slot.  */
-            dc->base.is_jmp = DISAS_JUMP;
+            /*
+             * Normal insn a delay slot.
+             * However, the return-from-exception type insns should
+             * return to the main loop, as they have adjusted MSR.
+             */
+            dc->base.is_jmp = (rt_ibe ? DISAS_EXIT_JUMP : DISAS_JUMP);
             break;
         case DISAS_EXIT_NEXT:
             /*
-- 
2.25.1


