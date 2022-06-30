Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D457F560F7D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 05:18:41 +0200 (CEST)
Received: from localhost ([::1]:54418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6khU-0006Yj-F4
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 23:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o6kfe-0005mD-BX
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 23:16:46 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o6kfc-0005uN-Rh
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 23:16:46 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 128so16839032pfv.12
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 20:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXcV7WzdJB6v6tRs5Y7JbMW0b+6unrNcPOHqTvkpgwc=;
 b=n8ebV8fixtqYIBNwfl3l3NaghidRUTQLGITrRS2N2pFyRcR5UKYYp+kFvHmhxGpLcX
 QKfkNnDOI5R/iABQTCA0mCC0qbiVu5HPtzn6pARaW1Zv67/NexUNvOWCmwIaSs8pJ80C
 IIr5H+iTaW7f+XEewIDTT+HmiRijXX1QlNu+FRlhgFIrGM7q5FFDPUo6Pg4FbnbvMgBW
 yiUumD6QuQUA3ddOv6RRgrYn1beIZeEy9CEPhgwfltkuR0lVm9oMpsJpspU1L+GJxAg7
 VKlv6BFbXSx2X35n0GQjFdQVCYySqy4OnwEjPp0q2K1N+J7QXDuaPd23Eg7+cGImCcCU
 DqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXcV7WzdJB6v6tRs5Y7JbMW0b+6unrNcPOHqTvkpgwc=;
 b=yNHTXNtyZZbamQPsQ47WcbPA/8MB65A0fiO0mZW6to6XMvI6REqqK0kypECTgnFaSq
 IhquGpxEm958gvg2CTJm5YYkQ0ZjEV436xIP7anPVKosDcRKXFI2qxX3pzm2wu/DUlCJ
 xJtR6Yn6D3xx/nntXJ5/aBWBSN20DiSno75qXgry5zeS9qVVqHW0d55F/jBadBRP9zNq
 +n3wloXTKgqSJDg6Cv3gfdo8WxSF6XDSRKDyCPDk1uClTtdhdXr0uy9Wc3VAI6p4zp+w
 0xCJ6xW0RfPtTDq8jK8QGCEjg9cXhXgX6tX5cnsvkYU4WtDo/9O/4R2vS79QaRZd02mU
 1sgw==
X-Gm-Message-State: AJIora/8F0v0UsJpOGxcfGHRcClyY6Ff1PCnleA+v0xVdfY9BepOW7Vu
 sOe6mUDIOMGFlX6i/fg9HKYf2Ac7A3Q6DDgk
X-Google-Smtp-Source: AGRyM1sJJ0XbxTmdiUbxU53e/ubdQf6X9cqWSFSnsGwtM5VcyWRhXDWvBOfURwCwWI9Siu+h0X0OzA==
X-Received: by 2002:aa7:8895:0:b0:525:79c8:eb6a with SMTP id
 z21-20020aa78895000000b0052579c8eb6amr13176113pfe.35.1656559003059; 
 Wed, 29 Jun 2022 20:16:43 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 s3-20020a170902c64300b0016a61301293sm11997060pls.212.2022.06.29.20.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 20:16:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Sven Schnelle <svens@linux.ibm.com>
Subject: [PATCH] target/s390x: Exit tb after executing ex_value
Date: Thu, 30 Jun 2022 08:46:35 +0530
Message-Id: <20220630031635.271353-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When EXECUTE sets ex_value to interrupt the constructed instruction,
we implicitly disable interrupts so that the value is not corrupted.
Exit to the main loop after execution, so that we re-evaluate any
pending interrupts.

Reported-by: Sven Schnelle <svens@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Hi Sven.  Will you test this vs your testcase?  Thanks,

r~

---
 target/s390x/tcg/translate.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index fd2433d625..e52c2a4a6f 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6620,11 +6620,18 @@ static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     dc->base.is_jmp = translate_one(env, dc);
     if (dc->base.is_jmp == DISAS_NEXT) {
-        uint64_t page_start;
-
-        page_start = dc->base.pc_first & TARGET_PAGE_MASK;
-        if (dc->base.pc_next - page_start >= TARGET_PAGE_SIZE || dc->ex_value) {
-            dc->base.is_jmp = DISAS_TOO_MANY;
+        if (unlikely(dc->ex_value)) {
+            /*
+             * Because ex_value was set, s390_cpu_exec_interrupt may
+             * have skipped an interrupt.  Exit to the main loop to
+             * re-evaluate interrupts, as we do for LCTL.
+             */
+            dc->base.is_jmp = DISAS_PC_STALE_NOCHAIN;
+        } else {
+            uint64_t page_start = dc->base.pc_first & TARGET_PAGE_MASK;
+            if (dc->base.pc_next - page_start >= TARGET_PAGE_SIZE) {
+                dc->base.is_jmp = DISAS_TOO_MANY;
+            }
         }
     }
 }
-- 
2.34.1


