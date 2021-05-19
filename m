Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFFC3895E2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:55:03 +0200 (CEST)
Received: from localhost ([::1]:51842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRLT-0003w8-0O
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyu-0004Xv-Gm
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:44 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31]:44796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyd-0005oC-Tc
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:44 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 s24-20020a4aead80000b02901fec6deb28aso3212243ooh.11
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YE5gh1RAZElW6rE0tgb4yyRWs9xDRZvjDM9uycPY9fA=;
 b=XAiXHmeFNAdV33zpYz5y6O98ZuvnwugHgfif+qPk3fyhOXba1ffovj+avuagY6SBJk
 x/iKkZQTiI3i+ZJzpYdHlcpzHLDvtIaJYTxkxUmjj/mfFi4dkUzz4BywGWQTqoYVPIBm
 R6O3oDz+Zno9IN63c3FwasRvf4QNDkg6IT73MGPEia52rfOxi/Qm7OFmX0FaTWhLxrmL
 tfLT6AWYELJZXTayHWL2Amx37IOyGzHV26dQ8YFD8Ut957/Khg7yWnN8qqN6H+cl+i4b
 ysrtDPUrT+mqkKgG3cWuONXW7kYT2RbaGqWRUKVhV4xLJK/VUEiC77UwQK6tupwFRAI2
 nsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YE5gh1RAZElW6rE0tgb4yyRWs9xDRZvjDM9uycPY9fA=;
 b=mE+DPBS/yoCzv3RhCDgs62ZSKotsaruc3E2L/FySGwLCmWGvNUz6ebrHtImTbYW2w8
 rB9xkKt0JECNXC7esD6ra7/3miEsqmBU7kbisxfqjeCdX4zzrSUUsKZvBleJQIi3Df/8
 dZEVb3bZuk7bEHAMtDTThFC7UVHptRcRCiFDtTyD1Hpmwu5az3sn4AkcWp37uH8q/Exu
 O2/ONNB8J7um4gQk4xRwtgXsV5L3P6M9rLJsYPYo91/D5g4qbXC4rdnOHr6wnuQF/DJl
 ZcBX9j7wBjY3uiUj3sNuadV/M5Ng23ZEFKastOyEK5RcEVFPRZM4boF69w+zYkXnjXN+
 WVzw==
X-Gm-Message-State: AOAM531EFELRAH9/i9Lmkg5J2hCVO8iLESskvuCWUoqfs+cfrP/8JeyK
 93PZTnfF26e/EYJ7q5J4Uy63eK9t0W9qsG9t
X-Google-Smtp-Source: ABdhPJz+0x9sgZl1Dyn0DFZikBMbHaLhQ2lFH3asN7yUYX/Veq0CqTQALG/IEIMO+EabOJjVatU5fg==
X-Received: by 2002:a4a:97ed:: with SMTP id x42mr564923ooi.40.1621449086664;
 Wed, 19 May 2021 11:31:26 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/50] target/i386: Simplify gen_debug usage
Date: Wed, 19 May 2021 13:30:35 -0500
Message-Id: <20210519183050.875453-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc31.google.com
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both invocations pass the start of the current instruction,
which is available as s->base.pc_next.  The function sets
is_jmp, so we can eliminate a second setting.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-36-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index c1d4d58c61..36e38ebebf 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2614,10 +2614,10 @@ static void gen_interrupt(DisasContext *s, int intno,
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_debug(DisasContext *s, target_ulong cur_eip)
+static void gen_debug(DisasContext *s)
 {
     gen_update_cc_op(s);
-    gen_jmp_im(s, cur_eip);
+    gen_jmp_im(s, s->base.pc_next - s->cs_base);
     gen_helper_debug(cpu_env);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -7152,7 +7152,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #ifdef WANT_ICEBP
     case 0xf1: /* icebp (undocumented, exits to external debugger) */
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_ICEBP);
-        gen_debug(s, pc_start - s->cs_base);
+        gen_debug(s);
         break;
 #endif
     case 0xfa: /* cli */
@@ -8586,8 +8586,7 @@ static bool i386_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
     /* If RF is set, suppress an internally generated breakpoint.  */
     int flags = dc->base.tb->flags & HF_RF_MASK ? BP_GDB : BP_ANY;
     if (bp->flags & flags) {
-        gen_debug(dc, dc->base.pc_next - dc->cs_base);
-        dc->base.is_jmp = DISAS_NORETURN;
+        gen_debug(dc);
         /* The address covered by the breakpoint must be included in
            [tb->pc, tb->pc + tb->size) in order to for it to be
            properly cleared -- thus we increment the PC here so that
-- 
2.25.1


