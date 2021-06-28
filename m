Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A633B5F89
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:03:27 +0200 (CEST)
Received: from localhost ([::1]:57170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrrC-0007Nc-7n
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmd-0002ek-Jw
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:43 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmZ-0005zi-MI
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:43 -0400
Received: by mail-wr1-x430.google.com with SMTP id a13so21388194wrf.10
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=po4Y+YPkHZGykvWsq45tycJkH3zonFVdu3AV4jkF1yg=;
 b=b0WRlX6wDnXEP1W6epAMnPSNnWWx3vm+uidclm4EKz4WmInz5h9TumvIZXY+HKh0T0
 2AEQzSHg5LXI27xLSLa9cQ3LCfx3V8Bx/uRFbCndzeXf9VG23Yg3pUoJEm9zDJ4WBn14
 pmNkouuosdVxXgEC5/J62M6duLL40/c6B+iTlDMFwFe4TuoZWNUH6ldEhSOBHrEA+gVE
 L2e2sSFNFYLpsf1ArhYVpz8IsCUlwWb9A8vNCoSnVwQ9enVEP54mzt+a8BeYtSElaiRq
 MhcgFkWHjvSWW3IyGj2evbImF7YIY5HDKScezL7KaOFgscLXHescpfrtzbVsppymSdOh
 2GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=po4Y+YPkHZGykvWsq45tycJkH3zonFVdu3AV4jkF1yg=;
 b=lAJwYdhFBjOdzgCIzEorSmKNaOCrrtt81bLq6fB2StPwm5bwV0VFR+ke/q1weLrOGv
 goXLpERO0BqZALznVC5IfD+NP/EP4KxWNmYKT8kPAEAVFEFbPkOKcsbzxM7EfR8QoPxA
 HhqGNogX0DOSEvvG5+uw6K/ntC4R6flOl/MYtYvDWa+DGR3CFlOeHE5nNCayP1jf2G8k
 i7VBXElN/0ypjdEKYTi0N0lYnFb93Jzaz6KEmCDT5MRu35CkkQZdj0rZaG5n4vShi7N9
 PZl7V1oZ3NgkJ/j6jLzb55NdlMw+zrTQeT4T2dl8rts0ZHwywn8X3orLbSqwLcmPUuab
 YzAw==
X-Gm-Message-State: AOAM533iVISv+k1F5v0EhQb7JPrWnywffhYjkQQTtEmQFBFjf1R3tEG1
 0fmWo4CbmQOyE5sqWIKFbFOOuQ==
X-Google-Smtp-Source: ABdhPJyqRpVZCKtJ75h3iVaK6CJQiWq7WM2/JwVXozsVK6PMmTFznSQqf+0LS3zJ6AEk94uaepwa5w==
X-Received: by 2002:a05:6000:246:: with SMTP id
 m6mr27273009wrz.116.1624888717652; 
 Mon, 28 Jun 2021 06:58:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/18] target/arm: Second slice of MVE implementation
Date: Mon, 28 Jun 2021 14:58:17 +0100
Message-Id: <20210628135835.6690-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchseries provides the second slice of the MVE implementation.
In this series:
 * fixes for bugs in a couple of the insns committed to upstream
   as part of the first slice
 * the logical immediate insns (including a preliminary refactoring
   to share the asimd_imm_const() decode between Neon, A64 and MVE)
 * some vector shifts
 * all the new MVE shift instructions which sit entirely within the
   non-coprocessor part of the encoding space and operate only on
   general purpose registers (either 32-bit shifts of one register,
   or 64-bit shifts of a register pair). These insns are not
   predicable and not subject to beatwise execution.
 * VADDLV (add long across vector)
 * VSHLC (shift left entire vector with carry in and out)

(I haven't yet got to the shift-vector-by-scalar-in-register
shift insns yet; those will be in some future patchset.)

This is a bit smaller than the first slice patchseries was, but
softfreeze is approaching and I wanted to give this the best chance of
getting through code review before then. (Not that it matters much if
it doesn't, it just means I would be carrying more patches locally
until we reopen for 6.2.)

thanks
-- PMM

Peter Maydell (18):
  target/arm: Fix MVE widening/narrowing VLDR/VSTR offset calculation
  target/arm: Fix bugs in MVE VRMLALDAVH, VRMLSLDAVH
  target/arm: Make asimd_imm_const() public
  target/arm: Use asimd_imm_const for A64 decode
  target/arm: Use dup_const() instead of bitfield_replicate()
  target/arm: Implement MVE logical immediate insns
  target/arm: Implement MVE vector shift left by immediate insns
  target/arm: Implement MVE vector shift right by immediate insns
  target/arm: Implement MVE VSHLL
  target/arm: Implement MVE VSRI, VSLI
  target/arm: Implement MVE VSHRN, VRSHRN
  target/arm: Implement MVE saturating narrowing shifts
  target/arm: Implement MVE VSHLC
  target/arm: Implement MVE VADDLV
  target/arm: Implement MVE long shifts by immediate
  target/arm: Implement MVE long shifts by register
  target/arm: Implement MVE shifts by immediate
  target/arm: Implement MVE shifts by register

 target/arm/helper-mve.h     | 108 ++++++++
 target/arm/translate.h      |  41 +++
 target/arm/mve.decode       | 177 +++++++++++-
 target/arm/t32.decode       |  55 +++-
 target/arm/mve_helper.c     | 524 ++++++++++++++++++++++++++++++++++--
 target/arm/translate-a64.c  |  86 +-----
 target/arm/translate-mve.c  | 261 +++++++++++++++++-
 target/arm/translate-neon.c |  81 ------
 target/arm/translate.c      | 327 +++++++++++++++++++++-
 9 files changed, 1465 insertions(+), 195 deletions(-)

-- 
2.20.1


