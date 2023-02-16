Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647C6698AD8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:02:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUTV-0003iO-Io; Wed, 15 Feb 2023 21:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTU-0003fq-0Y
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:20 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTS-0005oV-D0
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:19 -0500
Received: by mail-pl1-x635.google.com with SMTP id r8so708135pls.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9MYkYHWZA2BK/uGhp/+Wu1+AiImWiE3k4spOtSXkSE=;
 b=WZKVtdf3zU0ANvXnRmUD0SjFo2nu7PQ3Bfn5skyEi0PNCsNWDMBD9bxxDj9SuC12kD
 n6Tnk4xEufGEksK1ooN0UEW6hmZV2dcBRUgsYh9JJf4hLDFuMadongk8TegFjilLt8Gv
 mnhOg8s6pVTFGNx2hSWADbsJr5GdB62g6xjLZNiaKzU0NQrGLZoSd8UgwEgyOTOKbERV
 xMhzlesHmM7nDZuYB4bkaaGcnAkDBrUc9FAPXdisqZq4rugPQe372VXVdS+GzRTH8lPW
 82Q2D3k8AEqfqYvC8XwgB921z60wLmgkA8G0fQk9c1qnh3eHzzI+T/CQPndKw52Tbolp
 58yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/9MYkYHWZA2BK/uGhp/+Wu1+AiImWiE3k4spOtSXkSE=;
 b=3E2T6G3+spIeDjvrjp4vs2ektzt+VKLW5lHnVX1lJEEGi3HkrS7oG4If61QvlkyV0i
 iZRzjTcNGgwhpyrE1EbJHDIXywibGTvuKQyfprQeeXcLMUPUCLSyPCHj0qnEu06SmJOj
 tHbXeuXCZTZeCF10azs69pPpcOI+BPHVV/Tw1f8nl6Ip6UgZBBRPWwe99qoFpTqXVWaK
 KlN+ZCds5tkI8yX0elajsGNm+szDz9IVGZgBCEfCxgPHmX9+fTPZsu5x5krXiWfJOhJA
 wyQCRC2xxqZNQMZWIUwcU8VR5JKCnODiI0Ny2T0fwe4sQ0+zNEAt/8alMsix8Dt/wDpo
 JNow==
X-Gm-Message-State: AO0yUKWJME/GiiE/nPWjPKKCRZzlFJQWRmp9nHKA7ReOsCxKixYJoTEB
 tkG4z13HZWdtcXCJuuwupFj5Q/juRuSkw7NKyBw=
X-Google-Smtp-Source: AK7set/9MU7/DfoFLOk53rZphZXAR9fmXEugH/V42nQSl2Gk8AdlTRwM54fel+v1F0vtas75LoK15A==
X-Received: by 2002:a05:6a20:8416:b0:c7:13bf:3fd0 with SMTP id
 c22-20020a056a20841600b000c713bf3fd0mr1363274pzd.25.1676516297101; 
 Wed, 15 Feb 2023 18:58:17 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:58:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 26/30] tcg/i386: Mark Win64 call-saved vector regs as
 reserved
Date: Wed, 15 Feb 2023 16:57:35 -1000
Message-Id: <20230216025739.1211680-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

While we do not include these in tcg_target_reg_alloc_order,
and therefore they ought never be allocated, it seems safer
to mark them reserved as well.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 5dcea7e198..21442c9339 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -4232,6 +4232,19 @@ static void tcg_target_init(TCGContext *s)
 
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
+#ifdef _WIN64
+    /* These are call saved, and we don't save them, so don't use them. */
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM6);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM7);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM8);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM9);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM10);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM11);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM12);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM13);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM14);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM15);
+#endif
 }
 
 typedef struct {
-- 
2.34.1


