Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C8F4E6EBD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 08:21:36 +0100 (CET)
Received: from localhost ([::1]:55212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXeGM-0004qG-Kw
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 03:21:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXe2V-00080H-56
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:07:15 -0400
Received: from [2a00:1450:4864:20::532] (port=45993
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXe2T-0000Y1-Df
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:07:14 -0400
Received: by mail-ed1-x532.google.com with SMTP id u26so8137061eda.12
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 00:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gGwR00G2oPsV6CI+SY2f6JpoisnJnzXQj8p1weGDL4c=;
 b=fgx7QCk7r0zCGQi5IsfqDxWxbnrBtz+zqrVShNJEl/7p1FDMIDCn8+XClKcU/oYzSa
 OWZCEMowZWNGq30BmAb08YIsQCW64382S1Cb2kl01iQJe6y04dGsIHxeHtip9k/VLLH2
 ULRG2eB81L7Ce7TcnOo9scGVTDwsd0dYl9wh73dkxKOLZH1lM2I0EdeK0MWTs6Km9LX8
 x3qFNnivqOlZXGiFruDl0g4gzaRNd3Zy+3bCh1izXFahPTDL3cl6AR9O54hWpWDY0hOg
 do452TtdUzGky6Pe2WwccthdjGR9AQ0nQMcWrAHY+Oj0NJXAdvFoFc5ZarZl6zzsrJ6w
 b/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gGwR00G2oPsV6CI+SY2f6JpoisnJnzXQj8p1weGDL4c=;
 b=6UDQXEd1C5xyC6UypCQyA4a30TP1N2zm9Kqwv4FBYIf3GcaSgDlJgD6MPg2LpureZ/
 7PxjNlZ9PtY09jwuWqlMUlPGbRhawF7UbOyy61lFwegFjyJXpOx90n/gvqOLjDmVE1JZ
 vFj2MQ2HANVQIBOMzFXkLPZ3xbhgHXgpVlMwJK9htkMPcWPKBg03rSzzEmgboB+i0m4v
 k1luWUNdk9giDEL/PFmgnmTOipWeUTmkxDcapno9PwRdPFXim8xplpdkXnA2tfgfe+W3
 6dNwtnvZhZQRF6nRCM4vmLMoBSmCauU25+1L4xtiMGFb3RrvwbG3w51RlJrDaMyTyuZT
 LuUw==
X-Gm-Message-State: AOAM531YmotuLBquaZTXAYuqPa1uyj3P7ur9PtEEMUrhSwGDWs3cTJaf
 lDezsM++L72ZvwF2KJdSE2TaWq2e3Pc=
X-Google-Smtp-Source: ABdhPJwpuilyUJ1fXJE7W/TK8knOm1DhxEjjHUd3I/o78iNRIE+A0iqVbizVLCEGnOJXGj2Zdjm49g==
X-Received: by 2002:a05:6402:6c2:b0:419:1a14:8fb2 with SMTP id
 n2-20020a05640206c200b004191a148fb2mr11474997edy.415.1648192032086; 
 Fri, 25 Mar 2022 00:07:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ka6-20020a170907990600b006ce54c95e3csm2011497ejc.161.2022.03.25.00.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 00:07:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] target/i386: tcg: high bits SSE cmp operation must be
 ignored
Date: Fri, 25 Mar 2022 08:07:04 +0100
Message-Id: <20220325070706.271291-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325070706.271291-1-pbonzini@redhat.com>
References: <20220325070706.271291-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: sonicadvance1@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

High bits in the immediate operand of SSE comparisons are ignored, they
do not result in an undefined opcode exception.  This is mentioned
explicitly in the Intel documentation.

Reported-by: sonicadvance1@gmail.com
Closes: https://gitlab.com/qemu-project/qemu/-/issues/184
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2a94d33742..c393913fe0 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4509,10 +4509,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             sse_fn_ppi(s->ptr0, s->ptr1, tcg_const_i32(val));
             break;
         case 0xc2:
-            /* compare insns */
-            val = x86_ldub_code(env, s);
-            if (val >= 8)
-                goto unknown_op;
+            /* compare insns, bits 7:3 (7:5 for AVX) are ignored */
+            val = x86_ldub_code(env, s) & 7;
             sse_fn_epp = sse_op_table4[val][b1];
 
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-- 
2.35.1



