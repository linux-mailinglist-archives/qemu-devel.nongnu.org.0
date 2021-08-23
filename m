Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E09D3F4EAB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:47:24 +0200 (CEST)
Received: from localhost ([::1]:37334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mID6U-000844-Bv
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mID0L-0006OW-NB
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:40:57 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:37852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mID0F-0006N0-8x
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:40:57 -0400
Received: by mail-lf1-x130.google.com with SMTP id k5so39166017lfu.4
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7L5bPxNk9OZK52K99DLLBEftF0rJQTAKb3CD95NCe/8=;
 b=0L1KN68K2vLrQ141zddBkh6qjm0NPZN6M5AiJdAwd1ZA0B9A/F/BuTSZ52rjpgzMeI
 Q3MajMJSjpfqfBJf1G28iu1h5f42E9bEdIf4wYHaTbCeWY/XC3VKsNf1lmVugVkTJtFB
 OeVoboHwO3Wf1mq8VFAs76LzowguVsLNYVM15sl7MHIrli/XVlSjjlwTJfzWJco39tPB
 YCFGYFUfi2IIxTjoYB5clHq9Wg/1qkgDhDTbfMiB8uc3JofF40d6Rtd/+hSYuNM4P0NA
 JE1bF1HRf3sJGmlSYSrZbEfnX2hT+eWE0Rut6JK47InKF1hjm1JbzrL+4gBHAnvBJvwy
 I2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7L5bPxNk9OZK52K99DLLBEftF0rJQTAKb3CD95NCe/8=;
 b=ZYt0jG8uiFHH30utvbW/t9gxkp5gFv04+oNRduLc5ZEO3RBaV1q+hldG1RRbGxJaY3
 L/4esDpX3Qcqe4QudnWbROkxkg2TWXC7AXgfv0++lv3kH4Ris07w2tYLaV5YyJvI1rPT
 9iXBfKuoajGNFnUMOO4mg1RrLIROJxIz6leLyo1eNMCPIPKtMspN/sAt/vwgcOUGCBge
 QtNgihO0mh8gmaYD0rzHwDVEic4PYfJGDy6H7dNccjJ+C5g34Y+rO+LPgNoNBNMNQ5OR
 UIsbURaiQF2dodi/fyMBoE1lRfCktG2FEhpR6Vbw5psWGI60EEKwNHOG6yS6lFAO2Dq5
 nrWQ==
X-Gm-Message-State: AOAM531NAMmaEaqvD58/vC007hgpu1ZOJWKysG1E3mdc5QWRFC9/xXVM
 2Kh3P4Umuy3WprSv3NCsMV/5EAc0erGwa8G7
X-Google-Smtp-Source: ABdhPJxEZtf4pDaRbBSa8UdkPrZL/00RgK3eCIqAtaTGeRSdpQ+ijmQuKSsg3MjdOJmEHpl+JJfQGg==
X-Received: by 2002:a19:505d:: with SMTP id z29mr26131349lfj.498.1629736849446; 
 Mon, 23 Aug 2021 09:40:49 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id z5sm1491671lfs.126.2021.08.23.09.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:40:49 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/15] target/riscv: Add a REQUIRE_32BIT macro
Date: Mon, 23 Aug 2021 18:40:33 +0200
Message-Id: <20210823164038.2195113-11-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the changes to Zb[abcs], there's some encodings that are
different in RV64 and RV32 (e.g., for rev8 and zext.h). For these,
we'll need a helper macro allowing us to select on RV32, as well.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

Changes in v3:
- Moved the REQUIRE_32BIT macro into a separate commit.

 target/riscv/translate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5c099ff007..aabdd44663 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -417,6 +417,12 @@ EX_SH(12)
     }                              \
 } while (0)
 
+#define REQUIRE_32BIT(ctx) do { \
+    if (!is_32bit(ctx)) {       \
+        return false;           \
+    }                           \
+} while (0)
+
 #define REQUIRE_64BIT(ctx) do { \
     if (is_32bit(ctx)) {        \
         return false;           \
-- 
2.25.1


