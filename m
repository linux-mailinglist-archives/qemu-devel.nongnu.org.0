Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F366A6D4D09
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:03:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjMcl-00059e-Dg; Mon, 03 Apr 2023 12:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjMcX-00055S-Ua
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:01:25 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjMcU-0002BP-Au
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:01:23 -0400
Received: by mail-wr1-x432.google.com with SMTP id i9so29899400wrp.3
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680537680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=D0bzLBgoxKzl8wuuz0d2cPzzjDTy7V+sRD0Owr6cPGk=;
 b=q5ejblw0dpKlrjuVEd0VYgD+yndmoA0lN+RorXjENFU6b7uwfZ+CwGUILz5oxkpqhj
 CQBHXKR3Dhzf5JXrkXfzP9EPl4FbAaKTMM+KrgTKlhTvsWrb+XlBuEjSLljzi3Eb46+m
 v53Jm070q6QaYz6rXL9ta8VPTRtGc8RWpe+X8yRll0jAlrtN1I4KmiK63KZaK6q/8zVm
 6jVIO+DTJpqIcG9YiS6yxb8BINVQWwnoFX52gCCoeIaPc/vAOT6BnpVBGfQMdKmEaVwH
 oHrDKMZNDYk4mTs70Wa2gvzbVSZl17wdwYazPzRo7r5uCTibrAJix3nWoDvl7lxHOHTG
 qh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680537680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D0bzLBgoxKzl8wuuz0d2cPzzjDTy7V+sRD0Owr6cPGk=;
 b=hU8EsvLOXVSAtkt2Xqicx+if0Fbqbxc/RS+6MyT/RIy2jaiT+x4yxayt6B/yAYLAKG
 Bnv7iV+FeUoSRHKUWgGwPci9d27L9R/uwHgwtmacdP9j8xNqrEZyUvfaHYe4ILTh8Pal
 NmvbUh+2MxVP7JygNZyK+kUUfzfCyG+5n3Nf3hEX+enfo90JoCMzX2mdbqWqL+aW04Yr
 ggWu3ZRq69IKHUgkevRmf3xa4mYkXNu31kjKEI7N16H4nR99oqx8bC1kQM5undoQUS/C
 uGgvKQtol15BVUqUZTwk7vXczViR+e3mULqqOs9oz+6n9nMr9N/gnjattqGXWd/oQDX3
 p4TA==
X-Gm-Message-State: AAQBX9eJFKQDBnkyRU5Ln/ION5eAAGOwRBs3HanYjvbCO55NywKtIe/A
 e2jSjjt+sjBeGIKS9tGPmOjAVTwWDgcs3+vsSKs=
X-Google-Smtp-Source: AKy350ZerOOij0yNdUyCPiNKxnolMItH68i2z0Iw5TatfLHUbinicYkOYlOEKHCteO6nvtrcEm/v7g==
X-Received: by 2002:a5d:6a4d:0:b0:2ce:a0c7:153a with SMTP id
 t13-20020a5d6a4d000000b002cea0c7153amr30605222wrw.14.1680537680446; 
 Mon, 03 Apr 2023 09:01:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d68c1000000b002c59f18674asm10088668wrw.22.2023.04.03.09.01.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 09:01:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] target/arm: Fix generated code for cpreg reads when HSTR
 is active
Date: Mon,  3 Apr 2023 17:01:16 +0100
Message-Id: <20230403160117.3034102-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403160117.3034102-1-peter.maydell@linaro.org>
References: <20230403160117.3034102-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

In commit 049edada we added some code to handle HSTR_EL2 traps, which
we did as an inline "conditionally branch over a
gen_exception_insn()".  Unfortunately this fails to take account of
the fact that gen_exception_insn() will set s->base.is_jmp to
DISAS_NORETURN.  That means that at the end of the TB we won't
generate the necessary code to handle the "branched over the trap and
continued normal execution" codepath.  The result is that the TCG
main loop thinks that we stopped execution of the TB due to a
situation that only happens when icount is enabled, and hits an
assertion. Explicitly set is_jmp back to DISAS_NEXT so we generate
the correct code for when execution continues past this insn.

Note that this only happens for cpreg reads; writes will call
gen_lookup_tb() which generates a valid end-of-TB.

Fixes: 049edada ("target/arm: Make HSTR_EL2 traps take priority over UNDEF-at-EL1")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1551
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230330101900.2320380-1-peter.maydell@linaro.org
---
 target/arm/tcg/translate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 2cb9368b1ba..3c8401e9086 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -4623,6 +4623,12 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             tcg_gen_brcondi_i32(TCG_COND_EQ, t, 0, over.label);
 
             gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
+            /*
+             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
+             * but since we're conditionally branching over it, we want
+             * to assume continue-to-next-instruction.
+             */
+            s->base.is_jmp = DISAS_NEXT;
             set_disas_label(s, over);
         }
     }
-- 
2.34.1


