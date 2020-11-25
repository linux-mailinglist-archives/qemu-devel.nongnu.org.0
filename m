Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C1A2C37E4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 05:08:47 +0100 (CET)
Received: from localhost ([::1]:48174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khm6n-0006Q9-WD
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 23:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4v-0004f4-Rs
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:49 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4s-00060c-Rc
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:49 -0500
Received: by mail-pg1-x533.google.com with SMTP id t21so1206483pgl.3
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 20:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6ya5vofU6C1QM+kvPyUyuEWbvoQt6UR8CMi/DgLk2T8=;
 b=fXwrbVVctWGegyVHO5mu2f5hLPiYPtZbFnAWt4ip/6nIFHV/xR5lFLxs6k985JrzXZ
 SYpeG4N8RRC8us69gECHMlyWidenlupeX09VCXJGmsSoqh+I+vfE8FR6s8jILx8gBads
 Z/B0wYx9gjNtvhZwhpdXWGLICq/ALlGopTJdXLiq1ZdhT1np+PuWC8LJ6WI+oMIyBYMy
 fiLbi9yFOsWaewGM3cX+5OshNFYQbkr94ShhFuc2xmcrFRBryCw3PSLwUF5SGQzyDacX
 hWbUrhpWgSqoVtVlECk01zLLeLrIAdhgmPrY8upWu+g8jZWn1c8eJi7U/hJFknqQBxfe
 GPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6ya5vofU6C1QM+kvPyUyuEWbvoQt6UR8CMi/DgLk2T8=;
 b=JZfb4CrMUt0qhLmIm/7oSFozSg8ggpZDRYHbgrhXRLv774U6Ymc6LBGyvGBe9/8xuF
 DYxchOWK8bgz5U+ve0zCu8VcXz/jsGmlQcQKLL+T+C1Fr8lLKBDif98PJgw+8z6eJbyN
 5u+g2fFBHpcw+WgsaiMaD90sBfCPoPXajuKNjTL5MV0ulfAEPz4yhryBgh30Zb8r2oaF
 GOCUyzgoafIurwcNscw7s7Xe9Zbk3TIngx/E8mzU47LnDqK5Wk7fKg7ehzQIyr1Ic2M2
 OMTNVBY7gdYZHhnGBoz2nFW46w6bzv2leH0MF6Mk3zkU2OiOruejz1twOlgp652DXph2
 zQmw==
X-Gm-Message-State: AOAM531NAe0nB1a9vRLssjwXIQ8z3UGLt8m3bq2xRDogO10DzfTkgcZ+
 75pFNIDwF3UvwlizYfMF6ODXy7t/LOfqaw==
X-Google-Smtp-Source: ABdhPJxO7vuBLv85cVeDpw1+K6amTbZaBJS8jYeDq/EQjamz3KATyTi1wj1ByWSSYR8ebLJ4jCkyNw==
X-Received: by 2002:a17:90a:5d0a:: with SMTP id
 s10mr1863720pji.160.1606277205075; 
 Tue, 24 Nov 2020 20:06:45 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 00/11] target/arm: enforce alignment
Date: Tue, 24 Nov 2020 20:06:31 -0800
Message-Id: <20201125040642.2339476-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

As reported in https://bugs.launchpad.net/bugs/1905356

Not implementing SCTLR.A, but all of the other required
alignment for SCTLR.A=0 in Table A3-1.


r~

Richard Henderson (11):
  target/arm: Enforce word alignment for LDRD/STRD
  target/arm: Enforce alignment for LDA/LDAH/STL/STLH
  target/arm: Enforce alignment for LDM/STM
  target/arm: Enforce alignment for RFE
  target/arm: Enforce alignment for SRS
  target/arm: Enforce alignment for VLDM/VSTM
  target/arm: Enforce alignment for VLDR/VSTR
  target/arm: Enforce alignment for VLD1 (all lanes)
  target/arm: Enforce alignment for VLDn/VSTn (multiple)
  target/arm: Fix decode of align in VLDST_single
  target/arm: Enforce alignment for VLDn/VSTn (single)

 target/arm/neon-ls.decode       |  4 +--
 target/arm/translate.c          | 32 +++++++++--------
 target/arm/translate-neon.c.inc | 63 +++++++++++++++++++++++++--------
 target/arm/translate-vfp.c.inc  | 30 ++++++++++------
 4 files changed, 88 insertions(+), 41 deletions(-)

-- 
2.25.1


