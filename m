Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C139F5AE3BA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:02:47 +0200 (CEST)
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUTm-0001Sf-Pw
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6P-0002lU-Ii
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:37 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6M-0005YU-Oo
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:36 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 d12-20020a05600c34cc00b003a83d20812fso7001876wmq.1
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=w1ES14kbaqz1aOCbKXN9PfcL6E/pNAFDrn35F0KK2iE=;
 b=N5sQY1pWRY8owwFdPYBrC/62I2osS14erujcW1Qo6jfvz8mwMF6AOekVliHsr8Ula+
 ZqDuKlGQnO2zLznj35NU+3s3XT203hARb+8fWdnWDmzPgRnzcP3XSD/ayKdWeBu0iVun
 nwhsphe5IDkmKkImXm+EwyNU9DYlma3NM1MpPmWhAOai9Zm/7cp0Gu2mbOfgi3f3j+Oh
 rdkUiicheZW0wl44TP8iCJvTjukZNsLQPa7H3zK3RDWgv+l24YuLBc05PQr/t9klN9xC
 O2a3zzZy3OrsVRVV6ZmPteJgAYLVUpqOtE0JxjHh5JkUeOPL8JDIrJp6qFMhaSBgQR02
 m57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=w1ES14kbaqz1aOCbKXN9PfcL6E/pNAFDrn35F0KK2iE=;
 b=XXi8amKFGZOjrNNY2DSswxWuTYgILR/8T3a+IMgB+IiIFh4vlieC4Uy7N30bj0THII
 4cAMO1IAAv5SySwrvRKeYOUF5FHyBeqixBOMm2oy3RFMbSTSKDEztSIfUPAC6m2qksRm
 GGtZh5KTXHv/0IhvfLiWDMa0qwyD7KFTkRm3D+ckc3rRMHItUy2Ir3ag524xQznYftVG
 MbkcVIyvbsWTZKpmbYew3KWC7pWOgewnGrNBQ+UZpnYBJy7tzMNMBctSJWaAkNZOFHk9
 it2LLZNOUoNEJsfAJUBMnaoLiaPmXzdbimdrp1sTGRXh3bXT0iNYlLaBlyVbwwm+wOW7
 JcOw==
X-Gm-Message-State: ACgBeo2AiH6/WUh+N3LMQWVfY7mGDC6fnx24zWZtdDwFZBkdOUATGyCo
 UmBVE624uOF4LSu86W2m7l0de3+CUhOBbJTF
X-Google-Smtp-Source: AA6agR5NWnDJSTwUNNTY3sPrEYxq7M+kNZF+rA6S+TkeG7QDOsAWNO8YIn4mee2GPQ7DbHJeY5FOeQ==
X-Received: by 2002:a05:600c:1d14:b0:3a5:e8ba:f394 with SMTP id
 l20-20020a05600c1d1400b003a5e8baf394mr12966136wms.137.1662453512931; 
 Tue, 06 Sep 2022 01:38:32 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v3 13/20] accel/tcg: Document the faulting lookup in
 tb_lookup_cmp
Date: Tue,  6 Sep 2022 09:38:08 +0100
Message-Id: <20220906083815.252478-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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


