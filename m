Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA6E5048B8
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 19:58:25 +0200 (CEST)
Received: from localhost ([::1]:52652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9AG-0001bB-Vm
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 13:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wy-0000fU-Qj
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:41 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wv-0003H9-Sl
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:40 -0400
Received: by mail-pg1-x530.google.com with SMTP id j71so1443664pge.11
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RxLRcUMRXZIX8VeQpjedlgnjJfO7UvkrNmgRZi4O4+0=;
 b=KdLM8h1JGtzeZuX9glkjRthvPMUmMwW7CNEQ/sKHmk5U8L+Lptw5Cj5sJvm/W0qu6Y
 1aQIDVX487Smbz7Tqsw/pP7DR4DmpUh4cvKjVuXnB9TWKHf3iQnK65l14jjz4yljw59B
 RF1ySx5Gb3CLSsWlepjHm0JeiezwKG7brMkVw1TuawQMvI2GoqEOm4pJKLpjuCbnGbg9
 hXHKQNxfxSAJgr7AjVn1jMncJK1hFKLIMktb4ZtuIPfppky6hwDFivDupaEglnz44f5c
 RXCYzPzhN+brwePv6ln/I1dLX/8Fn4LEGJ4GWODZ/PTOvHHvhX0bZA7k0Zcfb0b6yT18
 35TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RxLRcUMRXZIX8VeQpjedlgnjJfO7UvkrNmgRZi4O4+0=;
 b=4oZ9pkXMJjlehQ1HTsbVckC6mdrZr0tx86zmKQPsIdCVHGWhpRpv5PIg0Ko7SoTwbM
 ++axaJ+cfnU+b7nCz+oPI247pit2muvb4U1m104puFyzZNiZTqw4ORQ/Rjg4xFOBnNJl
 clDW61TsbooUfvm5orhM/dFmAYx1WZhCOt6u4R13RMUpSULjefaywgdeDStDYkA5NKG0
 XdqLt2AariWWj0FioeLaGKBc6bHyZKCa1eITIlVxkAC/BGakivKxcarrGQlQFt0s/3Hh
 t4LGjsDqf0HW3ybRfho5PQPgmwYHkwnk+MaM8aCAHbMSenX2y4MO6Bos38GXW6YRxQ86
 FCxQ==
X-Gm-Message-State: AOAM5320eNbb5p7KjtXXWpe5riVbabuN7XtuTSr6TTmbT8AmziUV7My0
 IHedV/5tPMuDfHQgHL6P6bgfrmsGrt7IAg==
X-Google-Smtp-Source: ABdhPJwVhj1ZYuQygR/efqLh80XvFEaPDxzU7OvdsZGapHWLZcCuABZt+X84fqo/E2pW/7W0zcT+Ew==
X-Received: by 2002:aa7:920b:0:b0:505:66a5:3029 with SMTP id
 11-20020aa7920b000000b0050566a53029mr8313795pfo.40.1650217476615; 
 Sun, 17 Apr 2022 10:44:36 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/60] target/arm: Change DisasContext.thumb to bool
Date: Sun, 17 Apr 2022 10:43:34 -0700
Message-Id: <20220417174426.711829-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bool is a more appropriate type for this value.
Move the member down in the struct to keep the
bool type members together and remove a hole.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 2 +-
 target/arm/translate-a64.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 8b7dd1a4c0..050d80f6f9 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -30,7 +30,6 @@ typedef struct DisasContext {
     bool eci_handled;
     /* TCG op to rewind to if this turns out to be an invalid ECI state */
     TCGOp *insn_eci_rewind;
-    int thumb;
     int sctlr_b;
     MemOp be_data;
 #if !defined(CONFIG_USER_ONLY)
@@ -65,6 +64,7 @@ typedef struct DisasContext {
     GHashTable *cp_regs;
     uint64_t features; /* CPU features bits */
     bool aarch64;
+    bool thumb;
     /* Because unallocated encodings generate different exception syndrome
      * information from traps due to FP being disabled, we can't do a single
      * "is fp access disabled" check at a high level in the decode tree.
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4dad23db48..be7283b966 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14670,7 +14670,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
      */
     dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
                                !arm_el_is_aa64(env, 3);
-    dc->thumb = 0;
+    dc->thumb = false;
     dc->sctlr_b = 0;
     dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
     dc->condexec_mask = 0;
-- 
2.25.1


