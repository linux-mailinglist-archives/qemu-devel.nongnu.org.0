Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32786BF9BA
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 12:57:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdVBO-0004oI-JJ; Sat, 18 Mar 2023 07:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdVBM-0004o3-IS
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:57:08 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdVBH-0000Yg-Os
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:57:05 -0400
Received: by mail-wm1-x32a.google.com with SMTP id g18so4788688wmk.0
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679140622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H7w228qMV522vrZs8kcDs+ryF/z3Qx23mEIba2VleiM=;
 b=xnTIzvFAIakTOr2gWL45iu0dQkjYh7Fl88ao+fmn+Pz6QIxaCAYtcy9KGv+lhNMrwl
 +jb8JZnFxHE0sohmxEzs0tjgJehitxtK5tayia+bRGH8Oslymji+hlAhr04b7hlyLPfx
 qoqSjBIXurDtW2Rql06c/pcTyoBf47nX+Iv4AQHg5hfaqWM2a/Mzu3XCESYq19dO8EOL
 4MBQwyeSO7oipBCXQzoVWdWW6LPwSL7HMWbsxYv3mL+hczcDGua/I9iMbDiCG8C6lwMG
 jbzsR6YrhiNHJGsQrX7QWCPOPmWmbltDYZkcBo0iwMGqtKg1JV0iRHwBmTn3+chiprbX
 ENzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679140622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H7w228qMV522vrZs8kcDs+ryF/z3Qx23mEIba2VleiM=;
 b=z1Rax4np3PfBdP6FZp2sT8DrBFGeHo+DT/2mbc6bG2E7ApApInKh/lddIVoXft66CD
 bsMJqIB8x7raotmM9O05j2AuglSRiCql4bP6YMw9m7FJoJlKV5KV4qImkGYLzqexR002
 IfHYSXUi/9cYC2c2eSLse7ME0M2p2hJMMytUSQOKKyR8JQcJPMS+746sUEQwWhr7wFKz
 7t7lVW/2FxXoSxtXZ1HYpBOrWeA1lKMlaitoCVTUHOQOY0fH+Z5pdsPMHiPuHvp1NneW
 /eI0l77QtYf/hjLU+XXDLBeasDtR9PPONFYzfBoeYtb5xMcxtgVm+XoJrP0RAkM3MAfz
 GNmg==
X-Gm-Message-State: AO0yUKUzqCG805+I5JCdVDmlUlSQvSnd4knz9iWattFQIW0BqEqEde8i
 0wqxygS6LWvGbKz82Xd9ztZmMA==
X-Google-Smtp-Source: AK7set/b0ywbLAN10LMLyPD9kH9zVWh5cWl/oVbciqBiET3VOeURfjxaSZjs/+r3Hvd6BAVQ94gNDg==
X-Received: by 2002:a05:600c:4e16:b0:3dc:4042:5c21 with SMTP id
 b22-20020a05600c4e1600b003dc40425c21mr27202311wmq.6.1679140622149; 
 Sat, 18 Mar 2023 04:57:02 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a056000018a00b002c3f9404c45sm4246946wrx.7.2023.03.18.04.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 04:57:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8E8E31FFB7;
 Sat, 18 Mar 2023 11:57:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH] metadata: add .git-blame-ignore-revs
Date: Sat, 18 Mar 2023 11:56:57 +0000
Message-Id: <20230318115657.1345921-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Someone mentioned this on IRC so I thought I would try it out with a
few commits that are pure code style fixes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .git-blame-ignore-revs | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 .git-blame-ignore-revs

diff --git a/.git-blame-ignore-revs b/.git-blame-ignore-revs
new file mode 100644
index 0000000000..24208ece8c
--- /dev/null
+++ b/.git-blame-ignore-revs
@@ -0,0 +1,18 @@
+#
+# List of code-formatting clean ups the git blame can ignore
+#
+#   git blame --ignore-revs-file .git-blame-ignore-revs
+#
+# or
+#
+#   git config blame.ignoreRevsFile .git-blame-ignore-revs
+#
+
+# gdbstub: clean-up indents
+ad9e4585b3c7425759d3eea697afbca71d2c2082
+
+# e1000e: fix code style
+0eadd56bf53ab196a16d492d7dd31c62e1c24c32
+
+# target/riscv: coding style fixes
+8c7feddddd9218b407792120bcfda0347ed16205
-- 
2.39.2


