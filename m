Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3786377FD
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 12:51:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAke-0003PX-2h; Thu, 24 Nov 2022 06:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkR-0003Np-AH
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:31 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkO-0004op-4a
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:31 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso1059724wms.4
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uuMgKH+3fxzrMAWB3ctjGbRmQ7Bt4fbv5IUickRCrxw=;
 b=BB++zy2w2VqVmaabat7qSgdOI39bEbIx2kWIePXP9cbOvAK78MkkVm37XABBRDF6vj
 OlnCYQSEZdLO+0VuQC7+xUROY7KKpgFOGeOGVNmtK6UxwIBZq3IhG5gXuyWbf5SgU5Gd
 XILAJCgVg/gvSYIsFIJLdv14B09nFXPwggKzNrIKydYwgKGzH1smiC9RkU7a4U9g+dVX
 49NPsBI8YnCzPks1UZYValv86KPn3BpIJyjNaDFktuJUOt095g9T3jBXW/0u7hHp1QiG
 jeqS1depmZ2B4vqCVUhDn/yhH7wvU1v55tpESvXyMeg22hFtDK6z/d273H4rJp27MFbo
 KAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uuMgKH+3fxzrMAWB3ctjGbRmQ7Bt4fbv5IUickRCrxw=;
 b=uNJb+Tak8bfqUor3xyTNYHts05okC7J6DfMv78bpJjUpaXaZabpCRNWO2A8aWLw9ki
 OS7EYXwRPJbepS3nD9wRCJM9rY5iIqrQiVp8cNq1YCXb1U+YItSIKbV2n3voEw7cPk1C
 fFbhKVHlQzYwHWcFDK8VvSZD6p85tj6Y79rhPeUI1Rt9Z4IluLXJy1+kiy1iN4RqMpiG
 2fzrACslsMzEMwFohmkrBJ0eHH5+HICPmVqiaNA1YRPdF2KiAe0dnw3NSSaHQ2vOW6xp
 bSU3WJ687rCyjh1TWdMWOpohlwicMeDFd6AjUNrs96nQ34JjI5feg2+Qwgew/r6nZK1S
 6N6w==
X-Gm-Message-State: ANoB5plqxPc24SEHPvhXz7UAlyalAsBAP/UlkTfz6rw3nWuTQbF7wPkV
 ImBqgPIaltRNr91umrkV0HBXeqcHbUeXwg==
X-Google-Smtp-Source: AA0mqf53mW7KIw+TvwqPtV751NhcTPCKzg2AFJ7rrnusUE35k6ONGPXSVcwPd39PHp/aTQcv9KznTg==
X-Received: by 2002:a05:600c:35c8:b0:3cf:cf89:2f02 with SMTP id
 r8-20020a05600c35c800b003cfcf892f02mr12691218wmq.2.1669290626201; 
 Thu, 24 Nov 2022 03:50:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH for-8.0 00/19] Convert most CPU classes to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:03 +0000
Message-Id: <20221124115023.2437291-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

This patchset converts the TYPE_CPU base class and most subclasses
to use 3-phase reset. (The exception is s390, which is doing
something a bit odd with its reset, so the conversion there isn't
going to be simple like these others. So I'll do that one
separately.)

The rationale here is that we should be able to get rid of
all the remaining uses of device_class_set_parent_reset()
and remove/simplify some of the transitional code that's
currently bridging between "legacy" reset and 3-phase reset.

NB: even with this series, it's not possible to usefully do
anything requiring 3-phase reset of a CPU yet, because all
CPU objects get ad-hoc reset by some code somewhere doing
a cpu_reset() call on them, which will just do all 3 phases
in order. I would like to try to address that eventually,
but it's not trivial.

thanks
-- PMM

Peter Maydell (19):
  hw/core/cpu-common: Convert TYPE_CPU class to 3-phase reset
  target/arm: Convert to 3-phase reset
  target/avr: Convert to 3-phase reset
  target/cris: Convert to 3-phase reset
  target/hexagon: Convert to 3-phase reset
  target/i386: Convert to 3-phase reset
  target/loongarch: Convert to 3-phase reset
  target/m68k: Convert to 3-phase reset
  target/microblaze: Convert to 3-phase reset
  target/mips: Convert to 3-phase reset
  target/nios2: Convert to 3-phase reset
  target/openrisc: Convert to 3-phase reset
  target/ppc: Convert to 3-phase reset
  target/riscv: Convert to 3-phase reset
  target/rx: Convert to 3-phase reset
  target/sh4: Convert to 3-phase reset
  target/sparc: Convert to 3-phase reset
  target/tricore: Convert to 3-phase reset
  target/xtensa: Convert to 3-phase reset

 target/arm/cpu-qom.h        |  4 ++--
 target/avr/cpu-qom.h        |  4 ++--
 target/cris/cpu-qom.h       |  4 ++--
 target/hexagon/cpu.h        |  2 +-
 target/i386/cpu-qom.h       |  4 ++--
 target/loongarch/cpu.h      |  4 ++--
 target/m68k/cpu-qom.h       |  4 ++--
 target/microblaze/cpu-qom.h |  4 ++--
 target/mips/cpu-qom.h       |  4 ++--
 target/nios2/cpu.h          |  4 ++--
 target/openrisc/cpu.h       |  4 ++--
 target/ppc/cpu-qom.h        |  4 ++--
 target/riscv/cpu.h          |  4 ++--
 target/rx/cpu-qom.h         |  4 ++--
 target/sh4/cpu-qom.h        |  4 ++--
 target/sparc/cpu-qom.h      |  4 ++--
 target/tricore/cpu-qom.h    |  2 +-
 target/xtensa/cpu-qom.h     |  4 ++--
 hw/core/cpu-common.c        |  7 ++++---
 target/arm/cpu.c            | 13 +++++++++----
 target/avr/cpu.c            | 13 +++++++++----
 target/cris/cpu.c           | 12 ++++++++----
 target/hexagon/cpu.c        | 12 ++++++++----
 target/i386/cpu.c           | 12 ++++++++----
 target/loongarch/cpu.c      | 12 ++++++++----
 target/m68k/cpu.c           | 12 ++++++++----
 target/microblaze/cpu.c     | 12 ++++++++----
 target/mips/cpu.c           | 12 ++++++++----
 target/nios2/cpu.c          | 12 ++++++++----
 target/openrisc/cpu.c       | 12 ++++++++----
 target/ppc/cpu_init.c       | 12 ++++++++----
 target/riscv/cpu.c          | 12 ++++++++----
 target/rx/cpu.c             | 13 ++++++++-----
 target/sh4/cpu.c            | 12 ++++++++----
 target/sparc/cpu.c          | 12 ++++++++----
 target/tricore/cpu.c        | 12 ++++++++----
 target/xtensa/cpu.c         | 12 ++++++++----
 37 files changed, 184 insertions(+), 110 deletions(-)

-- 
2.25.1


