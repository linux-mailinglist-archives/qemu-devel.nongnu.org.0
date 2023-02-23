Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AE16A0D66
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:58:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDyL-0008RE-HX; Thu, 23 Feb 2023 10:57:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyI-0008CF-Ks
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:26 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyG-0004ib-SU
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:26 -0500
Received: by mail-wr1-x432.google.com with SMTP id r7so10890785wrz.6
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cxT8CnhgY0D2r8NxQicEQ9Z5WyfyndJneuRY8lJ1+eo=;
 b=BoP902A0sb/FLK02Ci73PsdyvrgfWgqy11RUdU+y6do+xqWOCLMnrOZQGswqb+8xb4
 PDP45XuzmPSUAsbRvalmUl+MMBWeTrlsdJnMbb6v2O6iL3kMbo5d5Qpwt1u0ipw7GKT8
 0w71zciDreVBB91Wqn+WBYm7tvbMmKfZ5cM+nbk6FUu399wUHi1GwUrB+B9J2taZChyb
 m27EbCZjZ+dCeF/Pkw3PCYKxvjhkoWt0cSpCpfMaKrEzqk6Z42hvbscAtcgquIMMG7W0
 T7CHCFg39wFmPYS/DLaYr/ZF/8R1YmgmNH/AF6k9AUcDuSWmzbE4aAIbLkxhG8GwvIR3
 /IPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cxT8CnhgY0D2r8NxQicEQ9Z5WyfyndJneuRY8lJ1+eo=;
 b=1CKclpgCaP3Q7L8wdZX4RszLclSVNoXqoGzP43RYwhmXXtCELQYryfFPiPemsBZWxO
 ps5/msVU8VP0zjAHomk46EsNS9z/o3SOWJwaBHWy4XWkwu2eTeR7VF3A92DzeVUpu0xl
 AGiVIDnuoWvRCjVe+rU7YAdoQxWWiM7kWQwQKXwwHDRCVqwTcysv3+cKOC9ElA1O2HcV
 thNvry96c4aFC5soiSm6gq4FJzSU79n6RXb2imH1QHBmRQ0q+WYr2D17B6xuCAicL6w8
 I/CTJD/P9Z39wL6PrFSW2eF2uOrS2IaL2Q49COP1+h2NfmpTDsx+AJBIUeTmH/+gVJlN
 6UzQ==
X-Gm-Message-State: AO0yUKXOyE0AFEkiNcLBBxXVHsG3QK2Jq+u0T+tFn7QUcyU2NPzL1mJ7
 xD2J69yFGGlpzJUTN5F9Fz3G9A==
X-Google-Smtp-Source: AK7set9TdZgpYoOFg/ZGG9f7rsz3mp5UXPhepYKKEwyUdHnX/mqgFBM7IcppQWmvfg8oO6GKHxrsaw==
X-Received: by 2002:a5d:4851:0:b0:2c7:1159:dfde with SMTP id
 n17-20020a5d4851000000b002c71159dfdemr2126472wrs.31.1677167842962; 
 Thu, 23 Feb 2023 07:57:22 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d434d000000b002c55ec7f661sm9476530wrr.5.2023.02.23.07.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 07:57:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 014771FFB7;
 Thu, 23 Feb 2023 15:57:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 05/13] gitlab-ci: Use artifacts instead of dumping logs in the
 Cirrus-CI jobs
Date: Thu, 23 Feb 2023 15:57:12 +0000
Message-Id: <20230223155720.310593-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223155720.310593-1-alex.bennee@linaro.org>
References: <20230223155720.310593-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

From: Thomas Huth <thuth@redhat.com>

The meson log files can get very big, especially if running the tests in
verbose mode. So dumping those logs to the console was a bad idea, since
gitlab truncates the output if it is getting too big. Let's publish the
logs as artifacts instead. This has the disadvantage that you have to
look up the logs on cirrus-ci.com now instead, but that's still better
than not having the important part of the log at all since it got
truncated.

Fixes: 998f334722 ("gitlab: show testlog.txt contents ...")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230215142503.90660-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230221094558.2864616-7-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
index 7ef6af8d33..a9444902ec 100644
--- a/.gitlab-ci.d/cirrus/build.yml
+++ b/.gitlab-ci.d/cirrus/build.yml
@@ -32,6 +32,9 @@ build_task:
     - $MAKE -j$(sysctl -n hw.ncpu)
     - for TARGET in $TEST_TARGETS ;
       do
-        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1
-        || { cat meson-logs/testlog.txt; exit 1; } ;
+        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1 ;
       done
+  always:
+    build_result_artifacts:
+      path: build/meson-logs/*log.txt
+      type: text/plain
-- 
2.39.1


