Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1286433426D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:06:17 +0100 (CET)
Received: from localhost ([::1]:57524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1Lk-0006i9-2e
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:06:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1Fu-0004PI-8m
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:14 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1Fs-0002Zp-32
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:14 -0500
Received: by mail-ed1-x536.google.com with SMTP id m9so28793279edd.5
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8s+rghqoDmtXn+vNGYx+gVftGGy4eFdbii8sa4jsLZY=;
 b=qCZkG5X5nMnm+k7GMCdOQzYSm4Z7KIOlRE4BTcjHRE7nQyJqNq/cvWCaCElkjsA3mm
 RK+Yb+v4V2E/LoLBF8I3l/9BzDNOXMVm7gD0/M76ZPaAyTCigcAUOTRe0ZY8I/K+xZKZ
 4fTTSai0038H8007j1zCJMxNmdzksOY5Xo1LMyetWG1bVORpS3LZFdwIDWMXCUSqHpm+
 X5SOWV0L2RppC3xeG3j4j1Imc0Dh/5EdAnuNkGNCP0eJXRJQ1a7Gz48kyXkeT3K7I5zO
 i9udbBx/eQSYgBYyoWtCAVKIROxKPJekjmdNk5OO9lzzkeI+VPEgoHMPZ1qxIqRfnHYz
 lbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8s+rghqoDmtXn+vNGYx+gVftGGy4eFdbii8sa4jsLZY=;
 b=dewYQhadNWhLQGWMGV0RbFeaTauaI9OpBvatQ+uVifPBMNFiGgRFX9YnCJ/m+tKnk9
 fwzTDS/5zKZ4FZ90RIoCrQNoav3MTTvlfydYmTwnxRX+T4VNTLV3kkDov3o2i9wlJuFQ
 l8pa4z1CMsxU3pJhMIrDdUgXAtv3+1s+67zirlf5g1qbNPCf9XxlqxcLjURV5tAPnFnu
 cOyyCqhI31fZDL2Jvy8DXtUqkdujt0e4djfKHnf/F59ykYDitXQyinERQt1FiGRFjq00
 nepl9zaeAX/FVs1i97aU2RBysSsVlZerC+hT6zlcm9l/1k3aOTLmX24N5DnziMY2B8bB
 v3Ag==
X-Gm-Message-State: AOAM531pOH+ipG4kbF0A92RwbgLfGbgpI81+9xCZgJdKnBmA/rx5MyUH
 WrxuUlZ/gSJnNEjqWUTzQvGaAA==
X-Google-Smtp-Source: ABdhPJz+XO63CFaAlt5kwPg5ZuMr/IiMXuKSsQMF3Jt3Z7sv4vL2rD2ySu3+x2YFI2+KGS9chtvkBg==
X-Received: by 2002:a05:6402:549:: with SMTP id
 i9mr4166540edx.379.1615392007574; 
 Wed, 10 Mar 2021 08:00:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k26sm10149388ejk.29.2021.03.10.08.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:00:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE1EF1FF8C;
 Wed, 10 Mar 2021 16:00:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 02/15] tests/docker: add a test-tcg for building then
 running check-tcg
Date: Wed, 10 Mar 2021 15:59:49 +0000
Message-Id: <20210310160002.11659-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310160002.11659-1-alex.bennee@linaro.org>
References: <20210310160002.11659-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is mostly useful for verifying containers will work on the CI
setup.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210305092328.31792-4-alex.bennee@linaro.org>

diff --git a/tests/docker/test-tcg b/tests/docker/test-tcg
new file mode 100755
index 0000000000..00993b73ba
--- /dev/null
+++ b/tests/docker/test-tcg
@@ -0,0 +1,22 @@
+#!/bin/bash -e
+#
+# Build and run the TCG tests
+#
+# Copyright (c) 2021 Linaro Ltd.
+#
+# Authors:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2
+# or (at your option) any later version. See the COPYING file in
+# the top-level directory.
+
+. common.rc
+
+cd "$BUILD_DIR"
+
+# although we are not building QEMU itself we still need a configured
+# build for the unit tests to be built and run
+TARGET_LIST=${TARGET_LIST:-$DEF_TARGET_LIST} \
+build_qemu
+check_qemu check-tcg
-- 
2.20.1


