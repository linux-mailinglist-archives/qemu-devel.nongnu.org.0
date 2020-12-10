Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1222D688F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 21:21:49 +0100 (CET)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knSRg-00033M-GL
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 15:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knSKm-0007Um-Is
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 15:14:40 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knSKk-00010d-Ko
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 15:14:40 -0500
Received: by mail-wm1-x342.google.com with SMTP id a6so5752189wmc.2
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 12:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hWTyQdYvGAHwtkhAWU69NATzVe5v3D2e/9r/5ZH5EY0=;
 b=hKlYvkhFjmY2pKs5DFI0ctRxw1MT9d7SR/7r5LMKrUYyHnNguVRsQNi/NcYOPEVREO
 7rhYKwd7wxaL8Ksqa2yvA1HJGzt8HlDk325oTehJVKcSfW4bFna8/6OJpJfpzJeuLo1W
 Q8zUvB+d6Bs+I9tMh9kRrPAg/0GZfSVDWRf+Q+sdNRrsFJdLtSn+bjl+xdmduCx9fFaV
 GWU9mwAmGOglYDeULdnSMuU2Z26B42Z7hxc5pTnHjvatB2mjMerGDnTks4RGA6S6Pi0w
 fpwsRSG5+VJzcv+EEnryyuAguPg68aFjrflzlNNqqWBQCZLVIDWmvYzZTXX5vMHxBLy6
 jDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hWTyQdYvGAHwtkhAWU69NATzVe5v3D2e/9r/5ZH5EY0=;
 b=T39tZkOr97obPN3cML2/OawnyA4JAW0ND9DzRMPwInkNiNK9nuQWiz9win4haFwMY7
 oQUiRo6tGEnQKGEQ9Fk3CRn+AqNcrOl38oRMbeBOg6gLQh6jH/Oy9l1cxEkFGwOgrAsP
 J7BV/6Rvp3fEHDMjCXnsb09aJmoIrL2hVpTb0LgXNB5s1psDxqdGQfZp9Sj4N838gD3n
 Ft/GD29ILCj9jWmMFH3+eYW53PBqncbTn6AYojyuMMCKhKohOJdbSzfJ5AfHAhZaUsTQ
 6pjOJO4Fa8D71C2yLYPAThwS1Hdb/HQUjyYIUvGAbvfaHFZg2lq5KJWpPGa6MaaH6dnE
 wICg==
X-Gm-Message-State: AOAM531HsZUi9fF5symOpwAUN6tp7CMXq/CCgov3em+y8xHUh3Z3Xdz+
 3UVBVOXT5TXR22N2Q3uhWAevOBvl1i+rrA==
X-Google-Smtp-Source: ABdhPJzzFZoVkmtBZu9v1Pjt4y8OfOhPsrTKNH09wxbApjppYhO/V3mUrd+8+AR/SRbHxsyVxApb/w==
X-Received: by 2002:a7b:cf0d:: with SMTP id l13mr10160775wmg.168.1607631276347; 
 Thu, 10 Dec 2020 12:14:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y130sm11879591wmc.22.2020.12.10.12.14.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 12:14:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] target/arm: Implement v8.1M and Cortex-M55
Date: Thu, 10 Dec 2020 20:14:29 +0000
Message-Id: <20201210201433.26262-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
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

This is a lot smaller than v2 because most of that work made it
through review and is now in master.  This series has the last few
patches that needed rework to address review comments, one new patch
(patch 2) which fixes a bug that I missed until this evening, and the
final "provide a Cortex-M55 model" patch.

thanks
-- PMM

Peter Maydell (4):
  hw/intc/armv7m_nvic: Correct handling of CCR.BFHFNMIGN
  target/arm: Correct store of FPSCR value via FPCXT_S
  target/arm: Implement FPCXT_NS fp system register
  target/arm: Implement Cortex-M55 model

 hw/intc/armv7m_nvic.c          |  15 +++++
 target/arm/cpu_tcg.c           |  42 ++++++++++++
 target/arm/translate-vfp.c.inc | 114 ++++++++++++++++++++++++++++++---
 3 files changed, 162 insertions(+), 9 deletions(-)

-- 
2.20.1


