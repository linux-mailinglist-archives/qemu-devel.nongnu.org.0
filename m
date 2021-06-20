Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317C93AE0D7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 00:15:23 +0200 (CEST)
Received: from localhost ([::1]:35764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv5is-0000zH-9H
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 18:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5eY-0001co-Uk
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 18:10:54 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5eW-0007sw-9E
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 18:10:54 -0400
Received: by mail-pg1-x52e.google.com with SMTP id m2so12557001pgk.7
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 15:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yw4nXpsUXP/IcY+QkLFOYlqRS4uebEjEIFpOqCI8OKc=;
 b=gkZzBwREd7t0VrFYbEpVxo0bfctP2rWz6YAzFS7EMwEQqrQvdGW81MXcqG9t9bV9Dg
 tnObhQWonDsKXk+ioNcaGDT8bJGQgneiXRJOkXynqix07ozOcM+CcEYEf3w4v00kyA/i
 dsNj2yZEqoLXPyVK4kUlygZd/p1xem+KS9es1ADJMfr8BYjIlH9vKWfKifvir3PTCnbs
 JZLTNawv2c23UCiX2uYv2a0TyDtsNmS7vemOP+IyMpXdUO/fEg9qShh0G5pwqKCERNib
 JmSa41CSpjRzI9m4cti3kalWYNCvuAngWGx/giH3/xtx6B261jTI7G7GeSfo/cERZ1Xq
 1E5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yw4nXpsUXP/IcY+QkLFOYlqRS4uebEjEIFpOqCI8OKc=;
 b=qPH8+qlT+WXApE24E+zIhGEhirce2hh9jt22UVDAY5MFr/Jgy5DBUrvo3qMfMOMbjQ
 /JUEdQTDr+imzDhjxour1+kbxZaLrNectA0ZrP3l4g4FT0g9w4l8fKWFnW0c3Hx4W4gV
 CxpH1GetwN/jjiO89d+WmJU1vhv/2gR76BX9AQaVjCtaG2B0oXkkaTqoegZemUHZ1KIJ
 BzutbK4WIq0W2I5a1d0Xy8t3mXjEAWxMtQWeFMtxND531NPVfjzDFmAYNIcHjG4OT7Bt
 GY5/W6MmrDx4XHGbZqFJ195f0dP99IFiq987Gz8yXfUVAaFbif+H/M03n4s3Dc+GDDmk
 lcCw==
X-Gm-Message-State: AOAM5313n6uWYK9MNy5U6gt4j3RNnCb4jIbUbnHSfs4QpZrKuzMcHiLa
 F91UtQsAgrudCMnqlUxNg/8VsLQpyTy3xw==
X-Google-Smtp-Source: ABdhPJxdwHTvcNUaUVjuWH9S62lCQcxucwDvWHXjlkVSM3NaBFNkjue+PdUgAulqhzDwggMuqaL+Ig==
X-Received: by 2002:a62:7848:0:b029:2f7:4ecc:f14 with SMTP id
 t69-20020a6278480000b02902f74ecc0f14mr16081777pfc.77.1624227050998; 
 Sun, 20 Jun 2021 15:10:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm11122961pgf.20.2021.06.20.15.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 15:10:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] target/nios2: Remove assignment to env in
 handle_instruction
Date: Sun, 20 Jun 2021 15:10:45 -0700
Message-Id: <20210620221046.1526418-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620221046.1526418-1-richard.henderson@linaro.org>
References: <20210620221046.1526418-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Direct assignments to env during translation do not work.

As it happens, the only way we can get here is if env->pc
is already set to dc->pc.  We will trap on the first insn
we execute anywhere on the page.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 06705c894d..31f63d9faa 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -740,14 +740,15 @@ static void handle_instruction(DisasContext *dc, CPUNios2State *env)
     uint32_t code;
     uint8_t op;
     const Nios2Instruction *instr;
+
 #if defined(CONFIG_USER_ONLY)
     /* FIXME: Is this needed ? */
     if (dc->pc >= 0x1000 && dc->pc < 0x2000) {
-        env->regs[R_PC] = dc->pc;
         t_gen_helper_raise_exception(dc, 0xaa);
         return;
     }
 #endif
+
     code = cpu_ldl_code(env, dc->pc);
     op = get_opcode(code);
 
-- 
2.25.1


