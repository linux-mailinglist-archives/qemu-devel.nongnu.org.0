Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497586F53D5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:58:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8IJ-0000uG-N6; Wed, 03 May 2023 04:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IH-0000sK-RI
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:01 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IG-0006bS-5Q
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:01 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso48537505e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683104218; x=1685696218;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DpeHG+3rjQwGt8Lp2GDMDOi+0/Jce+Ihwa90rb/ksYU=;
 b=QAQBg3peF3Aa/g4Xrj7ZzoHm0f1g4Mpt4M0lRApLh74tK4VhlKShE8ZLTDdKGM3zcw
 4vS3EWzNjtVdv853qZWE4TQgfKvT969XwXUlg0e5YxNHGNrttRYGqwc7q8g5uPkMQcVa
 HoFoqGQ6h2m92oyxVbTt8fVHs1hFvrj8g9vwaqJba6fvgLcU1otTRD4lPtPbmsJ1XPqD
 DJOT7zhKmD5Veki19tPnL25ktUBBfpO6pGH6u5R75l4P7K/W72ZNC3xSXVq9cTI34doA
 0N6hN6xuXCTSs818XFFzbv/iwyQC8LNt8Le+iy3KGxnIRK/enoAQMipChtWI1UOdeuys
 0L5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683104218; x=1685696218;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DpeHG+3rjQwGt8Lp2GDMDOi+0/Jce+Ihwa90rb/ksYU=;
 b=RP5QRqHswdcb4RoZlO8sWFINB11eol1E1Qc6E2sg/qiR6WL2+hiui4gSEi6Ioj+A9J
 SvHP+/UM53FpMaxg0wwflPLi5M/xb4yjDFtDMZILVy2Yk/8P4zFkExJglmq3m74iBIBQ
 kN1SUTBI9x77lISwKhQ2mkFmY1Ar3m9+7NoUYHA5HLctCQ9GbKxMxsTwqzkZ5xs3Njfy
 5RW+E1sJtAMpztDb20M5LgKaElSoex1axoOZw7SNVOgIg4innM8wC9qTQUllzoXDtBDT
 +3PRl/ABtPy7DQEgBDtwNzRuXcD1yn/YLjTOWdBwxihn0CFNvAF8O3w5kFACfHphf9Es
 3X0Q==
X-Gm-Message-State: AC+VfDzXGgam8vgX+htaEZqfnG3b7CF+R9gmd8pGJhahgIH5uezGhjHn
 WdSC7M7CqstzB4BQcufMdLZ6cNBGUIGQ+i7XxUMnyQ==
X-Google-Smtp-Source: ACHHUZ6R52ElYT0LaOe6am1aBgo4l6ZcUuMFZIf6wPROb1omClfTj/I6fF1HMaiRNGdvvVXiKmIL0A==
X-Received: by 2002:a1c:7710:0:b0:3f3:2b37:dd34 with SMTP id
 t16-20020a1c7710000000b003f32b37dd34mr10150947wmi.9.1683104218217; 
 Wed, 03 May 2023 01:56:58 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a7bcd1a000000b003ef5f77901dsm1191307wmj.45.2023.05.03.01.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 01:56:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: dbarboza@ventanamicro.com
Subject: [PATCH 00/11] tcg/riscv: Support for Zba, Zbb, Zicond extensions
Date: Wed,  3 May 2023 09:56:46 +0100
Message-Id: <20230503085657.1814850-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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

Based-on: 20230503070656.1746170-1-richard.henderson@linaro.org
("[PATCH v4 00/57] tcg: Improve atomicity support")

I've been vaguely following the __hw_probe syscall progress
in the upstream kernel.  The initial version only handled
bog standard F+D and C extensions, which everything expects
to be present anyway, which was disappointing.  But at least
the basis is there for proper extensions.

In the meantime, probe via sigill.  Tested with qemu-on-qemu.
I understand the Ventana core has all of these, if you'd be
so kind as to test.


r~


Richard Henderson (11):
  disas/riscv: Decode czero.{eqz,nez}
  tcg/riscv: Probe for Zba, Zbb, Zicond extensions
  tcg/riscv: Support ANDN, ORN, XNOR from Zbb
  tcg/riscv: Support ADD.UW, SEXT.B, SEXT.H, ZEXT.H from Zba+Zbb
  tcg/riscv: Use ADD.UW for guest address generation
  tcg/riscv: Support rotates from Zbb
  tcg/riscv: Support REV8 from Zbb
  tcg/riscv: Support CPOP from Zbb
  tcg/riscv: Improve setcond expansion
  tcg/riscv: Implement movcond
  tcg/riscv: Support CTZ, CLZ from Zbb

 tcg/riscv/tcg-target-con-set.h |   3 +
 tcg/riscv/tcg-target-con-str.h |   1 +
 tcg/riscv/tcg-target.h         |  48 +--
 disas/riscv.c                  |   8 +-
 tcg/riscv/tcg-target.c.inc     | 612 +++++++++++++++++++++++++++++----
 5 files changed, 587 insertions(+), 85 deletions(-)

-- 
2.34.1


