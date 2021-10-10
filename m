Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29B34282B4
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 19:48:33 +0200 (CEST)
Received: from localhost ([::1]:59850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZcw2-0003Ie-N8
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 13:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcro-0000Sh-Pv
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:10 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcrn-0005mq-5R
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:08 -0400
Received: by mail-pg1-x52e.google.com with SMTP id s11so8603328pgr.11
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 10:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=issvR+5Tb5pYCgV3cOo6EeKof5gpcpR/vqySCKb4w1c=;
 b=q+raBKjOuOzk/BE1lmXMdCSlTX4qjaMESQBx2QRNu37eY+/zDcNC1BA7RJLI9sluQV
 INnWJWkC+z8OPaw3sTyp7nQQWhdu3ln/PQky3ihVCIWi6ibun51Fr8mDx91NKsIRjBOb
 KyUO8z5FFoco7h4uf84uThqei4rXRWp/mZtJ8U0o8EKELElZJL4AH0ZBsjSnr3u29oDf
 8ccacVmLxSJkU8OUxpiavC1eLAXvsjPx6fnfs3ZbexNyEY1U0hnKAbUwEY0QrP0zqCB3
 JCeJnHnIn7IcKyTK+IP5xdVtHFNLh6X1goEDwevz8bXlnBu4rlEAgPNqTHOn7Kiu3cMC
 mLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=issvR+5Tb5pYCgV3cOo6EeKof5gpcpR/vqySCKb4w1c=;
 b=LnxQJSU3nfLhjQJuYCswNdSd6IXvIj20ByM3d+e/mi5OheUVzLwPmMmE1xxCywDE7W
 rclf6HvvWy67HlfKJmvUNbFuZ2+okhhb67GVzC3+oEAtU2ONlAuEHvvmnwByEOp+gU4B
 Egw1ILmeaHKY/E46ctQ+qV8zEA/09ImJpj7Da3EnPz1DnjBddBoRfvoAUS9NmcWYBFlp
 ePigaGqOHUTzvXzrHDGpwhPsdFDo8pvKWgNje/D5y3l/GpcTFwZkPIgoq6pBURmdMnyk
 3j+CW35fLg7Bns1HrEN8pRecNVvkDZz4ItAHH0EjTdcIIgs05uiAEHkvPLocl+Dae9Q7
 HP+w==
X-Gm-Message-State: AOAM532kiGAqbh8fRAZrsoS3PCXU//1hz2srrcr4SvI8wsPvbPGb3mx+
 KtYtOPRdjSl6SYSeO5He0uA9PTxA5v/wo1YZ
X-Google-Smtp-Source: ABdhPJzheRp+xMRNl96ll3LNPEjVKAJCzOLQgiC3OCk85x34FA8OjKtztm85wI/F4nKA3928+PtrLQ==
X-Received: by 2002:a05:6a00:b96:b0:44c:65df:2760 with SMTP id
 g22-20020a056a000b9600b0044c65df2760mr21292569pfj.3.1633887845070; 
 Sun, 10 Oct 2021 10:44:05 -0700 (PDT)
Received: from localhost.localdomain (068-185-026-038.biz.spectrum.com.
 [68.185.26.38])
 by smtp.gmail.com with ESMTPSA id 18sm5095391pfh.115.2021.10.10.10.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 10:44:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] tcg: support 32-bit guest addresses as signed
Date: Sun, 10 Oct 2021 10:43:53 -0700
Message-Id: <20211010174401.141339-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have 2, and nearly 3, hosts that naturally produce sign-extended
values, and have to work extra hard (with 1 or 2 insns) to produce
the zero-extended address that we expect today.

However, it's a simple matter of arithmetic for the middle-end to
require sign-extended addresses instead.  For user-only, we do have
to be careful not to allow a guest object to wrap around the signed
boundary, but that's fairly easily done.

Tested with aarch64, as that's the best hw currently available.


r~


Richard Henderson (8):
  tcg: Add TCG_TARGET_SIGNED_ADDR32
  accel/tcg: Split out g2h_tlbe
  accel/tcg: Support TCG_TARGET_SIGNED_ADDR32 for softmmu
  accel/tcg: Add guest_base_signed_addr32 for user-only
  linux-user: Support TCG_TARGET_SIGNED_ADDR32
  tcg/aarch64: Support TCG_TARGET_SIGNED_ADDR32
  target/mips: Support TCG_TARGET_SIGNED_ADDR32
  target/riscv: Support TCG_TARGET_SIGNED_ADDR32

 include/exec/cpu-all.h        | 20 ++++++++---
 include/exec/cpu_ldst.h       |  3 +-
 tcg/aarch64/tcg-target-sa32.h |  7 ++++
 tcg/arm/tcg-target-sa32.h     |  1 +
 tcg/i386/tcg-target-sa32.h    |  1 +
 tcg/mips/tcg-target-sa32.h    |  9 +++++
 tcg/ppc/tcg-target-sa32.h     |  1 +
 tcg/riscv/tcg-target-sa32.h   |  5 +++
 tcg/s390x/tcg-target-sa32.h   |  1 +
 tcg/sparc/tcg-target-sa32.h   |  1 +
 tcg/tci/tcg-target-sa32.h     |  1 +
 accel/tcg/cputlb.c            | 36 +++++++++++++------
 bsd-user/main.c               |  4 +++
 linux-user/elfload.c          | 62 +++++++++++++++++++++++++-------
 linux-user/main.c             |  3 ++
 tcg/aarch64/tcg-target.c.inc  | 68 ++++++++++++++++++++++-------------
 tcg/mips/tcg-target.c.inc     | 13 ++-----
 tcg/riscv/tcg-target.c.inc    |  8 ++---
 18 files changed, 176 insertions(+), 68 deletions(-)
 create mode 100644 tcg/aarch64/tcg-target-sa32.h
 create mode 100644 tcg/arm/tcg-target-sa32.h
 create mode 100644 tcg/i386/tcg-target-sa32.h
 create mode 100644 tcg/mips/tcg-target-sa32.h
 create mode 100644 tcg/ppc/tcg-target-sa32.h
 create mode 100644 tcg/riscv/tcg-target-sa32.h
 create mode 100644 tcg/s390x/tcg-target-sa32.h
 create mode 100644 tcg/sparc/tcg-target-sa32.h
 create mode 100644 tcg/tci/tcg-target-sa32.h

-- 
2.25.1


