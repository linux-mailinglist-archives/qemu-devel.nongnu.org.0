Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFF1390C8D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:00:17 +0200 (CEST)
Received: from localhost ([::1]:59082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llg24-0005Oc-9J
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0N-0002XM-TK
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:31 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:37612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0D-0004ma-Bg
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:31 -0400
Received: by mail-pg1-x52e.google.com with SMTP id t193so23956182pgb.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 15:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VduqsqOC/yk2t9Dar2PD6vtb7T2o9BkDw/NGRdbLG/c=;
 b=VTUbtYV0iXVS1OG8nL01Kaa4IVJnKkUyXG0vwc9pq66+LmoVvUpprC+gHirmqv5QWp
 jZ9Um6QvqrYYYw4Xev0I3GkgUwqr8ZVr0TLQ0d96M9abXnEvyfLMOrvDPwH/JHn+5J+8
 KnMzs9VQYasjdFZCOp+3JyXjyO8nNwGQtP+PmVpynu6xR07ipzHZXesnoM6m69tB5OG3
 yMmiFSs101djD+zfJKVVFiwZ14ByJgUeC9OFrAOrbyjlauZKOkVptOFeE/RwZ6FiysVY
 I85GPnji4klVM9tBzM/yOp1hA0qKeE9NKc+lxBC0aDIu4dEVmSKsPln2izvE6KAtgjRc
 MtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VduqsqOC/yk2t9Dar2PD6vtb7T2o9BkDw/NGRdbLG/c=;
 b=OLGPcagMK/lIrM3T/D0U45Ll2h0Ete1eGeRqKMqNot9hzUXxarYsv9+/sc5UiffnWN
 IbIxqoPNQTbx1HubLrveqpsAYVmywl1kQwbdHK28AjMruj8ll8GTha2GKeY2K6nqLIRC
 iLg6vZRimrmELC4dE5xA2D+9yryZuhg3BCjYHw4QHhC7ThXwGsXKyHjOTJOuaf46OHes
 y3z5GADsVw0wN3qCfbTg2j747Y8t5xVFf+5Osg3JUPxjkiDe7HEE4fzvoySWnLZkKmTt
 dgfyL82ScjxnBSNkqkXyOa3ahaKWGlWKg/GAv3nbNj5J+nqOUrhzFgLIqbkY5rRgF/A2
 OGJw==
X-Gm-Message-State: AOAM533b43jwb+J/10cVKHpasId/vRLRk9EwvwyI7h1hqlVXYbquX5js
 cN8pyTSCryKpT5TXcJKmAXM7Ueih/4GtdA==
X-Google-Smtp-Source: ABdhPJzVRCmhLG1Yl+Zk0R7KP8DkzkyV1KwPwW8jv8qYuMymPlb91GNr/yor3jKy64kAarVi1gDsbw==
X-Received: by 2002:a63:1d61:: with SMTP id d33mr21366640pgm.331.1621983498522; 
 Tue, 25 May 2021 15:58:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/12] target/arm: Implement BFloat16
Date: Tue, 25 May 2021 15:58:05 -0700
Message-Id: <20210525225817.400336-1-richard.henderson@linaro.org>
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Whee!  All prerequisites are now merged.

Patches missing r-b:

  05-softfpu-Add-float_round_to_odd_inf.patch
  06-target-arm-Implement-bfloat16-dot-product-vector.patch
  07-target-arm-Implement-bfloat16-dot-product-indexed.patch
  11-linux-user-aarch64-Enable-hwcap-bits-for-bfloat16.patch
  12-target-arm-Enable-BFloat16-extensions.patch

Per the question of whether additional checks vs VFP or NEON
are required, I have disabled BF16 when either VFP or NEON are
also disabled.  Which seems like a similarly reasonable choice.


r~


Richard Henderson (12):
  target/arm: Add isar_feature_{aa32,aa64,aa64_sve}_bf16
  target/arm: Unify unallocated path in disas_fp_1src
  target/arm: Implement scalar float32 to bfloat16 conversion
  target/arm: Implement vector float32 to bfloat16 conversion
  softfpu: Add float_round_to_odd_inf
  target/arm: Implement bfloat16 dot product (vector)
  target/arm: Implement bfloat16 dot product (indexed)
  target/arm: Implement bfloat16 matrix multiply accumulate
  target/arm: Implement bfloat widening fma (vector)
  target/arm: Implement bfloat widening fma (indexed)
  linux-user/aarch64: Enable hwcap bits for bfloat16
  target/arm: Enable BFloat16 extensions

 include/fpu/softfloat-types.h |   4 +-
 target/arm/cpu.h              |  15 ++++
 target/arm/helper-sve.h       |   4 +
 target/arm/helper.h           |  15 ++++
 target/arm/neon-dp.decode     |   1 +
 target/arm/neon-shared.decode |  11 +++
 target/arm/sve.decode         |  19 ++++-
 target/arm/vfp.decode         |   2 +
 linux-user/elfload.c          |   2 +
 target/arm/cpu.c              |   3 +
 target/arm/cpu64.c            |   3 +
 target/arm/cpu_tcg.c          |   1 +
 target/arm/sve_helper.c       |   2 +
 target/arm/translate-a64.c    | 142 +++++++++++++++++++++++++++++-----
 target/arm/translate-neon.c   |  91 ++++++++++++++++++++++
 target/arm/translate-sve.c    | 112 +++++++++++++++++++++++++++
 target/arm/translate-vfp.c    |  24 ++++++
 target/arm/vec_helper.c       | 140 ++++++++++++++++++++++++++++++++-
 target/arm/vfp_helper.c       |  12 +++
 fpu/softfloat-parts.c.inc     |   6 +-
 20 files changed, 584 insertions(+), 25 deletions(-)

-- 
2.25.1


