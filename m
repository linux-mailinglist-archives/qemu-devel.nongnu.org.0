Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C885774FC
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jul 2022 09:37:35 +0200 (CEST)
Received: from localhost ([::1]:42366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCyqL-0006l6-Tp
	for lists+qemu-devel@lfdr.de; Sun, 17 Jul 2022 03:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCyml-0001Y4-KG
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 03:33:51 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCymj-00052W-K2
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 03:33:51 -0400
Received: by mail-pl1-x635.google.com with SMTP id 5so6551797plk.9
 for <qemu-devel@nongnu.org>; Sun, 17 Jul 2022 00:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ndCZU0Q1a2+zL6vsezxtOTr9aHgmqpKDESFv+m8rnuA=;
 b=W53lz71iCUgniWRimcTmafQCikPQVVZUBVwiELA86ZpjtsrtZpfkGQd/vo6BLnE4gT
 BUFfeAzXHSZ5agdaDcsezNVURcJoP+wVINinYWL+7dQA4yT8k/rzzqlso8Ob1nADfukD
 nlVz3NeIE/yxDD7W+bHL+VmSik+mzABYkECB0t2g+UDB5FySO2+i4iO68OPBzZGgus16
 2eLNljPmEbEU/eI2oTBgWb8MfleCntkWOZqclB9RDc9LO0wGuJCxFhE4oI/+dB7utv2R
 GgiVUrP0zQ8VEYUUA5r/WR3tBVjLB4lQZ9qreKQg0pa4620AKMVL1cFxE8tZBptWZeE6
 R7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ndCZU0Q1a2+zL6vsezxtOTr9aHgmqpKDESFv+m8rnuA=;
 b=dWiR3uP6ieDGFuyrxhW2kqV6+O5PP3uK6feLweUuyxTyiALZiyqj0uyMVrOEnzhSHV
 Lyf6oR5NsG8ikr8ui8vQAI/W2lsSO1z33A5aLfSZfHiCHA84l59N+Kv7EFWoO0oT+eBy
 GtlOe1mrAvdmmK9l8a9F3C2pEcccsU5+erZpjBLfXVol5rI0Eg9rEq884eBfI+desOKG
 fkr+P1DTzcWwNPbuLxCMnk0ABpt5kQZM/b7oSe5N6L5O6WZqDggUWFqZ530kTLLn8UjO
 6We3DHuAyp4oFashbYVGpagp7YmHwhRX/seHs8m5qyObIfUb1FBOrxooUg2cC0QrsFGB
 RfYA==
X-Gm-Message-State: AJIora9MgzdsxrqWQFZc4kab6CFAmzX7w7hIzTR0JMUC/fRQy01UBNyr
 nRaIwm/loZ6eRORaXN9KDdYzpRlxo7c=
X-Google-Smtp-Source: AGRyM1trlQdkpDqgXBtuAlgO7A2Avr/RELmtzwL3BJ7Z5Z6HpcsHpddPcNl0bA7sqwxfUATKft6l0g==
X-Received: by 2002:a17:902:7c04:b0:16c:2e00:395a with SMTP id
 x4-20020a1709027c0400b0016c2e00395amr22461119pll.123.1658043226923; 
 Sun, 17 Jul 2022 00:33:46 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:ece4:54e6:b565:8dcd])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b0016c4546fbf9sm6793364plh.128.2022.07.17.00.33.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 17 Jul 2022 00:33:46 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v4 0/3] ui/cocoa: Run qemu_init in the main thread
Date: Sun, 17 Jul 2022 16:33:37 +0900
Message-Id: <20220717073340.25830-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x635.google.com
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

v4: Asynchronously call -[NSApplication terminate:] to avoid potential
    deadlock with qemu_thread_join(). (Paolo Bonzini)

v3: Document functions involved in startup. (Peter Maydell)

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
 ui/cocoa.m               | 168 ++++++++++++++-------------------------
 9 files changed, 76 insertions(+), 142 deletions(-)

-- 
2.32.1 (Apple Git-133)


