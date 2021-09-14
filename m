Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D4540AD12
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:10:41 +0200 (CEST)
Received: from localhost ([::1]:47148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7Gq-0003F9-Ly
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7Do-0000fH-Bs
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:07:32 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:46746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7Dl-0001Gq-Bf
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:07:32 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso2334089wmd.5
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yVzonKb3Z2paD7vGj+uwPJ4SAE1zyLr8B8FFP9nvw3Q=;
 b=koEqc8RLIlw4ibjuiAb4v2tjremAuBp1C35vwY3T35xyS5+/f9r1PJsHb7tum+vQXv
 n+IY4ihrdNMlrOxoqRV1eVC+CfeNVYT0Kf0E5BdxbOX1FHOjMVekoNay+BoaHqbwA8HT
 AtOQ3/jPTX9vP3aq+u4gKuWp8rAXc/ODf6XHHzF9SLYvLKBm0c9lqNCmWFpVZV8Lt+AY
 bPvVniRPifWyd++x+8EUCqiIYDVtwEmZgbLrBhZP4YuXWmQgl2m7p6BgAsKhstpAKemt
 XN/y5ZVcWL4VLhd2xQwg7CJGcZ6p1eWi8PsgNN8A0D6Unh5qgqBZuHyIb5UESQUz4uud
 eKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yVzonKb3Z2paD7vGj+uwPJ4SAE1zyLr8B8FFP9nvw3Q=;
 b=Z9SfelUGrVwWhK7FhzvBa42u+KNEQeEX+ayeS1Ntky+xNPneocBrFDrgJdGVWkR4wB
 g9j1m6OWiDvvat3C1Rec85fmE3rvsXIGoElUNxYadyI7rUuQUjQZpS+6br0zjcgb/msx
 2Lm6lAu7UWlWbsi+0OMVcLJqHyOWOoq39neAvT7Y2rGN/aYznlau7/qvSICyUcXs87KZ
 5pCi46H6cpb4rBRFQhHwyuorSue2gQK1WDqvKcK6CFtz3gpXDISONKhXt6xXo1npZX4Y
 P+pH+j+SmKr5lgQ/dSV5oSap288stCZDlqH46gAA+eKK/RBLAGKq4SSvN2ohiuNqdDw8
 Yztw==
X-Gm-Message-State: AOAM532f354VWZ6RCMpGnfIUQ72NVU8c0iqBB+rKev0GzvhU5+67oOSM
 lWCWe8RZHGjf3vlKc911G9xc3Q==
X-Google-Smtp-Source: ABdhPJyEtACEL9csAnqbCp0CBMP97JKVP5tGJ4yiAPd3qoPu6+cALAoAOL5TZv8k4euY6WyptWIY8A==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr1822089wmi.4.1631621247620;
 Tue, 14 Sep 2021 05:07:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o10sm11472466wrc.16.2021.09.14.05.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 05:07:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: Set FPSCR.LTPSIZE for user-mode
Date: Tue, 14 Sep 2021 13:07:22 +0100
Message-Id: <20210914120725.24992-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Christophe Lyon <christophe.lyon@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset fixes https://gitlab.com/qemu-project/qemu/-/issues/613
which is a bug where we weren't setting FPSCR.LTPSIZE correctly
out of reset for the user-mode emulator. The effect is that
when using an M-profile CPU with the low-overhead-branch or MVE
extensions (ie the Cortex-M55) with the linux-user QEMU the 'LE'
instruction would take a UserFault and MVE instructions would
be incorrectly predicated.

This is the result of some over-exuberant ifdeffery in the
arm_cpu_reset() function. Patch 1 fixes that so that most of
the M-profile-specific reset handling is not ifdeffed, and
when we're in user mode we specifically set the FPU state up
cleanly. Patches 2 and 3 are just follow-on tidyup.

Christophe, if you are in a position to test this series with:
 M55 (has Security, MVE and LOB)
 M33 (has Security extension but not MVE/LOB)
 M7 or M4 (no Security, but does have FPU)
that would be ideal. I don't really have much in the way of
test cases for usermode to hand, so it's possible that I
forgot something in the init of the FPU state that might break
one of those combinations. (It does fix the test case attached
to the bug report.)

thanks
-- PMM

Peter Maydell (3):
  target/arm: Don't skip M-profile reset entirely in user mode
  target/arm: Always clear exclusive monitor on reset
  target/arm: Consolidate ifdef blocks in reset

 target/arm/cpu.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

-- 
2.20.1


