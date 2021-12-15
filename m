Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F99547579D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:17:45 +0100 (CET)
Received: from localhost ([::1]:56172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSI4-0002Zn-Lt
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:17:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRie-00079r-V9
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:08 -0500
Received: from [2a00:1450:4864:20::432] (port=36631
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiY-0008SV-W7
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:08 -0500
Received: by mail-wr1-x432.google.com with SMTP id u17so37404588wrt.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1LIBTaRPYIs3MFe5ZnN0Uy0Pc8j1ZIq2IU2jO2WESb4=;
 b=I2bu0+KxijB/s13zHne2vMXqQibNG/xWAILqnE4zSMH7UY/piR20amMXr19hbR3fRt
 eSjQvPHF4ZQUTN2tavhSICBJGYrmiZQ0UEFG18D3PH7YDoUyaiN2H9BI2KrJP+aXvWx2
 xGzP8NTtb30RNbeMIRj82//0zTwckd1biCpXNPStP/n6QghESvNZUldkCf29e4RLLYwD
 0BNhU1cfcWuYsiS3efZhUtbVOHQYXFTn/tvViWMh08vf4tCUdyXOSYNXNtNuSNrG7GfX
 gQ71XwYFf/tRvxx193rZgGwn5kth2mFn9uojPmYwVO4UPS9C8wZq9/Z8tH80fSXK2dAY
 m/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1LIBTaRPYIs3MFe5ZnN0Uy0Pc8j1ZIq2IU2jO2WESb4=;
 b=N0Jif+Lb8pQ5EECiu9q1neeLjFedPtFyxZH2ZSyJMRIikaBAXM/t7E+yRm60NdJpcP
 udgUioVThdK875RPNTmQAxE8BIIdCon10XOQsTr3zHsN4SWRNgqvnBkr1sHzdXFNWo2/
 2AI74fb6NNJnaClSN+bWz/wavNVIVvW4QDC7LuZIH4kWbK+BBOP+9zpN7JUKB24OOUKN
 ypzYJfuE65kG+15UzgU4rPj5ZJ0+h0GZrLL0VQt4k5pBVx58LRXddqlsbmxXuXx6y8Zi
 YG0uB2/M2jY9lTrEaJUoYYtsYmUGs5Nj9xj89EfKB6j/rneczehAwgjKN5aeaPFkg5cb
 jI6Q==
X-Gm-Message-State: AOAM5317dQ019AvKIvIssOm3iRu5hG/v0dxrIPu/dZfCuCb7oSv+6rDa
 S4xrsmmSCmucIR0JBUUn4mrvfeAWUUKdJg==
X-Google-Smtp-Source: ABdhPJy9LCDUWhSC6deq3Gi349QHbvLLs90h4Dmv2Wfej6XP59KBiLkudOYd7wQlrMxJ9JEes8obng==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr3994598wri.632.1639564861685; 
 Wed, 15 Dec 2021 02:41:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/33] target/i386: Use assert() to sanity-check b1 in SSE
 decode
Date: Wed, 15 Dec 2021 10:40:35 +0000
Message-Id: <20211215104049.2030475-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e9e14515409..05f9336c9b9 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3519,9 +3519,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x171: /* shift xmm, im */
         case 0x172:
         case 0x173:
-            if (b1 >= 2) {
-                goto unknown_op;
-            }
             val = x86_ldub_code(env, s);
             if (is_xmm) {
                 tcg_gen_movi_tl(s->T0, val);
@@ -3540,6 +3537,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                 offsetof(CPUX86State, mmx_t0.MMX_L(1)));
                 op1_offset = offsetof(CPUX86State,mmx_t0);
             }
+            assert(b1 < 2);
             sse_fn_epp = sse_op_table2[((b - 1) & 3) * 8 +
                                        (((modrm >> 3)) & 7)][b1];
             if (!sse_fn_epp) {
@@ -3770,10 +3768,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
@@ -4200,10 +4196,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
2.25.1


