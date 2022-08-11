Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5A85905C0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:22:52 +0200 (CEST)
Received: from localhost ([::1]:47082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBtT-00047A-5k
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnH-0006m3-66
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:27 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:46645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnE-0000sG-39
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:26 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so2980892wms.5
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=LAPtWKrKaZqjEi+4+qsyZ39lAOW3AbKKlekZOCCWKzU=;
 b=pGRI/RsFcnnKlcZ0VsCfUSq1w7tIY9lfBhEqS3zVmdv0LncpOaFuB0Fkg7gDZLUAEt
 DV0dpunuy4zlOTbEpDvcxyeO3FRSnZ+KhHBCn0Z/vgmA3ecqk3nI/blrb/StPNJWp68V
 7F509+FXi00Sivz9Fe2k9+KW6LmWfUM8mFWFOxSUoHJWUCymmqNFPrTmgIcsapG9urhv
 VdfQzQ+C2PHtZzs8UdWM0WLKQfPVn2ERGyX4QxQYjdPOChnI7aRfVVLUguGo2POhVL2G
 7bDzAFcEnLSwEKb0SByQb4fcEarut9336NFbPB1eNa7CqbhxEMpgXgYINVLNWBU4CdWf
 u4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=LAPtWKrKaZqjEi+4+qsyZ39lAOW3AbKKlekZOCCWKzU=;
 b=s96auJkxOoRfTIM1BeaL85JtS8rrRWFfR/S/V5cYIOJcA3pZXrkVhF0ME3YxsljAbG
 PNPMQicHXvrQUpZovSZ4Jvjp9BgfqFToVi5PQpLVC0b79Xr7rRZRc/yidLB6z51axM/P
 HGmsM+410WoZKGY4UjGdp5y2TxsZzLBt0PmSjD6EIWlWW0jOjCPt4D6vLYDPi3WKxAPY
 CpQsKpeR4dva2OBG5z/M8QPt/IcQcg3Ek/OL+93TkvkYyhCHacGRyyPw0/bTBOeg6U/u
 Rs5b/xLwFSD8vPJHlle1OlQbHtd5XfcCc5RaFUKdAyKIwaWjA+9a94Oauuu+7ggL711n
 Lpkw==
X-Gm-Message-State: ACgBeo0wLatI5lzb0iGrVcG61O7Mry1SyxrpLN3mrBgSpXzk82rXb5yv
 kR+aWci9EHM1KZc0W4ETGmLtEBsObFsjkA==
X-Google-Smtp-Source: AA6agR61LVfRhT1n+HebIX2ALYPeTzQJIulIojQgXTakJYgBNEJmkIrcyyMZsfcHyeGVtb5us0CwDg==
X-Received: by 2002:a1c:541b:0:b0:3a5:411:5575 with SMTP id
 i27-20020a1c541b000000b003a504115575mr139082wmb.65.1660238181177; 
 Thu, 11 Aug 2022 10:16:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/10] target/arm: Implement FEAT_PMUv3p5
Date: Thu, 11 Aug 2022 18:16:09 +0100
Message-Id: <20220811171619.1154755-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

This patchset implements the Armv8.5 feature FEAT_PMUv3p5, which is
a set of minor enhancements to the PMU:
 * EL2 and EL3 can now prohibit the cycle counter from counting
   when in EL2 or when Secure, using new MDCR_EL2.HCCD and
   MDCR_EL3.SCCD bits
 * event counters are now 64 bits, with the overflow detection
   configurably at the 32 bit or 64 bit mark

It also fixes a set of bugs in the existing PMU emulation which I
discovered while trying to test my additions.

This is of course all intended for 7.2.

thanks
-- PMM

Peter Maydell (10):
  target/arm: Don't corrupt high half of PMOVSR when cycle counter
    overflows
  target/arm: Correct value returned by pmu_counter_mask()
  target/arm: Don't mishandle count when enabling or disabling PMU
    counters
  target/arm: Ignore PMCR.D when PMCR.LC is set
  target/arm: Honour MDCR_EL2.HPMD in Secure EL2
  target/arm: Detect overflow when calculating next PMU interrupt
  target/arm: Rename pmu_8_n feature test functions
  target/arm: Implement FEAT_PMUv3p5 cycle counter disable bits
  target/arm: Support 64-bit event counters for FEAT_PMUv3p5
  target/arm: Report FEAT_PMUv3p5 for TCG '-cpu max'

 target/arm/cpu.h       |  37 ++++++--
 target/arm/internals.h |   5 +-
 target/arm/cpu64.c     |   2 +-
 target/arm/cpu_tcg.c   |   2 +-
 target/arm/helper.c    | 197 ++++++++++++++++++++++++++++++++---------
 5 files changed, 190 insertions(+), 53 deletions(-)

-- 
2.25.1


