Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1A92EC4E9
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 21:30:54 +0100 (CET)
Received: from localhost ([::1]:49804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxFSI-00049M-16
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 15:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxFNz-000055-Ap
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:26:27 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxFNx-0005VR-He
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:26:27 -0500
Received: by mail-wr1-x42b.google.com with SMTP id y17so3536051wrr.10
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 12:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ixCMvC4dguaDEwQ4Nsum0LZqSHq/uTPT9B1FTaYzPo=;
 b=U+pbZ3KyaGWYxhpTrluktBofrPLN7ZyPxZ5d8YwRzJn/58yk+lKfVP/qj5/q4uyedr
 xaaL4PK+FN29tfcOsSd2j6zEVb1RShbiInBC2/oXgE1exSHyMhUl3h+UDrfCqvj1KGE7
 B8o/NxON/A6KUQko2W84Tt+mqav+tY1BmW+rIqJqT4V1Cbgv4r7kZdFQ0BHBeV4rJ2c4
 Jf1U6QoygjhnPnKn0bmNCOtpBBBhafaXLVKEiCTvKr8KokM6q75odlLX4tCE/qWUhyxD
 ZgabHpTybhIKZugi7GNNNTl2QrBBt2Hlgni5regSd6zni+T0gyGpSGRnkc1XkTpjgfAh
 C46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ixCMvC4dguaDEwQ4Nsum0LZqSHq/uTPT9B1FTaYzPo=;
 b=Q4uUiC4WM5i3yjBgaWInNY1zFFbwt34alw7oARlZtmI8h0hDZNF0EqACrQ1o0RnrDu
 3XIaaEg9sUOnmi8Znhy+A6C0NTZf8oWEsbib60NHQf10XVmuj3PwUpaBJJb6x+jzuzbV
 ZMgfyI1rFNHKgROhI+wBslmYJarsS/79s0si+piBjGpzszhUeqsP/BMJ3/LQlFC1P6Tw
 2cpC8BGrQKNTQAUFSv9zAX04lvR9P0ffQsOu50DIXlOYxkQyQ/wZvTau18SPZ3eCmV2v
 CTY4lmkb3tzj3mvZXDH1GPKHq5vyfAdSIRzdsMbHhTzK3XeHAA9FD8R5EZGXr3hCVyRY
 J5lQ==
X-Gm-Message-State: AOAM532wdO/swFG2aI/Vu2uYt57suzQ+gi45YQvagDyZdji3pExmZU3N
 jsX8b5vN1/hhbrKzmQmQcuQn+iX6TNyJgQ==
X-Google-Smtp-Source: ABdhPJzLu731oqSjbqPrsMQdXvo2Xd58wsuD8+iNZvY1m9lDuwdu0kXQJVoJnYYtsvmpGfvPfii7zw==
X-Received: by 2002:adf:dd11:: with SMTP id a17mr5846063wrm.360.1609964784247; 
 Wed, 06 Jan 2021 12:26:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c4sm5006933wrw.72.2021.01.06.12.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 12:26:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B9F461FF90;
 Wed,  6 Jan 2021 20:26:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v4 4/4] cirrus: don't run full qtest on macOS
Date: Wed,  6 Jan 2021 20:26:16 +0000
Message-Id: <20210106202616.20004-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210106202616.20004-1-alex.bennee@linaro.org>
References: <20210106202616.20004-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Willian Rampazzo <willianr@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The Cirrus CI macOS build hosts have exhibited a serious performance
degradation in recent months. For example the "qom-test" qtest takes
over an hour for only the qemu-system-aarch64 binary. This is as much
20-40 times slower than other environments. The other qtests all show
similar performance degradation, as do many of the unit tests.

This does not appear related to QEMU code changes, since older git
commits which were known to fully complete in less than 1 hour on
Cirrus CI now also show similar bad performance. Either Cirrus CI
performance has degraded, or an change in its environment has exposed
a latent bug widely affecting all of QEMU. Debugging the qom-test
showed no easily identified large bottleneck - every step of the
test execution was simply slower.

macOS builds/tests run outside Cirrus CI show normal performance.

With an inability to identify any obvious problem, the only viable
way to get a reliably completing Cirrus CI macOS job is to cut out
almost all of the qtests. We choose to run the x86_64 target only,
since that has very few machine types and thus is least badly
impacted in the qom-test execution.

With this change, the macOS jobs complete in approx 35 minutes.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210106114159.981538-1-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/.cirrus.yml b/.cirrus.yml
index 62a9b57530..3907e036da 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -18,7 +18,6 @@ freebsd_12_task:
     - gmake -j$(sysctl -n hw.ncpu) check V=1
 
 macos_task:
-  timeout_in: 90m
   osx_instance:
     image: catalina-base
   install_script:
@@ -30,10 +29,13 @@ macos_task:
                    --extra-cflags='-Wno-error=deprecated-declarations'
                    || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
-    - gmake check V=1
+    - gmake check-unit V=1
+    - gmake check-block V=1
+    - gmake check-qapi-schema V=1
+    - gmake check-softfloat V=1
+    - gmake check-qtest-x86_64 V=1
 
 macos_xcode_task:
-  timeout_in: 90m
   osx_instance:
     # this is an alias for the latest Xcode
     image: catalina-xcode
@@ -45,7 +47,11 @@ macos_xcode_task:
     - ../configure --extra-cflags='-Wno-error=deprecated-declarations' --enable-modules
                    --enable-werror --cc=clang || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
-    - gmake check V=1
+    - gmake check-unit V=1
+    - gmake check-block V=1
+    - gmake check-qapi-schema V=1
+    - gmake check-softfloat V=1
+    - gmake check-qtest-x86_64 V=1
 
 windows_msys2_task:
   timeout_in: 90m
-- 
2.20.1


