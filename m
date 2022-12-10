Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A75648F8C
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 16:56:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p42CI-0003Pu-El; Sat, 10 Dec 2022 10:55:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42C1-0003I4-14
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:15 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42By-0004D3-CD
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:12 -0500
Received: by mail-wr1-x431.google.com with SMTP id w15so7983894wrl.9
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 07:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FCfMHe5b/hTNsGMUHYdZCTbKXqMgLewG0q+mJCK5/VM=;
 b=hdciz/TS/f8YyUvEWDBsN+hdTpvIzipJEuixF0SIaANHUFmA/62cntDL1TgUbktiZ8
 tMY9+Km7IJqS9GhDOinpBhoE2zNsjG1rOqFnwp6Wu841NmAwilTVfYCjZYviFDRrVGBY
 ND46TjeJEOjEYSD/3qqerZ55qxO9PO0DjXaypnuk/jB2sHVr6ksPdclHbWyEBVpW4QOo
 qW0XrHZAJnkfLKaL6pntHRrnBigsKTqMdsfKpQWBnyF7bpUuyh6Kh/BrLeWxAxgmp3P0
 gy0JT9xIn9JZCv5HjmvPHhWngu9LqwZyRf3PD/fC+IqZHNOJEM9C8Mgdd7GysBaOGFIa
 EFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FCfMHe5b/hTNsGMUHYdZCTbKXqMgLewG0q+mJCK5/VM=;
 b=D1pgYbbdVu3E+voJ2FKdRA3It94IxmdpvUB+PFjK1GLALwj+DWDgu2DwshUCIOgaIl
 RuXb6IpGm/2AuDxGgJmn3C3E4yUhHckFxW8GCoFujuQux726PErSGuZa6X2tz8rhcE8H
 1gVplUG+0N9gPydVwioItsQkELQ3LhUoqTzAIE/SUo5ub/+Mw4wU5BtIWZD4zF7ajdzg
 KcMvJSFWvFAWMw+Oxa1AxUMDLZ6NQc/XmDULi2aIZbf5HAg8uSPS9ISzqlgctILZg7G8
 EF+WH4MAxVEnWBo/tv2l5ezrFnv/IvUUFlYyCfVA9HcCRUCaaB7Bf7v2wgObGFwFZUeB
 Z2NQ==
X-Gm-Message-State: ANoB5pkJVFz71AHZNv8Ap7NyI/MueqBL7ZcHK0V5zK7hcd66cMmEugMo
 OVLmTwOBijxakqdwDcr+4uT5jQw+LKvvLpiR1Ik=
X-Google-Smtp-Source: AA0mqf4P4Yu4M/sH4VhA0AWLLS2qzHEg2izdI14P800L68atpisZmw9wEgciZD1SMC/nVmpdYN6Zfg==
X-Received: by 2002:a5d:490d:0:b0:242:fa5:ce83 with SMTP id
 x13-20020a5d490d000000b002420fa5ce83mr7989559wrq.37.1670687705218; 
 Sat, 10 Dec 2022 07:55:05 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w18-20020adfee52000000b00236883f2f5csm4179435wro.94.2022.12.10.07.55.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 10 Dec 2022 07:55:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 0/7] hw/mips/malta: Generate nanoMIPS bootloader with
 bootloader generator API
Date: Sat, 10 Dec 2022 16:54:55 +0100
Message-Id: <20221210155502.74609-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Bernhard posted his "Consolidate PIIX south bridges" v3 series:
https://lore.kernel.org/qemu-devel/20221204190553.3274-1-shentey@gmail.com/

However in order to simplify it, on the Malta board we need to set
the PIIX IRQC[A:D] routing values via the embedded bootloader (used
when no external BIOS is provided). Jiaxun added a "bootloader
generator API" for 32-bit wide instructions, and we use it in the
write_bootloader() function.
This series provides the nanoMIPS equivalent generated instructions
and update the write_bootloader_nanomips() function.
That allow fixing the TODO left in
https://lore.kernel.org/qemu-devel/20221027204720.33611-3-philmd@linaro.org/
and apply Bernhard's consolidation.

Please review,

Phil.

Philippe Mathieu-Daudé (7):
  hw/mips/bootloader: Handle buffers as opaque arrays
  hw/mips/bootloader: Pass 32-bit immediate value to LUI opcode
    generator
  hw/mips/bootloader: Implement nanoMIPS NOP opcode
  hw/mips/bootloader: Implement nanoMIPS LUI opcode
  hw/mips/bootloader: Implement nanoMIPS SW opcode
  hw/mips/bootloader: Implement nanoMIPS SW opcode
  hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs

 hw/mips/bootloader.c         | 140 +++++++++++++++++++++++------
 hw/mips/malta.c              | 167 ++++++++++-------------------------
 include/hw/mips/bootloader.h |  10 +--
 3 files changed, 162 insertions(+), 155 deletions(-)

-- 
2.38.1


