Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDBE3FDDA9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:11:21 +0200 (CEST)
Received: from localhost ([::1]:39774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLQxU-0004Rw-8k
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLQwQ-0003hN-3z
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:10:14 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLQwO-0003VY-FK
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:10:13 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u16so4747661wrn.5
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YdnQvFnRj9VTCxv64h96MSKNuF6wjpgVFj12vYzb5q0=;
 b=f+tBrvqKws/Xvyjc7EVf7oO21RVt1mBix7kWf5rMTic/N1m+aIaTvXbLIsWLbGB9rp
 Nq3L9SIcpJYrSqb79HnQ+wxdzPu8yYSzIauyz0nljbcEbv4/3QHFGU6zCFIM43IqfOJt
 FL3AWshzwWoG0oBM9XOA7I0/9KRISQHhHAcrSZLxk7XzZtnjeP/T9RurfOzM1yp9v/hK
 KezGJhRuinQKTc+8dJ+vhDcZM23eyNrpTvi5Pcd2YVbU01kOqEG1e2gc+FTAYQ96BOo9
 GlSU5G/bkcC91Wq1HOdv3GtVzEanDamwqr9jgXCvPdYwt3EEwktdNIKsOEAPllx9ZH1n
 zlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YdnQvFnRj9VTCxv64h96MSKNuF6wjpgVFj12vYzb5q0=;
 b=V+NPaiNKR+zhe2FPq6c2OHeq2XCpg0+gw8kapPEu62dN0m4xhu/qpS26iREnVmOuLU
 KaeCl0BoSZZsVqAkrgdfC2cfUATwCUGpt611eXb6jrYa9hA6Qy1iUyb7ljv+1P6lkXrs
 SB/6Nd1+aWU48azcU650M4So0zIAlJzJeeKnDa8XiRlZmVMjkdmHGDaXWVxkYMzGrYoH
 t0kdA30RWYrDnjOUz4vb7N8qx+gfS6VXcquoejP1cnkCKpm+E+XDNGgIxboAhvo4Fgjl
 6F2rZBr3A8+N5CEm5xAHD8BcMkHtx9YfiQqox4AukgbHw+obdpP2E+s8DGKzlXSAelBk
 vz9w==
X-Gm-Message-State: AOAM531khLtfPWPpSXx6JOi2uPDnl8vZzj9AzqO3Es7hhi7TUM62/58K
 DDUY85MJ9+L7vO5CqjyJFFOblO+3sgRKrg==
X-Google-Smtp-Source: ABdhPJxNVqimbwkeEbQlICkFd1gomPYimk8Po9h972yqs7R96v2+X+w2RODiIcPb1OqZwUeOhadgDw==
X-Received: by 2002:adf:f88d:: with SMTP id u13mr37890387wrp.297.1630505410360; 
 Wed, 01 Sep 2021 07:10:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d145sm5388964wmd.3.2021.09.01.07.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 07:10:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/i386: Use assert() to sanity-check b1 in SSE decode
Date: Wed,  1 Sep 2021 15:10:08 +0100
Message-Id: <20210901141008.17203-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the SSE decode function gen_sse(), we combine a byte
'b' and a value 'b1' which can be [0..3], and switch on them:
   b |= (b1 << 8);
   switch (b) {
   ...
   default:
   unknown_op:
       gen_unknown_opcode(env, s);
       return;
   }

In three cases inside this switch, we were then also checking for
 "if (b1 >= 2) { goto unknown_op; }".
However, this can never happen, because the 'case' values in each place
are 0x0nn or 0x1nn and the switch will have directed the b1 == (2, 3)
cases to the default already.

This check was added in commit c045af25a52e9 in 2010; the added code
was unnecessary then as well, and was apparently intended only to
ensure that we never accidentally ended up indexing off the end
of an sse_op_table with only 2 entries as a result of future bugs
in the decode logic.

Change the checks to assert() instead, and make sure they're always
immediately before the array access they are protecting.

Fixes: Coverity CID 1460207
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: use assert() rather than just deleting the if()s

 target/i386/tcg/translate.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index aacb605eee4..a4fee5e445d 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3521,9 +3521,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x171: /* shift xmm, im */
         case 0x172:
         case 0x173:
-            if (b1 >= 2) {
-                goto unknown_op;
-            }
             val = x86_ldub_code(env, s);
             if (is_xmm) {
                 tcg_gen_movi_tl(s->T0, val);
@@ -3542,6 +3539,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                 offsetof(CPUX86State, mmx_t0.MMX_L(1)));
                 op1_offset = offsetof(CPUX86State,mmx_t0);
             }
+            assert(b1 < 2);
             sse_fn_epp = sse_op_table2[((b - 1) & 3) * 8 +
                                        (((modrm >> 3)) & 7)][b1];
             if (!sse_fn_epp) {
@@ -3772,10 +3770,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             rm = modrm & 7;
             reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
-            if (b1 >= 2) {
-                goto unknown_op;
-            }
 
+            assert(b1 < 2);
             sse_fn_epp = sse_op_table6[b].op[b1];
             if (!sse_fn_epp) {
                 goto unknown_op;
@@ -4202,10 +4198,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             rm = modrm & 7;
             reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
-            if (b1 >= 2) {
-                goto unknown_op;
-            }
 
+            assert(b1 < 2);
             sse_fn_eppi = sse_op_table7[b].op[b1];
             if (!sse_fn_eppi) {
                 goto unknown_op;
-- 
2.20.1


