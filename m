Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672A667353E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:15:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRoM-0003uZ-Gx; Thu, 19 Jan 2023 05:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRnk-0003jN-JS
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:05:49 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRni-0005Db-0T
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:05:43 -0500
Received: by mail-wr1-x432.google.com with SMTP id r9so1322047wrw.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uN3qFnmoj1WnTfMm88xTldxtTtQOWE+7gMCV82qBTQU=;
 b=N+wHtGZjO6Ax/xK9rwfKDzzj/ZGf3tZK1d1WO7pGB0zcYMue+jrnEkQVRPEfXSWL6+
 bzFGC4ZORT0hfN1c1c0EahlZ6iyihKnD6RP429JMNVQ4aXdpWd2VUlWRD/AjznE/C4kU
 qnkxBhSp8CAnhSGPxILrF/6Eq1SVb18cxdvJzc1BoXEF5XJJDaMYq4UStwuNp07NIZ3r
 8x8/gqh/cBTpaZ8T+mFH+HzM0VK4mcZtRT0j2L3LWpKrHZQK7NQDbi8UylzRgG3f0FZY
 gOTHdxBoYJ2lRINgdzcjF84rfxeCqbQjv/hB1pHaDhKEs9HOwwXc7eiuKg1uI3Dcexvb
 dNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uN3qFnmoj1WnTfMm88xTldxtTtQOWE+7gMCV82qBTQU=;
 b=5ZJXN6PH5ChFI4ypL3XVR/lo5GN1k8fx6CzRO77BtpWQrcwkrLSm32UW1NIPc6a1Rv
 OjG60vTWHPY+8QOTvWGMMETF++9ShrHfkaLfa3T26CzC5bTCdZKSR+LakxCR1320u5/H
 ZLzi6/r4j38Lora/PbZEaRh3Oh7/WZu2145pbfaZupW4NDADXfHhnsEZlw3iQMOJbop4
 JBh+3qfaQIJtQVIMeVjotMRvT/vXfgUhe4oagzs2l9tp8DRThp1sjeOWpYBAhoRiUvEd
 lhBjRUvzGs76lQ0TkxCf4QTjE4RE5Cw4h11X7AUAu63+lYL7t8TLFRR0v5q07JjwhID4
 AZpg==
X-Gm-Message-State: AFqh2koLuLgmev6Dv1t2fXd7VhxhLLfVBj6enK+qJPFlc+zB2OY1UOmA
 bpite4z9TAnbM7PdTv7PD7jTssnr1k0wyQSE
X-Google-Smtp-Source: AMrXdXst/nWnNNc5bx/oURgRf0X4ZVjyhRE+Wh7RuXVqJcavisUT84wPP/AlorP1EXOOVNX46o07hQ==
X-Received: by 2002:a5d:5b0e:0:b0:250:22e4:b89e with SMTP id
 bx14-20020a5d5b0e000000b0025022e4b89emr10058002wrb.65.1674122739450; 
 Thu, 19 Jan 2023 02:05:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a056000024500b00267bcb1bbe5sm34317063wrz.56.2023.01.19.02.05.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 02:05:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/8] tests/qtest: Allow running boot-serial / migration with
 TCG disabled
Date: Thu, 19 Jan 2023 11:05:29 +0100
Message-Id: <20230119100537.5114-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
TCG / KVM, then HVF.

Pending: How to test for (poisoned) HVF with qtest?

Philippe Mathieu-Daudé (8):
  tests/qtest/boot-serial-test: Constify tests[] array
  tests/qtest/boot-serial-test: Build command line using GString API
  tests/qtest/boot-serial-test: Only use available accelerators
  tests/qtest/migration-test: Build command line using GString API
  tests/qtest/migration-test: Only use available accelerators
  tests/qtest/libqtest: Allow checking for HVF accelerator
  tests/qtest/boot-serial-test: Allow running with HVF
  tests/qtest/migration-test: Allow running with HVF

 tests/qtest/boot-serial-test.c |  42 ++++++++++----
 tests/qtest/libqtest.c         |   2 +
 tests/qtest/migration-test.c   | 101 +++++++++++++++++++--------------
 3 files changed, 91 insertions(+), 54 deletions(-)

-- 
2.38.1


