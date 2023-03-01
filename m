Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D46A6F2B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:18:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOBn-0008Cw-M9; Wed, 01 Mar 2023 10:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBh-00087n-MZ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:14 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBd-0007bl-Dc
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:13 -0500
Received: by mail-wr1-x432.google.com with SMTP id g3so4716252wri.6
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbykLvpPl5/hixH9ogfK/P0Luf51vXufeBGBbBQlZ/g=;
 b=YYMyazvfdxunNJCuDGPxbbhondTnCvBTAUF+tAvM7n9WKIYw5qHGa/IeSY5xmOXBDn
 EOT4mK5OoVcdhknVhzPcZIPRGkv3slMvSVN1Lvs0FwjpTnlFGrGsFmtSWWFZ5J4bLnkG
 oFsxLaAw1/ccn0lTNmvzH9+J4eu5ohbvSaobDSyU2uoFX5D0zHAMsURWAR3nEtpNBcAx
 MDRg3hCL2/+QLldYo4G0//s1vggsgqynImuERERKF7b15C1iil8p0pki28Na2Xgv/m+S
 GAz9AzNl8QIxXewJ07SOetkftjjM9yxL34KUiot+VfgpC86p6m2JxaycaKQT8co6GbMt
 4RVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JbykLvpPl5/hixH9ogfK/P0Luf51vXufeBGBbBQlZ/g=;
 b=567AmSz/rO9oQWSCe3SJlEmvojADLbqQDLrbxq5aNvffyBBODpaByZviPWdzfvWlti
 n+qCf1oBejZ5PoAGTSpJ6WuFqJMF5uaj6mT+N04MdpmQfeWPTRZEZZwgRhuzwvaylWC5
 vg0MsUiPmuY9DmACZnL0YvSK8aFxzHa9zTzuIwXqNrXswbbkI3ampiD3Jecy/B9xfSB0
 AOU/MBV+0axHeG62/jwRcKURIrV/IBwQU5KwEmFxuq7LzSIBMGxtnR0KaRxvA3IIGYOk
 aYIJRbMlWtI7M2KTGo7armLcXzfZUNLaT/gynHMEgNypRv587kPNodZrpREJg6m+0eMn
 THnA==
X-Gm-Message-State: AO0yUKVgClK1A63hpao6f2DyYw7y1Fd+h0ciWse0y6AaQQGu5ONRwmpO
 TH2sO/0qYhCcqs045+0D9gOg1A==
X-Google-Smtp-Source: AK7set9/ajKJIBIUMa9rJJy5fUr5UgGq+WwU+R/Bp+h/VAPi8KiPwGI+meZFkKZv+W3NdG+ukALruw==
X-Received: by 2002:a05:6000:81e:b0:2c4:489:fe93 with SMTP id
 bt30-20020a056000081e00b002c40489fe93mr11546664wrb.21.1677683768081; 
 Wed, 01 Mar 2023 07:16:08 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c18-20020adfed92000000b002c54c9bd71fsm13238487wro.93.2023.03.01.07.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:16:06 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 335FF1FFBD;
 Wed,  1 Mar 2023 15:16:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 05/24] gitlab-ci: Use artifacts instead of dumping logs in
 the Cirrus-CI jobs
Date: Wed,  1 Mar 2023 15:15:45 +0000
Message-Id: <20230301151604.1948813-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
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
Message-Id: <20230228190653.1602033-6-alex.bennee@linaro.org>

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
2.39.2


