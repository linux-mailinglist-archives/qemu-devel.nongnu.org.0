Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7B74078AB
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 16:13:15 +0200 (CEST)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP3kp-0003cz-0u
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 10:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3Yc-0002TX-8J
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:38 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:35686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YW-0005h9-GQ
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:36 -0400
Received: by mail-lf1-x134.google.com with SMTP id k13so10381754lfv.2
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 07:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vt8+N6yBWO/4uVbWRfNaWrkHPQxFNumDx5RyHNmUIpc=;
 b=hLFnOeWSOOnxwW3DQf3tpyjZuVwRsWAVJeCrZUeFpJqT7Jfgnn0I2qWMZntq8KsJfn
 nMv0eh0SmbZc5lNUHayZUDUK8J+f3AfLfgO1Q9/fhAUcJ42AahQzbPDi8mBcEk2cG781
 9lyYtRLKG7Jmkfyei+oU0/ux0doAnt/fJer51QXL2xLojHjtCTD5Hpqk3YJkeZt7Odst
 3nR9h8fXTcjrGV/lj6WMBk6cDz6XxEidh8MYZ2rvLENHgEs1W94OXTzPMFWd2m6oglkh
 PFIDXK5F20YinGzVT7pDCKA1fGNgj2uhSQyOVDO2cpsLvPje/JzBsrGpFOf6bLkM2oIs
 B8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vt8+N6yBWO/4uVbWRfNaWrkHPQxFNumDx5RyHNmUIpc=;
 b=wp3usvpsoQ7c3e5GIsAw6AjODrGfbWDnxBJAzlTUlCjxKkfyEEoDjXlAPIXwi1gMg7
 tBDSxfSF6brmcdRt57TWN7/0q3sVArk8d0cy/eLUZd/xGJGMo9NMDgljdA2fXrI2D3Qr
 0MIM9J8K8uDDz1Vfet4AmIld9uin/BX1nNafIoyIgk1yOJfRIsLeKJ1U7PXMymwbsC2B
 df/p/EoRIaj3H4mGa/4RTniSX6XmJf7tLNgtlpRtSY1/zBzsQLqMxaQNb+/QjL+zpS2/
 eDZDeRu2O16ijzy1Fdz+lxpZ/bdRTXPw2bnZzZQEKH75RVWquQfoZzPSoeyviRYANaSP
 8ndg==
X-Gm-Message-State: AOAM532nfzd5c16LtiXaC5BNmdoN/rzDAMk/+iH7n7n5YW+LiWEpK0jz
 pwXLTKe3eJdsIWQXMXglAIHVqxo8MdiqWR/H
X-Google-Smtp-Source: ABdhPJxU5Kzt1WsaxtRGmgAN0RM2wPiqFjOkeCLywdYc/w5TbZgcxWYgA+Gn1Y+93I3iwR4BMPtZmA==
X-Received: by 2002:a05:6512:21cc:: with SMTP id
 d12mr2165898lft.452.1631368829926; 
 Sat, 11 Sep 2021 07:00:29 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u15sm213052lfk.26.2021.09.11.07.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 07:00:29 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 12/16] target/riscv: Add a REQUIRE_32BIT macro
Date: Sat, 11 Sep 2021 16:00:12 +0200
Message-Id: <20210911140016.834071-13-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x134.google.com
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
 Kito Cheng <kito.cheng@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
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
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
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


