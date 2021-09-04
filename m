Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268A7400CE7
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 22:37:43 +0200 (CEST)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMcQ2-0000AM-6l
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 16:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNq-0005sz-4h
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:26 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:35538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNn-0002rq-Qs
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:25 -0400
Received: by mail-lf1-x12d.google.com with SMTP id k13so5372640lfv.2
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 13:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VXRUh2RNxOPq7aVtgUqJTY86Nx2WcsRc44jSMulnpm8=;
 b=auDp2Hbb/B2DkvihJ/tPBBKv/4JbikXTz4AtbeYOEeaMyOrBY1RSIOdL2fihKCWYQ9
 5kJbFPrzFnruU1Bu/P86kx7XqUDiJJaK0ROaO961OrIFSqAjsFwz0MIcrsDO4Bq6VWcr
 soAlJFZRHhrXxsNzCk0GROAHg4JefhjzCGYK5z2i9YkCPvV5X7TxeKIYl4fC5AjMYJhp
 CcM/P+yqn9f0QffyZ1JiaKTuG8GyJtxTdzowY5vj7/+IOpXUu9Av/Q9/PposfET67lVK
 iowpCOOBrURNXDPQn5JMkv6SpSLb3tZ0jt9r2p206wgXC/deAIJZxP8AttURBxJk1OnK
 0FYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VXRUh2RNxOPq7aVtgUqJTY86Nx2WcsRc44jSMulnpm8=;
 b=eM1fLhlCaDr8dlNKsxNMaitkdgTkk22kSa/L1uzC9N2+6Lqz5Am1gUmQSMJUzdU+T5
 RXpjvxhED3fTGwchZdnD/kiqL98J/MsEJQyx8AT4s/hy5RezwtcdX2G/pDfmeLrJxnKe
 TZyg6oMtHdy1pBUEUW1OEwlG8b2A14nAxZNzX1G7YwHTcNaLdaANCuQOS1b1c5DTqLaV
 Ew/Kpth+EF6XcMcO6ijiiTxXYt6O+Vdek91+ScQanTfQKpHJ7BkbwGcap45yevskRIF3
 UXnKItIvzTm89jPRUjCG6Y4uOb7TJPUBocJk+wRNzZZn8AEOy8mJ59DFdOGfiEY0bZsi
 8iRQ==
X-Gm-Message-State: AOAM530k0PUes+ExL/RXF2GE5xDYku3EkUazyz9qsPv0Ji++XR07Hrfs
 +gvivEjz9Fn9trQECReLRzOho8/O5+K8laesdsw=
X-Google-Smtp-Source: ABdhPJxufJhORPqZTheLDaR+XiYd94jUxc1IZI/z8znQU7Tbr0J7gnrV5089EIBaW3O2HZ0FbLwUUg==
X-Received: by 2002:a05:6512:3f9:: with SMTP id
 n25mr3955489lfq.231.1630787721002; 
 Sat, 04 Sep 2021 13:35:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id v15sm326304lfq.142.2021.09.04.13.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:35:20 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 02/16] target/riscv: fix clzw implementation to operate on
 arg1
Date: Sat,  4 Sep 2021 22:35:01 +0200
Message-Id: <20210904203516.2570119-3-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The refactored gen_clzw() uses ret as its argument, instead of arg1.
Fix it.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

Changes in v10:
- New patch, fixing regressions discovered with x264_r.

 target/riscv/insn_trans/trans_rvb.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index c0a6e25826..6c85c89f6d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -349,7 +349,7 @@ GEN_TRANS_SHADD(3)
 
 static void gen_clzw(TCGv ret, TCGv arg1)
 {
-    tcg_gen_clzi_tl(ret, ret, 64);
+    tcg_gen_clzi_tl(ret, arg1, 64);
     tcg_gen_subi_tl(ret, ret, 32);
 }
 
-- 
2.25.1


