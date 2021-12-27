Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF3847FE0B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 16:03:53 +0100 (CET)
Received: from localhost ([::1]:55038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1rXU-0008Eu-Go
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 10:03:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1rVF-0005fj-1U
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:01:33 -0500
Received: from [2607:f8b0:4864:20::102c] (port=46877
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1rVC-0000jw-O2
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:01:32 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so14518978pjb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 07:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wDu91BB9NQDcOjL3wsvEpspth618U8RiGW+GYPNUoNY=;
 b=JWHM+q5+zHmSOp1fETBf7FQRgIkX8moQbzZPdg+kHm+zd8jlywlvw3UxKMIOsZBDTT
 Yjm0xDcnRw3T5XpimMD1jA276NId4jJ9FxwXdk/8lAhdQqBjpcJvWQ6IxaaFlYqQwSV/
 kI0/nnNl3h0PqNVEDGFSGHPaUBXS9REQ63JkR+Li4iKecjMD9GM5jCGvfk06ZAMO7kHB
 FIcGDCCXtZtZOlqDYPw8MlIky8ZUrpf91TDfv56/OFZKaLqPE8JXWQpve63VEYuxZacc
 NBZK+PrQ77BuN8mAEqxRHO8ESVFLmUWdh8Qb5zODLZXdeJx9g2ouHuvIWLlcGV76DnU3
 Tfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wDu91BB9NQDcOjL3wsvEpspth618U8RiGW+GYPNUoNY=;
 b=41vcLpK/d4qUh5pMMWBMpAv/DFMe4FrtjPo5abnxbssfEkQosbfyYFJgnlZumyS1bM
 V+3VYCZq+18psSidQBvu3xmbwQTKpIJBjsN0XAobhBjNC4sXNnJa25JCZyvC5YcchO/j
 1KO9/ajqLSPYO3Q6No4x8tL/1PqwfGQA5YlaaukdkDrfyklkcRprt3eSoTS1DePyd/YE
 k1DteRrw+N5dKyCbboE8hZlEePp0NABCBYS7ch13audRckUULf4bVUI3PYOHo3FRpL/9
 ikBS3tlh/6Ksu2IZYZ5tDijF3RnB9twZcqoLUcOEyPTsn73ii+I2k4kIVmbx3M6UrDZu
 yAAQ==
X-Gm-Message-State: AOAM531hJ+WEfUXoVxEYqtDvz90kxj9Vljrur2ni0/xA13st06nhuXhb
 K5li8tA4XOCw+vx/Ad1Ccv6Y5TH2fL0O0A==
X-Google-Smtp-Source: ABdhPJx2NonLi3wt+qd1ny718AUY07RGie0xCb+CWfGaEJsDhpkBeOK7Zf11zvEFYMaDSVCidxdZhA==
X-Received: by 2002:a17:902:7d8f:b0:149:52a3:2ebe with SMTP id
 a15-20020a1709027d8f00b0014952a32ebemr17228030plm.140.1640617288260; 
 Mon, 27 Dec 2021 07:01:28 -0800 (PST)
Received: from localhost.localdomain (76-14-210-194.or.wavecable.com.
 [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id m13sm14756743pgt.22.2021.12.27.07.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 07:01:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] linux-user: prctl improvements
Date: Mon, 27 Dec 2021 07:01:21 -0800
Message-Id: <20211227150127.2659293-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is split out from a larger patch set for unaligned accesses.
The changes in target/ have no effect without the changes in tcg/,
but this allows the syscall to be handled separately.

Changes for v2:
  * Added LOG_UNIMP to the default case.
  * Use MO_ALIGN instead of 0 for target/sh.


r~


Richard Henderson (6):
  linux-user: Split out do_prctl and subroutines
  linux-user: Disable more prctl subcodes
  linux-user: Add code for PR_GET/SET_UNALIGN
  target/alpha: Implement prctl_unalign_sigbus
  target/hppa: Implement prctl_unalign_sigbus
  target/sh4: Implement prctl_unalign_sigbus

 include/hw/core/cpu.h                     |   3 +
 linux-user/aarch64/target_prctl.h         | 160 +++++++
 linux-user/aarch64/target_syscall.h       |  23 -
 linux-user/alpha/target_prctl.h           |   1 +
 linux-user/arm/target_prctl.h             |   1 +
 linux-user/cris/target_prctl.h            |   1 +
 linux-user/generic/target_prctl_unalign.h |  27 ++
 linux-user/hexagon/target_prctl.h         |   1 +
 linux-user/hppa/target_prctl.h            |   1 +
 linux-user/i386/target_prctl.h            |   1 +
 linux-user/m68k/target_prctl.h            |   1 +
 linux-user/microblaze/target_prctl.h      |   1 +
 linux-user/mips/target_prctl.h            |  88 ++++
 linux-user/mips/target_syscall.h          |   6 -
 linux-user/mips64/target_prctl.h          |   1 +
 linux-user/mips64/target_syscall.h        |   6 -
 linux-user/nios2/target_prctl.h           |   1 +
 linux-user/openrisc/target_prctl.h        |   1 +
 linux-user/ppc/target_prctl.h             |   1 +
 linux-user/riscv/target_prctl.h           |   1 +
 linux-user/s390x/target_prctl.h           |   1 +
 linux-user/sh4/target_prctl.h             |   1 +
 linux-user/sparc/target_prctl.h           |   1 +
 linux-user/x86_64/target_prctl.h          |   1 +
 linux-user/xtensa/target_prctl.h          |   1 +
 target/alpha/cpu.h                        |   5 +
 target/hppa/cpu.h                         |   5 +-
 target/sh4/cpu.h                          |   4 +
 cpu.c                                     |  20 +-
 linux-user/syscall.c                      | 494 +++++++++-------------
 target/alpha/translate.c                  |  31 +-
 target/hppa/translate.c                   |  19 +-
 target/sh4/translate.c                    |  50 ++-
 33 files changed, 604 insertions(+), 355 deletions(-)
 create mode 100644 linux-user/aarch64/target_prctl.h
 create mode 100644 linux-user/alpha/target_prctl.h
 create mode 100644 linux-user/arm/target_prctl.h
 create mode 100644 linux-user/cris/target_prctl.h
 create mode 100644 linux-user/generic/target_prctl_unalign.h
 create mode 100644 linux-user/hexagon/target_prctl.h
 create mode 100644 linux-user/hppa/target_prctl.h
 create mode 100644 linux-user/i386/target_prctl.h
 create mode 100644 linux-user/m68k/target_prctl.h
 create mode 100644 linux-user/microblaze/target_prctl.h
 create mode 100644 linux-user/mips/target_prctl.h
 create mode 100644 linux-user/mips64/target_prctl.h
 create mode 100644 linux-user/nios2/target_prctl.h
 create mode 100644 linux-user/openrisc/target_prctl.h
 create mode 100644 linux-user/ppc/target_prctl.h
 create mode 100644 linux-user/riscv/target_prctl.h
 create mode 100644 linux-user/s390x/target_prctl.h
 create mode 100644 linux-user/sh4/target_prctl.h
 create mode 100644 linux-user/sparc/target_prctl.h
 create mode 100644 linux-user/x86_64/target_prctl.h
 create mode 100644 linux-user/xtensa/target_prctl.h

-- 
2.25.1


