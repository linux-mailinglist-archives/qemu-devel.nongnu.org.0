Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5A16A21FF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:03:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdJn-0001gw-3Y; Fri, 24 Feb 2023 14:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJk-0001g4-Ao
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:01:16 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJd-0002dY-Ms
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:01:16 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so204069pjp.2
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 11:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677265260;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=sCdi+SHJPKJBVJowJgdPg6sU9XDCvdZSkBN94dRLpm4=;
 b=nfEz/hSP6m4jFRYIrzYlR3RJU7liqAGu+fx4+JezkPEo0Ib3ZKnNA3k4sEONzJ8vp7
 U/fyodgqRpXJfrYzV+iRHuJpyGbMO2zcBSMcTqzj+vwDEHuVEIoqrXAbPNWye9ubEJyX
 MrThCKSAQQjy1qkcUdZtmW4fgLYohIb+csP5QurGovFYd6BMjBrSDyOosvdNQjpS+STi
 Pc+o+bhR2ApEseriqGKkLCr9ooUjevi9TesezS+l3e2y0+CJ7voOZpi/yxOVzJUTqsjF
 m6LLfd+xfno2znUQeyeM9qP6Fy+3PD28yc9UAi6P7W3BX+8InKPeI3z3k6sL41XTj5GY
 bwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677265260;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sCdi+SHJPKJBVJowJgdPg6sU9XDCvdZSkBN94dRLpm4=;
 b=k6kL/O/fnKuHi3ExSWcpj8TLpB+xQIvB3Oll3uMhTYwab7hSDaZiFaOQsee6369Zni
 o3Gtj+U33IP6PTOL2Sds04wlzvf3SEq5rbJUxlZ20MDWOEIzgj/MScf476Oh29bKXy8x
 nDjsXN0jYvoiqXm3mbsmB8tcfEkV00dPGsv4N5Yvl1UDw0CKDCIzgjfHtUnPRSY+liRN
 8iJJfMlgS6Ygx3TN83QOSJHBGLwDaH/K7+WgStSz3HWlxTuP/VQ7HlTQWKnsH1g50BxG
 osOjiSkmOwUtXgTXwLSMpQ09OP5EDocjIvtgw544lu7TmRR1n4fM0CICjtxCeTQifcY3
 X/EA==
X-Gm-Message-State: AO0yUKXv8jtC9Fkv1D01o0C0GWmRtO2q2vDHRzKK0+cXbh/gZ7W7GhVQ
 s8127+6HPLM1fYfCB1WdWW6g2A==
X-Google-Smtp-Source: AK7set8hSh3b12BoORoi+GEEv0WBJDpy990luePhG9FUCkiylZsOgBWjZPHnueukS0dOWbxguyd68g==
X-Received: by 2002:a05:6a20:244d:b0:cc:aedf:9a1e with SMTP id
 t13-20020a056a20244d00b000ccaedf9a1emr611937pzc.61.1677265259477; 
 Fri, 24 Feb 2023 11:00:59 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 q22-20020a62ae16000000b005d6fcd8f9desm5325757pff.94.2023.02.24.11.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 11:00:58 -0800 (PST)
Subject: [PULL] Fourth RISC-V PR for QEMU 8.0, Attempt 2
Date: Fri, 24 Feb 2023 10:59:01 -0800
Message-Id: <20230224185908.32706-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The following changes since commit 417296c8d8588f782018d01a317f88957e9786d6:

  tests/qtest/netdev-socket: Raise connection timeout to 60 seconds (2023-02-09 11:23:53 +0000)

are available in the Git repository at:

  git@github.com:palmer-dabbelt/qemu.git tags/pull-riscv-to-apply-20230224

for you to fetch changes up to 8c89d50c10afdd98da82642ca5e9d7af4f1c18bd:

  target/riscv: Fix vslide1up.vf and vslide1down.vf (2023-02-23 14:21:34 -0800)

----------------------------------------------------------------
Fourth RISC-V PR for QEMU 8.0, Attempt 2

* A triplet of cleanups to the kernel/initrd loader that avoids
  duplication between the various boards.
* Weiwei Li, Daniel Henrique Barboza, and Liu Zhiwei have been added as
  reviewers.  Thanks for the help!
* A fix for PMP matching to avoid incorrectly appling the default
  permissions on PMP permission violations.
* A cleanup to avoid an unnecessary avoid env_archcpu() in
  cpu_get_tb_cpu_state().
* Fixes for the vector slide instructions to avoid truncating 64-bit
  values (such as doubles) on 32-bit targets.

----------------------------------------------------------------
Alistair Francis (1):
      MAINTAINERS: Add some RISC-V reviewers

Daniel Henrique Barboza (4):
      hw/riscv: handle 32 bit CPUs kernel_entry in riscv_load_kernel()
      hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
      hw/riscv/boot.c: make riscv_load_initrd() static
      target/riscv: avoid env_archcpu() in cpu_get_tb_cpu_state()

Frank Chang (1):
      target/riscv: Remove privileged spec version restriction for RVV

Himanshu Chauhan (1):
      target/riscv: Smepmp: Skip applying default rules when address matches

LIU Zhiwei (1):
      target/riscv: Fix vslide1up.vf and vslide1down.vf

 MAINTAINERS                  |  3 ++
 hw/riscv/boot.c              | 97 ++++++++++++++++++++++++++++----------------
 hw/riscv/microchip_pfsoc.c   | 12 +-----
 hw/riscv/opentitan.c         |  4 +-
 hw/riscv/sifive_e.c          |  4 +-
 hw/riscv/sifive_u.c          | 12 +-----
 hw/riscv/spike.c             | 14 ++-----
 hw/riscv/virt.c              | 12 +-----
 include/hw/riscv/boot.h      |  3 +-
 target/riscv/cpu.c           |  2 +-
 target/riscv/cpu_helper.c    |  2 +-
 target/riscv/csr.c           | 21 ++++------
 target/riscv/pmp.c           |  9 ++--
 target/riscv/vector_helper.c |  4 +-
 14 files changed, 98 insertions(+), 101 deletions(-)
Subject: [PULL] Fourth RISC-V PR for QEMU 8.0, Attempt 2

The following changes since commit 417296c8d8588f782018d01a317f88957e9786d6:

  tests/qtest/netdev-socket: Raise connection timeout to 60 seconds (2023-02-09 11:23:53 +0000)

are available in the Git repository at:

  git@github.com:palmer-dabbelt/qemu.git tags/pull-riscv-to-apply-20230224

for you to fetch changes up to 8c89d50c10afdd98da82642ca5e9d7af4f1c18bd:

  target/riscv: Fix vslide1up.vf and vslide1down.vf (2023-02-23 14:21:34 -0800)

----------------------------------------------------------------
Fourth RISC-V PR for QEMU 8.0, Attempt 2

* A triplet of cleanups to the kernel/initrd loader that avoids
  duplication between the various boards.
* Weiwei Li, Daniel Henrique Barboza, and Liu Zhiwei have been added as
  reviewers.  Thanks for the help!
* A fix for PMP matching to avoid incorrectly appling the default
  permissions on PMP permission violations.
* A cleanup to avoid an unnecessary avoid env_archcpu() in
  cpu_get_tb_cpu_state().
* Fixes for the vector slide instructions to avoid truncating 64-bit
  values (such as doubles) on 32-bit targets.

----------------------------------------------------------------
I've dropped the OpenSBI update from the first attempt.  I'll take a
shot at fixing it given Thomas' instructions, but since Peter said some
PRs may be processed locally I figured it'd be easier to get this out
now -- we'd probably want to pull whatever CI fixes are necessary for
OpenSBI before the bump either way, just to avoid a history breakage, so
I figure this doesn't hurt anything.

If this doesn't process then no big deal on my end, there's some more
stuff floating around.

----------------------------------------------------------------
Alistair Francis (1):
      MAINTAINERS: Add some RISC-V reviewers

Daniel Henrique Barboza (4):
      hw/riscv: handle 32 bit CPUs kernel_entry in riscv_load_kernel()
      hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
      hw/riscv/boot.c: make riscv_load_initrd() static
      target/riscv: avoid env_archcpu() in cpu_get_tb_cpu_state()

Frank Chang (1):
      target/riscv: Remove privileged spec version restriction for RVV

Himanshu Chauhan (1):
      target/riscv: Smepmp: Skip applying default rules when address matches

LIU Zhiwei (1):
      target/riscv: Fix vslide1up.vf and vslide1down.vf

 MAINTAINERS                  |  3 ++
 hw/riscv/boot.c              | 97 ++++++++++++++++++++++++++++----------------
 hw/riscv/microchip_pfsoc.c   | 12 +-----
 hw/riscv/opentitan.c         |  4 +-
 hw/riscv/sifive_e.c          |  4 +-
 hw/riscv/sifive_u.c          | 12 +-----
 hw/riscv/spike.c             | 14 ++-----
 hw/riscv/virt.c              | 12 +-----
 include/hw/riscv/boot.h      |  3 +-
 target/riscv/cpu.c           |  2 +-
 target/riscv/cpu_helper.c    |  2 +-
 target/riscv/csr.c           | 21 ++++------
 target/riscv/pmp.c           |  9 ++--
 target/riscv/vector_helper.c |  4 +-
 14 files changed, 98 insertions(+), 101 deletions(-)


