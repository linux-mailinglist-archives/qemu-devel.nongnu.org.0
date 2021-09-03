Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA60C400095
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:34:16 +0200 (CEST)
Received: from localhost ([::1]:39490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9Kh-0004q4-Ju
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mM91e-0002L5-Kq
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:14:34 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:39902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mM91b-0003fE-AL
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:14:34 -0400
Received: by mail-lf1-x12b.google.com with SMTP id m28so11710327lfj.6
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iFrdZ0kMv+PZ8RQYkPNFa0LTHTFe0e6o8JJ2FLkYzDY=;
 b=maVg8mBryzStQIMU8a98gP4RbolD0pHqvaEvHYNx2hju4HLR5gVwfrHotKRY71yUiQ
 dxd9xfhpJIjiu9WzAq2iAivqNjAzu2y+Lcgyoitgq3UA2ds1p8oO2BGUYg/yJ56PKcws
 uIyEILyOGnH2uyc6Zm8TXxAH7Kt2yltnW3ohCSphZH1NT4XeLhmAWgjVxMEPyzzFHaRA
 XjuM3i9629eliFLO2IlAiyA4N9EpMEDaBEvd8AJVjdVnIbrMvvxMH0HnW+GE/H/BJiM6
 mpbvNDGRFfCYodR7I4hWK0+3/IfIseA/kCw6vNk1vMOe+WvqbAmaaEAfzTCIrL8JOb3/
 wifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iFrdZ0kMv+PZ8RQYkPNFa0LTHTFe0e6o8JJ2FLkYzDY=;
 b=WKrlwUbuvF/OdYEhMGqmcoxPdjJlZK0EIP498bY1WefnmSzsvyoMpXBDKnap16DAY0
 6zDHgJ5Rn5rlQOxHJxuJNk/PEwEOGfy/crUrYApfaUxr14pDZ+FA4cajRizaeXzQNpcG
 EvysMvEgTJuo0fD081mSl/1epWZtznkr1Uk70kqOEYaiWJAxl9EZ8MmZUN2nNFQXVRxi
 VVJUXmNw7yBjD3BobqZmi/gMCtrIClgPDixG9iAPWXXzPsec0ZfW7DXWgvCXWmDit/oP
 mX5XCMBUx9UQQ/FLfLa0ZAFPgeSRILSeza2kSfLS+uIsF/A+VhKwyrolPamFSZ357d1O
 nhQQ==
X-Gm-Message-State: AOAM530cg51U1yc2FfrW/daVX/jr7LZfBKxxfsODmb5cBL3iNOrteOJi
 MHO+1ree75RC1Avh0l4AKKSpXeq7K3kHf9X1Pvk=
X-Google-Smtp-Source: ABdhPJy8CL3Q3kUFDP5HfQEhwJkDjHZocyay8XrOXglsTJuIvTS/3ob59z7omTGk0eoyOcUj+NkGng==
X-Received: by 2002:a05:6512:eaa:: with SMTP id
 bi42mr2791976lfb.328.1630674869463; 
 Fri, 03 Sep 2021 06:14:29 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id n5sm577995ljj.97.2021.09.03.06.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 06:14:29 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 10/14] target/riscv: Add a REQUIRE_32BIT macro
Date: Fri,  3 Sep 2021 15:14:13 +0200
Message-Id: <20210903131417.2248471-11-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903131417.2248471-1-philipp.tomsich@vrull.eu>
References: <20210903131417.2248471-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12b.google.com
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


