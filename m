Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9183F50B2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:47:57 +0200 (CEST)
Received: from localhost ([::1]:48526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEzE-0000iC-No
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEuU-0000Z2-LP
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:43:02 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:33661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEuT-0004Uz-1n
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:43:02 -0400
Received: by mail-lf1-x136.google.com with SMTP id p38so39973784lfa.0
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BqIIxKQ2PmiG9ipCizLmh006nF+zpi5csTKSI3kOtFY=;
 b=TZ2PYzq+7ByiZcddFunY+tPsM9m3BrHv7qGFfjGrOCRW+CwjA/7YRD8Iv5ih5ex3Nc
 CVB+YjNnDsQX/LVGSZobFJAhLs84zv7NWGqD3H7sYEL6pj1hztRDR6K4TvtK3m5EKwVp
 8dw3r3I02wlpK13CQlMXEjtEL02xywy1+QHkbHHxvpiPJWeuwgKVVzWcDK2Aj8WKS19T
 DE/9c/g8dRzWwBf1ZfuDRD+wmnKtAX/bfCHDAGxzUl1JH68qPMg/N9+E/0yRqw05ul1b
 Pl5KYJiZr/ffPwWUXiWjtVKuhwnfOYxeCAfVItUzbco/j/GonlFNLiYkKdyZAgtt2D4Y
 61Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BqIIxKQ2PmiG9ipCizLmh006nF+zpi5csTKSI3kOtFY=;
 b=p4TCCqc6NEaxTmTfVtFKa9veaU+hbKv2r/I+k+3Ux3Ty1Aiv8C+wYdFdY1yy3e60p0
 WcCgjxYWi3W76SD406uXqhVSpxAfd53hlF467LsunCIaXuw+Zxb21ArgHzuRW+GH339u
 V4xgemDowVzPwg2ln9PN7f8M1b2zSSk88G+i/TXf1WsWP5SyoacnOd8eDp4iJMPetoLU
 mgDWyFygYVrlLRiwGxSn7hfeLJftWQvvbG/divdNVhziMe44ttlBjUNFmBo54SprMPRT
 Bs1TjU9zDeExzsJZe+EMJsu90t1X6JYbs9CGN5EHxNIrzFITLHJ6N0Gj8i7vwjS4hLfi
 sNzA==
X-Gm-Message-State: AOAM530q4iHn2nWU9/vWAJ3vA2tvMAU5K4tBoQ/gLm9yOwufWwq1XnFt
 rHQHy0RT00ot/9uzWqSHGBIWVg/MsS1DHwvC
X-Google-Smtp-Source: ABdhPJxjIlroXSX3nobHpMErrxINcxOzyrs8/5jJ1xD/LY2uCXh/6IpYfPLkgnAsWH+/zNsZo/oacg==
X-Received: by 2002:a05:6512:1695:: with SMTP id
 bu21mr26244894lfb.506.1629744179208; 
 Mon, 23 Aug 2021 11:42:59 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id 25sm1443794ljw.31.2021.08.23.11.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:42:58 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/14] target/riscv: Add a REQUIRE_32BIT macro
Date: Mon, 23 Aug 2021 20:42:44 +0200
Message-Id: <20210823184248.2209614-11-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823184248.2209614-1-philipp.tomsich@vrull.eu>
References: <20210823184248.2209614-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x136.google.com
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
index bdb47905f6..9b726ce9c4 100644
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


