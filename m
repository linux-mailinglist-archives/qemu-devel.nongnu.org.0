Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F726D2306
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:52:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piG5e-0000ZO-0O; Fri, 31 Mar 2023 10:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piG5a-0000Z3-A6
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:50:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piG5Y-0000bQ-Ml
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:50:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id l12so22675010wrm.10
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680274247;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=BOarpuRm+IrqDu6sABKN3WM6NwFaVVCdOuZfwYDzPeU=;
 b=n1JOJE1Je+HZ8lb87dYTbgKp0VQ9bh0p2LVnr95M5Qz6QUshiGF2jqWbVsH8Rt7RxJ
 O0k1LgokcipvLe7d/tgaST2rQCNymXA6pTEHlM0eH/QijDetKoLg4iWEcZRPx0pSePmP
 TbFXLKZz9lfhcLkigdTMZSWp3coOUWx3qwf0mg6O8bGMkJXw5yVwQGJpOSFvNnOPeh6F
 VCqheVBglzK5nWATNnySsl7F0mDxPPN0MeRWXPJPhbDIOQf7eViwTrpLHlzAttffDZNR
 yOtYg6OiwUGqSecUvdyWb8+ZUCjy3j1CQhnmyXROactxbecJ7ucOcsU9i8dzrvXNXEb6
 FqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680274247;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BOarpuRm+IrqDu6sABKN3WM6NwFaVVCdOuZfwYDzPeU=;
 b=s67qlt2puqb4dJxOgN88tlX0htVuM9041g8chAibmeOdirshGaOuaSj0vD1VwY6vCU
 h1avoZK50bcTUtXsiduHsYF1TDgo3J9hhtWpWwAwo4ROllQWNn80ea/PojB+odQJ/hW7
 c8qproUZ6XDqptZq3IJkh9Ou0giH50CoTuegSjAa4u9gkueWHAoZTEv29F899a/W6GnG
 YVFa1xpE0Nvx3jIrXyLxxc+AO2lnCwgetvc0UmqtWXI+baoGQBoXcuVr8B6o6IDbZ2/a
 xw+gRXy04ZfO3+ZQkgwp4SYEERd1Q59l9f2cU3kxRD70scufBYH9gqxD0xoIZbujHaBc
 OZ4Q==
X-Gm-Message-State: AAQBX9fx4BLbbEYaklbaeJLOHWQk//Qgq54nnXLvdBHExfjipgJyrw6e
 K0wFHph0Phs+7rQm7W4S83RsMueXVAhZOJVXjvM=
X-Google-Smtp-Source: AKy350bZn4xRHozx+4liBNE6n+2UQ/Q4au+ZBExD+m3uPtkyHnOsDLd0lpccWg+Q6wdGmKrDnv2dEw==
X-Received: by 2002:a5d:5392:0:b0:2db:9ccf:f9f5 with SMTP id
 d18-20020a5d5392000000b002db9ccff9f5mr21601955wrv.0.1680274246907; 
 Fri, 31 Mar 2023 07:50:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d560c000000b002cfe685bfd6sm2339831wrv.108.2023.03.31.07.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 07:50:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: Fix ESR_EL2 buglet, implement FEAT_PAN3
Date: Fri, 31 Mar 2023 15:50:42 +0100
Message-Id: <20230331145045.2584941-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The main purpose of this patchset is to implement FEAT_PAN3,
which allows the guest to force privileged code to not be able
to access memory that can be executed by user code. (This is
an extension of the existing FEAT_PAN which denies access
if user code could read or write the memory.) That is all
done in patch 3.

Patches 1 and 2 fix a buglet in our ESR_EL2 syndrome reporting
that I happened to notice while testing the FEAT_PAN3 code:
we were reporting the detailed instruction syndrome information
for all data aborts reported to EL2, whereas the architecture
requires this to happen only for stage-2 aborts, not stage-1
aborts.

This is all for-8.1 material -- the syndrome bug is minor
and has been around forever so isn't worth trying to fix
for 8.0 at this point in the release cycle.

thanks
-- PMM

Peter Maydell (3):
  target/arm: Pass ARMMMUFaultInfo to merge_syn_data_abort()
  target/arm: Don't set ISV when reporting stage 1 faults in ESR_EL2
  target/arm: Implement FEAT_PAN3

 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu.h              |  5 +++++
 target/arm/cpu64.c            |  2 +-
 target/arm/ptw.c              | 14 +++++++++++++-
 target/arm/tcg/tlb_helper.c   | 26 ++++++++++++++++----------
 5 files changed, 36 insertions(+), 12 deletions(-)

-- 
2.34.1

 

