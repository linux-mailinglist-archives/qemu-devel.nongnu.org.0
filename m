Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854AE6EC58E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:53:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqp4u-0006bB-MV; Mon, 24 Apr 2023 01:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0b-0006FF-4o
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:45:19 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0H-0005MY-Tt
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:45:04 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f46348728eso2305219f8f.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315079; x=1684907079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
 b=loIzhHVZ8cgAyCUje2Ol0tC5Qt51NjEgcT4ZD9Zb1mlwqhk0tOlMugfWrtEQagx2wY
 qlw1gWu0L20Oe1mD+X/Cu1PUaIJPx5hT0Nc3AYOxMWStRTDn0GmixILlCWyE1l4BnG2K
 JyFl6h3Zj/bPkuiXJq1fZdiMW166ZnvVkh4AvFu0uVQLQXFdvbjYk2qrJDJwj/DGh0nR
 ViyYKW+q5Srv1AqV36Eaz0AcUSfD1Q6ZyCNlpSYyVwELChJUh1YCJQcsLQBqmgS6EpAu
 j6HqXMqv0n+Dp9qbp2SDhNprGk1g7cfhJemzPLI/j4IhSTVqzmFoU5x96cYcbQbNE53X
 xnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315079; x=1684907079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
 b=SAHNFxyeaNsYReeL6LrLGETUiiqRkXRQS4rwbOVhMha7A8yZy7WpRyNBlU8QwV2rmo
 7qTwb0Wpi/0VhN5KQPHRBx/CtAsxzilFnVM6DtlAphdG3iBcfZTpHjNF5fz41/hW3mCi
 CnO6oxsQuVR2UwUkKKCyXtG6FSvVTtcEbWYcUlzt/BOH3VQkJzdsI2hXFOL3sLdi3Yaq
 jFR4am0q28cY+FT508iFatY8OoExM7uvymLP5NTuN86pg2T5iLC3ZRhdkHbh/5P4awn9
 g7BqAQ9WA7L9NLPgWJq+Cg3zFq61zVp3gko8BaBsp6bkn0VAi1h9OZeuhHK/8c215iVJ
 ySRA==
X-Gm-Message-State: AAQBX9esdLREbtq8P2Fx0E+5oKuPHEgMxC4EG063MImAz4YHDhzafhcG
 X6HNAYlQ4kF8rSgUaPeHqZnASUhAfJghvFjfyJdFhQ==
X-Google-Smtp-Source: AKy350YLuLGV8ZheQEDDsp8qyRoZQukAvkXyZKEyz/r7xn8sYqfCboOZzm2FV6WC52pWumUTwABB3A==
X-Received: by 2002:a5d:428e:0:b0:2f9:b08a:a3af with SMTP id
 k14-20020a5d428e000000b002f9b08aa3afmr7404891wrq.49.1682315079542; 
 Sun, 23 Apr 2023 22:44:39 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 56/57] tcg/s390x: Use ALGFR in constructing softmmu host
 address
Date: Mon, 24 Apr 2023 06:41:04 +0100
Message-Id: <20230424054105.1579315-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Rather than zero-extend the guest address into a register,
use an add instruction which zero-extends the second input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index dfcf4d9e34..dd13326670 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -149,6 +149,7 @@ typedef enum S390Opcode {
     RRE_ALGR    = 0xb90a,
     RRE_ALCR    = 0xb998,
     RRE_ALCGR   = 0xb988,
+    RRE_ALGFR   = 0xb91a,
     RRE_CGR     = 0xb920,
     RRE_CLGR    = 0xb921,
     RRE_DLGR    = 0xb987,
@@ -1853,10 +1854,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_insn(s, RXY, LG, h->index, TCG_REG_R2, TCG_REG_NONE,
                  offsetof(CPUTLBEntry, addend));
 
-    h->base = addr_reg;
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
-        h->base = TCG_REG_R3;
+        tcg_out_insn(s, RRE, ALGFR, h->index, addr_reg);
+        h->base = TCG_REG_NONE;
+    } else {
+        h->base = addr_reg;
     }
     h->disp = 0;
 #else
-- 
2.34.1


