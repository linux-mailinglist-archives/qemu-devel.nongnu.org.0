Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6675F380D8D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:45:02 +0200 (CEST)
Received: from localhost ([::1]:42166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZzp-0004Vh-4P
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZWC-0006AB-1d
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:24 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:41579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW5-00077v-DX
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:23 -0400
Received: by mail-qt1-x832.google.com with SMTP id t20so18136924qtx.8
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=roDfKVwoE/FokDKWYoRGBlgbgtAxIqlU8Xs4UzYUyTc=;
 b=fIrxxhLRjFAUbeT/0vsQePdVVFX1zv3KwvGsRabqnCHCy8hela34s+6JXm3GVk90HX
 XSKUlLfjHqX1JGjWB91Zx4QcOauZOlQJ5+3ip9QuR4o6/rs8Ng+6KnuVejG2Hh2LSUFD
 5r/U0GNgdCC+cjxSqORzRjJNxnEmmXbh2qg4HwGi0udXY+UY/wxKhQAsPKXmj65lFEFx
 I4KEn4rsmDGwTW5Dp5/00gxyqThCQF4bj2VzeOjQHIHVMJ15tyo8aenoHTiI+ltWlkGg
 0STMOG29BvpvWv7n6OuJcToc7aUQjMBvcmN6UoUtPL44KF4DMqNttI93nR2pQwpQsNTy
 sgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=roDfKVwoE/FokDKWYoRGBlgbgtAxIqlU8Xs4UzYUyTc=;
 b=KhEtYiDNJG/ZFcYSVd5mcee2EDI2X0oWYArCGwjrposTPvYcpZPCDkHRDMX9v73a9t
 ZJOKYa1vw/bJT4OdbvsH2Bwq6c71fe+hLL/8awgtI3YuMdruq8gvcrNgiEyQGeBlHuQf
 H2h8MByPxJQMAvkThnGMFGTlPHWkMv3roQQA5Oajez57urfiO+j+La2fyu4JCtwxOSPO
 KDDCey9bIsALElmoqjeHPPds4BJWHC8XzboA3CxJHOxjNy9nBaIyWWPOFuo1j3ZU518/
 lBJHtnqzhBqOmVKVlScBiss7n7zH+PdZBuBa1Z5WVZkNK+2XbMFkNThnLWIOnevsAjbr
 DiQw==
X-Gm-Message-State: AOAM531sPXliBy/OFcEYBZohb/SO5Y/2h+YrAZgRDsNGf+QI29C4TxfL
 xInqop1PcKZ5YJ9VDIJPCIi2+SFJ0+dfdyTqfjo=
X-Google-Smtp-Source: ABdhPJxY/LjYqLa1M/VXSNpo3U/Ujet2rcqxWgYA8C3L8iO7lLuohRzAjWdyTDWETimgnkVXEsFLVw==
X-Received: by 2002:ac8:5f48:: with SMTP id y8mr43645506qta.69.1621005256227; 
 Fri, 14 May 2021 08:14:16 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 35/50] target/i386: Simplify gen_debug usage
Date: Fri, 14 May 2021 10:13:27 -0500
Message-Id: <20210514151342.384376-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both invocations pass the start of the current instruction,
which is available as s->base.pc_next.  The function sets
is_jmp, so we can eliminate a second setting.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 8419aaa62c..8a02c5a373 100644
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
@@ -8592,8 +8592,7 @@ static bool i386_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
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


