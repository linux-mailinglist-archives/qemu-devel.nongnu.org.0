Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B224370EF6
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 22:08:30 +0200 (CEST)
Received: from localhost ([::1]:35048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldIOC-00034n-OL
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 16:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1ldINE-0002Z2-2n
 for qemu-devel@nongnu.org; Sun, 02 May 2021 16:07:28 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1ldINA-0001KS-Ga
 for qemu-devel@nongnu.org; Sun, 02 May 2021 16:07:27 -0400
Received: by mail-ed1-x52f.google.com with SMTP id i3so4022956edt.1
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 13:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B7atDk5Faf5vw/+84jFmPALmt3M+9CqHKID1soFk3Qs=;
 b=Yf+N8sVJWE9bTTwkmr7s6GFC7ZjnbhrXV7CL8zuUw5b6tKPbegrNvUnk9BM70pLOEH
 NlnFa/qS/jLol1n8uu2hq5KpgWGk6n85zwjDfWLNZQkZci8l5z4sua7sra/3c48vafvs
 Z1S2E/hb7x6tzc0DdS1ZB9itSugTfXlNhyDrQxJybQ9QPUfK1UqxRNgOG3mJJDTeY2j9
 BYD9oR7FKBAmQaw+ri9pa3ObgiiYS/VXBI407M7VYSJ0fDHI+R/V8f1TaKFOGRwBf7gC
 4P84SNeEe7t2d7ruJRwMrMS0PvKJHoCxFqraz0H8aZIKNnskLHXbE7nDcUxpk5OUqdz2
 8WtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B7atDk5Faf5vw/+84jFmPALmt3M+9CqHKID1soFk3Qs=;
 b=YuzATnBI04/E4auFn9FXfPCBrYn22s6E1eQGMYExi1MFmrb5AUGkHCTXlzvd35f13x
 HVnFt/EdFpKjPDL1blr2XDP8jpiRHpU54e+cE56Lp0i5D7sDd4Gz6Z6G1RaCmCi6vupt
 XXzh6MoA695QrHeevqBsn14iVdzxT8F5vod4XCp4L5d1tF+hZT8x+YykKlEOnML4itFh
 lTmk9v4t2gReD7b1MnLmAz48YHVC0ZMwmAtlDAmfTRT+MhRrZElZrLR29uZB3tql/nU2
 O7Gp+KwDJYk1ps+uwF491A2Zy8OX60IXhBQm6XNtvQFsLmh/Dzm+RJ4XQXVWrOHKRqBC
 VF5A==
X-Gm-Message-State: AOAM53350FCU6RejAPOIZS1+FgPUOCaSmCcFtvS8y2mdR/W9lc+LR+Xc
 NnNcqCRV0eQYKlsutWL1H4I2a39edMJT7Q==
X-Google-Smtp-Source: ABdhPJxc1lwBqqsrHpXHfSkVhDir3uHEJWA2nNW9GI5AKMMpPQR5iJ5meZFbzRwPUGHMJl9++/WdAA==
X-Received: by 2002:a05:6402:1013:: with SMTP id
 c19mr16810210edu.213.1619986041915; 
 Sun, 02 May 2021 13:07:21 -0700 (PDT)
Received: from mrolnik-NUC10i7FNH.mynet
 ([2001:4df4:30e:9b00:8f7:3de1:39e4:6675])
 by smtp.gmail.com with ESMTPSA id t22sm10674646edw.29.2021.05.02.13.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 13:07:21 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/1] Implement AVR WDT (watchdog timer)
Date: Sun,  2 May 2021 23:07:16 +0300
Message-Id: <20210502200717.48808-1-mrolnik@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=mrolnik@gmail.com; helo=mail-ed1-x52f.google.com
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


