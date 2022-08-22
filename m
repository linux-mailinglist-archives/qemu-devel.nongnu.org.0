Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087CD59C63C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:29:20 +0200 (CEST)
Received: from localhost ([::1]:42650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQCAp-00048o-1Q
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQAik-0008GL-1d
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:56:14 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQAii-0005zf-8g
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:56:13 -0400
Received: by mail-ej1-x62a.google.com with SMTP id gt3so10026862ejb.12
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 09:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=olZjtV3u/LBeU7LjViqCv/A3Xt87pdczg2xQwsU+XTE=;
 b=XFnf8wIsw4ICYRW+oP+wCNwIEiHPnxmUkEVD4zpYXYSH9KgkKv5ZB+AfEwkE8G40Fz
 sqT8qX0fUzY9iG8J0u2SauCixeQXYBCSFef9VqHrA4LrgbMsPq1D34qL7Is/UchO9hBN
 nu+BCZDpO6YeJMpfLe4xxWL1NvFuuF8LNYh1BtwauEAj2EcPAH5sPbWZBNjckyGFEbRx
 xgqKORgC6r8JILbR4C98SpjYqOJYETNbSf8/zHqgRdQMuqcix2b0gy921Wu2NRQeXh5y
 KDywU8as/IESddnjGqsvdWd0bHBj9MhN1mrrTWia9iyknmSzxV6sKtPz0d093i7uV4No
 ezCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=olZjtV3u/LBeU7LjViqCv/A3Xt87pdczg2xQwsU+XTE=;
 b=oIYmEhbGUqloxgNyyNs4oSnwvBqKJ0M16aeu4ej++pKT0APyrKOQyrCQ1OX26t9AVq
 uWKDXKVNVM12b7gfxH8VW/sZDvQTyd9nTqy5FgEu/WNzxv0x1kvHRqNURVVuyirP3XV8
 IXsdeMqyNq9fmd0+n5ocOZZ1AzpHgb1IizcyVY7y1DDOWB2txwm6O9qEVhOacyMK0lc0
 QtPMVewCbEI0aRl46+v8IuSPyoMw0r7ILQsfVbOj/PB9bb6ZcqKnA+iy6ayoHcg774YX
 DeKlZ0haz0Jrn9rC70jLGU+g/rla1Q1l1v1ZrbHSADMED2GQYPuziY1sGPweQJhP9o/d
 Xkvg==
X-Gm-Message-State: ACgBeo2KB4fpYBxZeOyQubY7tjhrHtb4so6jEqpbdhvY3cg7HUIjoDG0
 idBPDEM7+DPvO1V7ddx9ML4a2kZDKyBETQ==
X-Google-Smtp-Source: AA6agR7/GX2Umfv6TC39fpu3qzgkoMQI10iUZ4kvxls9d9Xft3m1wOT6XkyV8+D1q91Uz38dD8UjkQ==
X-Received: by 2002:a17:906:4fd0:b0:73d:8301:e25 with SMTP id
 i16-20020a1709064fd000b0073d83010e25mr3543257ejw.157.1661187370796; 
 Mon, 22 Aug 2022 09:56:10 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a170906b20700b0073d706ac66csm2827045ejz.46.2022.08.22.09.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 09:56:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E9DE61FFB7;
 Mon, 22 Aug 2022 17:56:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 7.1 v1 0/6] testing fixes and doc tweak pre-PR
Date: Mon, 22 Aug 2022 17:56:02 +0100
Message-Id: <20220822165608.2980552-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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

Hi,

This is a small subset of testing fixes to improve the stability of
the CI. The first ensure all jobs have a timeout (default 120s) and
then we have Thomas'  excellent work to speed up the migration test
which was the source of a number of gitlab timeouts. Finally a little
bit of extra manual text to point users in the right direction when
defining block devices.

Only one patch needs review before the PR:

 - tests/avocado: push default timeout to QemuBaseTest
   
Alex Bennée (2):
  tests/avocado: push default timeout to QemuBaseTest
  qemu-options: try and clarify preferred block semantics

Thomas Huth (4):
  tests/qtest/migration-test: Only wait for serial output where
    migration succeeds
  tests/migration/aarch64: Speed up the aarch64 migration test
  tests/migration/i386: Speed up the i386 migration test (when using
    TCG)
  tests/qtest/migration-test: Remove duplicated test_postcopy from the
    test plan

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


