Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F187674F5E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:25:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImgi-0004b3-7N; Fri, 20 Jan 2023 03:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImge-0004aG-53
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:23:49 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgc-0004YJ-2G
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:23:47 -0500
Received: by mail-wr1-x433.google.com with SMTP id h16so4104594wrz.12
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gq3KZjZqmhmt+ZIW81YYHELjkhaTdKj6nDlr4LtJu4o=;
 b=dkpd+UuIv826VvBxL1EgDvP83gMgAsmAP82j1K/rnbhKODBKNSufd3hFvnZ2k6ucLY
 J25yCxtHVxjsdmcGc0x78MN61GGhA2S1ZZKW+l34uaqH6Huz1N+nsM5171rkTgBBw3bO
 Z6u1q1lqoTwMgcXbXng/+NTnBAc6u6E8l1dN6SRO3XyK7Q3Hvrj8PlYOEOpIWLWC8Nmx
 b8l4NCBhqM3ZLCKdBIOXn7m8PY5SryMOBMl8CxJYR6OxJGS2VK3AoCJaqXiiSgXcU/sh
 znoSx4gBh8LUdLZlsAIObi+Qc1cfesTuIk2nhtLtu8UUumsdlKSbbNj/czkJ7zO44CgU
 /vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gq3KZjZqmhmt+ZIW81YYHELjkhaTdKj6nDlr4LtJu4o=;
 b=uATdzFbY72ZJijyCHnQ7jC2sOJVdHhMTdhcF8rgZ6v8YJ+OfMlSEkVmuNtKxrN1In5
 HuRvI9isxSnQLoxmlx8FFkM4CP83FIFr0wDVpr57B9hEtg3RoHXLwzRYwKEhtJkqCf+M
 FyfbZOy6o8KhYCdzoBvcq9dF0vir97+F4PACTCmoQ505Z7crG4Nplzo4JQh9snAqqQ1q
 lkYEpKwlwL05+Z1fKv6jtkKIGGJ63Rani3AvXrVx43W9iFy16crVFXeO5VvfoCbY8x6T
 CEJfz8imfxPAAhg7t2/fwdh80AbJ9q8N3jhkCLLtwdoM8X4BsnVMRNz5nDQfMedQ3FeZ
 OA9Q==
X-Gm-Message-State: AFqh2kqIw75iWQO4nVs9HljKUWYYhO2L9w1/44Yni9rkL/D8zZM+N02I
 zbo7D1rCbzyqtv4lgL4r9zzKwPI1YPupHTUw
X-Google-Smtp-Source: AMrXdXt0esvGBl+ZqZKv/IFIJQ7TFNja8nxeycQmXrSsakrTF1YXa58YBWPSW8fXcGWWtRAOjMii/g==
X-Received: by 2002:a5d:6988:0:b0:2bd:f18d:e909 with SMTP id
 g8-20020a5d6988000000b002bdf18de909mr11480342wru.1.1674203023407; 
 Fri, 20 Jan 2023 00:23:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n6-20020adfe786000000b002bdbde1d3absm25418384wrm.78.2023.01.20.00.23.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:23:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 00/11] tests/qtest: Allow running boot-serial / migration
 with TCG disabled
Date: Fri, 20 Jan 2023 09:23:30 +0100
Message-Id: <20230120082341.59913-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Missing review: #7

Two test were failing on Darwin when testing Fabiano's series
which allows building ARM targets without TCG accelerator:
https://lore.kernel.org/qemu-devel/20230118193518.26433-1-farosas@suse.de/

These patches allow boot-serial / migration tests to run without
TCG / KVM.

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
 tests/qtest/migration-test.c   | 96 ++++++++++++++++++----------------
 2 files changed, 80 insertions(+), 62 deletions(-)

-- 
2.38.1


