Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1E05727FC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:56:46 +0200 (CEST)
Received: from localhost ([::1]:42134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMw1-0000xS-Pf
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtF-0005RW-UB
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:53:53 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtD-0007Aw-Kw
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:53:53 -0400
Received: by mail-wr1-x429.google.com with SMTP id d16so12798008wrv.10
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=blVlv4jhWFybm66tURNwjdfYLWf7AYdSvlRAmjpIyaw=;
 b=gKX4h9lOLDjo5tleOC42x3Q7i/ZqwYZHDkjgoeVQZm6ZtPd4YtReTMM+OZzdKifNWt
 nRMvqemHuZO6gokGnEGCY0Iyw/9Ogrpzfk9GotqEhZPUDr6ZYJKKS2EKmx9vKLGE/a6N
 2DQsBsQxqgEtVMaJ1EVicewGw88tPxyvTfSSXoNfYbdSOhCRh9dVGKoht2AQ8jIY3MVy
 EBhCcxBb4WvbQPQfiCtwG1ujn6/+QfxKQ5RgTsg6cfCydvRv2qsNgcd7Q11iPJ8lWKL2
 AsWIqdak3MF3ewsM+EqSCIj4+A970CdJZzcB5ES+UggZ9FY2M9oS0qGuauMbHrt/XX53
 tqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=blVlv4jhWFybm66tURNwjdfYLWf7AYdSvlRAmjpIyaw=;
 b=uK2P8bM3aIrBkZ1l1AzxzfQL501OHJU91WbNReCKO+zadqhuz5fjolbVEp1tz6dg7z
 L1ODHIM6fq095+M2JbqJgnnsPALfft5fK4GB7KNkeTZ/3gh7k5PnP1/MTCzNlEVsvXXP
 js9g9kWfF+wTkwxBI2iKruozctKMHKGR5OWazLhyIPD6Y2iHPTHw59hle0Fj5YzA4FTA
 +hqGy+kd44qOSrBi9Cr98cLLTxqiYlrZndR1s2EV8ISMMXVfDbT88ZHx32owXKyYG2qp
 USWrYilihwMm/Yx1037yVYrmtvzAF2jtF3TpB68R3bUKQDVCa9fdqg5MXya1rnGIUzIX
 J9FQ==
X-Gm-Message-State: AJIora+YiyAMard/yfOoRMB9OsIhFg4C9+hUF0rY4wvRDwF9A4yLy1aX
 R8oFP3neOuNUlhV9mPIIaN4YbtA1F0wSRY+d
X-Google-Smtp-Source: AGRyM1t/lbEdlqYX3POHnbD1qRuS8KAHspIP2OH6vcrTMt4/nxehA/pWRXaLfw6uRajm39xyoT28bQ==
X-Received: by 2002:a5d:5504:0:b0:21d:6dca:f720 with SMTP id
 b4-20020a5d5504000000b0021d6dcaf720mr23378306wrv.141.1657659229780; 
 Tue, 12 Jul 2022 13:53:49 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a7bc450000000b003a2d6f26babsm102601wmi.3.2022.07.12.13.53.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 13:53:49 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 00/12] MIPS patches for 2022-07-12
Date: Tue, 12 Jul 2022 22:53:35 +0200
Message-Id: <20220712205347.58372-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

The following changes since commit 8e3d85d36b77f11ad7bded3a2d48c1f0cc334f82:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-07-12 14:12:15 +0100)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/mips-20220712

for you to fetch changes up to b10ccec10096a27bb3b99a7291d5a3d5c826a1f3:

  target/mips: Remove GET_TARGET_STRING and FREE_TARGET_STRING (2022-07-12 22:32:22 +0200)

----------------------------------------------------------------
MIPS patches queue

- Cavium Octeon MIPS extension and CPU model (Pavel Dovgalyuk)
- Semihosting cleanup (Richard Henderson)

----------------------------------------------------------------

Pavel Dovgalyuk (4):
  target/mips: introduce decodetree structure for Cavium Octeon
    extension
  target/mips: implement Octeon-specific BBIT instructions
  target/mips: implement Octeon-specific arithmetic instructions
  target/mips: introduce Cavium Octeon CPU model

Richard Henderson (8):
  target/mips: Create report_fault for semihosting
  target/mips: Drop link syscall from semihosting
  target/mips: Use semihosting/syscalls.h
  target/mips: Avoid qemu_semihosting_log_out for UHI_plog
  target/mips: Use error_report for UHI_assert
  semihosting: Remove qemu_semihosting_log_out
  target/mips: Simplify UHI_argnlen and UHI_argn
  target/mips: Remove GET_TARGET_STRING and FREE_TARGET_STRING

 include/semihosting/console.h      |  13 -
 semihosting/console.c              |   9 -
 target/mips/cpu-defs.c.inc         |  28 ++
 target/mips/mips-defs.h            |   1 +
 target/mips/tcg/meson.build        |   2 +
 target/mips/tcg/octeon.decode      |  41 +++
 target/mips/tcg/octeon_translate.c | 201 +++++++++++++++
 target/mips/tcg/sysemu/mips-semi.c | 397 ++++++++++++++---------------
 target/mips/tcg/translate.c        |   5 +
 target/mips/tcg/translate.h        |   1 +
 10 files changed, 465 insertions(+), 233 deletions(-)
 create mode 100644 target/mips/tcg/octeon.decode
 create mode 100644 target/mips/tcg/octeon_translate.c

-- 
2.36.1


