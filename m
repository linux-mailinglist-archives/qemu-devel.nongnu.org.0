Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC894D10DC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:24:04 +0100 (CET)
Received: from localhost ([::1]:55618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUCR-0007tW-RG
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:24:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8l-000514-49
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:15 -0500
Received: from [2607:f8b0:4864:20::435] (port=35665
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8h-00063F-Dc
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:13 -0500
Received: by mail-pf1-x435.google.com with SMTP id a5so5014452pfv.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g5THbsHysAyapGxVmXfdy1fXukBYP1v1QKzSVEDTKJ8=;
 b=pnRskPXBjlnfWaQYsEjRWcMDopRQMz3n/sUcpSsa3OrXkOSUCNDYu10djFV4vWoyRt
 BZ/QgdhsHK93kmlRf0fgPqN32ZBDykwMBGFPLBpXEf4wR5btn2VkM5j7oDr9Ipj+9rZY
 SM9dITQT7tvtqR8foA0cS9IAP7vAg6Ebte6XS0Dl9B2gDxKBJNzbdfKR8BOi7A4QTD4W
 vEIfOnyqgQlN2XOAGaGdhYy4I628/qRdBIbH0N3w6SPGmeVPIAp3uBEsZSDiwdIKkUoX
 mX6Qh5ddTMUVUuZv1L+3TNfQbumcTQjSZTDo0DxfGjafYpTca98jtY6FUH5X1qu5P+mf
 UveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g5THbsHysAyapGxVmXfdy1fXukBYP1v1QKzSVEDTKJ8=;
 b=JxwCt385eVEEiP7vwwWjoj40AGLJ5knDltwfBTDJcMiRnzKwglmmJ/Ya0floo/DHTE
 3jW+gn/x2+yobUDxcRsWyM8g7kj42Qf7rGw6xpzZCcm8TlPioqBSCup8AaUsGEX2o+VA
 jM/AXDFsOGrKQGP4Ac2kquh6WNyaw7IQ64doXFV0PDvNVaXcCvIMX9KXrYWzsJnRRwQe
 zQ+vC9f/hlmJVPMKxGp8JtMxAXpCiHNJGAA2XJXnO+WHBW89i6Aku9frwOfAtSxhtsaj
 2jTxbaNRTI4P5Ofn2I8e7ov5q3OBqUc/LUONOA3vA4yGKAozV3Q2xRiFTe2TI6RnC103
 Eiwg==
X-Gm-Message-State: AOAM530QSNJAKk1tVKC5TjVedv5UPeizZ4BtkOSw9EGhd/XkouV7pOZg
 JArvL4pudA8yg6BVRnGXY8HmICiSjUISyg==
X-Google-Smtp-Source: ABdhPJwDlInAaq5y/cgbKaRhGCOrSGulWpJ1BjmLh9+Ir1v0Sc5cfiB1cxd73OFn0ZmsBhPZYxAf9Q==
X-Received: by 2002:a05:6a00:1694:b0:4e1:9050:1e19 with SMTP id
 k20-20020a056a00169400b004e190501e19mr16838426pfc.72.1646724009099; 
 Mon, 07 Mar 2022 23:20:09 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/33] target/nios2: Shadow register set, EIC and VIC
Date: Mon,  7 Mar 2022 21:19:32 -1000
Message-Id: <20220308072005.307955-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Amir,

I've done a bunch of cleanup which Peter and I had recommended
during review.  The major bits are:

* Note reserved bits of control registers, which may include
  the entire control register.
* Complete conversion to registerfields.h.
* Use pointer to shadow register set, akin to Sparc windows.
* Use -M 10m50-ghrd,vic=on to enable VIC.

I can test this to a point, but not the final result.
It works to a point with our existing nios2 kernels,
but of course no interrupts are received. So it verifies
that something changes, and that the init doesn't crash,
but that's about it.


r~


Amir Gonnen (5):
  target/nios2: Check supervisor on eret
  target/nios2: Add NUM_GP_REGS and NUM_CP_REGS
  target/nios2: Split out helper for eret instruction
  hw/intc: Vectored Interrupt Controller (VIC)
  hw/nios2: Machine with a Vectored Interrupt Controller

Richard Henderson (28):
  target/nios2: Stop generating code if gen_check_supervisor fails
  target/nios2: Split PC out of env->regs[]
  target/nios2: Do not create TCGv for control registers
  linux-user/nios2: Trim target_pc_regs to sp and pc
  target/nios2: Remove cpu_interrupts_enabled
  target/nios2: Split control registers away from general registers
  target/nios2: Clean up nios2_cpu_dump_state
  target/nios2: Use hw/registerfields.h for CR_STATUS fields
  target/nios2: Use hw/registerfields.h for CR_EXCEPTION fields
  target/nios2: Use hw/registerfields.h for CR_TLBADDR fields
  target/nios2: Use hw/registerfields.h for CR_TLBACC fields
  target/nios2: Use hw/registerfields.h for CR_TLBMISC fields
  target/nios2: Move R_FOO and CR_BAR into enumerations
  target/nios2: Prevent writes to read-only or reserved control fields
  target/nios2: Implement cpuid
  target/nios2: Implement CR_STATUS.RSIE
  target/nios2: Remove CPU_INTERRUPT_NMI
  target/nios2: Use tcg_constant_tl
  target/nios2: Introduce dest_gpr
  target/nios2: Drop CR_STATUS_EH from tb->flags
  target/nios2: Introduce shadow register sets
  target/nios2: Implement rdprs, wrprs
  target/nios2: Update helper_eret for shadow registers
  target/nios2: Create EXCP_SEMIHOST for semi-hosting
  target/nios2: Clean up nios2_cpu_do_interrupt
  target/nios2: Implement EIC interrupt processing
  hw/nios2: Introduce Nios2MachineState
  hw/nios2: Move memory regions into Nios2Machine

 linux-user/nios2/target_syscall.h |  25 +-
 target/nios2/cpu.h                | 253 ++++++++++++------
 target/nios2/helper.h             |   3 +
 hw/intc/nios2_vic.c               | 341 ++++++++++++++++++++++++
 hw/nios2/10m50_devboard.c         | 118 +++++++--
 hw/nios2/boot.c                   |   8 +-
 linux-user/elfload.c              |   5 +-
 linux-user/nios2/cpu_loop.c       |  39 +--
 linux-user/nios2/signal.c         |   6 +-
 target/nios2/cpu.c                | 194 +++++++++++---
 target/nios2/helper.c             | 218 +++++++--------
 target/nios2/mmu.c                |  73 +++---
 target/nios2/nios2-semi.c         |  13 +-
 target/nios2/op_helper.c          |  39 +++
 target/nios2/translate.c          | 422 +++++++++++++++++++-----------
 hw/intc/Kconfig                   |   3 +
 hw/intc/meson.build               |   1 +
 hw/nios2/Kconfig                  |   1 +
 18 files changed, 1223 insertions(+), 539 deletions(-)
 create mode 100644 hw/intc/nios2_vic.c

-- 
2.25.1


