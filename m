Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE8E59F649
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:33:53 +0200 (CEST)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmlk-0003bg-EW
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQmXm-0002Yp-Gh
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:19:31 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQmXk-0006Xc-PV
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:19:26 -0400
Received: by mail-ej1-x635.google.com with SMTP id d21so12974093eje.3
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=WDG7z/UQXKWw+tdZ66PV06fv37Sx/KkKYubN2MmuahY=;
 b=ISYv5dY73eV0K2wLo6AAGC8rZ259SIWehtUZ5CcKeNDjaFUtbh64/JR5ZYybJ0ZeUV
 IdNem+FX7B7I6SXHVc4jZSmNuIdpi7ufa1TfhHtlszE4G5Y50eVVu3mROQKgieTq5MMR
 mwKWzaiwnUZlpkcnoXC7xOrwZAaSjkvgB1YOURCCsZfrP80YA+6f3Gze7dj77WeD7E7p
 Zb34VNx2sB28u7SyG9VUi/wTjjrNRIUqcDRJKr8tuK8RWQ3YdbxX9n4yMuVtneFHU2gU
 UO8HEsZjhztV/uxHOaNzhgAWrXsVQdZRyZMSg3cuIIKC+A4g79pgBJENdjLg9BuD032/
 2Bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=WDG7z/UQXKWw+tdZ66PV06fv37Sx/KkKYubN2MmuahY=;
 b=HehAnV49c5LS7lwfYC7tEGTfgsnlABn7WCS2A95wnHQ5eMyM7N4tVqK+e65fJpHfaK
 WrDjCd6hjBRTDvWQTlD4B0aBnDCabPH34hbUpzweB6DoPwDMQ2jU2O2nrIrwDKWPvx6v
 of0ZnJWj3eUE32modHY/34uynYcWAjb6xQi14H7ml4r85UCf7isX74g/QKormX/VjH8c
 LkmAnoM+f1zEh+7I0wHyJ5ntVY1CNr9rh4jI7cYQL0VyAkehGCtI9Z752XTIOrJVGpAM
 N0ftzDOlca8aKZcCU852tBrVMJ/eGAspbu+/tZFcKxPGO9c1+6p8JcW/YgRf7K36fI05
 BVug==
X-Gm-Message-State: ACgBeo29bwqy+5gjkShutkd2/IlmE/idGkaUtP+cwO6iZxdQmdAPGElI
 1yRzuhQWrRg0ybCGZCtbmjovDQ==
X-Google-Smtp-Source: AA6agR65j1zVtJEovp/MA1nzwngRV8mwlomrmjhH1smTifmWK3vOhh+M/jCiORgXxE55WRXpIr3Ehw==
X-Received: by 2002:a17:906:a0d3:b0:73d:be5b:2b52 with SMTP id
 bh19-20020a170906a0d300b0073dbe5b2b52mr903799ejb.727.1661332762295; 
 Wed, 24 Aug 2022 02:19:22 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d7-20020aa7d687000000b0044786c2c5c1sm547290edr.3.2022.08.24.02.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:19:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E78FC1FFB7;
 Wed, 24 Aug 2022 10:19:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 for 7.1 0/6] testing and doc updates
Date: Wed, 24 Aug 2022 10:19:20 +0100
Message-Id: <20220824091920.1248422-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a8cc5842b5cb863e46a2d009151c6ccbdecadaba:

  Merge tag 'for-upstream' of git://repo.or.cz/qemu/kevin into staging (2022-08-23 10:37:21 -0700)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-for-7.1-fixes-240822-3

for you to fetch changes up to 5af2b0f6eace7b368ed5cad9677e3bc995b6a7e3:

  qemu-options: try and clarify preferred block semantics (2022-08-24 10:14:49 +0100)

----------------------------------------------------------------
Testing and doc updates:

  - move default timeout to QemuBaseTests
  - optimise migration tests to run faster
  - removed duplicate migration test
  - add some clarifying language to block options in manual

----------------------------------------------------------------
Alex Bennée (2):
      tests/avocado: push default timeout to QemuBaseTest
      qemu-options: try and clarify preferred block semantics

Thomas Huth (4):
      tests/qtest/migration-test: Only wait for serial output where migration succeeds
      tests/migration/aarch64: Speed up the aarch64 migration test
      tests/migration/i386: Speed up the i386 migration test (when using TCG)
      tests/qtest/migration-test: Remove duplicated test_postcopy from the test plan

 tests/migration/aarch64/a-b-kernel.h   | 10 +++++-----
 tests/migration/i386/a-b-bootblock.h   | 12 ++++++------
 tests/qtest/migration-test.c           |  5 +++--
 qemu-options.hx                        | 13 +++++++++++++
 tests/avocado/avocado_qemu/__init__.py |  5 ++++-
 tests/migration/aarch64/a-b-kernel.S   |  3 +--
 tests/migration/i386/a-b-bootblock.S   |  1 +
 7 files changed, 33 insertions(+), 16 deletions(-)

-- 
2.30.2


