Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52BE643C25
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:18:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POe-0003M7-GX; Mon, 05 Dec 2022 23:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POZ-0003Kw-3d
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:27 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POU-0006vs-Qn
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:25 -0500
Received: by mail-oi1-x229.google.com with SMTP id e205so15552669oif.11
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dv7mKrORCdRv24tX0CJVaTCQqf4CXOzJEBkmuES7f0o=;
 b=V7LpB+dxdXWtOicbSSJkuIp5h/aGqKf9G7biuJ4534vKqSTaVho4iXcPLEqT2qnH8E
 ChYLUlA/emNCwF24tScx9Y34WEHOgfpFTpeCAp424nZxJv5BDiXfiZTCnv5NfNhFNFcG
 wjW23Zfwo+0IUG7E+6/RZ1HQUOpWzQFb2QTQ0z4A/JqS/Jlw6Z6/Kr1w0qwr6NK2WZk5
 aO3VJDJ/T577R8VcrpQK09kdiulF/XiOaCtjU8mSRlHjbitGUczetGFnv2fLSB0baobp
 xtFHGnjpOrPodDFkesvJUNtOyttc636vdTZYO/sxbLgHRrmU5V9wozRW0+4SEJD8rgsg
 qveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dv7mKrORCdRv24tX0CJVaTCQqf4CXOzJEBkmuES7f0o=;
 b=3AUYh2P4RslAIEJjmdOzfcxTznA7yB8XVjPaIzm/9R7UJ+zdfACRZE5EyO5RpcmQad
 NIHcyU5laqEdP/zsE85J8Iy2vKOWkrYKt0Z8Gc9FiqnL7cs9SnJwYm8DY8N2ov9eQSWj
 eQTu9V1bFD4HdMGMCS2oIzrN4l5eL05V795jjvNim10MG7x5Y58Z5uFAkei3i9Ld3/KX
 cJKQcGNdPSnOPfa4Hhc+JfR/sgEMwt0Ol4PKs46KPeim4E9ZxOEYd6/zTW2iHiiEuGbz
 9jG8o5tlWDPL4EcLaMM6PpFLNWFR58QVvvP/VELB/DSYjQ2odNvNIaKBoEErhl9gF9eb
 M7vA==
X-Gm-Message-State: ANoB5pnBpNDyU4FCFYfZexN7RKOoo0i2ZxmwXu5a9qQbuEAslB2xikGK
 Ycg6I4lW+PVLlveb7JJmpIdaBEG0qO1o1y5tDlo=
X-Google-Smtp-Source: AA0mqf6M4YduRyz1VOx+uhFZEpBJmCrbnL+IN2BfDiVM5zkJ9n8Oil2VSgvhvzpIBJ7XpWK/qVVbXA==
X-Received: by 2002:a54:4590:0:b0:35a:8ab0:70f0 with SMTP id
 z16-20020a544590000000b0035a8ab070f0mr32366731oib.272.1670300241259; 
 Mon, 05 Dec 2022 20:17:21 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 02/22] tcg/i386: Remove unused goto_tb code for indirect jump
Date: Mon,  5 Dec 2022 22:16:55 -0600
Message-Id: <20221206041715.314209-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 5c20bedd20..f3a40fc428 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2382,23 +2382,19 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_insn_offset) {
-            /* direct jump method */
-            int gap;
-            /* jump displacement must be aligned for atomic patching;
+        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
+        {
+            /*
+             * Jump displacement must be aligned for atomic patching;
              * see if we need to add extra nops before jump
              */
-            gap = QEMU_ALIGN_PTR_UP(s->code_ptr + 1, 4) - s->code_ptr;
+            int gap = QEMU_ALIGN_PTR_UP(s->code_ptr + 1, 4) - s->code_ptr;
             if (gap != 1) {
                 tcg_out_nopn(s, gap - 1);
             }
             tcg_out8(s, OPC_JMP_long); /* jmp im */
             s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
             tcg_out32(s, 0);
-        } else {
-            /* indirect jump method */
-            tcg_out_modrm_offset(s, OPC_GRP5, EXT5_JMPN_Ev, -1,
-                                 (intptr_t)(s->tb_jmp_target_addr + a0));
         }
         set_jmp_reset_offset(s, a0);
         break;
-- 
2.34.1


