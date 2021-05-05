Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4AA374ACB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:50:03 +0200 (CEST)
Received: from localhost ([::1]:36118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lePP7-0002aw-Ti
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1leOvE-0000wr-Ry
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:19:08 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1leOvA-00005p-7h
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:19:08 -0400
Received: by mail-wr1-x430.google.com with SMTP id v12so3333719wrq.6
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ZhvdvmWrA6ybm8U9MmUGfoOH3sdOOlUUCSfB5oT4a0=;
 b=e6Qrw4RHO04rYTLn04s9I2IW0y2HL9suGLw3hNLYYbiDpCCHyi7Hp38ivBtzi7inNZ
 McEJhrewzyl3aqkLJhwtEiG+TxYdnYCajWeHkTUkRFMKv3Ydz4xeazmPt1tfWmZ76cyp
 Xbv5CMv80J1gBykX2dQK+zjzHXPRH7GtxY+SUVYUAOqC5IQa8yGWIndcvp8cow9WHXTW
 NFmqBE4ialYp9ilWUfsUMBoe4JNxU1VnzZW2RmAL+J2YoinredNruLS6JdWTT8yAEeu+
 6PZwwCRScWBG1VNI3YYSq9H+5Fi/kXLoiWzz5r00WKuAOs88O1U9PeIyL7qVe5T0yF5t
 ujkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ZhvdvmWrA6ybm8U9MmUGfoOH3sdOOlUUCSfB5oT4a0=;
 b=jyeq0z7QdFTX0XoxlI12NRvgTg5VvkyBFBmRtxo82juh3RXSCHQI0e194yYTBBTNok
 SGHwlme5aku1GYGXfGeWINeNFcQQ+mImx5kTg59L3w1FHt/plxStoZBW/jQ7ZWEEImLL
 D4JaQdBxTb+0srO8NThLjTECNW82UTT0zuJjaIWUs9OJBo62voTQQKsO9O4I58Uy1aGb
 slTRl4xycce9YSlKGLxJqbiUI3QLIBkqDQWXyEBZTByzLxpClLDgn+7hVLjNOA72yjr6
 nH+dJ73zyBh4QO1fi47vHsU3Yi//MN5cBY5K8yoH2Tlu9XX2lNlpSexkEx13ZjO2Fx50
 z0Rg==
X-Gm-Message-State: AOAM533oGcam57VDgQV1TVrcZUgH3pPsu3jNv4i7uyS8VSpBG1bWpdHc
 l0XIs2MhSiY00NpdywWOOgj0MrGWow+sNA==
X-Google-Smtp-Source: ABdhPJyqo0se6tjfVZYl1yaX1P2wP0bfGLM12WH446kkAn0tTV/OaUdMRzb9Ay/VaoMAXuPxFVTACg==
X-Received: by 2002:adf:e70b:: with SMTP id c11mr1118438wrm.196.1620249535719; 
 Wed, 05 May 2021 14:18:55 -0700 (PDT)
Received: from mrolnik-NUC10i7FNH.mynet
 ([2a02:14c:234:9200:acde:dd9b:810c:5ab6])
 by smtp.gmail.com with ESMTPSA id p14sm710101wrx.88.2021.05.05.14.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:18:55 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC v1 0/1] Implement AVR WDT (watchdog timer)
Date: Thu,  6 May 2021 00:18:48 +0300
Message-Id: <20210505211849.101005-1-mrolnik@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=mrolnik@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Michael Rolnik <mrolnik@gmail.com>, me@xcancerberox.com.ar,
 konrad@adacore.com, richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1.  Initial implementation of AVR WDT
    There are two issues with this implementation so I need your help here
    a. when I configure the WDT to fire an interrupt every 15ms it actually happens every 6 instructions
    b. when I specify --icount shift=0 qemu stucks

changes since v1
1.  correct RW or RW1C behavior is implemented
2.  icount functionality is fixed
3.  I still observe something strange, it takes AVR 150 instructions to simulate 15ms


*** BLURB HERE ***

Michael Rolnik (1):
  Implement AVR watchdog timer

 MAINTAINERS                   |   2 +
 hw/avr/Kconfig                |   1 +
 hw/avr/atmega.c               |  15 +-
 hw/avr/atmega.h               |   2 +
 hw/watchdog/Kconfig           |   3 +
 hw/watchdog/avr_wdt.c         | 274 ++++++++++++++++++++++++++++++++++
 hw/watchdog/meson.build       |   2 +
 hw/watchdog/trace-events      |   5 +
 include/hw/watchdog/avr_wdt.h |  47 ++++++
 target/avr/cpu.c              |   3 +
 target/avr/cpu.h              |   1 +
 target/avr/helper.c           |   7 +-
 target/avr/translate.c        |  38 ++++-
 13 files changed, 391 insertions(+), 9 deletions(-)
 create mode 100644 hw/watchdog/avr_wdt.c
 create mode 100644 include/hw/watchdog/avr_wdt.h

-- 
2.25.1


