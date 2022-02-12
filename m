Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D184B34BA
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 12:39:33 +0100 (CET)
Received: from localhost ([::1]:43844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIqkV-0000hn-T9
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 06:39:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nIqgk-0006ja-Td
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 06:35:39 -0500
Received: from [2a00:1450:4864:20::534] (port=34686
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nIqgi-0005aN-6Q
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 06:35:37 -0500
Received: by mail-ed1-x534.google.com with SMTP id co28so20106157edb.1
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 03:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k5lVvaoNPZ9XH2KcO5W7YtDrQNB6HNSZrJOEiGAyk1I=;
 b=HMwyw2e3OnaIClXnBorXjz7LNSPivY3uP566cJGP04kSeahDMQKBEMm8sgE4hQBovf
 B64caKv2VWFy4FcEgwAQNNzArm4pYnJdM34UNKh082g8UiBERbF98LgYR5WkicJqvSDs
 Xe1OB1JkDHyoEReLgt28r6VccjEBm9sc7CvVIw/ycufKKdBkrccRZGc+aI+lYq+3Kux1
 VD683KEYbGXO5ydpgXE+jpwZVhvXtzaoeF3lLRIpwOiTW/f0Wx6MXLdLa4SXukvy28eW
 Yx90lltDBVi123VSSAzoBn51KQabId7kiLWhyCjFyBko4QiST1e1BLt+TNgEPP61zNr0
 2R5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k5lVvaoNPZ9XH2KcO5W7YtDrQNB6HNSZrJOEiGAyk1I=;
 b=AlnElEL7tRR3NWwt8TUCmkrItaegcuVcFI05X5FeZz5FJX6F5EXi0xKMRDfOjmgZlM
 xdbsxebB8Mzatb54JA1+ETAs8JapoKL9iGyN38zLE80z6+lByXDiBYi3Y9ri48UlY9VO
 DPnVvbXifIn1A9qYGHMG+v06j/tAUR6/QuAkFIoiFET/2ouSSdPbCnnfkvIhiL+pshPq
 dx6bRt6RxHALyHGashcRLt9YJqH7GlJSpShRrwK0qikArZMm+H7TRy79n/llallOx1v4
 fNyKU5m4XFlEjyX0bCO5IfLMcvftdt69T31ms+niXFMfrn6wKa8kZ0Ad6x4OZAZkY3Y/
 wHyw==
X-Gm-Message-State: AOAM530ApINXuGNyqJMBXExRhITrRAGKWn5fh6uhtTWiLEYSSYraIQu2
 flXXG5C81tcg9hyow+MJq8BiTzSWedsV5IslspE=
X-Google-Smtp-Source: ABdhPJxD/v85cIgRMgNj4mEOzHF9avw/AhJcAjVQUbqMhRoTi1V3z0hKciZ6NF8xUiA/8frqiaEO1A==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr6267320edd.408.1644665734176; 
 Sat, 12 Feb 2022 03:35:34 -0800 (PST)
Received: from osoxes.fritz.box (i577BC145.versanet.de. [87.123.193.69])
 by smtp.gmail.com with ESMTPSA id z14sm889288edc.62.2022.02.12.03.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 03:35:33 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] malta: Fix PCI IRQ levels to be preserved during
 migration
Date: Sat, 12 Feb 2022 12:35:14 +0100
Message-Id: <20220212113519.69527-1-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The intention behind v1 [1] was just to remove some global variables from
gt64xxx and piix4. During review it was noticed that the Malta board misses to
preserve the PCI IRQ levels during migration. Since the patch series offered an
easy fix v2 was born.

Furthermore, i8259[] was moved to PIIX4State in patch 1. This attribute seems
quite redundant to *isa to me. I therefore attempt to resolve it.

Tested with [2]:

  qemu-system-mips64 -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda \
  debian_wheezy_mips_standard.qcow2 -append "root=/dev/sda1 console=tty0"

It was possible to log in as root and `poweroff` the machine.
  
[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg02786.html
[2] https://people.debian.org/~aurel32/qemu/mips/
  
v2:
  isa/piix4: Fix PCI IRQ levels to be preserved in VMState
  isa/piix4: Resolve redundant i8259[] attribute

Bernhard Beschow (5):
  malta: Move PCI interrupt handling from gt64xxx to piix4
  pci: Always pass own DeviceState to pci_map_irq_fn's
  isa/piix4: Resolve global variables
  isa/piix4: Fix PCI IRQ levels to be preserved in VMState
  isa/piix4: Resolve redundant i8259[] attribute

 hw/isa/piix4.c                | 61 +++++++++++++++++++++++++++++++---
 hw/mips/gt64xxx_pci.c         | 62 +++--------------------------------
 hw/mips/malta.c               |  6 +---
 hw/pci-host/sh_pci.c          |  6 ++--
 hw/pci-host/versatile.c       |  6 ++--
 hw/ppc/ppc440_pcix.c          |  6 ++--
 hw/ppc/ppc4xx_pci.c           |  6 ++--
 include/hw/mips/mips.h        |  2 +-
 include/hw/southbridge/piix.h |  2 --
 9 files changed, 75 insertions(+), 82 deletions(-)

-- 
2.35.1


