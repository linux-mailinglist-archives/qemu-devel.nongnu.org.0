Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D5C3F5045
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:19:27 +0200 (CEST)
Received: from localhost ([::1]:56118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEXe-0000Yk-1Q
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEQL-0006X3-R0
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:11:54 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEQD-0008Nq-2b
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:11:53 -0400
Received: by mail-lf1-x133.google.com with SMTP id f10so24903654lfv.6
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u9aw/FdTidHW28P0btKY0zpgCd0X2THvww44X+Potaw=;
 b=S1Z2s/q1ui7p2+eUcew9BxEZXk8+0fEYF3TZYU+Gxj7qzyZAZhCq0r8qDgvwbv4fUM
 /U7//53UBEpYbhlaEaVCpt5s9k9RfV2Bv+XG6fM4aeMdI1fMBXkrAtTL3FicPK2m2BNN
 bDn0jmVqkhZsZpRxpblfaLI+7SaBOxWdHHsbffX9j4sGtd+bAwNnoMaZyK73LmPmzhqS
 Vp+Z/yy4t6R50GebrZikpbReFbUXOylDU8zFVMFhorNa8O5Z9DIaTwUW8sZcHaK3cg5+
 Jl6sWerxp1rWuQSSbkfo+SHu2+HIhtku5B58KsYT3CJEUevEaIs+3UIJaJi5/BTBv/P8
 nOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u9aw/FdTidHW28P0btKY0zpgCd0X2THvww44X+Potaw=;
 b=I0tZSyfZ94EX/H1Zk34yYDJ9UCeXXIs2TPzmUthPAOY/8TjPIwfeKOhsM9VCLn4on2
 +FO7ODGxo62gGRkKkoFP/RTNRUZcAb9Ju04GTyqXtVezdqobX1HH1zDWLkR0KqQwuG1M
 Ke6/zXPBykBBLZPT5rCHM+hBznUopH5NrwYDWhjPzHPDXc2o+ATRuha5nIc9O00niFWL
 4FnmhVJUMpik2uzcAnu5TgZ2iYlskUhgtOiveyk/cS4mZ7O/GXyAiL6L6OJSpNSbLq/F
 bHy1gqhZO6nGisOKF85uRoDgQu+2yUGCM2ZrQmqOWG7mLDyqqca2lP6rqBXdDJB4PDM1
 Es+w==
X-Gm-Message-State: AOAM531oYpKc5xPdvoq6MIKcKtTLSa2IFlXP5lyJty7o0hf1TKUpDkOa
 kX0Fk5JA0Yuowmrsmw1HhzKpoyMOtkZKFNhH
X-Google-Smtp-Source: ABdhPJzPliJNWvDNs2cmijjEEORLfNo3bLsf9+2EOfDqCf0HvIPcakwzs3Nw5Ld+PZc4CJyjnLZ5BA==
X-Received: by 2002:a05:6512:1589:: with SMTP id
 bp9mr25477278lfb.567.1629742303407; 
 Mon, 23 Aug 2021 11:11:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id w26sm1511739lfk.223.2021.08.23.11.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:11:43 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/14] target/riscv: Add a REQUIRE_32BIT macro
Date: Mon, 23 Aug 2021 20:11:28 +0200
Message-Id: <20210823181132.2205367-11-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823181132.2205367-1-philipp.tomsich@vrull.eu>
References: <20210823181132.2205367-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x133.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
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


