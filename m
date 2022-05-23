Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADF6531663
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 22:50:57 +0200 (CEST)
Received: from localhost ([::1]:60336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntF0v-0002j0-T7
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 16:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntExw-0008BF-GD
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:48 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntExu-0004z2-OD
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:48 -0400
Received: by mail-pf1-x434.google.com with SMTP id c14so14721494pfn.2
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YbH0Qi07uHBhhPIRS648hMMOWcj5g+xQWUqXIeZS4go=;
 b=XQQ5NiQjDIqlEamOI1J2NgslAAp4VGYx5hej74TuEFfdM17+auxQmbvejijcfks7Df
 qQxjUTFKLdjch5Q+ZAACneZn2e02tO6Suxz+ut9bI9lee9BNjUEK/4xyy9Evx2rwBQ39
 KYLX0SLRjcsEeSBvHxFaTTwvK3rTHfPdVjzIXnlVH4AsgYslSepDseax2SsV0xGu/0QO
 YkQ/0jxqbZGCo11nOeqlZmExTgz70rkkFn1lGRARGj4jAW8pFKN1axc8kc7P77k3F834
 EqYpvRjtdnqNktogCaRlIDiRSWruL+7qvsxC3MdH0RbxYODP3+uFpktXlg42QQB4nLZ7
 WpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YbH0Qi07uHBhhPIRS648hMMOWcj5g+xQWUqXIeZS4go=;
 b=nCIh396FXZweFGiLk1KirAc8Lle8WICQuBXEvmeXQBqCmDEEBj+YFjbjLQqFz4CxOP
 piTZQ4mOXiL4Fc+Z3Nm+dqHRTVOMNU8AIhgcfY9zRl5fOAkgH/M6jNYuDz9WraE1O56E
 iAHtLOXyHZ+tZgMiUBSN60kefW3gYgP0rKj6OxPMRZFJBdvbjaPRXR3iaf20XBvQsRa2
 aXnczqqJUGL8vclUel4F9lkEHIrIrY4iHO2Jj2yLHg23PY1pZrtXeLi0MjbLGlC6bsXe
 goofNpAKMJf/3x+f0b8FQAIn1OM9XNgxRk6z0hUfHK2lTP0FytJ5k4hrdEhNtPst3UxR
 zXog==
X-Gm-Message-State: AOAM532kXa8TBhAUT6l9T8mlsdpM9p3GqiKNTQQ7GZZRP7fAnrD3gzDa
 mDCzidOitY3k7+51sr/wbVhSrLqJdTBanA==
X-Google-Smtp-Source: ABdhPJzxyLu+vAkuR3CxLp1qX/ZuyU4SD4yxx2h/9UsFMZQLpywMGUhdu4GF4jRadD8dCHJ08VfD+Q==
X-Received: by 2002:a65:6bc4:0:b0:3c2:2f7c:cc74 with SMTP id
 e4-20020a656bc4000000b003c22f7ccc74mr21486096pgw.307.1653338864124; 
 Mon, 23 May 2022 13:47:44 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/18] target/arm: tidy exception routing
Date: Mon, 23 May 2022 13:47:24 -0700
Message-Id: <20220523204742.740932-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The target el for raising an exception currently lives in at
least 3 places: exception_target_el, arm_debug_target_el, and
in {sve,fp}_exception_el.

This patch set aims to put all of the routing into the same place.

For the purposes of prep for SME, the goal is the last patch,
where we do not confuse the level at which SVE exceptions are
trapped with the level to which exceptions are delivered.

I suspect that the existing SME prep patch where I remove the
fp checks and then compare fp vs sve el, is flawed while this
route_to_el2 line is still present.

The end result for debug exceptions isn't quite as clean as I
was hoping, but hopefully it's still better than before.


r~


Richard Henderson (18):
  target/arm: Allow raise_exception to handle finding target EL
  target/arm: Use arm_current_el for simple exceptions
  target/arm: Move and expand parameters to exception_target_el
  target/arm: Move HCR_TGE check into exception_target_el
  target/arm: Move arm_singlestep_active out of line
  target/arm: Move arm_generate_debug_exceptions out of line
  target/arm: Hoist arm_current_el in arm_generate_debug_exceptions
  target/arm: Use is_a64 in arm_generate_debug_exceptions
  target/arm: Move exception_bkpt_insn to debug_helper.c
  target/arm: Move arm_debug_exception_fsr to debug_helper.c
  target/arm: Move arm_debug_target_el to internals.h
  target/arm: Create raise_exception_debug
  target/arm: Move MDCR_TDE test into exception_target_el
  target/arm: Mark exception helpers as noreturn
  target/arm: Create helper_exception_swstep
  target/arm: Remove TBFLAG_ANY.DEBUG_TARGET_EL
  target/arm: Add cur_el parameter to arm_generate_debug_exceptions
  target/arm: Remove route_to_el2 case from sve_exception_el

 target/arm/cpu.h           | 128 +---------------------------
 target/arm/helper.h        |   7 +-
 target/arm/internals.h     |  64 +++++---------
 target/arm/translate.h     |  14 +---
 target/arm/debug_helper.c  | 167 ++++++++++++++++++++++++++++++++++---
 target/arm/helper-a64.c    |   7 +-
 target/arm/helper.c        |  25 ++----
 target/arm/mte_helper.c    |   7 +-
 target/arm/op_helper.c     | 128 ++++++++++++++++++----------
 target/arm/tlb_helper.c    |  10 ++-
 target/arm/translate-a64.c |   1 -
 target/arm/translate.c     |   1 -
 12 files changed, 289 insertions(+), 270 deletions(-)

-- 
2.34.1


