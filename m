Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B7C593607
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 21:09:35 +0200 (CEST)
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNfSw-0007bD-5p
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 15:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfMk-0002a3-C6
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 15:03:10 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfMi-0006K7-CK
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 15:03:09 -0400
Received: by mail-wr1-x435.google.com with SMTP id p10so10089285wru.8
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 12:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=4Q67kU5Pa8qbKDq/p11cYTFwJU0Q6OYYwsmMELIDttI=;
 b=ULEtzSDrVV/7I099f4FZOktooS/YmI8a8LRkHckUIsJKCM2MWn5AwGB/CJq3J4Wiqr
 XmVzkFsXqqvBTwfDN9DEj6TnfTn+iqtt809xSh7N9fMMjGRoGNvVCkZlHd/GjUBY5gIc
 H8U8jakIiB2M/TlnuSskDz3b62wvWSv60fYcpDz9mvliI/cR64jaQNEBcg0shSzWLype
 YE2BJpVP/9zf6BKBv/+4IAf1Dv03QVKvLMeCBZ5or1K98zy3nvFHYKGsd1cWLnmwx8T4
 uZ+Kq+1WRMwP9cbL3OZg/7+aMaBUwEB7fLgHTqUuM44PpB73GUAwzv2rB662YEyVG0ow
 we5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=4Q67kU5Pa8qbKDq/p11cYTFwJU0Q6OYYwsmMELIDttI=;
 b=b/9LNokzly8Ievydfc2kVukFBuOhX9WIe18I2AOnAkIaQCHd0J9oChAkS+HdDAf7UW
 qvxJQ7UKg2m++bUlk4AXTdy1PR0iqb3kg7x4gAQ5hTFz7kv88sIF+dK54yHDwy/dOm5Z
 SLlm9oS/MH0JdnUPsAK2Owt3I0HAOFQ7U5ug/+gWiD7H/fJS2C8xDDnttaM2KqFgTpry
 /c4pgFJzoG4OGE8bA/JdFUsy2v7hHQYVjd3vuqNUbwxyzKcPsshGoGaM+6Rqqn7EmhKz
 elYKVfhv6PBVBpU47x8IudJnyKQRz/6MkPDt4+ZCiYPEALketoYHwsNwYQRPQ5Ko5OxV
 FLUQ==
X-Gm-Message-State: ACgBeo2IHyAwThoqpwgHz99SoWNFKiLoL7kM/SkHY3YbDNSBO+xFJ3gf
 KN5runyMCLAtjMQFbb6UqCHfug==
X-Google-Smtp-Source: AA6agR686UYwqSFydtFEb6BIZHoBm6o2H+eBG9yToKIoNk3se1D/z4jlhfgUZitVhszq6vRf9kuSHA==
X-Received: by 2002:a05:6000:18a1:b0:222:c477:e919 with SMTP id
 b1-20020a05600018a100b00222c477e919mr9521126wri.301.1660590186535; 
 Mon, 15 Aug 2022 12:03:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a5d5144000000b00220606afdf4sm8009162wrt.43.2022.08.15.12.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 12:03:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH 0/7] Allow semihosting from user mode
Date: Mon, 15 Aug 2022 20:02:56 +0100
Message-Id: <20220815190303.2061559-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Currently our semihosting implementations usually prohibit use of
semihosting calls in system emulation from the guest userspace.  This
is a very long standing behaviour justified originally "to provide
some semblance of security" (since code with access to the semihosting
ABI can do things like read and write arbitrary files on the host
system).  However, it is sometimes useful to be able to run trusted
guest code which performs semihosting calls from guest userspace,
notably for test code.

This patchset adds a command line suboption to the existing
semihosting-config option group so that you can explicitly opt in to
semihosting from guest userspace with "-semihosting-config
userspace=on".

It also brings all our target architectures into line about
how they handle semihosting. Currently these fall into three
different groups:

 * semihosting permitted only in privileged mode and only
   if enabled on the command line:
   - arm
   - m68k
 * semihosting permitted in any mode, if enabled on the command line:
   - mips
   - nios2
   - xtensa
 * semihosting permitted only in privileged mode, but fails
   to honour the existing "enable semihosting" option, instead
   enabling it all the time:
   - riscv

The effect of the new option for group 1 is:
 * user can now optionally also allow semihosting in usermode

For group 2 it is:
 * usermode semihosting used to be permitted, but now changes
   to default-disabled, needing explicit enablement

For group 3 it is:
 * semihosting overall used to be default-enabled and is
   now default-disabled, needing explicit enablement.
   Semihosting in usermode can also be enabled.

That means this is a "things that used to work no longer do
unless you change your commandline" change for groups 2 and 3
(so, mips, nios2. xtensa, riscv). In this patchset I've opted
to just make the change (with the intention of releasenoting
it) but I'm open to arguments that we ought to put it through
the deprecate-and-delete cycle. (I suspect this probably most
affects riscv.)

The patchset structure adds the option first and then updates
each target architecture in turn to honour it. It didn't seem
to me worth the extra patch-splitting to put the underlying
infrastructure in first, then the target changes and finally
exposing the option to the user only once it's honoured
everywhere.

NB: I haven't really tested this much, just 'make check'
and 'make check-avocado'; I wanted to get it out to the
mailing list for discussion, anyway.

thanks
-- PMM

Peter Maydell (7):
  semihosting: Allow optional use of semihosting from userspace
  target/arm: Honour -semihosting-config userspace=on
  target/m68k: Honour -semihosting-config userspace=on
  target/mips: Honour -semihosting-config userspace=on
  target/nios2: Honour -semihosting-config userspace=on
  target/xtensa: Honour -semihosting-config userspace=on
  target/riscv: Honour -semihosting-config userspace=on and enable=on

 include/semihosting/semihost.h            | 10 ++++++++--
 semihosting/config.c                      | 10 ++++++++--
 softmmu/vl.c                              |  2 +-
 stubs/semihost.c                          |  2 +-
 target/arm/translate-a64.c                | 12 +-----------
 target/arm/translate.c                    | 16 ++++------------
 target/m68k/op_helper.c                   |  3 +--
 target/mips/tcg/translate.c               |  9 +++++----
 target/nios2/translate.c                  |  3 ++-
 target/riscv/cpu_helper.c                 |  3 ++-
 target/xtensa/translate.c                 |  7 ++++---
 target/mips/tcg/micromips_translate.c.inc |  6 +++---
 target/mips/tcg/mips16e_translate.c.inc   |  2 +-
 target/mips/tcg/nanomips_translate.c.inc  |  4 ++--
 qemu-options.hx                           | 11 +++++++++--
 15 files changed, 52 insertions(+), 48 deletions(-)

-- 
2.25.1


