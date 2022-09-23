Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D2C5E7B1E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 14:49:14 +0200 (CEST)
Received: from localhost ([::1]:40428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obi7C-0001Mm-Oc
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 08:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obhso-0006PC-LK
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:34:18 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obhsm-0007VM-Ve
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:34:18 -0400
Received: by mail-wr1-x432.google.com with SMTP id z6so20293160wrq.1
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 05:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=upwhR+H0cqGHMXItgFLczOGILoh98UbA8+O2Ym4ZDr0=;
 b=htRyQynVFtqiGymzb4mkKfkdBGA7wRIQd3DdKLL5rEba61OptGOqEJMW3Uq/cS8THC
 ad7r/yzvrwnsKtzVBs0xMexSUPk6YLmCF7CpILuq/qbyZuhX8zy5m38k1N9xV+voqFZQ
 otm7zTnjvsYfTHsVi+hdaglRqKpTMuT6tmyNLUs9zQSB/eA/dNzYT5cpfDYtY1MK+Shn
 khJpeca1+GpNU5H4B+t6cwf+TvW0QWpo+qDkGDgrEcTHeNDHS6NIxYHFMsLYtXwBpPSW
 gOx53KqjtSHnnR1m0u71U2eXIMd8IGiqkPkZzhFgCHPK4glttfU68aXcpT7+IO1qJV81
 nEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=upwhR+H0cqGHMXItgFLczOGILoh98UbA8+O2Ym4ZDr0=;
 b=SxZvfyr8Kltztcyl+psjIbkTwjiXcYUGXXUYkfxwDE5GdgipLozxbktbRMGGQHyGIV
 SzjuFDtx0R2gOoJmoQKZk2rIKIEQty++Pbc7Ijw17qPpsQ3l6uS7wuL8IFoTFetTJCIB
 ovg3jDmy3I32ylJhgcDK0cAIK+zp64OvE/L6xwpdG7QAPg/r4URAaq/6AmIw/GI/lxuG
 p8sUcod8Sj+UERtI21sUs3BoB8H1jA8gjnp+oekEkASvxGrPXE6PJWoDBOWx3hSTQ91x
 OEauYWa8P9s5wkE9fCQURNyPWGPYoqwfKfkQxwfsTteNNEKCqdTcwy6mcKx2P3QlCo1S
 XSuA==
X-Gm-Message-State: ACrzQf2ikuvuZJHA64g6t2LcXL5F5xIUpplNdMtbSsndWDLFq7blOR/4
 WZ7MTDjFlpyKb0pmQrTibzix7g==
X-Google-Smtp-Source: AMsMyM77KtFb5kSHSz0gDy2Ds3Q3mvPLbeC4OQl0B1RqkpTNYtIsifsihrNQGIxLl6N9taoQllw7Vw==
X-Received: by 2002:a5d:59a5:0:b0:22b:52:1c9f with SMTP id
 p5-20020a5d59a5000000b0022b00521c9fmr5209684wrr.576.1663936455108; 
 Fri, 23 Sep 2022 05:34:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n43-20020a05600c502b00b003b486027c8asm2504555wmr.20.2022.09.23.05.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 05:34:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PATCH 0/3] target/arm: Fix bugs in recent PMU changes
Date: Fri, 23 Sep 2022 13:34:09 +0100
Message-Id: <20220923123412.1214041-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This patchset fixes some bugs in the recent changes I made
to the Arm PMU emualtion as part of implementing FEAT_PMUv3p5.

The important patch here is the first one, which fixes a crash
when in icount mode if the guest touched MDCR_EL3, MDCR_EL2,
PMCNTENSET_EL0 or PMCNTENCLR_EL0. The other two are more minor,
things which I noticed while I was looking at the code.

thanks
-- PMM

Peter Maydell (3):
  target/arm: Mark registers which call pmu_op_start() as ARM_CP_IO
  target/arm: Make writes to MDCR_EL3 use PMU start/finish calls
  target/arm: Update SDCR_VALID_MASK to include SCCD

 target/arm/cpu.h    |  8 +++++++-
 target/arm/helper.c | 30 ++++++++++++++++++++----------
 2 files changed, 27 insertions(+), 11 deletions(-)

-- 
2.25.1


