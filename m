Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE7350A7C2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:05:03 +0200 (CEST)
Received: from localhost ([::1]:44042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbAs-0006Z9-Oc
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaei-0000n4-82
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:48 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaeT-0002wm-QW
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:47 -0400
Received: by mail-pl1-x630.google.com with SMTP id b7so5524535plh.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ezPeHZwRhMK3J/mr8sMEjy7zxNhMKWlBGFUNACOiAjs=;
 b=XJsmN6C758zstOfcrMcZXbV3mDOq/rKwctUmPPXaaqZMVUcM7weBAKUfaUKHuj8gUY
 IpfKk7rKJw9LizUHiKYNrrvDB6TSA8d2dlu+woyA+Y5y/l7pVxTJVx6eyFA0MKtn05tY
 BqpvTxHTqmGnpj8j6Jl30/vTqnqDOIcpXrWqkgILqyfIS7h27TpDqSAst0wjoN084F6y
 hB1cckGZ0I13W/S/cAvuTFHSi3PyZnfszbb23STVO4fl+Bqvd1NfY9ILkzHY1rs7U+ce
 YawxGyTtpajG6yoYBodghAHnYx8MD2gd8tw81FouKHLVET6qNYubEpgDeZN+51yX+FlC
 Ne4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ezPeHZwRhMK3J/mr8sMEjy7zxNhMKWlBGFUNACOiAjs=;
 b=0jwFghhE9dFSe/gbKTbvk+nsU/wxLpS9a2SpV+xyLTlTNCKtypgQ8RY/OqW+xQ0j0I
 HAO+KkWe0h8h3+tuwpLUX78JHRTWeg/kyFJcjZisU4986XnX3iffRS1ezWFYbP+z/ZoU
 MCbw1igYP7bVANEn/N+dAk+vGC3iZEzaPdE5SXnh+xGBYGzhN8nDZU/GyfbJnMuuBmsK
 YhM9TBbuHO0Ks+KaC6cT2Sp5+uFp9Kb+LRWZWWsqLwniZO/NavsNDQAUgMETT6jdXr1Z
 qLwWmXuhc2oNoAYiZubaN8HNUwqhS+7mxkJpPXhHdzF3x0DtD1W8P1OYj7J7qH8Lapap
 lyqg==
X-Gm-Message-State: AOAM530FBMxMH4KmewzEVTlVzugjOpV2gtK2O5eaTHFtUe4qTb6Z6YzS
 fP28dUUFqhc8ncOBV58i6sgkkPzBO+NgspIj
X-Google-Smtp-Source: ABdhPJx8FVrZkrZ75knHs2Fu76AGqhV8ThLmg7TDl/7WDqU0ODU15Vk9fBtWbV6sngG3L7/7mYoULg==
X-Received: by 2002:a17:902:aa06:b0:158:f13b:4859 with SMTP id
 be6-20020a170902aa0600b00158f13b4859mr454547plb.141.1650562292482; 
 Thu, 21 Apr 2022 10:31:32 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 204-20020a6302d5000000b00385f29b02b2sm23557644pgc.50.2022.04.21.10.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:31:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] target/rx: update PC correctly in wait instruction
Date: Thu, 21 Apr 2022 10:31:14 -0700
Message-Id: <20220421173114.48357-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421173114.48357-1-richard.henderson@linaro.org>
References: <20220421173114.48357-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Tomoaki Kawada <i@yvt.jp>, Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tomoaki Kawada <i@yvt.jp>

`cpu_pc` at this point does not necessary point to the current
instruction (i.e., the wait instruction being translated), so it's
incorrect to calculate the new value of `cpu_pc` based on this. It must
be updated with `ctx->base.pc_next`, which contains the correct address
of the next instruction.

This change fixes the wait instruction skipping the subsequent branch
when used in an idle loop like this:

    0:  wait
        bra.b 0b
        brk   // should be unreachable

Signed-off-by: Tomoaki Kawada <i@yvt.jp>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417060224.2131788-1-i@yvt.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index 63c062993e..62aee66937 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2285,7 +2285,7 @@ static bool trans_INT(DisasContext *ctx, arg_INT *a)
 static bool trans_WAIT(DisasContext *ctx, arg_WAIT *a)
 {
     if (is_privileged(ctx, 1)) {
-        tcg_gen_addi_i32(cpu_pc, cpu_pc, 2);
+        tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
         gen_helper_wait(cpu_env);
     }
     return true;
-- 
2.34.1


