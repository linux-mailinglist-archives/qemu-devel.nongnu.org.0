Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601C8649652
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:46:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4TCh-0005Ag-P3; Sun, 11 Dec 2022 15:45:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TCf-0005A4-H6
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:45:41 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TCd-0003Pw-9q
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:45:41 -0500
Received: by mail-ej1-x632.google.com with SMTP id b2so23294747eja.7
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 12:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LZH8TTDSSTKXy8hz6PuBZj6YjEWixqvKrZuEGMD2sSs=;
 b=HFqVPXcNLP1egVuUAFtvJfoZImtZTIcHEkLVdc16QcTnkg4p5yzUVrsGYWz9I+TSPV
 w57EK5ViuiM9WuLK4jCAIRQkE+WIwj/HtSQmO/8HFWJIJUjtrkQhDsYrKhN4JFdni2la
 D5BXQ6nO2QNvlARePdpCDnryMwxtWsvXQmb1NVxlAy1tfU/gX0gnEYbc/L+YmfRx4+ha
 cbp9fZIWOiPwd7fwMZpoMp+x4cJ+Jofl0D7cGkOi7R6i1NM071+VLC0JDPa3tT1hfXrv
 I1SVhqCuAW5fLJIFDRo1+r40faNCfggXk++O3AFwHnH0KDzvLEJnys5UAwP6zyGA8EGp
 /fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LZH8TTDSSTKXy8hz6PuBZj6YjEWixqvKrZuEGMD2sSs=;
 b=OU37sj0kMAQIBwmWrLVN1KWFnMCm3GXr8fq9mMIMlXXOqB2oeBJWT/eoqbrwLGomsC
 7WhDvR/8B/xHx+5LePrHCaf//A8YC7fOEQ1CoTrSaEUiK2wffd/GUAchK/MPXkY04FBI
 eT811hezQZBqZFvKwLBOru/24wjX4FzIiSmyo1tGTMUEUG0NiGgDkVF1xFt9wiP8fFrc
 S2xvggJx8O9dGebg6IE1WboK+Ojvxn/jQsGNhkssO5Y3/BPUj0nz6y1dKI+93w046zRF
 LSgsKuLr7kZIxRoT/7lv+EyD2I4TGns84q8dy5GVbL6cFZwDKBX7MdX6AkjeymCnXWH2
 Q8Vg==
X-Gm-Message-State: ANoB5pmYqYjQQJUym0SFFJRYuUuYyZ9PvoIap6JTcBC2Pm4GDaMhdbDo
 Ltyb3gPVnoBbvA/8OZwWPfgSKrqwkivOEt03YGU=
X-Google-Smtp-Source: AA0mqf5alZ7naEwlubhb6ievFjLVMdUh2MPL/mTydIdUeC04951eOyXoRUtb+aGj/giHvwMiFxDFTA==
X-Received: by 2002:a17:907:6e20:b0:7bc:fbd1:4ca with SMTP id
 sd32-20020a1709076e2000b007bcfbd104camr21612355ejc.69.1670791537181; 
 Sun, 11 Dec 2022 12:45:37 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170906210100b007c1675d2626sm1035241ejt.96.2022.12.11.12.45.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Dec 2022 12:45:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 v2 00/11] hw/mips/malta: Generate nanoMIPS bootloader
 with bootloader generator API
Date: Sun, 11 Dec 2022 21:45:22 +0100
Message-Id: <20221211204533.85359-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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

Since v1:
- addressed review comments
- generate JALRc
- split write_bootloader_nanomips() convertion in 5 parts
- use bl_gen_jump_kernel()
- merge common code to bl_setup_gt64120_jump_kernel()

Philippe Mathieu-Daudé (11):
  hw/mips/bootloader: Handle buffers as opaque arrays
  hw/mips/bootloader: Implement nanoMIPS NOP opcode generator
  hw/mips/bootloader: Implement nanoMIPS SW opcode generator
  hw/mips/bootloader: Implement nanoMIPS LI (LUI+ORI) opcode generator
  hw/mips/bootloader: Implement nanoMIPS JALRc opcode generator
  hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs (1/5)
  hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs (2/5)
  hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs (3/5)
  hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs (4/5)
  hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs (5/5)
  hw/mips/malta: Merge common BL code as bl_setup_gt64120_jump_kernel()

 hw/mips/bootloader.c         | 141 ++++++++++++++----
 hw/mips/malta.c              | 281 ++++++++---------------------------
 include/hw/mips/bootloader.h |  10 +-
 3 files changed, 177 insertions(+), 255 deletions(-)

-- 
2.38.1


