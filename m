Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEAF5760C0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 13:44:17 +0200 (CEST)
Received: from localhost ([::1]:41504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCJk0-00057F-ED
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 07:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCJgi-0001vh-6Z
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:40:52 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:44682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCJgg-0003jt-GD
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:40:51 -0400
Received: by mail-pg1-x534.google.com with SMTP id bf13so4154771pgb.11
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 04:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HL6lLjGofvPd6nfUUDU86wPWwbTfDjeIgso8yeL+650=;
 b=VPsBXCUBNPScLV3+uCnLdr3BCfUB7Ebp7jYPjussnswYn+wLYcHrSAdd/wXBBD6rTh
 aZNmWhUTrlkB2q+vOoY47xBxkMYrz9p2OIXeLXzPQG8f3KKIY+5xYv4FHlglQksEU/Et
 ftVP4a2kytTIXXGSVfAriEA3snd1Zqr/a+o2LqaL2gWH0TycHAHSK4TGNyc8Mxkes4k8
 xbJ6wsZ/QOxdOuKYUB3FLeSoWsqZ8JUuBK0I592Xy7n5ZA0gnG6KW7nxg920Csz4D8l2
 NRU2+0HklDJSV1E96Rxol/h0G8AckBFa6Q/y8lanhoABuWekq/pssD0bKpBUaNd7px15
 +i9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HL6lLjGofvPd6nfUUDU86wPWwbTfDjeIgso8yeL+650=;
 b=TM7FUt711PJaZRGjMA82/UKRNIFfDOxlv+QqHxuRLdzW7zbMAZfIk7YhRvTsA4ihn3
 LKA+nUX0ZWFceGGN9JsM+X3kpMnFsuSteyulDsCmIkM3McoY2+SBlVFQBnEX6HJcXcAJ
 znDuUn/FkjAKBS/Bp6N/gnIhe2qBt/GesUB4X6/OreaJO3XEePLJ07L0/UaP/v+xEYld
 L9uL0/qOSGEX0FqqiPzhg2Ffo/MbaNpjim3qeO3VRPI0fDz417n8kzWpKI6Tm3NOdNkx
 RxTT2xJjSavobg8ylpLeJJBnFl9PgMKC3BCRcdsm1ATFQXg1tkuvPLGSEYFE7MnW8mHr
 p5UA==
X-Gm-Message-State: AJIora//Hbs4iF1ptK8z9DgGU8FrSB6PT7XS/n7ybrd7iAuTkdp0wngG
 E85AuuRs+6dGha18nBmRw9byaoe7TeQ=
X-Google-Smtp-Source: AGRyM1tg7u7FKpChUrpkpZhIOWgwZaMgnsGU2G6FA8/OHwxWudUV8Uz+ZWuN/XygMHcoT0Q7DrkZlQ==
X-Received: by 2002:a63:db41:0:b0:40d:e79f:8334 with SMTP id
 x1-20020a63db41000000b0040de79f8334mr11612151pgi.565.1657885247762; 
 Fri, 15 Jul 2022 04:40:47 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d554:ffbd:f962:2efd])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a170902ca0400b0016c67a3b7d0sm3258627pld.61.2022.07.15.04.40.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 Jul 2022 04:40:47 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v2 0/3] ui/cocoa: Run qemu_init in the main thread
Date: Fri, 15 Jul 2022 20:40:36 +0900
Message-Id: <20220715114039.59790-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This work is based on:
https://patchew.org/QEMU/20220317125534.38706-1-philippe.mathieu.daude@gmail.com/

Simplify the initialization dance by running qemu_init() in the main
thread before the Cocoa event loop starts. The secondary thread only
runs only qemu_main_loop() and qemu_cleanup().

This fixes a case where addRemovableDevicesMenuItems() calls
qmp_query_block() while expecting the main thread to still hold
the BQL.

Overriding the code after calling qemu_init() is done by dynamically
replacing a function pointer variable, qemu_main when initializing
ui/cocoa, which unifies the static implementation of main() for
builds with ui/cocoa and ones without ui/cocoa.

v2: Restore allow_events flag to fix the crash reported by
    Philippe Mathieu-Daudé.

Akihiko Odaki (3):
  ui/cocoa: Run qemu_init in the main thread
  Revert "main-loop: Disable block backend global state assertion on
    Cocoa"
  meson: Allow to enable gtk and sdl while cocoa is enabled

 docs/devel/fuzzing.rst   |   4 +-
 include/qemu-main.h      |   3 +-
 include/qemu/main-loop.h |  13 ---
 include/sysemu/sysemu.h  |   2 +-
 meson.build              |  10 +--
 softmmu/main.c           |  14 ++--
 softmmu/vl.c             |   2 +-
 tests/qtest/fuzz/fuzz.c  |   2 +-
 ui/cocoa.m               | 167 +++++++++++++--------------------------
 9 files changed, 72 insertions(+), 145 deletions(-)

-- 
2.32.1 (Apple Git-133)


