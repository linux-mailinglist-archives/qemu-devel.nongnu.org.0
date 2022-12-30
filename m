Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52757659988
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 15:59:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBGpW-000054-A4; Fri, 30 Dec 2022 09:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1pBGpU-0008W7-Dn; Fri, 30 Dec 2022 09:57:52 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1pBGpS-0000V1-Gf; Fri, 30 Dec 2022 09:57:51 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2E9D7B81C95;
 Fri, 30 Dec 2022 14:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC6AC433EF;
 Fri, 30 Dec 2022 14:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672412259;
 bh=Laep0/9pb7GyjxRQNEjRJl/qxsFB0/AeNLVKIZig9W0=;
 h=From:To:Cc:Subject:Date:From;
 b=RnSbsfV0gW+qcllPC3JiCfrWuDRUQi5fmEcQw4m0jTZ1dz9R8sjZwg3LiQLmOIpwC
 10UZycbpj+Jbmz27AIN+YDST6tU+euXg7YowSA5r9tdaNrZXDPy8JZrsPIu3JOlGta
 AOoxIzm6AhNViM7oohrXkKd5qzcqsl84/7h7agHdWJXn/1GGIAi4kU1fC2tMOH4G7P
 QTEYfm8eIblUor+RunM1uxuJ6qccy9hM2qNp0R/oR6xpVzxLe9rlDuBzG3NpDVBjQU
 WwEjwQj0xa1W4P8WhGQQq3jo4xUtgtkMKnh3d34r3JFIwmYjwkmfEwKAzs9iXNuPvL
 jwRvkbOZ8WHZQ==
From: Felipe Balbi <balbi@kernel.org>
To: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Felipe Balbi <balbi@kernel.org>
Subject: [PATCH v2 0/2] hw/arm: Add support for STM32 H405 and fix STM32F405
 memory layout
Date: Fri, 30 Dec 2022 16:57:31 +0200
Message-Id: <20221230145733.200496-1-balbi@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=balbi@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

Hi,

The following patches pass checkpatch.pl and have been tested against
55745005e90a.

Felipe Balbi (2):
  hw/arm/stm32f405: correctly describe the memory layout
  hw/arm: Add Olimex H405

 MAINTAINERS                             |  6 +++
 configs/devices/arm-softmmu/default.mak |  1 +
 docs/system/arm/stm32.rst               |  1 +
 hw/arm/Kconfig                          |  4 ++
 hw/arm/meson.build                      |  1 +
 hw/arm/olimex-stm32-h405.c              | 69 +++++++++++++++++++++++++
 hw/arm/stm32f405_soc.c                  |  8 +++
 include/hw/arm/stm32f405_soc.h          |  5 +-
 8 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/olimex-stm32-h405.c

-- 
2.39.0


