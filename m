Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2471C4DAA75
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:10:10 +0100 (CET)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMrJ-0005mv-75
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:10:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgR-0002Vv-31
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:55 -0400
Received: from [2607:f8b0:4864:20::636] (port=38667
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgP-0006TD-J4
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:54 -0400
Received: by mail-pl1-x636.google.com with SMTP id n18so967545plg.5
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CgkorKQppvT/5EqF5TZdReeeVVST0AYPM557ltMmWGU=;
 b=Jtg+qJ9+ZrQ6yar+c5O4w+2XDtDas1FuQknsEvfkPpAmmmPwiPhTk6zsp5f2e31U80
 ATU/oM1XQgDP935R87YFijjuOjxxVy54YU9u36AfZuuSqc9EFj7SSIUirMZUqrlpdhLn
 HYzcUz936fRMDFulBpypCjByL7ksOij7dY905SjeIGnFsmTaqu5k3xFivkdNDtIOGyUH
 Z2l4jEKpRiYA8Yk/bf7H5neEE7iDISFWwaJSisPAcCBfLOz15cNXn1TWuSVPgw9CTHY9
 pOx1vIUyyPsDRhBgDwQVh1UImMwVVblBMff2SCgPsSSdyIg5ZgEknTd7HPQothJjqdjO
 O4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CgkorKQppvT/5EqF5TZdReeeVVST0AYPM557ltMmWGU=;
 b=M7h8vKe1c9QAtTO5tkH4WklZBv4ww54yLbpZMBkPfAXqXyslgno0H6Fw9B6qKVnM0A
 FkTDXzvWjcw5ruayqalUPJEqwdDQ8x0w95XeFKts5BGSxTXWASyh4aHp6A9mdSPVK7gs
 uhNAUCH18xmHGpYHX3HR0zQSAW9q3NPZbxte9ESLe75wWwWguiIKu29IauInLE1BJPE+
 up0FJDLCWfLeIawp8fK1PWISnPrXTEEMbY6RYbCy4a+cKx85sMMYz/P/R3G3+ebx5sI4
 6S+694jk4/OhFZlTLonJOm52Taamo0Bg5lZw82TnU/WDTzjRXt+N3UKtDTghrLyqPsuQ
 lD+A==
X-Gm-Message-State: AOAM530tv0V8LaJI3Kk+sVh7/YVc4aiDyzmI4JzPr08s75pK3F7yOxMz
 Dmcm53sSfmXnkhiuHMvblBp28KAZ89O1JQ==
X-Google-Smtp-Source: ABdhPJzYxRvLB55FNyaPg4uvpzk86aBG++4BTqmMyUhS/a5aQlIdi4YlAjhd6HkbbKZCNzxLI96UBQ==
X-Received: by 2002:a17:902:ec87:b0:151:c3f3:ddd5 with SMTP id
 x7-20020a170902ec8700b00151c3f3ddd5mr31518171plg.154.1647410332337; 
 Tue, 15 Mar 2022 22:58:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/17] target/m68k: Implement TPF in terms of TRAPcc
Date: Tue, 15 Mar 2022 22:58:34 -0700
Message-Id: <20220316055840.727571-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TPF stands for "trap false", and is a long-form nop for ColdFire.
Re-use the immediate consumption code from trapcc; the insn will
already expand to a nop because of the TCG_COND_NEVER test
within do_trapcc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index e15b317ddf..86e5e16f71 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -3075,22 +3075,6 @@ DISAS_INSN(addsubq)
     tcg_temp_free(dest);
 }
 
-DISAS_INSN(tpf)
-{
-    switch (insn & 7) {
-    case 2: /* One extension word.  */
-        s->pc += 2;
-        break;
-    case 3: /* Two extension words.  */
-        s->pc += 4;
-        break;
-    case 4: /* No extension words.  */
-        break;
-    default:
-        disas_undef(env, s, insn);
-    }
-}
-
 DISAS_INSN(branch)
 {
     int32_t offset;
@@ -6099,7 +6083,7 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
     INSN(dbcc,      50c8, f0f8, M68000);
     INSN(trapcc,    50f8, f0f8, TRAPCC);
-    INSN(tpf,       51f8, fff8, CF_ISA_A);
+    INSN(trapcc,    51f8, fff8, CF_ISA_A); /* TPF (trapf) */
 
     /* Branch instructions.  */
     BASE(branch,    6000, f000);
-- 
2.25.1


