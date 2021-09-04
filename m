Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DF6400CF8
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 22:48:41 +0200 (CEST)
Received: from localhost ([::1]:52248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMcae-000303-FN
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 16:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNz-0005ym-Tc
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:35 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:44932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNu-0002yI-LX
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:33 -0400
Received: by mail-lf1-x12e.google.com with SMTP id s10so5313122lfr.11
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 13:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Byfy05ziqCgv95xzCHpZBdafCiVDPBMWHY7L07p6tOg=;
 b=IuJ5xOAo3xQ4vHxt+7XoITWSmrE1rw5A4svYZzLDkCUYzhUODGTfFTAz1Qp8fbdH87
 opWyaPhXUIWMjf0yqTKuSStRW74RNM6acdefiWbzxQ1gWB1fUDvZ9OLq5QdOilxvKCT4
 paC6wmlE+kfG0xZFkRxCMLRLGo7yAMtkyblFSNzYYeINikVKBxVDRMlu21jxCfXd03YT
 +KBvUUcTVP0iVnOyhKZVAFwKVsf9bTkkY7v3vWdyDWV3q8zvqCSem8Y+Lzi5cTHxBDFr
 d4k4OiZnwDesMxZ6o0/nB/ydefpTrLCUXYcdtkrdUpoftV1467J4XWmf7KRX08JBiQRW
 7AKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Byfy05ziqCgv95xzCHpZBdafCiVDPBMWHY7L07p6tOg=;
 b=MMgbUYcMcyfxsjbBp+z0HhtdGy1pGndU4QkRNyvT8DWQ9PVoIs8ZD2yI5raXLigS7+
 o1zbIihrieJa1vtZBml8U6uQaVTuDkT/n+eJToZOOzy9yi5+Awz6ujMDWdiG8DMNw29O
 +ZA+vdqmQN1fH4eEEAAdIiYTKGHFqZIMDrSER22igJ6bCvMgAO3/rjf2bDjmpTjqR61I
 /HIc4odIU1SztSCtLgvDr5vdZGRTqEAwIEA3RZX4/IHbWIGKa79JkFPcrNFKwSAMrJGz
 WgBjTBLIJHn8SxBrfOe7gIj9ZoXeOKblhvTPavn8YhHtrKobfqWolTmcxHbaphT1k12/
 eWpw==
X-Gm-Message-State: AOAM533BRX6oTMOQpdz3e/WzVszY87cP2raWjkqpUOrXTQTl7rmIKz0a
 A1EHx6XjSC49U2DaPU3dv8V/9urG7W1MIdc5qCQ=
X-Google-Smtp-Source: ABdhPJyRkWet1Fgf/TONTPwzOZaTNd9nhNVaK1csyc+LWhVNUmDj7gVQWQnbKSl/k0oOrL9KCyUgSw==
X-Received: by 2002:a19:7406:: with SMTP id v6mr3979018lfe.669.1630787728545; 
 Sat, 04 Sep 2021 13:35:28 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id v15sm326304lfq.142.2021.09.04.13.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:35:28 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 12/16] target/riscv: Add a REQUIRE_32BIT macro
Date: Sat,  4 Sep 2021 22:35:11 +0200
Message-Id: <20210904203516.2570119-13-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12e.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v3)

Changes in v3:
- Moved the REQUIRE_32BIT macro into a separate commit.

 target/riscv/translate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e356fc6c46..7562b2f87c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -337,6 +337,12 @@ EX_SH(12)
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


