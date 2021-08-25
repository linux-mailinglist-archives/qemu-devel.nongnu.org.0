Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53ED3F7B2C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 19:07:00 +0200 (CEST)
Received: from localhost ([::1]:51666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIwMd-0006vp-OY
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 13:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwCr-0003t1-7g
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:56:53 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:39809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwCk-0007IY-A4
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:56:52 -0400
Received: by mail-lf1-x12e.google.com with SMTP id m28so334454lfj.6
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 09:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u9aw/FdTidHW28P0btKY0zpgCd0X2THvww44X+Potaw=;
 b=qBkc+sBTgqfO5Mnntq+vzmWXi/2APFT8Bx6V9DXUilfB8dPM6cdtR2N1MJAMsGRTM+
 XhzhkzExkzDPPUdZN0EJymRLoJjx8L62f7vYHStzitHvWr6Dq3fQ6y8CDf89Ndpr1Tex
 ebeuwOWJsdPOCg3inBapruMBxTUqpBmNV+wkW0B1K73sND3CLov4qhquLbslk04sszcE
 Y/q7iPwjj7d/YOwtSKtUuhiMa//Shif9/5+krsyAyxUcvSYYu9p1HFDyoGVpOuro2qIf
 NjKc4QjboQXJemz3RDi3EfZ+RVNinACwKkT/5lBILi23s7wEumn6IF1Upz6ASTnM187h
 Acbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u9aw/FdTidHW28P0btKY0zpgCd0X2THvww44X+Potaw=;
 b=GSQxwbbFGJ0JkGZytO1RORwnDEzGd/0C1+jooSNzobif7e6pRL4EO3pZsGz49WHymf
 9LLKyZ6k8Pikttj1P7DJc/+fckgNJL10XKK8R5m3k8V4/p96CAviRz1sy5qcGE6590uv
 rz2hUpa16r9kk3P5iDKjqcUqYp9BuBXeTqAWqcxJAKkMhTPS3AyC5qjRkB/Eq65uJ1M0
 jDfzGd18guCyah1BfqOypLPaX1xsCJZduouJyTT7jfbESNdhLr6JRCiBXbRR6QGpv0/Q
 HTBgRKTNidYbeos6YcTUYozrn3dZilbuKctUproVLERNqsQBr0h1fqiQSiddWeWns96u
 qZiA==
X-Gm-Message-State: AOAM5305E0m3lC2ZAlNu921KGsCBCGiuoKRdQn7Utg05fOcKqoocC2R3
 5rJGqUx/pLHzqWyWG4wBeqkD0e1PIFz9ypTX
X-Google-Smtp-Source: ABdhPJzeohXqeDsEGI/RjyJtGm1ppW+gPZslxBL6U1gsdJs4CsWiEGdaZGa35ge1Wn2xdNMkw8+GDQ==
X-Received: by 2002:a05:6512:3339:: with SMTP id
 l25mr8438219lfe.496.1629910604618; 
 Wed, 25 Aug 2021 09:56:44 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id i8sm55686lfl.280.2021.08.25.09.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 09:56:44 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/14] target/riscv: Add a REQUIRE_32BIT macro
Date: Wed, 25 Aug 2021 18:56:30 +0200
Message-Id: <20210825165634.32935-11-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825165634.32935-1-philipp.tomsich@vrull.eu>
References: <20210825165634.32935-1-philipp.tomsich@vrull.eu>
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


