Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AC54E9B19
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 17:28:40 +0200 (CEST)
Received: from localhost ([::1]:49198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYrIN-0002yc-BM
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 11:28:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYrGC-0001Bh-Gr
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:26:24 -0400
Received: from [2a00:1450:4864:20::430] (port=46658
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYrG9-0001Zj-74
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:26:23 -0400
Received: by mail-wr1-x430.google.com with SMTP id h4so20897142wrc.13
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gs6DhXXH3OheiODrWMr7bw7KN+vJ8pkDZF2hBYggHlU=;
 b=hzILFza1vrZqmYLvxSUj9kpCO9FV0eSlPYzEsioEDGpcPFDZL5RGB6zjYhEtyywUXx
 kCMYT1a525TzI1E1pqKGW5un6YzKfKrPEGfTew2+UzIJQk49Gf+rzX8x2s9KpA3qDvgC
 mgzVryKPf/J+fE9xrM4Oah34IOXoZpgRIDPoFaxAx3FdVqOcsi5AX6U5ODhyz45fs1Rn
 mpw+sXfttM9Nnlk9zglvDRNPDW8mfruym7FsCEv9XIHGuDXEPvved680MCjB9u2K2h8m
 br2BCnjzYmDXC97U3jx8KI+dyU3uGriWsY/ZDHL5uY+gwXlETibsLLfLpEgizA8FQyqh
 TfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gs6DhXXH3OheiODrWMr7bw7KN+vJ8pkDZF2hBYggHlU=;
 b=ImGutVyqGr5/1vnji7VsUi4BWEbLx0MzP2lmCpSh60By1IQPoc8uGOlQOURekDQofb
 bA3+6pGPumAid1OZdPkk8etDZWvfasywPH/7+bCZnnygCADYXdzRllCEHWfXaKbwffX/
 +e4FkZEvY+urKr79WAdhOIdpSLUESCv1JSWF3vXdpn2Iu0ISugn/HYmq6FRfpAhxoyS7
 jlMGqWWhUvtdtsXoX90jdhLeRgPzXlCdq4y9jS6EH3gP3Zz2hIpSyGlT9cKMDn1qvcWP
 8oSM9WG0y7OdVxK4uLpHtg6ZOVXfsvmyWDIKUbiZ/3ARGKkFWf3WHNxhHscGhBNIbYz/
 gy3g==
X-Gm-Message-State: AOAM532hd5TaEblDLT8sWA6Dr8iEHPSiWEyq88zPzSxhSBFGwhFTw66F
 0U62kzY5rwsK9QoJNPwOfocZxw==
X-Google-Smtp-Source: ABdhPJwbbROFItCIZGy3eYr1xvIQsCg+Dym9PzzJ+NpEDYoFpMuX0UXWZEud0tO+Ykz/SY2DAwrJOg==
X-Received: by 2002:a5d:460c:0:b0:204:62a:210c with SMTP id
 t12-20020a5d460c000000b00204062a210cmr24131056wrq.460.1648481178845; 
 Mon, 28 Mar 2022 08:26:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a05600c354100b0038cceb205besm12097704wmq.7.2022.03.28.08.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 08:26:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 95E831FFB8;
 Mon, 28 Mar 2022 16:26:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 1/2] tests/tcg: add memory-sve test for aarch64
Date: Mon, 28 Mar 2022 16:26:13 +0100
Message-Id: <20220328152614.2452259-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220328152614.2452259-1-alex.bennee@linaro.org>
References: <20220328152614.2452259-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
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


