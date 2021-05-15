Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84291381B52
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 00:12:09 +0200 (CEST)
Received: from localhost ([::1]:55206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li2Vz-0006tm-8U
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 18:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1li2U1-0004pO-Pi
 for qemu-devel@nongnu.org; Sat, 15 May 2021 18:10:05 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1li2U0-0008RM-3b
 for qemu-devel@nongnu.org; Sat, 15 May 2021 18:10:05 -0400
Received: by mail-wr1-x431.google.com with SMTP id h4so2537464wrt.12
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 15:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/PCPLJOsqIbv2MFqG6Kv9s3GpmgT/JOx3XLEHIoMuk=;
 b=KXIVkGfFwk4Rj+M86UtIGORSlO+hAVo2hzKlvcRofPFeAG8gzBnkNFRSfl1WtcNP1d
 WYmgJbMDQJuWsN+LmrU4pBUxBfQHDCxgmXySbStaev0jJr52UOj2WBsT0bnmbWuBSC5M
 nFIYEAP3RmIWDSqFLD/JOxfj6msyQmXiXKJkWpiShdOsiai4tCoefva67wjXHgxzvmLC
 +pSRjs0KdVTFvTlNN0fQqu29yTTSP6ZwSHB1W7CS84oT2nPZx29aYP+vg6eM6p85sP5D
 IZu17yMjFBkvBR7kVIZH0eDnkMDlgC47EhmosWxt7SGgXXRcnE1Vda6oFzcqOWNQ9SaI
 suug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/PCPLJOsqIbv2MFqG6Kv9s3GpmgT/JOx3XLEHIoMuk=;
 b=d5fgXzTBPz1YE4kv0ZrcMVF5VAICsJ0zpLORPuCRRVqZRWYeS3P0cNgbrpOhF4/MQO
 N8ECVk35pnw0gkSMyFEHVxBv5NdSiSAdfs+NZUTuD7JK124py/Z3FOSEGo6vAcglgZY1
 V+E3Wb/oKjfx8roa5HaDR3fdrHr4qgAzFnohJ4AvqqLTv9BL6Jy/iNeDpeN0jpWY41bF
 WDJJ3t6D9y6C+mJ5tceKmZ+80c0tBvqcjxq6OF2wjCCOhpPZkHPikszoVjuRR++l+x1+
 n10beyWobbG6ZmnIWHsa0rT0Lt22oyu5CEswMlvSrtZ8458+b36SMF3caNjE3gDbXqjQ
 SvmQ==
X-Gm-Message-State: AOAM533nXr2HCoiBBk9koFA4p2hr7qg7Me6ZwDkmebsNgApYDhAOHK/j
 BhEdnd3o0L31iIfmRBppfcdr8reAervlHg==
X-Google-Smtp-Source: ABdhPJzsbQIMfsguCY11Zk5ff8YBPeyUdKEbxRBi+TrRzDCvfC7MocALtEzOGUHcphSVQ8S/lH3w3g==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr63582912wrn.180.1621116601784; 
 Sat, 15 May 2021 15:10:01 -0700 (PDT)
Received: from localhost.localdomain ([2001:4df4:24b:2f00:952c:e8b5:99dc:4d3e])
 by smtp.gmail.com with ESMTPSA id r7sm8216022wmq.18.2021.05.15.15.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 15:10:01 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 0/1] Implement AVR WDT (watchdog timer)
Date: Sun, 16 May 2021 01:09:56 +0300
Message-Id: <20210515220957.13053-1-mrolnik@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=mrolnik@gmail.com; helo=mail-wr1-x431.google.com
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

changes since v2
1.  use REG8 & FIELD macros to define registers
2.  fixing ICOUNT behavior

*** BLURB HERE ***

Michael Rolnik (1):
  Implement AVR watchdog timer

 MAINTAINERS                   |   2 +
 hw/avr/Kconfig                |   1 +
 hw/avr/atmega.c               |  15 +-
 hw/avr/atmega.h               |   2 +
 hw/watchdog/Kconfig           |   3 +
 hw/watchdog/avr_wdt.c         | 279 ++++++++++++++++++++++++++++++++++
 hw/watchdog/meson.build       |   2 +
 hw/watchdog/trace-events      |   5 +
 include/hw/watchdog/avr_wdt.h |  47 ++++++
 target/avr/cpu.c              |   3 +
 target/avr/cpu.h              |   1 +
 target/avr/helper.c           |   7 +-
 target/avr/translate.c        |  58 ++++++-
 13 files changed, 419 insertions(+), 6 deletions(-)
 create mode 100644 hw/watchdog/avr_wdt.c
 create mode 100644 include/hw/watchdog/avr_wdt.h

-- 
2.25.1


