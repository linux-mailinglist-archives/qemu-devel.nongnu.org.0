Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418CA43EA0A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:12:27 +0200 (CEST)
Received: from localhost ([::1]:45292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgChG-000139-AN
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCe6-0006fh-DH
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:11 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCe4-0004SU-KF
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:10 -0400
Received: by mail-wm1-x329.google.com with SMTP id z200so6156158wmc.1
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tUcloN7N3DBv1r6VYXOgVRmRPwO5rl6SFdnuUp8Ul+o=;
 b=R8r+W43RDpNWniFSH+vFBu9w85LQzxsbcNYbKSXXe5TLZjBnySYQWTPSgdrzkNBWD1
 +lnY3Cuu1bsr1qTstqkoOJ9yGkfX3v+8oSJqtP+mifP90K1IXdxBqJFKxALsGJkOCxM2
 fZBiDe+a4nKGYXkQBDOp8sl3dZqvJwiE4K28HMV9HG6l70Biy7L5romAEg1jRN/C9vWY
 9YiFe0AFnWUkfXAkyc//OIiq/uTjhUUhg/9yCxN3OHd+A86gh7jRhyRGxDBEOni/UB8V
 2Rq79N88oZltT5PXBWKOkY9qAW0VMvIyu4xNHNb0APG6kKg90VwtaapNXCNdzrzfu/J/
 ZHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tUcloN7N3DBv1r6VYXOgVRmRPwO5rl6SFdnuUp8Ul+o=;
 b=jyKYHTvOT2Py55PYkEVqjJqpSC6jDAnM9riMAWLGETp5IJjNGRgL+3S2j/DPzchzzN
 jizxXK/UCc1AZ/gbcFdTW3eV07dOjjjfE9qWo58QOi/+J7HT1EvtSCIAD8GoQGrlXlAW
 vlXvJOlsSbvdCAJJwJQgwBjrImcm5QlCI/hptMpiJ9Jo7YWef76IvXMopx1Cgk6V9voZ
 2LEjTmHSgDQbkIhPcHdBvc8iYe5z38eYHsDKAcFUMhvnlK2M9eGTACR1lsCXNgkm/MZt
 jlOwf7IbhXpfuKwOWwiXf0/NiZhcRkm+SXlxuyK3tXqZ4d4+hAAYch4wJALnYkv6zv30
 7xww==
X-Gm-Message-State: AOAM5336eENb976otmZ09IhTZZ+e/6ErXFSK8rrDbWCRYnApnHOT3NvL
 vpoAd5hcUrLxTpqEyAhD0I14vSif43Q=
X-Google-Smtp-Source: ABdhPJzKCd+OcSNJr8dyIvyfGbMGvh0J26JgKzJsOHVed8FKhRxvlEqpDeAupOtb9fP9ABpN+PkoDA==
X-Received: by 2002:a05:600c:218:: with SMTP id
 24mr15307123wmi.192.1635455345578; 
 Thu, 28 Oct 2021 14:09:05 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p1sm7339858wmq.23.2021.10.28.14.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:09:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/32] target/mips: Use dup_const() to simplify
Date: Thu, 28 Oct 2021 23:08:15 +0200
Message-Id: <20211028210843.2120802-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The dup_const() helper makes the code easier to follow, use it.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Fix eval_big
---
 target/mips/tcg/msa_translate.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 3ef912da6b8..6fefb06da7c 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -313,28 +313,11 @@ static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
 {
     /* generates tcg ops to check if any element is 0 */
     /* Note this function only works with MSA_WRLEN = 128 */
-    uint64_t eval_zero_or_big = 0;
-    uint64_t eval_big = 0;
+    uint64_t eval_zero_or_big = dup_const(df, 1);
+    uint64_t eval_big = eval_zero_or_big << ((8 << df) - 1);
     TCGv_i64 t0 = tcg_temp_new_i64();
     TCGv_i64 t1 = tcg_temp_new_i64();
-    switch (df) {
-    case DF_BYTE:
-        eval_zero_or_big = 0x0101010101010101ULL;
-        eval_big = 0x8080808080808080ULL;
-        break;
-    case DF_HALF:
-        eval_zero_or_big = 0x0001000100010001ULL;
-        eval_big = 0x8000800080008000ULL;
-        break;
-    case DF_WORD:
-        eval_zero_or_big = 0x0000000100000001ULL;
-        eval_big = 0x8000000080000000ULL;
-        break;
-    case DF_DOUBLE:
-        eval_zero_or_big = 0x0000000000000001ULL;
-        eval_big = 0x8000000000000000ULL;
-        break;
-    }
+
     tcg_gen_subi_i64(t0, msa_wr_d[wt << 1], eval_zero_or_big);
     tcg_gen_andc_i64(t0, t0, msa_wr_d[wt << 1]);
     tcg_gen_andi_i64(t0, t0, eval_big);
-- 
2.31.1


