Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5D43895B8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:45:38 +0200 (CEST)
Received: from localhost ([::1]:45680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRCL-0006Ah-6Y
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyb-0003wE-Dn
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:25 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:44942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyQ-0005hx-2k
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:24 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so12603139otp.11
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fn0fKM7b0/WeEivTWmPBKTYTf/IZtNjtnp7j7fWEKko=;
 b=EMVQAn+dU7L1xJ43dazypz1TrWN1ybsmjGSTD24JVMcFQGHmA4OQbiTSm0YaU0Ids2
 qqBdCLjG6sg34kkXQGIRYaJNGHHVfBxgcGbJNXncJ4VJw7tOXf40NYoTRSw8tXZk3K6m
 qoAmD9Cp/83b7UBMOiZ5qPFJqT7ipe8uMdiXB6z0x4scWQajfTrrLIMHsveI8EDsOuO7
 j6/AunCOPLLDgyn5oiu6d1e4fhoEQbD9ucAAV/jHbQ0kgI1PH4qwgQBZi+5KEvQjGocF
 H3WbKzp1yw2iU5a798XKoNpT5L1qW1VmOUa4rXCIk1UWo0w9Ybi2juEVZD3+p4UgIwlq
 ik7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fn0fKM7b0/WeEivTWmPBKTYTf/IZtNjtnp7j7fWEKko=;
 b=kUWXlltGbCwlPWYLeX0QYy/IUNYdjH4phVXq9htTfwvyWCPW3GLllM2t/CVagxSy1F
 peyst7dvTSQwd3wRV9WVRv+7118G25mqA7z5gX64grDgYgq5QFloYaI7oy9GtJlJ7nDx
 igh3ElR0IWSnCRfk77DuFgnkfimkldicE/Hqw3T+97UrSO0U6e/zu/GzjhHNlINRYQfT
 mO0ECNU/hUtjAvh9PjguD0lFSNz/i2ISZlsS6uy2fw0ZUpXUZnfE/NPzGay7xH+/UyHC
 PKMYQfoMTK7/9CaCDvSEKmtaU+MNyUjGh2Kbc2vfj9Mgne0YEdoZO2rD/Lh505l3WFj5
 Rq7A==
X-Gm-Message-State: AOAM533auUoYUNM/lyQLjmutWpibFNsm/WhAZUDQNG4gyiUXU/4bgwVk
 RCipqkQASPdqiDNlZr5R0ENWCA8Inrpti7dy
X-Google-Smtp-Source: ABdhPJwwn6UsZFKp/B0pTdvPk29BzTA3S1ZXGSWRTu5BtcsGsiZL28j9Q2Res1CUZlCAvLBO6/TMBw==
X-Received: by 2002:a9d:7a94:: with SMTP id l20mr661790otn.46.1621449071287;
 Wed, 19 May 2021 11:31:11 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/50] target/i386: Remove DisasContext.f_st as unused
Date: Wed, 19 May 2021 13:30:19 -0500
Message-Id: <20210519183050.875453-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-20-richard.henderson@linaro.org>
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


