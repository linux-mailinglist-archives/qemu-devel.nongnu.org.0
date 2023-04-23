Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C166EBE80
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 12:21:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqWp6-0004BQ-D3; Sun, 23 Apr 2023 06:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWp3-0004Av-Sq
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:19:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWp0-0003Du-66
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:19:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f87c5b4635so3097585f8f.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 03:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682245192; x=1684837192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=oiNWjyvzKChuVCr8SZ0fUGGrR13egl7kuF+OiofHRqc=;
 b=UBHKuxxxef2bzvEwgLwbhaFplZucgcldpp39L6e86x0TG9fePQSZFMnkUPZCnzdjBN
 Pd1FQlQ/14vpVH/epsAdNA1+CcDAADEt6mTaZl4AtFfOEKVkHoJAfzMOdL729kl1fgH8
 WIOSNjT22Ovqvs3nABo5b0Yaf07QZmMemah3RrwrBuy/U+7hXKBHiXTxnWShIqJQRV0n
 ah+237q3Vc6nhEd2TWMN38BZGICuU4wHqYACBhYzNak3UJ/IQAlZdl1sxOOQh+6A+DO2
 yFfjsi94/3f2ndnOHJOFwWERNEwIFL+/kO+r981PLQpl6ZKbVRXJlakb5V3FD+yxEU6X
 IFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682245192; x=1684837192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oiNWjyvzKChuVCr8SZ0fUGGrR13egl7kuF+OiofHRqc=;
 b=PB7h02lXhoG1G7h7ZTv6V0LDVnAxeLcjxrn9Cmo8caiEBC2DbegB/9OWw/FsOH8UeX
 zUJm26/v1++bDzGFEWNs8+GS6rOn2+cHLdiKIfInLVw6yYRPTnN3aJkpBDJlCCqoWgP3
 dY+Vjic/MvyvzTNuK7QDMLcqQTGeJLfjFRspiufcEFjIUEn09m5L68TDG0gyCzbFD2iR
 cLhrpCF1XKLWCkvKnqhzbVAF3aScQpr7NoZVCffGxTgeL/KRlRGxKTikVeJxvgdqD4/e
 S5bNg5A1jw1PaIIhAvufazCRVp4ZqXJJaEEbHN/CHP3PnvEflDnzsTd9N6PQLzgzbkLG
 o7SQ==
X-Gm-Message-State: AAQBX9drqDF4LLYuQEhDEsvRp9fh+RS7dERQyLwBwipKHP0O9ttRoZIP
 i4JtE0S8MtqVBfkFA1+97E4nFni479Mq+kS5vOrYkg==
X-Google-Smtp-Source: AKy350bynGwuIfzLUck6Nloe47cnrj1DU8OYd3T7VT6ofnsQxEut2aMrX379s7WT4eoMXDSYIAWnsg==
X-Received: by 2002:a5d:6748:0:b0:2fe:d52:7ff1 with SMTP id
 l8-20020a5d6748000000b002fe0d527ff1mr7723892wrw.29.1682245191816; 
 Sun, 23 Apr 2023 03:19:51 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f080b2f9f4sm12550541wmk.27.2023.04.23.03.19.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 03:19:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/15] tcg patch queue
Date: Sun, 23 Apr 2023 11:19:35 +0100
Message-Id: <20230423101950.817899-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Merge the first set of reviewed patches from my queue.

r~

The following changes since commit 6dd06214892d71cbbdd25daed7693e58afcb1093:

  Merge tag 'pull-hex-20230421' of https://github.com/quic/qemu into staging (2023-04-22 08:31:38 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230423

for you to fetch changes up to 3ea9be33400f14305565a9a094cb6031c07183d5:

  tcg/riscv: Conditionalize tcg_out_exts_i32_i64 (2023-04-23 08:46:45 +0100)

----------------------------------------------------------------
tcg cleanups:
  - Remove tcg_abort()
  - Split out extensions as known backend interfaces
  - Put the separate extensions together as tcg_out_movext
  - Introduce tcg_out_xchg as a backend interface
  - Clear TCGLabelQemuLdst on allocation
  - Avoid redundant extensions for riscv

----------------------------------------------------------------
Richard Henderson (15):
      tcg: Replace if + tcg_abort with tcg_debug_assert
      tcg: Replace tcg_abort with g_assert_not_reached
      tcg: Split out tcg_out_ext8s
      tcg: Split out tcg_out_ext8u
      tcg: Split out tcg_out_ext16s
      tcg: Split out tcg_out_ext16u
      tcg: Split out tcg_out_ext32s
      tcg: Split out tcg_out_ext32u
      tcg: Split out tcg_out_exts_i32_i64
      tcg: Split out tcg_out_extu_i32_i64
      tcg: Split out tcg_out_extrl_i64_i32
      tcg: Introduce tcg_out_movext
      tcg: Introduce tcg_out_xchg
      tcg: Clear TCGLabelQemuLdst on allocation
      tcg/riscv: Conditionalize tcg_out_exts_i32_i64

 include/tcg/tcg.h                |   6 --
 target/i386/tcg/translate.c      |  20 +++---
 target/s390x/tcg/translate.c     |   4 +-
 tcg/optimize.c                   |  10 ++-
 tcg/tcg.c                        | 135 +++++++++++++++++++++++++++++++++++----
 tcg/aarch64/tcg-target.c.inc     | 106 +++++++++++++++++++-----------
 tcg/arm/tcg-target.c.inc         |  93 +++++++++++++++++----------
 tcg/i386/tcg-target.c.inc        | 129 ++++++++++++++++++-------------------
 tcg/loongarch64/tcg-target.c.inc | 123 +++++++++++++----------------------
 tcg/mips/tcg-target.c.inc        |  94 +++++++++++++++++++--------
 tcg/ppc/tcg-target.c.inc         | 119 ++++++++++++++++++----------------
 tcg/riscv/tcg-target.c.inc       |  83 +++++++++++-------------
 tcg/s390x/tcg-target.c.inc       | 128 +++++++++++++++++--------------------
 tcg/sparc64/tcg-target.c.inc     | 117 +++++++++++++++++++++------------
 tcg/tcg-ldst.c.inc               |   1 +
 tcg/tci/tcg-target.c.inc         | 116 ++++++++++++++++++++++++++++++---
 16 files changed, 786 insertions(+), 498 deletions(-)

