Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FA8567BCE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 04:17:19 +0200 (CEST)
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ubN-0001xw-Mt
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 22:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o8uXl-0008SA-MS
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 22:13:33 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o8uXk-0007iB-5k
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 22:13:33 -0400
Received: by mail-pl1-x62e.google.com with SMTP id p9so2333936plr.11
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 19:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S+1P1n/XB2m1TDNYukIrX4sMPuLGTCmxUWrrT1GvOGo=;
 b=nE+I6r8E3y5YIGQOVH3hn34cKVkumNLCCNzcTd/yehncWVqM4JDbv4guXd3jL8ET0O
 ct9rMCgwc/VK8khI+/YmydHG4MkphQ9ijc7WhqPeeP/mUTmYMLHDAwOFXpkcchppKjKl
 lBxnKHXl8NdSWWJ50QGJZwZJ/iceqMucEBh9LPiL4GuXE/BONnL6lyxfqaEgnKHzSR2J
 5FL6dPygWbN56dP3dOVV0duxd+bWN2vNuLUmUg739J1gQ5vok5czXHlTdOnxemNBv6WD
 CQP2p309vfLFW8WTOaVS+PuFjRCk/bdvC+UhnL0s697ZSGFPdrhh2jQSG4FPFM1jZER2
 rL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S+1P1n/XB2m1TDNYukIrX4sMPuLGTCmxUWrrT1GvOGo=;
 b=v/UJZ+Jui6ZwjeFX+zdHSX/PncTiAmFhd0PsLQMd57t1iGrngK7KpuKwX92CzEsG8H
 7fHyFxj5caVIaPwo83qOxvSMDdSFSZ/HX8JMMaIg0goVrAOweDOm+TAwWTdl9ziAUNvr
 9r1Zu+nJSwhinU4vRuvpKyOBzvdWIGEbGo0xxzesaVLIu6qLTwNoSfh9+0FdHi3aakPL
 8RYgp+m/USE8o+4+LFmi/cRyBu/eTwV5EtgWsN+zAKrBj4bLh5OhLJFKftfDJrDn1S8O
 q414LLfPCSXs60xQ0O5pHYidfHJIEyuNUhYt6k919uEyxn00uXrKKI87CbOhD8lXkBZ0
 H98Q==
X-Gm-Message-State: AJIora/oqzBu7v+yLOEYIkunfT1B0qlTMRDOagZAnIpbpNk7Ipu7220b
 c+H8UrBiY6sChh2piMCBj+pnH1UGHqE=
X-Google-Smtp-Source: AGRyM1syEOf+JilxGzQEthXFaMfGBC8h174i594QeGEtq7hDhmm0NSYYrCgagxKUJ4PEZxMK9PYR5A==
X-Received: by 2002:a17:903:1c8:b0:16a:6941:10d8 with SMTP id
 e8-20020a17090301c800b0016a694110d8mr44619000plh.150.1657073608825; 
 Tue, 05 Jul 2022 19:13:28 -0700 (PDT)
Received: from localhost.localdomain ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 ij21-20020a170902ab5500b0016bedcced2fsm3334071plb.35.2022.07.05.19.13.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Jul 2022 19:13:28 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH 0/3] ui/cocoa: Run qemu_init in the main thread
Date: Wed,  6 Jul 2022 11:13:19 +0900
Message-Id: <20220706021322.22570-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 softmmu/main.c           |  14 +--
 softmmu/vl.c             |   2 +-
 tests/qtest/fuzz/fuzz.c  |   2 +-
 ui/cocoa.m               | 185 ++++++++++++---------------------------
 9 files changed, 71 insertions(+), 164 deletions(-)

-- 
2.32.1 (Apple Git-133)


