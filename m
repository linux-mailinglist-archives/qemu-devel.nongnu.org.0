Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83E64F9B3A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:00:49 +0200 (CEST)
Received: from localhost ([::1]:48968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncrya-0005kz-Tu
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmK-000788-Up
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:09 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmI-00031p-HR
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:08 -0400
Received: by mail-wr1-x429.google.com with SMTP id a2so4524527wrh.5
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gs6DhXXH3OheiODrWMr7bw7KN+vJ8pkDZF2hBYggHlU=;
 b=G/7GqOFOyj9b10vXROCsAbFk/AZyoR84IitX7+YHykcxem7Jgpsn+qK0XkRr4QfIpt
 Ky6w4cA4pSCz8La+9WIVX7mR+VXu2oc0i1LwnZcHBS0+UoA6GiqztSfuvhf+JxyltLDZ
 Ap0PPNpdqyO/ivIWtLSQOqGiwWYAT5kq7yxD5a1JpO/QU6835GxS3ydvrLZXfCS2PbY9
 Kc698Fs4nVQdJhr+wOeD3fs55CoB1Wo+1OpgftPrHQqLcoXIZd35YTp7YuXpr7yEuI2J
 WO1Bt9or+FzRsQiYIMUgBtCqhn14HuO7P4yCjoAWTUJzMb9xZn1uVmrhSEcsXl3zP3ml
 DUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gs6DhXXH3OheiODrWMr7bw7KN+vJ8pkDZF2hBYggHlU=;
 b=o27JO5SCxjNBpC0e1hWwDEvRAAeo7fURsqzamp9hR4vCEvF7LH/Pp0TbpIdeCvqqA7
 1azBAvJFcmZxo5VvtFutL95hWFkLS7ymrLX/epbN9eYCQkF+UqUw4l0VU3onT2zoV3UM
 OYVaRvSB+wqlkoke9VIq7FJj7WjHQcHCkSjSCZxJpIGR/fR46DEd3beiBy4Bb3is3aVV
 rRv8gEixXAcycZsFz2E8946q8YW7XYV6nR5EOW5K0YUzZ5PGVHvJqGrIR57K2+Zfb66a
 rZXLv1zC9mEV6Re4H4jbVy++A+e+LXD7jgaGRsRRq1ufSniFSDJYMlP1F3BBgjJWBWsg
 6m8w==
X-Gm-Message-State: AOAM532WMiTFvy9Ru1oVQ2zb46hqWcR26HwkUxA8Dlw4b7mdmHyy/aU6
 7lBWfXEMGyq5x1omqC3isOP/3fWeaGUc8w==
X-Google-Smtp-Source: ABdhPJzXovumMTc9TKCJZhxZiLgp70uaJe4Qrth+cAUf+UB4dehZIFy6TBfnkI5FbHn0lafFA/VfRQ==
X-Received: by 2002:adf:a1cd:0:b0:206:168c:1c7e with SMTP id
 v13-20020adfa1cd000000b00206168c1c7emr15521853wrv.209.1649436471385; 
 Fri, 08 Apr 2022 09:47:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm11003039wmb.3.2022.04.08.09.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:47:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 37B641FFC3;
 Fri,  8 Apr 2022 17:47:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 12/15] tests/tcg: add memory-sve test for aarch64
Date: Fri,  8 Apr 2022 17:47:39 +0100
Message-Id: <20220408164742.2844631-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408164742.2844631-1-alex.bennee@linaro.org>
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, stefanha@redhat.com,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, crosa@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com, f4bug@amsat.org,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, pbonzini@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
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
index a7286ac295..cc02814065 100644
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
2.30.2


