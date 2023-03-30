Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B49866D0663
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:20:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phsBH-0007Jz-EN; Thu, 30 Mar 2023 09:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phsBF-0007D7-1S
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:19:05 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phsBB-0001z8-BL
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:19:04 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l15-20020a05600c4f0f00b003ef6d684102so8116518wmq.3
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 06:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680182338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ON9AZHMX3N64FVCrOFYihKkfNmrYxnPAKmcnIsXeVDg=;
 b=sBYcejN4qNwmjr96LOaQJsDObl2gv5zk9jzbJk5KsPDUmHO6XQA+PAoU4JGlb0labJ
 7lMb1yy5L7WDhLwzh9CFplwaK4850Je0rsSUQ3iikBvz9elgTuT0u/AicjEck3dgu5BH
 VPAeTZ4XtRTNyRyyKn98O7+8lgLDfs8VodpVzxRiwxrrjnJGnTXgJaVR1JtOcHAEfXG/
 dLFkiDZMA2mkFaHQr4GMv7q+MMw83WVPt5DfSi387m+FPOPVttvzfMtK6MJkSdRyIZ+O
 MfCLBCxvmAl2lVKrLberFB4woPd2B/nMheonasIUZM5yFU6pN0zEUtAl0GaXbo+mCeW0
 XBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ON9AZHMX3N64FVCrOFYihKkfNmrYxnPAKmcnIsXeVDg=;
 b=P5J6FjZERz57LllCpFIfrejabPDywcd5sGTfSeh0vPeAk9sRJ/fjrkdjZF5IjoGaVY
 1AQ8WyDPEAEUCQt9U/DIYoPjYeizvBQ2XXvaPau/8rSn9dlYIkjt7TUO7inHemYfbt6x
 FI0GXuZ++aj+eLvX3nOw7NVHHN7eFgE9JbesIbS6b0tnf3t2GPVcc0TjOINz3jTa47CD
 Ykn6MCbEBWksuvPOYH1VPI3k8WKt8C7G+hGMuYi4lt89L23d7pD9b9VtF7fspOUkPBQG
 S2584bwsxD6Gl1bpXARWr4fYZJfkt+sK6ydKb17oU4aOYE+RcmFCdAeMVvc3Gpx8o/ct
 2n0Q==
X-Gm-Message-State: AO0yUKXfakxo0TwQAMYAiKP70nafduObW7qU9RUVOhbqI/mbhHp6b2um
 g7nzYaXuZT/7fN/E652UczYvCAGbhb8SEv1Wxdg=
X-Google-Smtp-Source: AK7set94QhXQv/MIUgncUh/TmJn756CR+ToBkXe5498921vGGXl83o4qbpeIGNJbLDaeqHho2EmNLA==
X-Received: by 2002:a7b:c40b:0:b0:3ee:4ee:bf73 with SMTP id
 k11-20020a7bc40b000000b003ee04eebf73mr17410969wmi.24.1680182338646; 
 Thu, 30 Mar 2023 06:18:58 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003ef5bb63f13sm6332881wms.10.2023.03.30.06.18.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Mar 2023 06:18:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Titus Rwantare <titusr@google.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 0/6] Misc fixes for 2023-03-30
Date: Thu, 30 Mar 2023 15:18:50 +0200
Message-Id: <20230330131856.94210-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

The following changes since commit f00506aeca2f6d92318967693f8da8c713c163f3:

  Merge tag 'pull-tcg-20230328' of https://gitlab.com/rth7680/qemu into staging (2023-03-29 11:19:19 +0100)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/misc-fixes-20230330

for you to fetch changes up to aad3eb1ffeb65205153fb31d81d4f268186cde7a:

  block/dmg: Ignore C99 prototype declaration mismatch from <lzfse.h> (2023-03-30 15:03:36 +0200)

----------------------------------------------------------------
- linux-user:
  . Don't use 16-bit UIDs with SPARC V9
  . Pick MIPS3 CPU by default to run NaN2008 ELF binaries

- HW:
  . Fix invalid GT64120 north bridge endianness register swap
  . Prevent NULL pointer dereference by SMBus devices

- Buildsys:
  . Fix compiling with liblzfse on Darwin

----------------------------------------------------------------

Jiaxun Yang (1):
  hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR

Philippe Mathieu-Daudé (4):
  linux-user/sparc: Don't use 16-bit UIDs on SPARC V9
  linux-user/mips: Use P5600 as default CPU to run NaN2008 ELF binaries
  tests/avocado: Enable TuxRun/mips64 (big-endian) test
  block/dmg: Ignore C99 prototype declaration mismatch from <lzfse.h>

Titus Rwantare (1):
  hw/i2c: pmbus: block uninitialised string reads

 linux-user/mips/target_elf.h      |  3 +++
 linux-user/syscall_defs.h         |  2 +-
 block/dmg-lzfse.c                 |  5 +++++
 hw/i2c/pmbus_device.c             |  7 +++++++
 hw/pci-host/gt64120.c             | 18 ++++++------------
 tests/avocado/tuxrun_baselines.py |  1 -
 6 files changed, 22 insertions(+), 14 deletions(-)

-- 
2.38.1


