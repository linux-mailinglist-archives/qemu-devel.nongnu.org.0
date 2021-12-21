Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA9E47C8CA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 22:27:07 +0100 (CET)
Received: from localhost ([::1]:49038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzmf3-0002TE-Bn
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 16:27:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzme6-0001MQ-TX
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 16:26:07 -0500
Received: from [2607:f8b0:4864:20::52d] (port=38638
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzme2-0000eE-TB
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 16:26:06 -0500
Received: by mail-pg1-x52d.google.com with SMTP id y9so183103pgj.5
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 13:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4CnuJEAhPOJ2tRPMTqrKIFD0TxNhxkGVNj3b5ysbi6M=;
 b=LZ+fbQuBENnZ/vipxZR5T8t2UZgDg/s9EvhZ2n8/EnEVw++W0yc6VDSjS7v1y85ulf
 5Mt4oP7svZ44nGT0uaTV6J15iWmO5+brVeZxZAnxjFVy7uK7hyfCDFuFqqiod7CMjey6
 J1zaRkxw8PeCV7HATOSFAuRbiKgLdJAcRQyP/sRMSxKIHEG91v2O3ffLL2YBmvXwjiMN
 2MRrBRK7YtGHnVYQTANAMNWQiJ4YMVHeDhRVSu9yjngbXWr0WZwb3r1+OnU/IISaeyR/
 IgCQaV71gSpVLB9fFwc1wXj1A+vufMetnYg4hathT31g6eWyjOEU94MpTSYhXuXNDJGj
 lvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4CnuJEAhPOJ2tRPMTqrKIFD0TxNhxkGVNj3b5ysbi6M=;
 b=d1QEremYE+hdiUgs1xEtwZu4ZcTy/zz36p2OMlic9z3KPv4JOQiptV+s8mpY57DFxp
 TeaaZYP4p4/2cqTLfeGSQVlCTq2F6tuhAPvroKjxNK/bOob8OsZ/nuBUvJhP/pblfMgn
 /L/H9KzgneBvM6CE8Rtp3QTKfnY+cdF2zvQyM6zaHLnPdc9RBFSQL0R5akCaHFOfE2vM
 tx5Qy5qUagfxdNIIeo27GqULRstBtVKhS2S9rldt3omCmubHyBO4cc6ra0MzqfPPlNwY
 dUYXohzPCDVDmQwEkjbrcFXRyOZTQbYNEc7/LEqmq3cOqJhBNQbRQJCAZyzOVsbJDSDY
 dXFA==
X-Gm-Message-State: AOAM531qMD0GIkbY/iYQ6j6oae9RoBB5Z1816bbeTWc7TshRLyVfrqkT
 F7IvIJDbt8sKcTmXpYze5SoVJmuX0yl0rQ==
X-Google-Smtp-Source: ABdhPJzp28Tnc0V2q1kDY6KLJpGYltkoqZ1d6mHxS/Wbv0RndaSW4qkhXjwf8EdM8jNQG+Jf3QfdRQ==
X-Received: by 2002:a63:2b05:: with SMTP id r5mr227474pgr.0.1640121961103;
 Tue, 21 Dec 2021 13:26:01 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id w184sm28391pfw.218.2021.12.21.13.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 13:26:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/30] tcg/loongarch64: New tcg backend
Date: Tue, 21 Dec 2021 13:25:58 -0800
Message-Id: <20211221212558.1835038-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: git@xen0n.name
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Version 2: Dropped patch 31, the gitlab-ci change:

Found errors in your .gitlab-ci.yml:
'cross-loongarch64-system' job needs 'loongarch64-cross-container' job
but 'loongarch64-cross-container' is not in any previous stage
'cross-loongarch64-user' job needs 'loongarch64-cross-container' job
but 'loongarch64-cross-container' is not in any previous stage


r~


The following changes since commit 5316e12bb2b4408a1597b283ef4bb4794dd7b4f7:

  Merge tag 'dbus-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2021-12-21 08:00:26 -0800)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-loong-20211221-2

for you to fetch changes up to dfcf900ba67040ea9aa839aa38b33b4c091721d8:

  configure, meson.build: Mark support for loongarch64 hosts (2021-12-21 13:17:06 -0800)

----------------------------------------------------------------
Initial commit of tcg/loongarch64

----------------------------------------------------------------
WANG Xuerui (30):
      elf: Add machine type value for LoongArch
      MAINTAINERS: Add tcg/loongarch64 entry with myself as maintainer
      tcg/loongarch64: Add the tcg-target.h file
      tcg/loongarch64: Add generated instruction opcodes and encoding helpers
      tcg/loongarch64: Add register names, allocation order and input/output sets
      tcg/loongarch64: Define the operand constraints
      tcg/loongarch64: Implement necessary relocation operations
      tcg/loongarch64: Implement the memory barrier op
      tcg/loongarch64: Implement tcg_out_mov and tcg_out_movi
      tcg/loongarch64: Implement goto_ptr
      tcg/loongarch64: Implement sign-/zero-extension ops
      tcg/loongarch64: Implement not/and/or/xor/nor/andc/orc ops
      tcg/loongarch64: Implement deposit/extract ops
      tcg/loongarch64: Implement bswap{16,32,64} ops
      tcg/loongarch64: Implement clz/ctz ops
      tcg/loongarch64: Implement shl/shr/sar/rotl/rotr ops
      tcg/loongarch64: Implement add/sub ops
      tcg/loongarch64: Implement mul/mulsh/muluh/div/divu/rem/remu ops
      tcg/loongarch64: Implement br/brcond ops
      tcg/loongarch64: Implement setcond ops
      tcg/loongarch64: Implement tcg_out_call
      tcg/loongarch64: Implement simple load/store ops
      tcg/loongarch64: Add softmmu load/store helpers, implement qemu_ld/qemu_st ops
      tcg/loongarch64: Implement tcg_target_qemu_prologue
      tcg/loongarch64: Implement exit_tb/goto_tb
      tcg/loongarch64: Implement tcg_target_init
      tcg/loongarch64: Register the JIT
      common-user: Add safe syscall handling for loongarch64 hosts
      linux-user: Implement CPU-specific signal handler for loongarch64 hosts
      configure, meson.build: Mark support for loongarch64 hosts

 configure                                       |    5 +
 meson.build                                     |    2 +-
 include/elf.h                                   |    2 +
 linux-user/host/loongarch64/host-signal.h       |   87 ++
 tcg/loongarch64/tcg-target-con-set.h            |   31 +
 tcg/loongarch64/tcg-target-con-str.h            |   28 +
 tcg/loongarch64/tcg-target.h                    |  180 +++
 tcg/loongarch64/tcg-insn-defs.c.inc             |  979 +++++++++++++
 tcg/loongarch64/tcg-target.c.inc                | 1677 +++++++++++++++++++++++
 MAINTAINERS                                     |    5 +
 common-user/host/loongarch64/safe-syscall.inc.S |   90 ++
 11 files changed, 3085 insertions(+), 1 deletion(-)
 create mode 100644 linux-user/host/loongarch64/host-signal.h
 create mode 100644 tcg/loongarch64/tcg-target-con-set.h
 create mode 100644 tcg/loongarch64/tcg-target-con-str.h
 create mode 100644 tcg/loongarch64/tcg-target.h
 create mode 100644 tcg/loongarch64/tcg-insn-defs.c.inc
 create mode 100644 tcg/loongarch64/tcg-target.c.inc
 create mode 100644 common-user/host/loongarch64/safe-syscall.inc.S

