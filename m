Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15E370EF9
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 22:13:58 +0200 (CEST)
Received: from localhost ([::1]:41304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldITV-0005qw-Kq
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 16:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1ldIRw-0004nf-N6
 for qemu-devel@nongnu.org; Sun, 02 May 2021 16:12:20 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1ldIRv-0004QO-41
 for qemu-devel@nongnu.org; Sun, 02 May 2021 16:12:20 -0400
Received: by mail-ej1-x631.google.com with SMTP id m12so4882110eja.2
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 13:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B7atDk5Faf5vw/+84jFmPALmt3M+9CqHKID1soFk3Qs=;
 b=EhiMk/SEGmDA+VHP36T8SX17Sz6nG9C0CKx0S9fmLXqRdjxVwYvUBwGbgMPEuDOXD2
 JiNk0B+b3T6hxIH0iyy2V+33BzabKoxP+vL5wDxie4ekX23UkcTiz4PQrsR8tpmQd8yo
 K2laZQ8D6jKxqwyduZfgH0PWiEZOromu72CdOplSOq3JC510gOmxgTRbCzjhn/eI8uEU
 N6xb+XaiBk4AYF/wLFnfQpsLlPmpHS9bpDlmOkFSAQr2/+CyvmqFNGZ34+bMLf1gZB5V
 C26+eyBFAvPraYf5CPxIR8YcJMgH693hnxU2CXy0euKalU7rp59Aoz9HGITFKVsozFEq
 QXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B7atDk5Faf5vw/+84jFmPALmt3M+9CqHKID1soFk3Qs=;
 b=mWadehBnBVPqz65SPoSUKW7WvTxliRfuT/h+8W7ctx1jU25MVPcOkWmf2tGHdUx5c4
 0RsC5RPHPf5Cbok6l8hexU5LYDJ+RS/E1IADPwmN4BX3nCP1n/0X+Z4U4ty753oNP8Ak
 91nV2eS8XJ0WZiCgNGsXQ2F3y9Ie4EJBXQ23XZ4GCo/HwwGoJePRlwkbFJ63zstMJjeA
 jEXgUIq63HOmOM42eKb4UjdP2Dyb33f3rXLB5nrwl3C3Fif+Ug9c3PowBD2qW1CUGDlY
 BIUdV1LTytQT3QQ6R/dlctxEoBXQrfzteqv3r7sdXilIq5pir/HBuEEhDAt1h60v++ef
 Rd6w==
X-Gm-Message-State: AOAM53395NbhIpcO/hyWttq62AepdmzFlTgIN7Rti9LXOH+U5bDc+31B
 TclpcpmendLNLEqG1z6Crj4naqzlyAmS6w==
X-Google-Smtp-Source: ABdhPJxWoOF6+Hionoldj2vAms6Zw9HbjGlxeWj+MT3OiZZmr4peLzINg/N0yUl9wf6w745HvnMk2w==
X-Received: by 2002:a17:907:6289:: with SMTP id
 nd9mr13405597ejc.384.1619986337527; 
 Sun, 02 May 2021 13:12:17 -0700 (PDT)
Received: from mrolnik-NUC10i7FNH.mynet
 ([2001:4df4:30e:9b00:8f7:3de1:39e4:6675])
 by smtp.gmail.com with ESMTPSA id p22sm11032255edr.4.2021.05.02.13.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 13:12:17 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/1] Implement AVR WDT (watchdog timer)
Date: Sun,  2 May 2021 23:10:39 +0300
Message-Id: <20210502201040.52296-2-mrolnik@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502201040.52296-1-mrolnik@gmail.com>
References: <20210502201040.52296-1-mrolnik@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=mrolnik@gmail.com; helo=mail-ej1-x631.google.com
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

Michael Rolnik (1):
  Implement AVR watchdog timer

 hw/avr/Kconfig                |   1 +
 hw/avr/atmega.c               |  15 ++-
 hw/avr/atmega.h               |   2 +
 hw/watchdog/Kconfig           |   3 +
 hw/watchdog/avr_wdt.c         | 188 ++++++++++++++++++++++++++++++++++
 hw/watchdog/meson.build       |   2 +
 hw/watchdog/trace-events      |   5 +
 include/hw/watchdog/avr_wdt.h |  47 +++++++++
 target/avr/cpu.c              |   3 +
 target/avr/cpu.h              |   1 +
 target/avr/helper.c           |   7 +-
 11 files changed, 269 insertions(+), 5 deletions(-)
 create mode 100644 hw/watchdog/avr_wdt.c
 create mode 100644 include/hw/watchdog/avr_wdt.h

-- 
2.25.1


