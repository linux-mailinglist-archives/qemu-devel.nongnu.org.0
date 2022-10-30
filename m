Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AD5612D66
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:32:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGqk-0008Hs-RY; Sun, 30 Oct 2022 18:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqN-0007qp-EQ
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:52 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqL-0008BD-S2
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:51 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o4so13671649wrq.6
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=orPCsNrTP/gLYMurzkm8ANHpZ5tyfCimePBIzWAMz6Y=;
 b=l1eRlcKqkp2Ib+x/GPepxu3k/vJa4uDIadBX6maw+GLl0UlPcinWTRw1bFqm7cNL8A
 +Pp7TDybvZ9Kk0Oulo986m+UFAATajkGamymqBm142wCJYCwh4k7ZjS5WEbgpbjCWCuw
 HXQab5E5cOQAfP/Nj1SkJEsnyUzAizeEok08eOkTNyqgEOmjG2NrQVI/WyzSC/olYXfi
 b4Pffr3JslUR+gKsdwkFJoJTXowmXIPcGoPKtfjDmHPrDamOnSEyswMBUen4bOzU66bc
 lGnbjEhpQUBAoI4I9hKkJcpxbDO6x7SisvsOl9BA71orl5DxtI7j3EAFKJkvbFsr97w4
 SKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=orPCsNrTP/gLYMurzkm8ANHpZ5tyfCimePBIzWAMz6Y=;
 b=Xmwcb1uA8s/tRPR9fMKzJBaP4bYZtAMjJ6sL6SbJoRzmK6LVvcsM7QIlkuQUMVkafU
 PK8h2NNRSjkR6srqYkDLD/yQaVbf4m5C6orWqujK/9guqFwMT4LjjUfTUnUxLYz+7zMJ
 vgJ+MMfY/8c6u59waW+eCmBj45XrG3jmqsuO36lNwi+RWSjDdtpUSuQwlWI9iqwxYs0N
 OgqAWPYWve2oC6ldVGC/sroUPAUsTjFw2wPvoJEGTtFLlFT78KF4xsXtylk1qPfJPtmc
 EWAiT68ziqpytBD1FcHF/TSpglGQzq1q5Vu3T33omVcTXKSculCnc1pIeiHVGDb4IIxt
 higQ==
X-Gm-Message-State: ACrzQf3F02Gmc6ITUCGdmdG6LNCYFVtZLWTeFVoGunGcWPmCYe3yhN7n
 cixiztN5YUMM5Zaw+GcZr+4rqQVGsoq8cg==
X-Google-Smtp-Source: AMsMyM5eA8NGVEYvxWIg+YmFJ6q193AuVerJcP7TW1Z2+2thvTDUsEzRi8ziRxUnlyZCg70a9e0TUQ==
X-Received: by 2002:a5d:6c6b:0:b0:225:dde:ab40 with SMTP id
 r11-20020a5d6c6b000000b002250ddeab40mr6062380wrz.690.1667169107570; 
 Sun, 30 Oct 2022 15:31:47 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a7bca58000000b003cf47fdead5sm5370356wml.30.2022.10.30.15.31.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:31:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 28/55] disas/nanomips: Delete wrapper functions
Date: Sun, 30 Oct 2022 23:28:14 +0100
Message-Id: <20221030222841.42377-29-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Milica Lazarevic <milica.lazarevic@syrmia.com>

Following functions just wrap the decode_gpr_gpr3() function:
- encode_rs3_and_check_rs3_ge_rt3()
- encode_rs3_and_check_rs3_lt_rt3()
Therefore those have been deleted. Calls to these two functions have
been replaced with calls to decode_gpr_gpr3.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-15-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index b90be5744e..170f5c5c17 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -505,20 +505,6 @@ static int64 neg_copy(uint64 d)
 }
 
 
-/* strange wrapper around  gpr3 */
-static uint64 encode_rs3_and_check_rs3_ge_rt3(uint64 d)
-{
-return decode_gpr_gpr3(d);
-}
-
-
-/* strange wrapper around  gpr3 */
-static uint64 encode_rs3_and_check_rs3_lt_rt3(uint64 d)
-{
-    return decode_gpr_gpr3(d);
-}
-
-
 static uint64 encode_count3_from_count(uint64 d)
 {
     IMGASSERTONCE(d < 8);
@@ -2958,7 +2944,7 @@ static std::string BEQC_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    std::string rs3 = GPR(encode_rs3_and_check_rs3_lt_rt3(rs3_value));
+    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
     std::string u = ADDRESS(u_value, 2, info);
 
@@ -3244,7 +3230,7 @@ static std::string BNEC_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    std::string rs3 = GPR(encode_rs3_and_check_rs3_ge_rt3(rs3_value));
+    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
     std::string u = ADDRESS(u_value, 2, info);
 
-- 
2.37.3


