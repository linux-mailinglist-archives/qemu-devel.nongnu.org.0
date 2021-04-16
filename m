Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9ED3627C7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:34:09 +0200 (CEST)
Received: from localhost ([::1]:50130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTI7-0002Xk-HX
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTFI-0000ev-E1
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:31:12 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTFG-0003fG-C6
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:31:12 -0400
Received: by mail-pf1-x435.google.com with SMTP id a12so18886172pfc.7
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 11:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MRiN8JGM9eYShplxibiJfAaD7a9FxgKLo1Lkxp1IlB0=;
 b=si7jIqgKlvUT5186r8NpASDthDX/Zo+WjXR7DL/Rn0NiO/C6oLBY9zUfMe+YOa5tYe
 o0+nAx/ld0jBLJRLIj0vgpHzFYwipV6g+XBu8e0Ovozf18rZx40PhFpw5zz2sOd3YpUE
 mr+ySYON1cvP6pZA6VNaJVeDkcvEVoR1Bi1wm7rLGiBvOn2gskcuO5UqZKFf0EWXmEXc
 y6rqyQbRd9CxMgYJynAsxXlA3z+MNs6GGPa5a7tQXjGH1sm8/hY9uCxM+hl8yuBBxSGu
 PYUFqwtoUy/tjjNrILyGA0mH/aKf3NIBbTM2NibMACHq6yUGfgYbfhJNvsbGEFHoEKeM
 bjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MRiN8JGM9eYShplxibiJfAaD7a9FxgKLo1Lkxp1IlB0=;
 b=dpdGm6jfVdaTO+fEcW6e5Pk+yiduNyPyDGWTn7Fw5CO3mbT30z+vBAnWQKh4E7vCu6
 c87h7Qp3PN1gL1ezzPH83R4G0gq/jSXflXeiWCdaz7qaIm0HDFjtFEOWHO0KiiP1viTT
 fuIl0sDPKX6foh2n9UzqMrO+9BAhSFq8LVfpd1zu3/taZq7c0CZqZq9YqhVJPihDvWTD
 QiyJF1FQ2lIFIt0DZevVzVEBjgUPajzt+azQkXGuD3eElwba0XXt9A2GpZCSWu549lCW
 Hb43T3jzVEI73BsBRi8JyYB0UPOLPGnVcj6StIth/ME2rKcupeQQN+Gpq3aHMUQRkKO9
 L9XA==
X-Gm-Message-State: AOAM533UllzBr3ZlhB8V7VYLszOQVXLeUJuB5ykbsKew5lOAMX6PQAOK
 Pqs0puyHmtcoXvFN0Wx6qeTQa0sHGfZzSg==
X-Google-Smtp-Source: ABdhPJx2rIv8G1COOU6EtMelMK/Bg/qSvJdlsZupIuf/An2/IG2VFqalkeqYu/p/fn/GBz8vYalaRg==
X-Received: by 2002:a63:338b:: with SMTP id z133mr370901pgz.442.1618597868677; 
 Fri, 16 Apr 2021 11:31:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id p18sm3057307pju.3.2021.04.16.11.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 11:31:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 for-6.1 0/9] target/arm mte fixes
Date: Fri, 16 Apr 2021 11:30:57 -0700
Message-Id: <20210416183106.1516563-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Changes for v5:
  * Rebase.  Three patches upstream and a minor conflict fixed.

Changes for v4:
  * Fix tag count computation error in mte_checkN, which when used
    by mte_check1 in patch 5, caused all sorts of KASAN failures.
  * Fix PAGE_ANON / PAGE_TARGET_1 overlap.


r~


Richard Henderson (9):
  target/arm: Fix mte_checkN
  target/arm: Split out mte_probe_int
  target/arm: Fix unaligned checks for mte_check1, mte_probe1
  test/tcg/aarch64: Add mte-5
  target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
  target/arm: Merge mte_check1, mte_checkN
  target/arm: Rename mte_probe1 to mte_probe
  target/arm: Simplify sve mte checking
  target/arm: Remove log2_esize parameter to gen_mte_checkN

 target/arm/helper-a64.h           |   3 +-
 target/arm/internals.h            |  11 +-
 target/arm/translate-a64.h        |   2 +-
 target/arm/mte_helper.c           | 183 ++++++++++++------------------
 target/arm/sve_helper.c           | 100 ++++++----------
 target/arm/translate-a64.c        |  22 ++--
 target/arm/translate-sve.c        |   9 +-
 tests/tcg/aarch64/mte-5.c         |  44 +++++++
 tests/tcg/aarch64/Makefile.target |   2 +-
 9 files changed, 172 insertions(+), 204 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c

-- 
2.25.1


