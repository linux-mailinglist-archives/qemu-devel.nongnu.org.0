Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3F8380D1E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:30:57 +0200 (CEST)
Received: from localhost ([::1]:36820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZmC-0005Yg-Bx
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVt-0005wC-O1
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:08 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:46988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVr-00072x-Gc
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:05 -0400
Received: by mail-qk1-x72e.google.com with SMTP id 76so28990224qkn.13
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8edEzhGtq2xMFYEZpXK4wZ0FVGZmgn9bdMJp8iCQWR0=;
 b=g37ilEz3daZUPTXd67yvR3chAn216ztyn2MSXmx2nGnySaJFqcfXFNNhQb97jreqK9
 A+cLmKIVJtZZ4leVk1H+l190M62h5OUquSDM/zJVaby40Edxfbi63myE2qEmh3TznAff
 hjWYfjz6y51h80XZ5EL4OMMUYTingJnL/2q3LmT69mOnhsqx/Lb4N81PCQdXiqrSCDJw
 qabRzTpfObtbBiopS/BFQERK3ObKQjIL8vIonPSMRTOAp8RNzEGkzyDLlnM4+48PxzxU
 V9f2oNaezR5oQB5o6je5Pf4kMp/hmoEc0qtDHxSgw3feJrX3tY8b6x6vI/0SOWYPgFRH
 Nlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8edEzhGtq2xMFYEZpXK4wZ0FVGZmgn9bdMJp8iCQWR0=;
 b=V18AQmLhDb5d0/wswIApp3Eu26TS0Z0oMfW0TlvzUznlm4Lb3vqmZJmuHlB55wLbwr
 EDR4hP8eWns1/Px1+u849F1aPA2UxclaJLhvZEjVBwaT0b6fSPnobnB8RZdUKXN+X+M2
 97qoiIKxshE5fr8/p5AlPTyQL9pLtRPMmtdFYUmpqVdXFzVHNjGj8ehW4OVomg7xvhbp
 xplCAUZx5QYVwbitlVTUeyec0Kp9YGhUABJQwkGLmQBcqOnnXWrtIwMHLNmOkGVys67U
 uIfP6Q+37DOcCuAwkl4iBgdSgjs36aI1CYjDB5uS7+m4vSzE2SznYLSBvmXGdII1IFaG
 9rPQ==
X-Gm-Message-State: AOAM533hFK72EbZb9t40DO8mpazljFVWWA84kKfeo1IYC9TAJm6kpfiS
 j0XtAVKv7znGVFpEV3CsEeOhbE5t9a8zfar7JNU=
X-Google-Smtp-Source: ABdhPJxO7W2l1o/96E1bfPscOtBDFH0yAv/1X5Im1J4CDMcIOqvh9RY38R80Y+VxDbpD/0Z6fIYY0A==
X-Received: by 2002:a37:68c5:: with SMTP id
 d188mr31816815qkc.287.1621005242694; 
 Fri, 14 May 2021 08:14:02 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/50] target/i386: Reduce DisasContext.flags to uint32_t
Date: Fri, 14 May 2021 10:13:12 -0500
Message-Id: <20210514151342.384376-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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

The value comes from tb->flags, which is uint32_t.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 7e296b39f5..ca7f0a8cf4 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -105,7 +105,7 @@ typedef struct DisasContext {
     int jmp_opt; /* use direct block chaining for direct jumps */
     int repz_opt; /* optimize jumps within repz instructions */
     int mem_index; /* select memory access functions */
-    uint64_t flags; /* all execution flags */
+    uint32_t flags; /* all execution flags */
     int popl_esp_hack; /* for correct popl with esp base handling */
     int rip_offset; /* only used in x86_64, but left for simplicity */
     int cpuid_features;
-- 
2.25.1


