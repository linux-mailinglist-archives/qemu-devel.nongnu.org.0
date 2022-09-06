Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE8E5AE37B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:52:25 +0200 (CEST)
Received: from localhost ([::1]:40944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUJf-0007qC-BL
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6K-0002e1-Gn
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:32 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6F-0005Vz-2X
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:32 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e13so14320449wrm.1
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OsbFR6exiIugNlN/OA1NiX9KQk6dg8u5+nqhU943Djk=;
 b=cm14VttjBwtMEks5SXBiyRbaUIzaOWJS59TfLY/n3NcI8wi2xZWj5ktLutrx21+FNm
 lKnEAbD4NjpNAV6Wkkd3jV+vMwsJMwaN+9vwzLgbZHiZblz1pmO2mo1yfNRzkNmayKab
 9ROP/iV7YHokIyHeaUmcgz8PaRtrufvumOlBauYbS/+qAjTKco/GKnsgz7H3mat6Lu4G
 yTAQ5/h2ZLPeINQT//L25r5BLY8+t6IyyQ9t4GFf8jndyS8FeqM8C/zQ4QJo1CXz1QQP
 ZINy7LgVUyQl4nIIRJWi/XThO0KeDK+cWA1y8mC9jf7cvurt+pZ1Nze9DzeCnZCwo3eo
 ahQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OsbFR6exiIugNlN/OA1NiX9KQk6dg8u5+nqhU943Djk=;
 b=IYpfjvyF/WCxZub/DpCX5jyL+kNfVJHJqxWu+xbzliMjRkuSG+3fpdG44ayIgAdbW2
 1cZPmo/wegYZNfDMC024O/gADRpnFUWep3k7rvRZ/1BFORdvasPQQbJnAusSI98u1aTr
 h+xQCdWzkBDbtVagNSzDNyQPvaeYxFa846Li/DyxfXw2eujfpw5EtBrOw/muNCPlPwDK
 973w4gAb9+nYBaQ2Xh3M4BaeKMv6g8WhhjFo0A7veZ7bSDNwcAdZjilcE7l+YR6Kn/gp
 K+pPhNXvc63949J0fqvSxnfm/I6ktxIiKl85u8iQDAchPtrzF914MxoQbliYIT7SNTDx
 Sskw==
X-Gm-Message-State: ACgBeo1wDoHjgCTaaM2Q5WoyjcQ6BHZtyn3KJK2yJ/t9KlJpoZhAlqYs
 SIqJIJSItN3uthv0lI0/QDgufab2dW5dMv4/
X-Google-Smtp-Source: AA6agR7VYrqEizxq3aPW7sLyrf1BiqXGf4NpXhtIXCxvpzkobPvuKvYDsjLbK/sUAu93c1YEG1fyBg==
X-Received: by 2002:a5d:64e5:0:b0:220:7859:7bc with SMTP id
 g5-20020a5d64e5000000b00220785907bcmr25102380wri.669.1662453505693; 
 Tue, 06 Sep 2022 01:38:25 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com, Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 07/20] accel/tcg: Introduce is_same_page()
Date: Tue,  6 Sep 2022 09:38:02 +0100
Message-Id: <20220906083815.252478-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Introduce a function that checks whether a given address is on the same
page as where disassembly started. Having it improves readability of
the following patches.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220811095534.241224-3-iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[rth: Make the DisasContextBase parameter const.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 7db6845535..0d0bf3a31e 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -187,4 +187,14 @@ FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
 
 #undef GEN_TRANSLATOR_LD
 
+/*
+ * Return whether addr is on the same page as where disassembly started.
+ * Translators can use this to enforce the rule that only single-insn
+ * translation blocks are allowed to cross page boundaries.
+ */
+static inline bool is_same_page(const DisasContextBase *db, target_ulong addr)
+{
+    return ((addr ^ db->pc_first) & TARGET_PAGE_MASK) == 0;
+}
+
 #endif /* EXEC__TRANSLATOR_H */
-- 
2.34.1


