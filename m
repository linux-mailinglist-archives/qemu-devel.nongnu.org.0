Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0183380CD9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:26:27 +0200 (CEST)
Received: from localhost ([::1]:54508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZhq-0006fn-PN
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVs-0005v5-4e
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:04 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:46949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVq-00072F-Lh
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:03 -0400
Received: by mail-qt1-x834.google.com with SMTP id m13so7171558qtk.13
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JAUZoSf08wmQ4OzHJ+DwMM9rnCZ56JE9Izgi0Nl3LSA=;
 b=QQK6o1NOj2LU9IQ8S/X/KlDrqHMivwglajoMzM9Gb917mYZlvR8swYr7mFzuHBwibD
 f6OkZs5fF7wcvTYs/LqyshWC5zJw/8KtSgzDRzMtMPs8MOvIkIohc83GiuZ3UvAVdWMz
 9Lm5VIGYwGFqWxnPBP65+7D8XqPPVB1flJ5FF+//QmPHr712G6RaV9nTHH6h+JjVzFJh
 ylNbM0Qm7NLrObNj/dDi1Q2mEUVZtASyGrAF9c7D2dnux3z8Ewi1objoKtXUAhJJ3c89
 XQkQ3d+eRTRz2KFnyYg1wzKg/R6sWWwKA0fE2lya40R9maeByE3zoGj4X6W7iQbdvkNu
 FyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JAUZoSf08wmQ4OzHJ+DwMM9rnCZ56JE9Izgi0Nl3LSA=;
 b=orxbQ944XS1uwMB2E6e5Ii1a6yytLiMwKW4LKOlcoU/ZS3Qvq4uLcXvHvLVIdzbWN8
 gI3XHCJhShQDVxrOkzjw/ShDA3Hl+WxrjzFm27evAq0u7jIvdWi5m9CA+U5zDQzOATGS
 WTaci3jOhuC526gfc1+1NEFUxJ89JXWduyPCqktbYTh0HKam3GolhmAS7fpFpxldHZUh
 WGmzpwtiEgEUOI5jaTGmTeQctZg/iHCSZiN3YUrmomZ5O3eQ7+JzkVacHDzCQwPst8Se
 Y1X1Q26hJMsPBKTwxbD/jEf+nrfIEl3a0hBdsuQ6T0HLaq8w2b7+Ro7qP62mkriWntg9
 MZ3Q==
X-Gm-Message-State: AOAM532Wa1HwEbDN3n/S3iKUk/NMRaTGuooIMXLVq+fbhoeRt4g7aO4+
 mCnJM08zdlJaug2bAkYVeYgPB+z4KgiwLnIS+Us=
X-Google-Smtp-Source: ABdhPJz517VTBjKUKLMQ6ziTVi4VuW5WifnjjDESkJC8DXmoaNgS1K/odA8vx779tzFoI8g6KNTORA==
X-Received: by 2002:ac8:6908:: with SMTP id e8mr25695507qtr.174.1621005241754; 
 Fri, 14 May 2021 08:14:01 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/50] target/i386: Remove DisasContext.f_st as unused
Date: Fri, 14 May 2021 10:13:11 -0500
Message-Id: <20210514151342.384376-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 4222f09b6f..7e296b39f5 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -101,7 +101,6 @@ typedef struct DisasContext {
     int vex_v;  /* vex vvvv register, without 1's complement.  */
     CCOp cc_op;  /* current CC operation */
     bool cc_op_dirty;
-    int f_st;   /* currently unused */
     int tf;     /* TF cpu flag */
     int jmp_opt; /* use direct block chaining for direct jumps */
     int repz_opt; /* optimize jumps within repz instructions */
@@ -8507,7 +8506,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
     g_assert(ADDSEG(dc) == ((flags & HF_ADDSEG_MASK) != 0));
 
-    dc->f_st = 0;
     dc->tf = (flags >> TF_SHIFT) & 1;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->cc_op_dirty = false;
-- 
2.25.1


