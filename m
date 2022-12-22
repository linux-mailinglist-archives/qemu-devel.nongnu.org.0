Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0019654814
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 22:57:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8TXp-0005z2-PB; Thu, 22 Dec 2022 16:56:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TXl-0005yh-6z
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:56:02 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TXj-00078l-Lg
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:56:00 -0500
Received: by mail-ej1-x633.google.com with SMTP id bj12so7882865ejb.13
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 13:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U6OB+osXLSH5rsjdTEcuOpIx3EZfV0y8ZIYPN7oPYLs=;
 b=eaeT8tDS+rX486vZ7f3STK14HEPWH473aA+yQ6v64ROApXywLkMdephJuFtzYeMOil
 73uNmukHZ07xyH8ihzU4vEVudZI7IqjGCS8p+soaXE3tDj6SwZeiR1KEkbl3bBA48QgC
 DtKZsvmZknHiE8Zjsqt+LzETRhsQO5LNVpinMF98Ecuttdm3gkMZy/KKpRUveEc5XLhJ
 TjTjwbrevMhKBy9ZzRkRb/U01o9mixi2t8uCVVn5E0VrSSBVV/bw3crFkS9+AHPH27dN
 ATICZKtfHoTjTD/G/Am+2Gu+kb2tAWdB9xTdFvBvVqrO+tq9u+zSycKpLdY+b51emBLT
 UEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U6OB+osXLSH5rsjdTEcuOpIx3EZfV0y8ZIYPN7oPYLs=;
 b=XkaSwX7/I2NcaoNQRwrxTKTDnelwCBC3Uz96fNhYEbB72MCprsKrdou41+2nV6qX3q
 mKFfT6mpEoUwi4AkTHHdUA4tL+cJ+OyVP7csUk+MWofD9QJBVhwwc4OdkC0xCxmMNt6W
 imTO8o/XwIxey12jVu3i2fjxPCVmd9Ht07HAQLbJwfaR3kdEi8m5dncNpR6ws4vwL6sZ
 9QRc7bXl1n8ac7CVL3uV9GV9wGARGXpPwBTnUsgmVX0JQcVnAF4DH6hkFv/2NwAv3yJO
 dbxdF+I+PFdg5TcXY4aMvLCnFrTYuyBxnJQu/+sdXsilBduBgDFS4RHEuYmkgiO4k70v
 jq1w==
X-Gm-Message-State: AFqh2kpGO7cx/0HRQ+4Daaa2tpWAGBE8Mm9ilMK2lrQN9/suQz18z00I
 LazG0jHfZwtraQA33S8zeqXF/wagW8T/tyIPFKw=
X-Google-Smtp-Source: AMrXdXtcMVzoXP00Jhpcw/8WHHbaTFyDGIHguOUOwA9rqB6R+ww0kfxJMiPnXMqicCv7gJe3FOWymw==
X-Received: by 2002:a17:907:d045:b0:7c1:5464:3360 with SMTP id
 vb5-20020a170907d04500b007c154643360mr7931510ejc.65.1671746157387; 
 Thu, 22 Dec 2022 13:55:57 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a170906314f00b007c07909eb9asm677945eje.1.2022.12.22.13.55.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Dec 2022 13:55:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 0/6] hw/arm: Fix smpboot[] on big-endian hosts and remove
 tswap32()
Date: Thu, 22 Dec 2022 22:55:43 +0100
Message-Id: <20221222215549.86872-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

ARM CPUs fetch instructions in little-endian.

smpboot[] encoded instructions are written in little-endian.

We call tswap32() on the array. tswap32 function swap a 32-bit
value if the target endianness doesn't match the host one.
Otherwise it is a NOP.

* On a little-endian host, the array is stored as it. tswap32()
  is a NOP, and the vCPU fetches the instructions as it, in
  little-endian.

* On a big-endian host, the array is stored as it. tswap32()
  swap the instructions to little-endian, and the vCPU fetches
  the instructions as it, in little-endian.

Using tswap() on system emulation is a bit odd: while the target
particularities might change the system emulation, the host ones
(such its endianness) shouldn't interfere.

We can simplify by using const_le32() to always store the
instructions in the array in little-endian, removing the need
for the dubious tswap().

Two boards which weren't swapping (aspeed and raspi) are fixed.

Tested running ARM avocado tests on x86_64 and s390x.

Philippe Mathieu-Daudé (6):
  hw/arm/aspeed: Fix smpboot[] on big-endian hosts
  hw/arm/raspi: Fix smpboot[] on big-endian hosts
  hw/arm/exynos4210: Remove tswap32() calls and constify smpboot[]
  hw/arm/npcm7xx: Remove tswap32() calls and constify smpboot[]
  hw/arm/xilinx_zynq: Remove tswap32() calls and constify smpboot[]
  hw/arm/boot: Remove tswap32() calls and constify board_setup_blob[]

 hw/arm/aspeed.c      | 28 ++++++++++++------------
 hw/arm/boot.c        | 52 +++++++++++++++++++-------------------------
 hw/arm/exynos4210.c  | 48 ++++++++++++++++++----------------------
 hw/arm/npcm7xx.c     | 49 +++++++++++++++++------------------------
 hw/arm/raspi.c       | 46 +++++++++++++++++++--------------------
 hw/arm/xilinx_zynq.c | 27 ++++++++++-------------
 6 files changed, 112 insertions(+), 138 deletions(-)

-- 
2.38.1


