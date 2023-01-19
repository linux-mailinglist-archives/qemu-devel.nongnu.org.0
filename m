Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9694D673CE6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 15:59:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWNK-0005tz-0K; Thu, 19 Jan 2023 09:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNH-0005ng-Fx
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:58:43 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNF-0003Wh-OM
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:58:43 -0500
Received: by mail-wr1-x429.google.com with SMTP id q10so2151021wrs.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+4Tl4K3CGqyg++a/7QHqSqqgZ2XVBo5YG4lCRSctXYI=;
 b=v7jYh/dJLX3c7OWmnPoyHSPvpP9Th1BF5BzoOjbbIiJ+5wHEO53Nhbslg5GtlrgG9y
 qT1slXIrvTl2Ogbh6GG1xPLLoaNRe3lAp+XtkCiyeoJp1H0IjuyKPyuReA9kYcGbKx5o
 VgU/LvOFxyxRr3m24s6y1/iL75TEnc3KAhexaD0Myl8ufte4SJ5GRRDhvAZhQSXb4aDo
 z6WQQIf1JPuD1LZxCK4DVVELbwTwE3OClM6hV3EV5SCJMSKnZ2TkfIqNKyF7u1d2zqLA
 Ae6kHmvsepfzOXJUu06gm8jiAiNQR+kTBHYj6ZhXrhkhtqwCX7NSehNyWtBO1Ng8ZTfT
 3coA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+4Tl4K3CGqyg++a/7QHqSqqgZ2XVBo5YG4lCRSctXYI=;
 b=UOFuigzuapuTyTaBpxxxq/QjcDoP531DcbhmbIcxZOTkdao9fqGuyM0732Z1uOFg+a
 CkTEEKQjYozxsb5X7M4rvNY3t1CpRkJRnIefnzBkimJxdp1ZK0wMFhCvW+L4UCjvoGX3
 Do0OBq6lTkp+W4mMb7oz5HV9N8fdF2nrfYwyOxWN6LSF7+22W8jc7Kry2CQGRQK1LPEp
 Apkv7pUovjMNTWQi5XSJkNTbpijX82lQXdc3Gpy3paGv8y47AUA+ob7Lvtw2tT6cJCfg
 anqklTBzm4nXjJazCnUA3dI7FSptKHdqH5kzw2CrrW1mY8uPJBAVqv9iijTy+KfhtzgY
 RuxQ==
X-Gm-Message-State: AFqh2kp+9++V1BmHfWm7tK+QB831Gjel4vDfdS/YHV8l3qWKZJ4A7Wjb
 NGGrBTptrjuseEEJkHhaL+QgmZFmFvRYfX6E
X-Google-Smtp-Source: AMrXdXvSOhD9P/qkW6l/XiqKM2bVa5+O+/OHHW+SllHJhhPPwM9rhlqG1ZxKhQsJrEHZJbRPRFBX1w==
X-Received: by 2002:a05:6000:a03:b0:2bd:e7b4:aee3 with SMTP id
 co3-20020a0560000a0300b002bde7b4aee3mr11111603wrb.66.1674140320236; 
 Thu, 19 Jan 2023 06:58:40 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adff00e000000b0024cb961b6aesm33198829wro.104.2023.01.19.06.58.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:58:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/11] tests/qtest: Allow running boot-serial / migration
 with TCG disabled
Date: Thu, 19 Jan 2023 15:58:27 +0100
Message-Id: <20230119145838.41835-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Two test were failing on Darwin when testing Fabiano's series
which allows building ARM targets without TCG accelerator:
https://lore.kernel.org/qemu-devel/20230118193518.26433-1-farosas@suse.de/

These patches allow boot-serial / migration tests to run without
TCG / KVM.

Since v1:
- Split GString API conversion in multiple trivial patches (David)
- Use KVM first in migration test (David)
- Dropped HVF changes for now.

Philippe Mathieu-Daudé (11):
  tests/qtest/boot-serial-test: Constify tests[] array
  tests/qtest/boot-serial-test: Simplify test_machine() a bit
  tests/qtest/boot-serial-test: Build command line using GString API
  tests/qtest/boot-serial-test: Only use available accelerators
  tests/qtest/migration-test: Inverse #ifdef'ry ladders
  tests/qtest/migration-test: Reduce 'cmd_source' string scope
  tests/qtest/migration-test: Build command line using GString API (1/4)
  tests/qtest/migration-test: Build command line using GString API (2/4)
  tests/qtest/migration-test: Build command line using GString API (3/4)
  tests/qtest/migration-test: Build command line using GString API (4/4)
  tests/qtest/migration-test: Only use available accelerators

 tests/qtest/boot-serial-test.c | 46 +++++++++-------
 tests/qtest/migration-test.c   | 95 ++++++++++++++++++----------------
 2 files changed, 79 insertions(+), 62 deletions(-)

-- 
2.38.1


