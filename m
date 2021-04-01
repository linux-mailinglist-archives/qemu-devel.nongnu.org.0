Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD289351471
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:28:17 +0200 (CEST)
Received: from localhost ([::1]:43920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvUm-00069s-Pm
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPE-0000jT-3k
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:32 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvP9-0006fH-Kl
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:29 -0400
Received: by mail-ej1-x634.google.com with SMTP id l4so2294829ejc.10
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 04:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1O3FqB1/geIh7FAecaHTgKTUCfAPRJruQ8qG1ucIwNA=;
 b=Z0DCGfKqqJZp9O3qOHSAGFbGIVkPfDnmm5vRDleiyD9aIdP8p1fRLhPk3B75JM2nyx
 bewZUaAHriB291ik8daE4y2seEC/n7rLX8p4isRYUiyD6GHCBk7KcET7/h1gg/pLfemJ
 rDqXpGyNd4TXawxm4/aBu2ZXkTvdaSeJpqKPHJ4VLlci64l9IldrKHfB8DlU5sL2GVby
 jnAHlVxAykaAqJwdgtQQg58EkWxsuNv5+9HTRDEQSOc4CjmxGAltjuhmIk+t/riiz6qU
 xKS7VzxM1NkGPrHpFEE0Xu9CZ8C4GgLaD839t18xUs0VAVu68aCcEG4jqgB3xfJZpX2q
 oyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1O3FqB1/geIh7FAecaHTgKTUCfAPRJruQ8qG1ucIwNA=;
 b=Lumt3veGI/C/Y6NDKMIqESCB7l0zykBryRpbunLwq0ImoRPRXxnaBFCfLcfPg6f/fZ
 2BQ9UN3GnjEDM2SM2m/yHGDN4jVw/il7Kbksdih6JAdsVam/CkoLfytQjHXydeqvecYC
 //hw56WP/H6nXZ5cGW3YbG5km1sBysSsRkHk9nnNTzMrxtaiBop8cFt49We6RG2Raalw
 mNeKrK8L3eFwc9TTA31Yqqw0+pUdtmE/0daUuBZ/MIw1XuSdSHB3B+oEsB/2U236Idt4
 d3Rna2t/EqZ1nTf/DbprUhRVgM2JiliN/Sll2bY/3JrM/vHPLSgueudMSXCY87Tue6YP
 zlYw==
X-Gm-Message-State: AOAM531oRvVWmkevjELI0jikSyDy1tJGLzTd9bSOQTfG1xQiGH0iG7O0
 TOLq44VW7X1+n17fsrmlxvngLAyJHic=
X-Google-Smtp-Source: ABdhPJza+gza+jAEVkfjUYcfchTleOgfUmVjlkGYpA+NH2VJOzffjPQuTORj0DNqq9NS9yeE0jyr/g==
X-Received: by 2002:a17:906:b316:: with SMTP id
 n22mr8348280ejz.249.1617276146339; 
 Thu, 01 Apr 2021 04:22:26 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d15sm3383516edx.62.2021.04.01.04.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 04:22:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/12] target/i386: Verify memory operand for lcall and ljmp
Date: Thu,  1 Apr 2021 13:22:13 +0200
Message-Id: <20210401112223.55711-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401112223.55711-1-pbonzini@redhat.com>
References: <20210401112223.55711-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

These two opcodes only allow a memory operand.

Lacking the check for a register operand, we used the A0 temp
without initialization, which led to a tcg abort.

Buglink: https://bugs.launchpad.net/qemu/+bug/1921138
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210324164650.128608-1-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index af1faf9342..880bc45561 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5061,6 +5061,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_jr(s, s->T0);
             break;
         case 3: /* lcall Ev */
+            if (mod == 3) {
+                goto illegal_op;
+            }
             gen_op_ld_v(s, ot, s->T1, s->A0);
             gen_add_A0_im(s, 1 << ot);
             gen_op_ld_v(s, MO_16, s->T0, s->A0);
@@ -5088,6 +5091,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_jr(s, s->T0);
             break;
         case 5: /* ljmp Ev */
+            if (mod == 3) {
+                goto illegal_op;
+            }
             gen_op_ld_v(s, ot, s->T1, s->A0);
             gen_add_A0_im(s, 1 << ot);
             gen_op_ld_v(s, MO_16, s->T0, s->A0);
-- 
2.30.1



