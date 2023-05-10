Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43FD6FE13B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:10:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlPS-00074r-Pv; Wed, 10 May 2023 11:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPG-0006td-G8
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:06 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPE-0001WW-EE
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:06 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f42ba32e24so15059885e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683731223; x=1686323223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=thnMy8X2PRH6GO6v7+wbnsn6tBSbaVAWCCL4W8p3qQc=;
 b=bsfZfnXz3Db5Ij59bJnWCk4dAYTnCxASc8DfJ0c7Z3LpHZz9h4tnnF21P15ZYENSk7
 O5FkLuL8m62f4GjcY8EHM1Ksr0e1+S5AVQ+s+YMM2nvyOkIA6Q9ONF1pErjyXRKEh4Jb
 ZN3vwwpLmBI6Jpf2WQbxeVP1tqKbot0Oslh/fTnNGusNQ0IeKVZCv8HaIEyLQmXJxleG
 QOkI15k5+PqrREZEZvHlWz4eY3VKYA0uSy6BiNyN2YGtBdllyAtc5hRY+39YCipxxu/l
 2THSZGNxBCh3zdZPDTK815bCPB6ZnBuBxZcdL3TVa3ZPEkpREpN+bFAxtcWY3RUxbRhx
 WuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731223; x=1686323223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=thnMy8X2PRH6GO6v7+wbnsn6tBSbaVAWCCL4W8p3qQc=;
 b=Ire4/tnG5xl+yNSyKANzbEueb79jSAhox3PiX8pQvsiA0EvdThwnS0FxAJOzWFmiLG
 Jw3I/aXb8vRiJXDLT/ZyOcfAPLWEZl70tgAWbuKR1m1y30ydFaIilZrNSAIWQS5e9lZ8
 j2vVe61jwgNF7vdNyFpHpUPOOsQ5+niZ5wxeHRKWKXBfCjiuAyexQC0nKdHaJ2i4Unu2
 mKHUYUb/vCLQGDzvM4w25qmayvAZ2gQP6amJ/05gRHwUbhTwVUv9PSf5KO75efdP7IR+
 o6O0oas0LSDxamy2sY5r9qRMtPOvumuy+AZ9xpuT8pVvUJ43UHsBPo9ZRRisIbJKsP3C
 dRMA==
X-Gm-Message-State: AC+VfDwBZli67XBRuYWjPR6XJ6wyQiHqq6IO2b8zQTADtuUle61ARQT/
 22kEGk85XvcEhFQw1xbFfeqy2w==
X-Google-Smtp-Source: ACHHUZ57Fkm9v90Sxkm0cZzv6wy+tzDpISaL/UDcyBXLsvP0C3vQveeqzTDl/IDPBWj3ma3oLnlKEw==
X-Received: by 2002:a05:600c:21c2:b0:3f4:269d:a080 with SMTP id
 x2-20020a05600c21c200b003f4269da080mr6083554wmj.41.1683731222947; 
 Wed, 10 May 2023 08:07:02 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a1cf616000000b003f080b2f9f4sm22929865wmc.27.2023.05.10.08.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:07:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C70B1FFC0;
 Wed, 10 May 2023 16:06:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 5/8] gitlab: add ubuntu-22.04-aarch64-without-defaults
Date: Wed, 10 May 2023 16:06:55 +0100
Message-Id: <20230510150658.1399087-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510150658.1399087-1-alex.bennee@linaro.org>
References: <20230510150658.1399087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This does a very minimal build without default devices or features. I
chose the aarch64 runner as it doesn't count towards CI minutes and is
a fairly under-utilised builder.

Message-Id: <20230503091244.1450613-20-alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index 57303c12e1..f8489dd3fc 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -45,6 +45,28 @@ ubuntu-22.04-aarch64-all:
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
 
+ubuntu-22.04-aarch64-without-defaults:
+ extends: .custom_runner_template
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_22.04
+ - aarch64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$AARCH64_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-user --without-default-devices --without-default-features
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
+ - make --output-sync -j`nproc --ignore=40`
+ - make --output-sync -j`nproc --ignore=40` check
+
 ubuntu-22.04-aarch64-alldbg:
  extends: .custom_runner_template
  needs: []
-- 
2.39.2


