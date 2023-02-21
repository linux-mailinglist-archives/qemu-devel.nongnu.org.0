Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC79B69EB3B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 00:27:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUc0z-0005BI-ND; Tue, 21 Feb 2023 18:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc0m-00055Q-VK
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:25:29 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc0j-0002Y9-DG
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:25:28 -0500
Received: by mail-wm1-x330.google.com with SMTP id o14so4744218wms.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 15:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qKPE/6RO6kHdXJA591r4Zk4XEwUo19ExEpoqZcRPbRM=;
 b=IMRzhvRC5AWE77mw6m/Mrc22EKHnzcKd9ZmwYOJ+J2NqPm40OHEavbiQQxTzAmgIzf
 twPSXuEauyA7aiCcA8aeHCoMW+CTFVOgigouPsEDg9Yk1jt2VckR6seMQbOLyxOMf/bC
 tOzQwonIt+0b/19lfG9K1OhBvWbX17r/AkNXSij0wmkjlNlvW7gkFA7wI1CVeRCOo1F8
 32NUxvr5yjwed8e0TuO54m5kqlMmKgUFBt1+KmcNh/H1SIv0Blzn/hDeQop3aBu7N4MW
 CiwjBU2VdwvSLkw4imKarwSJgz8WNH/6dMz9+K8cvDu0TCQdF2yhgt78/wxxj6kCyhzi
 TYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qKPE/6RO6kHdXJA591r4Zk4XEwUo19ExEpoqZcRPbRM=;
 b=zvYhAHzQ7Qv7SU6vxRkpCFh0aIuxNjs0j1IJ20rPKzRY3ArLcmHJmjXr0mD2kje+d1
 9Xb1pcxtOtLgo3VQpSHaHED40ZZ46tDk2d5QHCctt9e3EtZH/9iN5yP3nuab9KYjWonN
 XmmA2UtzA+EzGcbrLBc2wgG7U9S+R+ahCBL4wTWrAgo2+T4lAZYYhvn/ILXfNnKDQYzu
 tG00DmKwR8z+OirjM5Z5Yi05sMN1s4pkW1u2xhSnmb3qCu9whotPAYNfOQ1jn5tw1kzW
 3kzzWQheE6gphvKejh5QWiL9a4rFcO2xaNAs0IVwU4K7a5NUaP7ffDHfr67NwcL6imjX
 lvIQ==
X-Gm-Message-State: AO0yUKVIfHU4v4e/PJI6GpUM310mD+Bjnn274wdVsFdGK9JRvi3HDiqy
 dVz2XaZbjDkJCGh6eG1lKMf86YdZpK7zmIMf
X-Google-Smtp-Source: AK7set+ZXSjvrtnDW/6JZKd6P2+UajX6M620vRcIK42gG5NgdBE3f7mVSN8ofPgpPif/EUKU/3j/Sg==
X-Received: by 2002:a05:600c:2e84:b0:3dc:59e9:9285 with SMTP id
 p4-20020a05600c2e8400b003dc59e99285mr5215909wmn.18.1677021923451; 
 Tue, 21 Feb 2023 15:25:23 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a05600c475200b003e220998b6bsm7180051wmo.17.2023.02.21.15.25.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Feb 2023 15:25:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] bulk: Replace assert(0) -> g_assert_not_reached()
Date: Wed, 22 Feb 2023 00:25:15 +0100
Message-Id: <20230221232520.14480-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Save contributors to post a patch each time clang
produce a -Werror=maybe-uninitialized warning on
assert(0). Replace by g_assert_not_reached()() and
prohibit '[g_]assert(0)'. Remove NDEBUG.

Philippe Mathieu-Daudé (4):
  scripts/checkpatch.pl: Do not allow assert(0)
  bulk: Replace [g_]assert(0) -> g_assert_not_reached()
  block/vvfat: Remove pointless check of NDEBUG
  hw: Remove mentions of NDEBUG

Pierrick Bouvier (1):
  target/ppc: fix warning with clang-15

 block/vvfat.c                       |   3 -
 docs/spin/aio_notify_accept.promela |   6 +-
 docs/spin/aio_notify_bug.promela    |   6 +-
 hw/acpi/aml-build.c                 |   3 +-
 hw/arm/highbank.c                   |   2 +-
 hw/char/avr_usart.c                 |   2 +-
 hw/core/numa.c                      |   2 +-
 hw/net/i82596.c                     |   2 +-
 hw/scsi/mptsas.c                    |   2 -
 hw/virtio/virtio.c                  |   2 -
 hw/watchdog/watchdog.c              |   2 +-
 migration/migration-hmp-cmds.c      |   2 +-
 migration/postcopy-ram.c            |  21 ++----
 migration/ram.c                     |   8 +--
 qobject/qlit.c                      |   2 +-
 qobject/qnum.c                      |  12 ++--
 scripts/checkpatch.pl               |   3 +
 softmmu/rtc.c                       |   2 +-
 target/mips/sysemu/physaddr.c       |   3 +-
 target/mips/tcg/msa_helper.c        | 104 ++++++++++++++--------------
 target/ppc/dfp_helper.c             |  12 ++--
 target/ppc/mmu_helper.c             |   2 +-
 tests/qtest/ipmi-bt-test.c          |   2 +-
 tests/qtest/ipmi-kcs-test.c         |   4 +-
 tests/qtest/rtl8139-test.c          |   2 +-
 25 files changed, 96 insertions(+), 115 deletions(-)

-- 
2.38.1


