Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60FE4D9BB5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:01:01 +0100 (CET)
Received: from localhost ([::1]:35444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6nM-0001YS-SH
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:01:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6ga-0003jb-4t
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:54:00 -0400
Received: from [2607:f8b0:4864:20::1031] (port=54257
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6gY-0007dJ-CJ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:53:59 -0400
Received: by mail-pj1-x1031.google.com with SMTP id bx5so17724522pjb.3
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5B8v95ttoJIHmd1QsV6XLmCILpPGXUYhqkPF7td1dg4=;
 b=hfDsYj+rOLkhKx6YiaqlB5a/spJ2pTGfu/hb58KPPHmiWZ5ENpk2YHvdTa6s9AF5vw
 WbeWgz3UDhGxsP6qDWjznqdF0jljh2VNKqMxTr6Mj7gyTAiS8cXxQZZ/gTWfNJD+LVxd
 5WOIVe6uREFGH/C5JYigtRBp6sgQV7n33jYRMr0wljWt0D8/H9ga4jB0BFmwS7fRFyFa
 PPEZ3aStIHJyF0QuKhqQ5rI12O9PfUo/3a8m3WXOpJsRovdex0Li9fowxE7je9w+XITr
 niw5vrdcQpUEQpIz6KynB/8He4h1cwk8A/7OrqIs5YHyOIRvNiZw1P4zlQQ4xdA/StyT
 jnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5B8v95ttoJIHmd1QsV6XLmCILpPGXUYhqkPF7td1dg4=;
 b=sSskFWu7Xyo1FEmmWOvrNZJV9iK43h19FaT3OS1EovnxUK8IdDuZyNdpI1+7k38M2w
 dbeHbWe96bBdkLUY3iTir0uVgZwuKQFdEEqvZHYNa33UM4jb14w1yVige3XumjbwEFWf
 MFjy1RUWl5m6oJYyDw1QMA2YnL4IoGQF0JwP7FQFvEdiAkG2Oh+grsCnwru0z4pvU2et
 hM+ypCbUF7TzkaW1WQmsVRpoGnu5+nNW69cKUaCERzvgLP8STCqs/vlSwKzexFbY51iQ
 HmwoTFow+tc7WmIvSnOqvtX5A5aca9k4NnMLBg0BPj3h+BUfgI0vXfKg5QIh7GCkedCW
 /SVw==
X-Gm-Message-State: AOAM532tqfWWfMJeAqQ6iGThqUGn3v4jP8x1JzIktwEhMyXgxsfSWpTZ
 e2chnPh24yOehY6G2s3g8ZiyukqSIWk=
X-Google-Smtp-Source: ABdhPJyvROpTWCWq3yxR5Ogb///ZqzKL11+OaT3FYQ9cWlTBKJHXMaafkr2V8GqEko+Lfvr0PI5PWg==
X-Received: by 2002:a17:90b:17d1:b0:1bf:1e3:ded3 with SMTP id
 me17-20020a17090b17d100b001bf01e3ded3mr4554917pjb.144.1647348836969; 
 Tue, 15 Mar 2022 05:53:56 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a056a00138b00b004f7664328a0sm22252299pfg.162.2022.03.15.05.53.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:53:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/21] Darwin patches for 2022-03-15
Date: Tue, 15 Mar 2022 13:53:29 +0100
Message-Id: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The following changes since commit a72ada1662ee3105c5d66ddc8930d98e9cab62be:

  Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2022-03-15 09:53:13 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/darwin-20220315

for you to fetch changes up to c82b7ef16f3efa59e28f821f25a9c084ef84ea9d:

  MAINTAINERS: Volunteer to maintain Darwin-based hosts support (2022-03-15 13:36:33 +0100)

----------------------------------------------------------------
Darwin-based host patches

- Remove various build warnings
- Fix building with modules on macOS
- Fix mouse/keyboard GUI interactions

----------------------------------------------------------------

Akihiko Odaki (2):
  audio: Log context for audio bug
  coreaudio: Always return 0 in handle_voice_change

Cameron Esfahani (1):
  hvf: Use standard CR0 and CR4 register definitions

Carwyn Ellis (2):
  ui/cocoa: add option to disable left-command forwarding to guest
  ui/cocoa: release mouse when user switches away from QEMU window

Gustavo Noronha Silva (2):
  ui/cocoa: capture all keys and combos when mouse is grabbed
  ui/cocoa: add option to swap Option and Command

Philippe Mathieu-Daudé (14):
  configure: Allow passing extra Objective C compiler flags
  tests/fp/berkeley-testfloat-3: Ignore ignored #pragma directives
  hvf: Make hvf_get_segments() / hvf_put_segments() local
  hvf: Remove deprecated hv_vcpu_flush() calls
  block/file-posix: Remove a deprecation warning on macOS 12
  audio/coreaudio: Remove a deprecation warning on macOS 12
  audio/dbus: Fix building with modules on macOS
  audio: Rename coreaudio extension to use Objective-C compiler
  osdep: Avoid using Clang-specific __builtin_available()
  meson: Resolve the entitlement.sh script once for good
  meson: Log QEMU_CXXFLAGS content in summary
  configure: Pass filtered QEMU_OBJCFLAGS to meson
  ui/cocoa: Constify qkeycode translation arrays
  MAINTAINERS: Volunteer to maintain Darwin-based hosts support

 MAINTAINERS                        |   8 ++
 audio/audio.c                      |  25 +++---
 audio/audio_template.h             |  27 +++----
 audio/{coreaudio.c => coreaudio.m} |  23 +++---
 audio/meson.build                  |   4 +-
 block/file-posix.c                 |  14 +++-
 configure                          |  31 ++++++++
 include/qemu/osdep.h               |  10 +--
 meson.build                        |  17 +++-
 qapi/ui.json                       |  29 +++++++
 qemu-options.hx                    |  15 ++++
 target/i386/hvf/vmx.h              |  19 +++--
 target/i386/hvf/x86.c              |   6 +-
 target/i386/hvf/x86.h              |  34 --------
 target/i386/hvf/x86_mmu.c          |   2 +-
 target/i386/hvf/x86_task.c         |   4 +-
 target/i386/hvf/x86hvf.c           |   6 +-
 target/i386/hvf/x86hvf.h           |   2 -
 tests/fp/meson.build               |   5 ++
 ui/cocoa.m                         | 122 ++++++++++++++++++++++++++---
 20 files changed, 283 insertions(+), 120 deletions(-)
 rename audio/{coreaudio.c => coreaudio.m} (97%)

-- 
2.34.1


