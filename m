Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BECD2C6BF1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:23:50 +0100 (CET)
Received: from localhost ([::1]:58018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kijLR-0002Ll-I7
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kijAd-00059M-T9
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:12:39 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kijAc-0004Ri-1E
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:12:39 -0500
Received: by mail-wr1-x441.google.com with SMTP id k14so6651954wrn.1
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 11:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1bq0iDuC/nznSu3yVWAfM2mAbaoiF3Yk2VQjStX2Hsk=;
 b=kOjgHZURRpECDbByMHDBh9rCsDTIJEU31CjV8XUaBJhHCZUSf+Sw7sC5xszWKkhtIa
 rWj3Y932hM/cKdddFezEJIfg2GFgAde68eF+lm0UTjtn75F+jYWWDSIaQyDMTbbvL18I
 p9cieFXijqgjrigPK+vIWbIfy8++X1SM8aEqt1QQ2phq/xjxt2yMIhHIutlb6mYB/6Tj
 oyvYSsUqRqR/CxF6p3VNBsNvRXXh3naJTm3F/Pmk2cj2div0MFEBqfZN0iKj6PGBiQ3D
 Yj3fYUl0sINdSxkqJ4aHu1k/r34QO6lNrzw6E7RKYLvurQIlfUUx++mrOuCPkd4XKvkd
 2sKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1bq0iDuC/nznSu3yVWAfM2mAbaoiF3Yk2VQjStX2Hsk=;
 b=b2gynXyuJM1IcnWVQ5bTjUb2k7DAa5C7CXcCTb0QbD3aaZOnAw+xrqGNHDfydy7dNy
 cjEcz/u2YsLIBuTnAA8cjyH17HdadSV1MoPWAQa1pitRf1u6rHXb3fOkvt5SyNMRwYwP
 DsVueM3g5/mVIGfUFWCLdbBVY8Oq/CwRK6Nw/BdlV3zfvjlriyBq299fngu5pYRRMxJS
 dcZck7ItDqgVsva5ERrAcXK4nenfQoonpR64M8z05GicbYD7os0lrQF9AwQxMhz1rKkE
 VXUhe/TloZn26lkPE8UO6IwFEtD8+cp03k2BIMwDUcsbV8nkxYKQNzV+AlzIfx9UwuS5
 f6zA==
X-Gm-Message-State: AOAM531h1y/+D9iLaWgdDHz8NBOs2Z811r2s7kb5p7RF9PlrrhzeGE7z
 EYodPifvh9oF5Gj35gZa20xtfMHKb0/oqQ==
X-Google-Smtp-Source: ABdhPJyERhDqrSxKbeVWfU4QGHMnIBjYnCePf6JvNGYWclhW6Q63XTKXpkEZFFFwYdzkQP2rAY8Ajw==
X-Received: by 2002:a5d:6744:: with SMTP id l4mr12512755wrw.378.1606504356059; 
 Fri, 27 Nov 2020 11:12:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 34sm15809722wrh.78.2020.11.27.11.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:12:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/nios2: Roll cpu_pic code into CPU itself
Date: Fri, 27 Nov 2020 19:12:31 +0000
Message-Id: <20201127191233.11200-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
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
Cc: Marek Vasut <marex@denx.de>, Sandra Loosemore <sandra@codesourcery.com>,
 Chris Wulff <crwulff@gmail.com>, Wentong Wu <wentong.wu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(As well as the listed nios2 maintainers, I've cc'd a couple
of the more recent contributors to this target in case they're
interested or wish to test the changes.)

The nios2 code uses an old style of interrupt handling, where a
separate standalone set of qemu_irqs invoke a function
nios2_pic_cpu_handler() which signals the interrupt to the CPU proper
by directly calling cpu_interrupt() and cpu_reset_interrupt().
Because CPU objects now inherit (indirectly) from TYPE_DEVICE, they
can have GPIO input lines themselves, and the neater modern way to
implement this is to simply have the CPU object itself provide the
input IRQ lines.

This allows us to roll all of the code in hw/nios/cpu_pic.c
into target/nios2 one way or another.

The motivation here is fixing a trivial Coverity-reported leak
(CID 1421916) of the IRQ array allocated in nios2_cpu_pic_init(),
and also part of the extremely slow refactoring of code away
from using qemu_allocate_irqs() at all.

Tested with 'make check' and 'make check-acceptance' (which does
include a boot test of a nios2 10m50 guest).

thanks
-- PMM

Peter Maydell (2):
  target/nios2: Move cpu_pic code into CPU object proper
  target/nios2: Move nios2_check_interrupts() into target/nios2

 target/nios2/cpu.h        |  3 --
 hw/nios2/10m50_devboard.c |  8 ++---
 hw/nios2/cpu_pic.c        | 67 ---------------------------------------
 target/nios2/cpu.c        | 34 ++++++++++++++++++++
 target/nios2/op_helper.c  |  9 ++++++
 hw/nios2/meson.build      |  2 +-
 6 files changed, 47 insertions(+), 76 deletions(-)
 delete mode 100644 hw/nios2/cpu_pic.c

-- 
2.20.1


