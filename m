Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035B6643C2A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:19:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POn-0003RG-5m; Mon, 05 Dec 2022 23:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POl-0003QO-7H
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:39 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POj-000719-If
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:38 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 v19-20020a9d5a13000000b0066e82a3872dso6548222oth.5
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VsbLI93FZVgakuE1ah+UYlgKlpOz2uEL9CaUUy2CR+0=;
 b=jObHoPF//9ZmJjOl3ak8MzivBzG9ZesvH5Sz3yVk9cCWS9Igxb0IvmP9aHKCxsdGJo
 S4fRt0xwHWrHqLkpcwxfNUHAvAjkoSh3Cd0c1SbRvTDBl7mBl/tdCkEOVPcMqdJcEwx2
 CWqwynzw1lVlr9PUbJCY86rOZqW5Wd5DX4WSiSo8V/u27xj6+GAKO97hqgm/X8MM2A/i
 XxNfX5kHeXR8D1JSeRn8ctuib2/g6DXSO2eusydaVjWRZnV6/6mAYHkpR5eb31BL17uh
 aTow5xAddmj8Rq9cCGVHKNS5nWqYwj8kTGsajqtCZwruyAfC7J19huipl+JWFKK2KEiX
 Gw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VsbLI93FZVgakuE1ah+UYlgKlpOz2uEL9CaUUy2CR+0=;
 b=NPFNOgVkNyu0QT8rGdOYzdc905RCN0z2QnZWGu709ntZGkkTyFsAIiPLAkhG0r6TVz
 SA1Wwq5KycFiKKwh71SYB1G7llJUEDLT79tjPsrsRowucF+xIcvQniU3T5yclY7r1UGG
 SUflnkuUtfakyaGTmcCb6GSeTG32oebCHtEzio7za4q/FNyv+V0Wee9ZTiWPbzhME7JH
 MwaCmSsyJOjc2GtQlUnVHUqgHaL/1lrkd5NcgP+slwjiajnonUox6NWQ15I8u5MrfdYO
 tY+CDXqt1c3QtHeA5k9ejos7fo1/Z7T//GzBmK0sXR1/eoH2KZnu8cj7vtfxU53zO3kU
 DeQw==
X-Gm-Message-State: ANoB5plng6qDI5WJ4HmSjZyz5Xe0dyJOCeFV2l04FP0sEdsdG/Bu4BxS
 udOqVad042eDCk3LsEs+Te+kWnAstzr4cXxFNS0=
X-Google-Smtp-Source: AA0mqf5D6nA/NxRKGmTwYjJN89gneUzIWNO/1wdXYcUh0jiHvsaOPKBQRY3guRAt8H/XQ0siBNkLOQ==
X-Received: by 2002:a05:6830:91f:b0:66e:824b:e48d with SMTP id
 v31-20020a056830091f00b0066e824be48dmr7992752ott.212.1670300256343; 
 Mon, 05 Dec 2022 20:17:36 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 14/22] tcg: Always define tb_target_set_jmp_target
Date: Mon,  5 Dec 2022 22:17:07 -0600
Message-Id: <20221206041715.314209-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Install empty versions for !TCG_TARGET_HAS_direct_jump hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc   | 6 ++++++
 tcg/mips/tcg-target.c.inc  | 6 ++++++
 tcg/riscv/tcg-target.c.inc | 6 ++++++
 tcg/tci/tcg-target.c.inc   | 6 ++++++
 4 files changed, 24 insertions(+)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 0afc286c8e..f5103dcc6d 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1958,6 +1958,12 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* Always indirect, nothing to do */
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 605aa7714a..dfb31a17bb 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1976,6 +1976,12 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* Always indirect, nothing to do */
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index e73dfb4cbb..06308c5243 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1285,6 +1285,12 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* Always indirect, nothing to do */
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index cf84ff3133..31094067b7 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -606,6 +606,12 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* Always indirect, nothing to do */
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
-- 
2.34.1


