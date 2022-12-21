Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6232653519
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:27:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82nF-0006R4-3Z; Wed, 21 Dec 2022 12:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p82mp-0006O8-Ac; Wed, 21 Dec 2022 12:21:47 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p82mn-0004GV-GX; Wed, 21 Dec 2022 12:21:46 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1443a16b71cso19858552fac.13; 
 Wed, 21 Dec 2022 09:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EeEIt188mjxs+Us4AwiKoIDg8eMEG4p/T1p//yzMezo=;
 b=cc1/iARLCWN6gtSRC1xl3McW1JnkbmZl1DIrz4LBTVx1/dJN4P1cpnE+/gPSjSLFsz
 9lZ+peDCW4BTYTVH51f7uSO8tqSeJNLK7/mr/nGx5dPPjwyUpzYPxdKhuVZU+cnTw/dt
 CnikqRNzIu1w9d+bcQg0wQzrgI6mpsDBoBOjUpEsIQGMwsZXKPmalm6KzS0CJ3hix5AV
 y6Vtb4PeYfdFt/sqBMp/AUXq6dK+O5f60xccZvhn4e25Q9chKnNkkAXV1sezpzUh8C9S
 G+vZODsXNSomoyTg+ueAAMTBvojtw9gQfIXQclsCdrDZ2zBn1FAXoha6ZMo3Bu235Io+
 ulbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EeEIt188mjxs+Us4AwiKoIDg8eMEG4p/T1p//yzMezo=;
 b=q08pdsEmI4mzngsBppXs2ufMnLMP742p/1+OoTm+JBp8FxPlXfV/qhk06se10bGSgS
 8DQsDO0O08F8vMPLe/5WokmpBgK+yQp1VOgr7UrxQjhowM4C4vqaAwr6uwqtXdfGIPOg
 MXDwDNupOozyZLGjCNyudBxlX/ss6LDMFtlYZ4Sf1kLK3kTeQi/fTkF2nZUENwOLAA45
 VHV2JSb81mtxYOyOOS1QA3HJuk1pdUZvXkdLVMGq2l5nMwMNsTrpjufDvgndr37PQFwR
 keNIw6AtUYgD++ozxNV0yd5yLEMyLCacq1mooZ6u/jpbBLHPrf2Z30zkHCTpJx4g2GCD
 PPTQ==
X-Gm-Message-State: AFqh2kooWDBq/hFS5K0SBHk5VHSRcM7hHUfH5z8v10CdlvEgQpVr3TUn
 0L0Wqs4QhLSPpCdqIZZF+tExfXKIVKk=
X-Google-Smtp-Source: AMrXdXvovQCEQwDIS8K2sqofeY0SRGMxr4UqPXci5UL5ZvLdn1vlKd4w8lwyv14y7++G9GfqOf5TJw==
X-Received: by 2002:a05:6870:ac89:b0:148:5c5:2296 with SMTP id
 ns9-20020a056870ac8900b0014805c52296mr1096069oab.58.1671643303049; 
 Wed, 21 Dec 2022 09:21:43 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 cm35-20020a056870b62300b001375188dae9sm7604640oab.16.2022.12.21.09.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:21:42 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	danielhb413@gmail.com,
	peter.maydell@linaro.org
Subject: [PULL v2 00/14] ppc queue
Date: Wed, 21 Dec 2022 14:21:23 -0300
Message-Id: <20221221172123.297248-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

v2: removed patch that was breaking clang tests. Thanks,

Daniel

------

The following changes since commit 700ce3b1bb52da4acbbf1ad8f6256baaf52c7953:

  Merge tag 'pull-tcg-20221220' of https://gitlab.com/rth7680/qemu into staging (2022-12-21 14:15:18 +0000)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20221221

for you to fetch changes up to 4091fabfeb54f02762bdecba7344353c56533873:

  target/ppc: Check DEXCR on hash{st, chk} instructions (2022-12-21 14:17:55 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-12-21:

This queue contains a MAINTAINERS update, the implementation of the Freescale eSDHC,
the introduction of the DEXCR/HDEXCR instructions and other assorted fixes (most of
them for the e500 board).

----------------------------------------------------------------
Bernhard Beschow (6):
      target/ppc/mmu_common: Log which effective address had no TLB entry found
      target/ppc/mmu_common: Fix table layout of "info tlb" HMP command
      hw/ppc/virtex_ml507: Prefer local over global variable
      hw/ppc/e500: Prefer local variable over qdev_get_machine()
      hw/ppc/e500: Resolve variable shadowing
      hw/ppc/e500: Move comment to more appropriate place

Daniel Henrique Barboza (1):
      MAINTAINERS: downgrade PPC KVM/TCG CPUs and pSeries to 'Odd Fixes'

Nicholas Miehlbradt (2):
      target/ppc: Implement the DEXCR and HDEXCR
      target/ppc: Check DEXCR on hash{st, chk} instructions

Philippe Mathieu-Daudé (5):
      hw/sd/sdhci: Support big endian SD host controller interfaces
      hw/ppc/e500: Add Freescale eSDHC to e500plat
      target/ppc/kvm: Add missing "cpu.h" and "exec/hwaddr.h"
      hw/ppc/vof: Do not include the full "cpu.h"
      hw/ppc/spapr: Reduce "vof.h" inclusion

 MAINTAINERS                 |  6 ++---
 docs/system/ppc/ppce500.rst | 13 ++++++++++
 hw/ppc/Kconfig              |  2 ++
 hw/ppc/e500.c               | 59 +++++++++++++++++++++++++++++++++++++++------
 hw/ppc/e500.h               |  1 +
 hw/ppc/e500plat.c           |  1 +
 hw/ppc/spapr.c              |  1 +
 hw/ppc/virtex_ml507.c       |  2 +-
 hw/sd/sdhci-internal.h      |  1 +
 hw/sd/sdhci.c               | 32 +++++++++++++++++++++---
 include/hw/ppc/spapr.h      |  3 ++-
 include/hw/ppc/vof.h        |  2 +-
 include/hw/sd/sdhci.h       |  1 +
 target/ppc/cpu.h            | 19 +++++++++++++++
 target/ppc/cpu_init.c       | 25 +++++++++++++++++++
 target/ppc/excp_helper.c    | 58 ++++++++++++++++++++++++++++++++------------
 target/ppc/kvm_ppc.h        |  3 +++
 target/ppc/mmu_common.c     |  5 ++--
 target/ppc/spr_common.h     |  1 +
 target/ppc/translate.c      | 19 +++++++++++++++
 20 files changed, 220 insertions(+), 34 deletions(-)

