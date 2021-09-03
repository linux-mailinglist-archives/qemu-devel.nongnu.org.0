Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33BE4003F7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:13:26 +0200 (CEST)
Received: from localhost ([::1]:34838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCkn-0002Ro-21
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMCZ5-0007W4-9g
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:01:19 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:44816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMCZ1-00056j-4y
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:01:17 -0400
Received: by mail-lf1-x129.google.com with SMTP id s10so12953697lfr.11
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Byfy05ziqCgv95xzCHpZBdafCiVDPBMWHY7L07p6tOg=;
 b=b951w8h3y9Cy1bZpH2Zh0v4UMaaNZ4zC/CyC2/CntVz3GnBbmfkjkARGZiMec2Od61
 lhGAE/r14+Qsok68Vv0nPV4wlYXhrsMqgeocVtygUzTsJx+Fne5wiUNTkAw0Z4kIDkns
 IwkAt404MlCy856Q4G4Lng5cH3Uos/Omc9aVkkQ+ID/YopI9aMorXbBWDCvoJwBRYr8y
 +VXoRQZRUun/YU/0jaqh2vngZzIhAzkHD3J/+yrsk+ivRr2PkJLELFnesKl7vlA14xWQ
 9ogl4MFAPf8bGJQ3t2ZRRbs1wgld6LFydG+ODW7L/hQ7+uFkls2BYSzD+ch5dc0xW8Q0
 +How==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Byfy05ziqCgv95xzCHpZBdafCiVDPBMWHY7L07p6tOg=;
 b=s1oQnVOaMDPtCWjmiAFTPfCt4T9tupn7a3jaRhY9JphcTjZaVn7d3N3d2/L/uWV6XU
 t+jd5iRrOlRGw+6Xz+TE5GLklKltcy21RFh8L2wdfpgeFPjhB0sOBzsWbx2EYWqKKgJN
 y3gO/k4swvbsWHb6N14ChwL/JENG0xHBNyLPM7HMmMccX08tnh/PxI5ydrh1omsNXUuz
 Gc+Fgl9sCjhRk56ob7dSZbBFW7rlm3DWeN5q57IMXykwdO5y1O0y9PycRW5U7YgQZ/rc
 tYblvL1lNvuv7xAlXwCmTj8s/1Z0/i6/KLcap/Zj0Hd6SzBQHd/ueOv6UaVBR4IBdzt5
 QS4Q==
X-Gm-Message-State: AOAM530nSmSyu6MCVE3aIKi85Etzs4P3DrRuAAPAOPRpraG2eNh6LRpU
 1xguuuv56cZlt5SyaC0ye/F8pJDVUyBnfBvY2k4=
X-Google-Smtp-Source: ABdhPJx2a0dOJylIUEOFvqITiZrvM6yIUnTebOrudRGIXESxpqrRSiUrnLv9aP8GZEhkyo0z6D0DUA==
X-Received: by 2002:a05:6512:401a:: with SMTP id
 br26mr3392203lfb.23.1630688473064; 
 Fri, 03 Sep 2021 10:01:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id c3sm628401ljj.77.2021.09.03.10.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:01:12 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 10/14] target/riscv: Add a REQUIRE_32BIT macro
Date: Fri,  3 Sep 2021 19:00:56 +0200
Message-Id: <20210903170100.2529121-11-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
References: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x129.google.com
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


