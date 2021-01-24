Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C263C30193E
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 03:56:29 +0100 (CET)
Received: from localhost ([::1]:45418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3VZi-00006H-HC
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 21:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWa-0006gN-4A
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 21:53:12 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWX-00038z-P6
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 21:53:11 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m1so8127129wrq.12
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 18:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s7PJ51jzBATxkQNcxoYSFNAfapcaizQoguoJb33d/p4=;
 b=T2CoCfMb1gR6oyxekb5GASUG88x1gpHBrhPLEMk1MkAUx8yM391S+lAGxZTdrAX0++
 fCbTTEY9JJOhIpZ64OcE9v/+1jzj5itI+om+8fpxZPC88DojttcvfeoQrpJGpWJo9ORs
 9EadpxYoGpyVU8XoWD6Jk57FNuSsHFZ0RJJPjKmiJvo0/3U4bGCh7jRn6fd3dNFvTgdw
 lC2JNT2Nz+vRPNvUkcCwDd5i8rtztGwziXgE/HRgvEq0X+2nFIVqf8oxybmbwoOnh5kP
 WNEgCTpehcihntc8bkeqBIqagqfg3bkR9LBDh7/AXSt2ooDcovQyQtE/PMuAjQP9x9ZL
 4mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s7PJ51jzBATxkQNcxoYSFNAfapcaizQoguoJb33d/p4=;
 b=SSDV0X725DiYigNa1ro9RIACjFOLO16uQBNiR/jdpAXrTjMAxDr841U79GqOANVDfE
 uTE7bjPfWyv+9NqFiETsL9WN/lB0sSITrCXJgkM98WqXZtVahb8nmZH1NbpiPeOQWMOG
 2CzQdtkXMS6ITCKFimHwGQfgAy+kKM69Fx0qYVWpoub0x3+u+4F0PuS5obxeNGYipHwK
 AFOrSLaX4t0TwnO+ajgpSSEm2CQHSbLJMMHsdpLOyL75OPRgbbwR37jpnhLNNonXl544
 4lN9wOzQWuzP2gTXzShsmk7km+JReumW75esAtsnIRs21ifyab+5GETljusdQUyUzlCJ
 7+wQ==
X-Gm-Message-State: AOAM530brFYpU09F73VkeRfQh0Gvq8YWG/VERj6TYyjA8jRNrBlPk+Ns
 rCHmbqx3mpJ1Z7IilmGHfwARAA==
X-Google-Smtp-Source: ABdhPJwmJvFoqrupjRpYqmBPUVhmrD1pAbYz6xWYlJkq5iqmdsMsQmBsGyW4YKVlY0r4cCz8NyVMAA==
X-Received: by 2002:adf:c454:: with SMTP id a20mr10937019wrg.314.1611456788006; 
 Sat, 23 Jan 2021 18:53:08 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id u17sm16189542wmj.35.2021.01.23.18.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:53:07 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [RFC PATCH 0/4] hw/intc: enable GICv4 memory layout for GICv3 driver
Date: Sun, 24 Jan 2021 02:53:02 +0000
Message-Id: <20210124025306.3949-1-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GICv4 sets aside 256K per redistributor configuration block, whereas GICv3
only uses 128K. However, some codebases (like TF-A, EDK2) will happily use
the GICv3 functionality only.

This set aims at enabling these codebases to run, without actually enabling
full support for GICv4. 

This creates a ... problematic ... system, which will misbehave if you try
to use the virtual LPIs. But it does help with letting me use QEMU for
modelling a platform containing a GICv4, and share firmware images with
other prototyping platforms.

Leif Lindholm (4):
  hw/intc: don't bail out gicv3 model init for revision 4
  hw/intc: add helper function to determine gicv3 redistributor size
  hw/intc: set GICD_TYPER.DVIS for GICv4
  hw/intc: make gicv3_idreg() distinguish between gicv3/gicv4

 hw/intc/arm_gicv3_common.c         |  4 ++--
 hw/intc/arm_gicv3_dist.c           |  5 ++++-
 hw/intc/arm_gicv3_redist.c         | 15 ++++++++++-----
 hw/intc/gicv3_internal.h           | 12 ++++++++++--
 include/hw/intc/arm_gicv3_common.h |  3 +++
 5 files changed, 29 insertions(+), 10 deletions(-)

-- 
2.20.1


