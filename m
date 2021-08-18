Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F99E3F0D71
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:35:52 +0200 (CEST)
Received: from localhost ([::1]:53518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTDz-0005uB-Ak
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7f-0005lM-39
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:19 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:34764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7c-0005fz-BS
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:18 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 gz13-20020a17090b0ecdb0290178c0e0ce8bso5959874pjb.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dgiTO7skKQmhMifcWbt+XoweqvSruW14i6+0Mp0ew/s=;
 b=syh7WV1XLcRDQ+oeJvTLjEa/odNlxdhGaQix7Z+PF9IygBQsztHls5YOwY+yxgny2p
 uFqpO6zAAzizuV6Hi3hQkRys69yx9nbJvFffTReOn9IK1dZDjxPHF/64DmYPiGD2IwoW
 IKSW45iWiYawqdrf3vs47r4By6V30YwkZGkMZbhPvuMzwKeRi8aSLzYhqcdx9diG+VSR
 gVQWii4YjQQC/WReEgEPkfBCfRJ0FH0rSux3Ny7gS4KrsrDyHVKO1nWTV7jc0zTz4e5k
 Dlde8xhjv3Lo90bi5kS+Gr3TgfHUL+KizdcfgCq/W/48HrwctsvmQFwMSZ+l0q6WawmR
 d6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dgiTO7skKQmhMifcWbt+XoweqvSruW14i6+0Mp0ew/s=;
 b=eSF11PRWqjkOq3WtjXZETDLprKc5NVG+4l6apSRkGnU/0RGOjdhE3n32ZWS0G9Ai3P
 XkhVth/EKR88soOX/Jm7XB9626KRv1KWwGEyVCMERX+ehugJ+pDBp4XHWB6mkXAqWogY
 NXRkwl1uJGUj1w/zBL9+sEwtns6fB0zKvkCOQ5q7B9jbR8l7C9tXCuIszztUx8YbrVdP
 d2d/cg8acw4+gSvlER4Ac717saAC0d0SDQM/1j7cg6ZmLv7s3aSBR52QezXg1Ru4y2cC
 BXEh7ggMbWfRHeoqMSq9O/J04jbvH04ICI0imgepVy5wHrDJkKPmTrCybI4qwu/BzWuz
 5jhQ==
X-Gm-Message-State: AOAM531mcd/CUqWSQHAb0BUgRNF6i1mpbVheG3U8JmBkCa+DZIq8T3nu
 ml79PLWYidZgGL7516T1S2eE7cyRPx55tw==
X-Google-Smtp-Source: ABdhPJyMbzGwpKpofSE1o8L02BOvQp6APiMUKiagXz4wDv7Mi4tDf/V8pabv3Y3VeWH+yKZRuSel0g==
X-Received: by 2002:a17:902:7582:b0:12f:802b:452e with SMTP id
 j2-20020a170902758200b0012f802b452emr388843pll.56.1629322154527; 
 Wed, 18 Aug 2021 14:29:14 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y19sm751965pfe.71.2021.08.18.14.29.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:29:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/14] tcg/arm: Unaligned access and other cleanup
Date: Wed, 18 Aug 2021 11:28:58 -1000
Message-Id: <20210818212912.396794-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210818191920.390759-1-richard.henderson@linaro.org>
("[PATCH v3 00/66] Unaligned access for user-only")

Important points:
  * Support unaligned accesses.
  * Add environment variable to for testing older architecture revs.
  * More use of enum types.


r~


Richard Henderson (14):
  tcg/arm: Remove fallback definition of __ARM_ARCH
  tcg/arm: Standardize on tcg_out_<branch>_{reg,imm}
  tcg/arm: Simplify use_armvt5_instructions
  tcg/arm: Support armv4t in tcg_out_goto and tcg_out_call
  tcg/arm: Examine QEMU_TCG_DEBUG environment variable
  tcg/arm: Support unaligned access for softmmu
  tcg/arm: Split out tcg_out_ldstm
  tcg/arm: Simplify usage of encode_imm
  tcg/arm: Drop inline markers
  tcg/arm: Give enum arm_cond_code_e a typedef and use it
  tcg/arm: More use of the ARMInsn enum
  tcg/arm: More use of the TCGReg enum
  tcg/arm: Reserve a register for guest_base
  tcg/arm: Support raising sigbus for user-only

 tcg/arm/tcg-target.h     |   35 +-
 tcg/arm/tcg-target.c.inc | 1010 +++++++++++++++++++++++++++-----------
 2 files changed, 724 insertions(+), 321 deletions(-)

-- 
2.25.1


