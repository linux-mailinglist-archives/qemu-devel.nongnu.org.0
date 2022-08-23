Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BCC59E604
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 17:29:34 +0200 (CEST)
Received: from localhost ([::1]:51252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQVqP-0006ll-Rc
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 11:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQVn5-0001zq-9G
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:07 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQVn3-0000Rq-1R
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:06 -0400
Received: by mail-wr1-x436.google.com with SMTP id a4so17459632wrq.1
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=bGIGE2rn7mBFk5hm+CQXZmnDnq1wT3WC77zwEmHTsAo=;
 b=bZwBVtfMVBDYY/c8a59LScFeSgxR7TmFyEEChtD3vXdhg0iLwmFt6brvj9pQoLT7wA
 CfI3DLdF/LPydDg6vLU/FGSAN60hUZ7mRNBuwhhceh1D7HKjn4+yoT2yYVLYbx3SpZwm
 AcBVGIvozL1xFNRc1h/a39RhG+M8Biv4EdBcsqjB+DY3ZhrkX3XYMCHg4QidED6Wrfg2
 fanHIi81KSCNNxnwjkf+/lj70XW8bOP8NaJ4UB/6M27Rms22K+iwKRlGu2r42RZQ4iz2
 E/XMUoAHnh2YEH8lCltKF5KuO6Ow49dfj8+qaHwuF8ZK3RRqmc/LukCLsaJJ397ieX5P
 8n1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=bGIGE2rn7mBFk5hm+CQXZmnDnq1wT3WC77zwEmHTsAo=;
 b=mvpMcXpqJtbi7Jwu3kYutRaAknOvXlqVEm7UkoABkPw10zDigzyo0NZCcr2M3AUXp+
 U4a1LdUjAkPAXs1Vcn++9AWuREeoVrssIMCHSRTvvSr7aDuUFewNku23FCijVK6mNZkZ
 UBA5LAP5UKexwUIGqgy9iIVtL++z7LLWsvAMRAMbwvjz/Ep8TpaLzyp0nzgT4lkeZ+SR
 dtiAeM6cAJheExqje1Nbder57/Lf4fKOCE3YwIlgBIJMop8xYqOGEOL1k1QatLWcZpZk
 /kE3gEMs/k5fjPVeru8k8tsXbF4QPkZHSKZa5TYEJEK2qznyH/b9Fc59lTlW534iF6hO
 qE+g==
X-Gm-Message-State: ACgBeo0UlThp4zWIklb3cgwHiPuXoh3VFIitl2kars9R/adLk90e1qK2
 mPyGKNQJYO3T7u9io6fvy2azSA==
X-Google-Smtp-Source: AA6agR4N99ZGQBNTuIa1KB+8yacxjjSlzshB25J9e4bo7Az0UBrN/2RjM6F58TzTY46bjWqD1Ne87Q==
X-Received: by 2002:a05:6000:1c0d:b0:225:6c66:5ed3 with SMTP id
 ba13-20020a0560001c0d00b002256c665ed3mr1042704wrb.678.1661268359836; 
 Tue, 23 Aug 2022 08:25:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m9-20020adfe0c9000000b00225206dd595sm14276213wri.86.2022.08.23.08.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 08:25:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7EF8A1FFB7;
 Tue, 23 Aug 2022 16:25:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL for 7.1 0/6] testing and doc updates
Date: Tue, 23 Aug 2022 16:25:52 +0100
Message-Id: <20220823152558.301624-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
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

The following changes since commit ba58ccbef60338d0b7334c714589a6423a3e7f91:

  Merge tag 'for-7.1-hppa' of https://github.com/hdeller/qemu-hppa into staging (2022-08-19 09:35:29 -0700)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-for-7.1-fixes-230822-1

for you to fetch changes up to 876ed1c1d373a9eb41352165aae3806215e30b1a:

  qemu-options: try and clarify preferred block semantics (2022-08-23 16:21:43 +0100)

----------------------------------------------------------------
Testing and doc updates:

  - default timeout for all QemuBaseTests is 120s
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


