Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDB35C03F6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:21:02 +0200 (CEST)
Received: from localhost ([::1]:41044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2T7-00051N-5p
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gh-0003FZ-3Y
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:11 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Ge-0000cG-UG
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:10 -0400
Received: by mail-wr1-x429.google.com with SMTP id n12so10643051wrx.9
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8Ro+xFgh/QdLoZQgvYQ8rQUQbQuFqJuKD5ycvRlp+PA=;
 b=yDRFOGZIwS5TBvjprxxXPeD/fM1U32vJwucS9FveGYT0CdQTBOyivLde2QxrvyAXt2
 1Vn4/s/QysuxWhsINXAqZhpyZShvpp4Y2GhDnqDCt0X9P42dlqs0xr3JoU+sG+IdfsxP
 gWWmOMkWMJiUKsfClVw3y7KkBcIgoLCyZfx6pJpdRkDzFdaiuH7Sfdj2pwUCYLUPrRkm
 GYrBTwQQrgDHM14JlAaxpdXO5y2yj5LTKDDv425siJ5bfi7p/t/TgWcTYye2C+juJ2l6
 9wX9M+l2rwrEZBsnVzrvU37tL5DWQNyOT32YFRbssHqMM4/6gMvpPZ/kVun8CcoP4X/W
 7iKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8Ro+xFgh/QdLoZQgvYQ8rQUQbQuFqJuKD5ycvRlp+PA=;
 b=iKKshSF4GgWww/SZPLXKi4Y5RZbTw8mI/wlJtyDqeOkJ830zr/efHH9eLMIZMyovIN
 ibEr9EFTt8ldbWmSx102EYHBjtrWWcZGIRpA3DaS5qP8w/BXf/lhG8WZ1/0sOr9qbh+v
 nE0F8VuESM7xuPrO8BxxaYnLgarU1pi7Zf9MvLzdC/FzYPsYxcSeGJ59mvFH6mN35csS
 xq3dbOOglgnM6o4iDQWHblZUj1RRjTG/D8czZ2zg9II6QYYW7cIceO9rmRhwFqHsYhhP
 DXi0o96/8dCjj816Ege0QHnbXNeQlvLe/EIZ4CvMBXqSa0deKM4r52L/AchSQ+yohB85
 UF6A==
X-Gm-Message-State: ACrzQf1fWIwOn/sFiSoLGiH2r2Ty/CBzVz8cgqi4YGvvo6iqbh92Bzhp
 9BP2BNxwHOPPClJTGPMpba5S3g==
X-Google-Smtp-Source: AMsMyM6boG4cIRgF1survFRTZd4Caniql31PKXBe2OhUl5E/ob4SMPewUZERo9uf3bJ0Wqt+zOXsXw==
X-Received: by 2002:a5d:47aa:0:b0:226:dbf6:680c with SMTP id
 10-20020a5d47aa000000b00226dbf6680cmr17803276wrb.581.1663776487085; 
 Wed, 21 Sep 2022 09:08:07 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a1cc904000000b003a5c7a942edsm3224652wmb.28.2022.09.21.09.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 09:08:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 886251FFBC;
 Wed, 21 Sep 2022 17:08:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v1 04/10] tests/tcg: add memory-sve test for aarch64
Date: Wed, 21 Sep 2022 17:07:55 +0100
Message-Id: <20220921160801.1490125-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921160801.1490125-1-alex.bennee@linaro.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This will be helpful in debugging problems with tracking SVE memory
accesses via the TCG plugins system.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Robert Henry <robhenry@microsoft.com>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 tests/tcg/aarch64/Makefile.softmmu-target | 7 +++++++
 tests/tcg/aarch64/system/boot.S           | 3 ++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index f6fcd4829e..26701b718c 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -31,6 +31,13 @@ LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
+memory-sve: memory.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+memory-sve: CFLAGS+=-DCHECK_UNALIGNED=1 -march=armv8.1-a+sve -O3 -fno-tree-loop-distribute-patterns
+
+TESTS+=memory-sve
+
 # Running
 QEMU_BASE_MACHINE=-M virt -cpu max -display none
 QEMU_OPTS+=$(QEMU_BASE_MACHINE) -semihosting-config enable=on,target=native,chardev=output -kernel
diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/boot.S
index e190b1efa6..f136363d2a 100644
--- a/tests/tcg/aarch64/system/boot.S
+++ b/tests/tcg/aarch64/system/boot.S
@@ -179,12 +179,13 @@ __start:
 	isb
 
 	/*
-	 * Enable FP registers. The standard C pre-amble will be
+	 * Enable FP/SVE registers. The standard C pre-amble will be
 	 * saving these and A-profile compilers will use AdvSIMD
 	 * registers unless we tell it not to.
 	*/
 	mrs	x0, cpacr_el1
 	orr	x0, x0, #(3 << 20)
+	orr	x0, x0, #(3 << 16)
 	msr	cpacr_el1, x0
 
 	/* Setup some stack space and enter the test code.
-- 
2.34.1


