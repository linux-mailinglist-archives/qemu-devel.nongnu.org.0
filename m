Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42243895B1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:44:25 +0200 (CEST)
Received: from localhost ([::1]:42840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRBA-0004GJ-Re
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyO-0003nF-0b
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:12 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:41800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyL-0005gl-Av
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:11 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so12592015oth.8
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=apQ7cUSEoG7Sw4F7rOAU3FhzYTNsiwzo7lp42fC1tSs=;
 b=i0hb+ltz7WDZUrIHAobLDKKjCLVs9mXeLJXjDBQwMPBv1yl3yyY7v7DLXtbnsBS+/d
 QWppEePg6qO9B49qBK+EOEiCdVl22vFj7ejhB3WHIkChMOvnxxaBInNHVoPV0Jp0V4Aa
 RGSJr1FmqCfAROSU5I8HkIuIebnpOd8T4X7K4A7Yvc//7YLBpR7ulGkSt4F6z25q8DNC
 qHDgxEvMruMWnDkQ8pt2J02Web2vkCNpfo4x1Gza/XuY9FBzghlqH+K/armR4iNj1yFa
 ntPoirMexbflILrCf+I0ZxFSJBq40LxL/anDVp1pOw9XRJnrs+OTGGpL7+u+08SJ2f6G
 cJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=apQ7cUSEoG7Sw4F7rOAU3FhzYTNsiwzo7lp42fC1tSs=;
 b=Sx9+DDrZNEqbvl6pa+X9vrQUm9g0MuiX+UuQSqmcf5qsIkx6vJjXJJ1gckFSg6x4Uv
 +qlMXGQfiLjC1WWM/K3ffQocu6BqXjgX/S3+pJLaWadhPfVbBtjtZ9ZOPGu4iCdlj8PQ
 tkp/PwqccxQhRk5JiXoN6wpjF9ilkQ5fKGNgqDsjUGV9ZL5f+aJdmeDIE/Jxq6cLQcjt
 SDp7gZwPvnCylWiOarbAoWHNXJRHcsQ5nClPiPgKYsMCtO59k/RdVbf1v9dQsT+MXVLe
 3WnknageqJcMDB3NbCPGGLVQHZlDvHdfqpg7PRKR4JQ4O53G4Zjqr1jBX+1MvuFOlkSW
 BWGQ==
X-Gm-Message-State: AOAM531TewrJqk9NjM5CpQR2yt7+aygBZdj9dZxJVwUKuVIzOtLf0eLt
 MPyaAnjKHzvPr0ZEoYSzx4gN06d7TBKTjqq8
X-Google-Smtp-Source: ABdhPJyzPt4udU150UPRJenjH93a3ZOtBMgCKQa+s8RBAByCRrpC6QcjNHajOTVUY2WYvbeSn3KBaQ==
X-Received: by 2002:a05:6830:1311:: with SMTP id
 p17mr655209otq.224.1621449068253; 
 Wed, 19 May 2021 11:31:08 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/50] target/i386: Tidy REX_B, REX_X definition
Date: Wed, 19 May 2021 13:30:16 -0500
Message-Id: <20210519183050.875453-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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

Change the storage from int to uint8_t since the value is in {0,8}.
For x86_64 add 0 in the macros to (1) promote the type back to int,
and (2) make the macro an rvalue.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-17-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 79a37fb1a7..9bb37215d8 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -41,14 +41,6 @@
 #define PREFIX_VEX    0x20
 #define PREFIX_REX    0x40
 
-#ifdef TARGET_X86_64
-#define REX_X(s) ((s)->rex_x)
-#define REX_B(s) ((s)->rex_b)
-#else
-#define REX_X(s) 0
-#define REX_B(s) 0
-#endif
-
 #ifdef TARGET_X86_64
 # define ctztl  ctz64
 # define clztl  clz64
@@ -100,7 +92,8 @@ typedef struct DisasContext {
 #endif
 
 #ifdef TARGET_X86_64
-    int rex_x, rex_b;
+    uint8_t rex_x;
+    uint8_t rex_b;
 #endif
     int vex_l;  /* vex vector length */
     int vex_v;  /* vex vvvv register, without 1's complement.  */
@@ -173,8 +166,12 @@ typedef struct DisasContext {
 
 #ifdef TARGET_X86_64
 #define REX_PREFIX(S)  (((S)->prefix & PREFIX_REX) != 0)
+#define REX_X(S)       ((S)->rex_x + 0)
+#define REX_B(S)       ((S)->rex_b + 0)
 #else
 #define REX_PREFIX(S)  false
+#define REX_X(S)       0
+#define REX_B(S)       0
 #endif
 
 static void gen_eob(DisasContext *s);
@@ -4617,7 +4614,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             rex_w = (b >> 3) & 1;
             rex_r = (b & 0x4) << 1;
             s->rex_x = (b & 0x2) << 2;
-            REX_B(s) = (b & 0x1) << 3;
+            s->rex_b = (b & 0x1) << 3;
             goto next_byte;
         }
         break;
-- 
2.25.1


