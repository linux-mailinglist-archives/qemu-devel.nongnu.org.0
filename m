Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882CD5A9055
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:33:11 +0200 (CEST)
Received: from localhost ([::1]:34142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTehJ-000281-L1
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4b-00069m-14
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:09 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4Z-0003P1-89
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:08 -0400
Received: by mail-wm1-x334.google.com with SMTP id ay12so8477586wmb.1
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=w1ES14kbaqz1aOCbKXN9PfcL6E/pNAFDrn35F0KK2iE=;
 b=IE51DO+n1JT5HFRxYYsDddn8SpP7goxnuo4Bi/L0WeQfap45zQDipNVYZyELxi0xFY
 D7yvdDIBka3a81rdKwjTcMp5OCCgJO7cGFE0Fw0fP33mLmjS4S3NeuxkB553KtNKCAIs
 qTOGKVG4f0uCRM549P+KC7T3NzYOLbdUQ6stqyzdSNNftJ/vrwSuqyCR3+Sg7SX+gw3C
 8HH6wv3068+d6PGhQs3YRNGP9fnd63mYobyjiR+vE+JmsSGKxhrXL+HU+t+9ZAAKsy2r
 aFq2bXPyqWmtBAA0r0z/xqyjaANdXiThKKDF+GuwNUon/+/74VzD68THMw+CiaSigzhR
 2tDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=w1ES14kbaqz1aOCbKXN9PfcL6E/pNAFDrn35F0KK2iE=;
 b=KOlZztuQr6r507QnjNzwHZCjBdenP1p7vTJTeppZo3jW/fWC9sPEepKrrgzOurPQw9
 TI26iAbOypdpsad1A79JivOcU2ICr8fcyHOn8oVlWiabQ1l+X6/SeII1scFPd7yw4dSO
 fpjhbrqpzzmnTcYsTPh2pmLCHePf7LwuonXn8IfXJAYQGqnhO/pMh0+uQUdtXVxmG22x
 Zb5hpu1A6wkw6jtiykqYYR7/MK1eqvhGMUG9vRW+nzgfydGlkn9dMZ7gOdBKivrAOeSe
 ZzcJB53Ow1p8gjy/JPIHtO4b7G7Q1dgM6Msj1ma+ugo6XFAH8ldrXuFBglK7Tsm7RTWa
 ugCA==
X-Gm-Message-State: ACgBeo0IzKfOXFVdF6xnoyAdN+lu/4i7cTnmVI9n9Fs0Ox0beoUJSRWw
 UjvHtsOT/HyodNYjidrBmrGrplHthRU272WF
X-Google-Smtp-Source: AA6agR65n4IvTD1D7NOCpyv5ZXm1iKjKXPtqPxCtZZmvCzEgxXE8HCaOxTjHllUXmbJ3A+i9Autk+A==
X-Received: by 2002:a05:600c:3508:b0:3a6:10a9:8115 with SMTP id
 h8-20020a05600c350800b003a610a98115mr4248393wmq.164.1662015184649; 
 Wed, 31 Aug 2022 23:53:04 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:53:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 13/20] accel/tcg: Document the faulting lookup in tb_lookup_cmp
Date: Thu,  1 Sep 2022 07:52:03 +0100
Message-Id: <20220901065210.117081-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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

It was non-obvious to me why we can raise an exception in
the middle of a comparison function, but it works.
While nearby, use TARGET_PAGE_ALIGN instead of open-coding.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 7887af6f45..5f43b9769a 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -198,7 +198,16 @@ static bool tb_lookup_cmp(const void *p, const void *d)
             tb_page_addr_t phys_page2;
             target_ulong virt_page2;
 
-            virt_page2 = (desc->pc & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+            /*
+             * We know that the first page matched, and an otherwise valid TB
+             * encountered an incomplete instruction at the end of that page,
+             * therefore we know that generating a new TB from the current PC
+             * must also require reading from the next page -- even if the
+             * second pages do not match, and therefore the resulting insn
+             * is different for the new TB.  Therefore any exception raised
+             * here by the faulting lookup is not premature.
+             */
+            virt_page2 = TARGET_PAGE_ALIGN(desc->pc);
             phys_page2 = get_page_addr_code(desc->env, virt_page2);
             if (tb->page_addr[1] == phys_page2) {
                 return true;
-- 
2.34.1


