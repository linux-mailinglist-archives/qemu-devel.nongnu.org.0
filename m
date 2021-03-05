Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E3432E4DC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:33:07 +0100 (CET)
Received: from localhost ([::1]:47528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6pW-0000NT-R0
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:33:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gT-0001CP-De
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:45 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gJ-0004Ig-9H
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:45 -0500
Received: by mail-wr1-x430.google.com with SMTP id d15so1284329wrv.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uKQWxVwgxygYQ7LgI/xiLI0s1GHCcjX+cZ0DX5HRE4c=;
 b=PEul8SeBRF04WvhZkrBDUjl9y8unFA/utvpRXk5BZ33ANwtrodLk2rWh2x+cQknW2b
 KWiXo9TtLndDOCi0WKjxn4H+yczCSXmFmUVmyQNsrEPt8+ro2E2NzImXCZOBCRH7oDmR
 CWx9GMEKT++bPqGvz+bdhBzlvf/ktyvXgjPlAgjEl61nkBDpdqS40ST+Q0TrZo9hPYVa
 wNsOJOgl7OHkymJO2l+wqUJAWUhrMrwM5IJzwzToFIhXNCvU1KZA/PtI/JsSSbcraVgn
 CgiUth7R8Et8fwZcpU9NOPaT1XTNVd0DGKdH/ruioovaTuSKUe0/67U/K7WjLPHXn0yk
 TUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uKQWxVwgxygYQ7LgI/xiLI0s1GHCcjX+cZ0DX5HRE4c=;
 b=c4cxyR+mwHFRosJMyicvH2XEy9Y72onSWfjugi+AxfVXvMabAtLzUI0zGeOmvfm3cs
 vvXRtVVyZXX3jEh/b0mKbOpm9uQmzPXHqxOs9ZcW+xMVrskEY3/1EDN/yha/i6VbsOr7
 oU24dWzoMvXdgZhEbFq/rFpReVr8D2EFSpxdm8EBW82ZsEglx4N4W8/+Ky8f19kHlaUy
 cO9kJOWjIoCctGTvGXH3m3B+6BuH3WCe07n+jRX80NTvVUbBy2YIQmcjKOCRobI9RZid
 zvaqo1G1DWTo3LK431Q8BSAAlhN8XZ5/yAznuqGj8r6QUE9Hi5T8zcyxb6mpj008GX+H
 amPw==
X-Gm-Message-State: AOAM531F7JrJOtiU8IH0tpKGxr6bgKIO2KYehVRnbRrPxngBlZdEck9F
 msAYlYF8+G3RZDcx1oamALWdoA==
X-Google-Smtp-Source: ABdhPJxogcgl+s1kPF3lT534CGLUXFwm6m1HVlIjxUlYyjX7DuhK8sNt4xXnf4uhwx4RVp7yIdic8w==
X-Received: by 2002:adf:e94a:: with SMTP id m10mr8231068wrn.55.1614936213780; 
 Fri, 05 Mar 2021 01:23:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m11sm3527749wrz.40.2021.03.05.01.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 01:23:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 378CB1FF8F;
 Fri,  5 Mar 2021 09:23:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/9] tests/docker: add a test-tcg for building then running
 check-tcg
Date: Fri,  5 Mar 2021 09:23:22 +0000
Message-Id: <20210305092328.31792-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305092328.31792-1-alex.bennee@linaro.org>
References: <20210305092328.31792-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is mostly useful for verifying containers will work on the CI
setup.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/test-tcg | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100755 tests/docker/test-tcg

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


