Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606EE370EF7
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 22:12:20 +0200 (CEST)
Received: from localhost ([::1]:37978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldIRv-0004Rd-FN
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 16:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1ldIQY-00040w-3Y
 for qemu-devel@nongnu.org; Sun, 02 May 2021 16:10:54 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1ldIQW-0003Yp-Hi
 for qemu-devel@nongnu.org; Sun, 02 May 2021 16:10:53 -0400
Received: by mail-ej1-x62f.google.com with SMTP id f24so4847864ejc.6
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 13:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GBf3AeDKj6YAb36vgBEoObxYW8oZ310ECU3OjP8uqqs=;
 b=tnOYbHh3uVueRRiJVn3OiZyWwjU8LgufeOzFL9k2nlbGigLdSCz0JkNvQV3SGqpsnE
 PIM+c1Er4V1VoAerr46nZit/JuGMweNswV4w4ZPBp6UAYu7cd45r/JUfIwV4kHZ2L5YJ
 DvZwsIQXQmKBg2HtYxan+keC3Ktm/IjB0w6NtETVUonp6tIB0qzOC1n0WgRu5v6lDTgH
 BphGb/eioLnUSfV6rkC/QAkxYup9kjCtqo60LrviDQ7DxeWEnNpddznnO9txjSAGVmzU
 6w78VEvziAHO9q6vtluOmQqP3Mj+V2fxdGQkB+Bu83X9iBDIqpdF5rHOJaY7sZDvL0xy
 JJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GBf3AeDKj6YAb36vgBEoObxYW8oZ310ECU3OjP8uqqs=;
 b=PkwAfxH4Jgi1nFtrY6Hi7kvdUynukwSzHl00bWq4lfHOnT/ba8qbwyh35/oAgfTqr2
 icmc5hIzywT/GyXvVHRQgoEHPdcrgC4cdg1Dp78GjOBpu8+7lg5J95ewr3IT+Zx02ZX8
 H4mfWUeiLsz0B3QHYgf66XNWrW1z5K8oMA/ep6fJ+O6UMr7qHThObojjgM6X1Qxd7aY6
 SaXxVRfsIg0KtVTqs7NBy7DfyT58LCd7jXjMKp9wH8vkVJQ2uM0sxfLx1JG1nYGZYNbx
 IhgjJwsAoOXHXM1FMcOKcsPQ1pkDJ/jHMWfI+Ap3r67MrPvfanUEKqYUgll3VY/G/ipJ
 uzzQ==
X-Gm-Message-State: AOAM531CdnN3YMV9G1msYdMDM2TvVMTZC7+/rWqIW5dtrloKzmr4B+Xd
 RoyP6AeW6LLo5l1rp+ceHv2DoB9Q8Ie2Cw==
X-Google-Smtp-Source: ABdhPJza47BXybmKi2+ySa5MbLIhI/3bkIIrcja82G4GqG1eGF5hByYlpkiFKN2U/4xWPfhr8+grsg==
X-Received: by 2002:a17:906:a295:: with SMTP id
 i21mr13616036ejz.160.1619986250975; 
 Sun, 02 May 2021 13:10:50 -0700 (PDT)
Received: from mrolnik-NUC10i7FNH.mynet
 ([2001:4df4:30e:9b00:8f7:3de1:39e4:6675])
 by smtp.gmail.com with ESMTPSA id p22sm11032255edr.4.2021.05.02.13.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 13:10:50 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/1] Implement AVR WDT (watchdog timer)
Date: Sun,  2 May 2021 23:10:38 +0300
Message-Id: <20210502201040.52296-1-mrolnik@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=mrolnik@gmail.com; helo=mail-ej1-x62f.google.com
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
 hw/watchdog/avr_wdt.c         | 190 ++++++++++++++++++++++++++++++++++
 hw/watchdog/meson.build       |   2 +
 hw/watchdog/trace-events      |   5 +
 include/hw/watchdog/avr_wdt.h |  47 +++++++++
 target/avr/cpu.c              |   3 +
 target/avr/cpu.h              |   1 +
 target/avr/helper.c           |   7 +-
 11 files changed, 271 insertions(+), 5 deletions(-)
 create mode 100644 hw/watchdog/avr_wdt.c
 create mode 100644 include/hw/watchdog/avr_wdt.h

-- 
2.25.1


