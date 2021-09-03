Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B49B4001A6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:02:30 +0200 (CEST)
Received: from localhost ([::1]:57054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMAi3-00022h-Dk
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mMAfV-0001Cd-2t
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:59:49 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mMAfT-0002pg-AC
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:59:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i6so8648854wrv.2
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 07:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eWIxMU12TOrgBs0giYNKVvqdRflVmfRfnBEVeqj3WTg=;
 b=QdwQzLyYzsWY3v5d0egPyG7MGbcb3hGgz0eRfkAFLEdK3585v1pGtwsZNYmraM/05k
 pSl/k5SIKSuhSYnc5t17p1SmGxOSc1RkgP4+8CAPOJaKINrJ3vjJ+YQ5Obgc5UgsoKNS
 73LP+Et71LzcP6mn077mLkYbn6mwHBq7WEwYuwYAErX05A8PKapjIv0jHBWAZkvhEtRr
 kaRqPozGGRVNjMaPoRDB5XXj4WIMiB4hARR2CDZ9JQgCpVSvAG8v93BYE6XFvjP5IhSp
 22b6Omj2OBBgtQpdCB88H+bRxQnoG50cr5IwEfC6eJg38HAif5jPbWrBfbqlN/rkcjE0
 6LSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eWIxMU12TOrgBs0giYNKVvqdRflVmfRfnBEVeqj3WTg=;
 b=Y1RRuCzHTn9rHYpZ+uXbo2v1P8lD+XxJPCh4Bkae5GUO04/KpSAO7dwIcW+OnauQkQ
 //paPqPgX9CIgR3wCYzYgRfbWW91hf1bA94hvtsKPXneg4W+PUIG+g0/1wAepFtVYDQK
 1GQPveNdHBmgScNiENs2ZCsJQ/yAS//sgWAi51W2SxclvDtEkACZ1pndZUemnt0VbmEQ
 +DPOwk9+PIYzm8EPz+ofdfztwf5+XleyIDbwPxQT9y21FAqf7fqNzww+VBRz65YKt66t
 gD1cEN6A22hL4FpKqGQwXDmOQlR8eXLoRK012PTmTcLKjUh9uT+VM+kCookEEzKBOdn6
 NJLw==
X-Gm-Message-State: AOAM530iapJKBC538uHtFxQ8mELUca93QD2vSFQQXO+IW9w8c/p3P9zm
 jR83UbW+9Fto03JdQZcK5pSBkA==
X-Google-Smtp-Source: ABdhPJy5dLBhFvwp8ZSRgrOOF/wHWbaTigaaBKfPILi8j251p52wbSboMcLixe7jtCkrwkqZTZA8qw==
X-Received: by 2002:adf:f84d:: with SMTP id d13mr4797801wrq.292.1630681185032; 
 Fri, 03 Sep 2021 07:59:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x9sm4296548wmi.30.2021.09.03.07.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:59:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6AD0B1FF96;
 Fri,  3 Sep 2021 15:59:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] accel/tcg: assert insn_idx will always be valid before
 plugin_inject_cb
Date: Fri,  3 Sep 2021 15:59:38 +0100
Message-Id: <20210903145938.1321571-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity doesn't know enough about how we have arranged our plugin TCG
ops to know we will always have incremented insn_idx before injecting
the callback. Let us assert it for the benefit of Coverity and protect
ourselves from accidentally breaking the assumption and triggering
harder to grok errors deeper in the code if we attempt a negative
indexed array lookup.

Fixes: Coverity 1459509
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/plugin-gen.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 88e25c6df9..b38aa1bb36 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -820,10 +820,9 @@ static void pr_ops(void)
 static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
 {
     TCGOp *op;
-    int insn_idx;
+    int insn_idx = -1;
 
     pr_ops();
-    insn_idx = -1;
     QSIMPLEQ_FOREACH(op, &tcg_ctx->plugin_ops, plugin_link) {
         enum plugin_gen_from from = op->args[0];
         enum plugin_gen_cb type = op->args[1];
@@ -834,6 +833,7 @@ static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
             type == PLUGIN_GEN_ENABLE_MEM_HELPER) {
             insn_idx++;
         }
+        g_assert(from == PLUGIN_GEN_FROM_TB || insn_idx >= 0);
         plugin_inject_cb(plugin_tb, op, insn_idx);
     }
     pr_ops();
-- 
2.30.2


