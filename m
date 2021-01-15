Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB392F7D78
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:01:32 +0100 (CET)
Received: from localhost ([::1]:34892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PfP-0000kD-3s
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:01:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEU-00012K-2b
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:42 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PER-00083s-0b
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:41 -0500
Received: by mail-wr1-x436.google.com with SMTP id 6so1998051wri.3
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9l5GkCqPTLZXmRBOi/YdjflOtXCCeq14JR2oZmMiTyU=;
 b=rf4Wu690iN9cZNxbxd/BeLkccLH3IkbSZSKBHyU5/5x7H44FxfQxkOi8n8SBg/HIdO
 K6CrPi+7jIaWzoCq7lutRUmJ0D3QFKI//qxC/dDgmZD4pP2ltLI5UhlVyO6RBVBK/Ota
 AEKKCbLeRL5ALSGsbamjDyi5rX07wYzt/Dk5cLG2PaLdd+3jrCWfI/Fi/dp/+w4LVNkR
 QH80r+8m3jRpg8dEiQ5vW8iQX3ZSKo//ysRrYO0rOV94MO3y80DcAF+9TTDrXjdmaQAF
 lJYA7WA/0UxLbg37a3wvtoN+7UcYayQKm/w845QARnhTgLKDVwtTRzyvWaEt73vDs71a
 M1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9l5GkCqPTLZXmRBOi/YdjflOtXCCeq14JR2oZmMiTyU=;
 b=Yi+3v23YjdhPhIQbexlRnwxvwuwfMzsAW8OyA7NbpmjqMxZS80id3JYAWEfZkBud4S
 Yh0mFyB+/VaBC7nVhon8F4gddONN4PLc+ItvIhmKu8w2Ll3AQR3D1m97hPjkTUuWh3lH
 i5aC3BvNMqRBNRaKt2ddjV+KplUPci7EUun/7Eos9kGZs9r/jr/zRFr8jmbBYNoBg8Gb
 zVDtFoOkqzhIPQBUOCurSzGfTpAvmVT2v65L1g7y2lPCaGFqjLsxDGK1oqAE4WhpgDmQ
 /74vQh0ZWvUXcgsVfiixoCSUvLrA9dBxrQIKt/EEuXN8ZnJD+3Q4vhOyUB/R014PhgPc
 hZbg==
X-Gm-Message-State: AOAM531hCWBEXFVN/FynUWenE1gqjusssp7RSGQmEvQSYus4I8nw+G5w
 yAnjE3SyK1ST5JgRhLj58agCWQ==
X-Google-Smtp-Source: ABdhPJxB8lCa2iKSxJaLyMZEdMsaCA/tTo+GRHmWS1zG6RW31V9IwdwILYm8OMSm6u0t0cU9+b7rCw==
X-Received: by 2002:a05:6000:368:: with SMTP id
 f8mr13171063wrf.150.1610717617491; 
 Fri, 15 Jan 2021 05:33:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v126sm1471163wma.22.2021.01.15.05.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:33:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 016401FF9A;
 Fri, 15 Jan 2021 13:08:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/30] gitlab: migrate the minimal tools and unit tests from
 Travis
Date: Fri, 15 Jan 2021 13:08:09 +0000
Message-Id: <20210115130828.23968-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These tests are good at shaking out missing stubs which otherwise work
if we have built targets. Rather than create a new job just add the
checks to the existing tools-and-docs build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210114165730.31607-12-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bd60f3e741..fd0162ad29 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -124,11 +124,13 @@ check-system-debian:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check
 
+# No targets are built here, just tools, docs, and unit tests. This
+# also feeds into the eventual documentation deployment steps later
 build-tools-and-docs-debian:
   <<: *native_build_job_definition
   variables:
     IMAGE: debian-amd64
-    MAKE_CHECK_ARGS: ctags TAGS cscope
+    MAKE_CHECK_ARGS: check-unit check-softfloat ctags TAGS cscope
     CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
   artifacts:
     expire_in: 2 days
diff --git a/.travis.yml b/.travis.yml
index 3b574a5968..5f1dea873e 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -119,15 +119,6 @@ after_script:
 
 jobs:
   include:
-    # Just build tools and run minimal unit and softfloat checks
-    - name: "GCC check-unit and check-softfloat"
-      env:
-        - BASE_CONFIG="--enable-tools"
-        - CONFIG="--disable-user --disable-system"
-        - TEST_CMD="make check-unit check-softfloat -j${JOBS}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-
-
     # --enable-debug implies --enable-debug-tcg, also runs quite a bit slower
     - name: "GCC debug (main-softmmu)"
       env:
-- 
2.20.1


