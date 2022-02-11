Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECE54B2A88
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:38:57 +0100 (CET)
Received: from localhost ([::1]:39974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYwi-0002Q8-9q
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:38:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYsf-0008B3-RZ
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:34:48 -0500
Received: from [2607:f8b0:4864:20::1032] (port=53072
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYse-0001xk-6C
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:34:45 -0500
Received: by mail-pj1-x1032.google.com with SMTP id v4so8585618pjh.2
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tYd9gyFcY6gyExlmF+sJGUFfLBl1p/N7is8NzZubJLU=;
 b=X/OoVkS0VawEjqM81Pb1VLAArP4qOa5x1kcFrymM8uI0uo6iZ3DuM4/7zm9K7cGSyC
 P2OiMLIg9vOlRDD9l4k5WVcr5CqCSpaOguiaky0fz1Kzy3XkZdHe/26KEbyyoyeoRMIh
 qfySMs0iLsAqGPu5PaXkW7rbdkkeJ+BElo0zB+6h6signe5hTrXPgNZxQAovV8pwHheM
 B2vLp9S7Bk2x+JIIQ0iS1n1NaATZK7iewilkzUJzuRwCficV0TSFYu/xacbEQ0LjI7En
 /wt2rz2AbKSzjTBvIGDTUYGQ9fuzm1Zf/NRBSTyNq34yT+gq1Mf3sSEVHmPWCWy924My
 bl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tYd9gyFcY6gyExlmF+sJGUFfLBl1p/N7is8NzZubJLU=;
 b=c8oRXvg0+SmZrBlr/sRLS9YMiJyHVh+4TS6G5DcHMfBaIZvXTwnWa3x7+uWnOMss+6
 0zUb5Fz5Vph0zOQLKuj2/FTUNB4dFGtL2TUra3oBcWbapXFHtnsgWdthR3Zl4SiwyXg3
 5IanBv9bGxewlpQWeUIC3OMM+y9RvlSKWmQEr65yAXHZISw4zsMDDKAvU2Y7WABPW2TI
 fanQedHvPoEpFrGfoC6NfUPPnsVgFhUW/I83fyK/W+mtuTow1ZMPYab8nHxQ6nuC+lCo
 QW4WwMJlfz2+NmZAYHbMf7XiEiqVvM9BoDUIKlGVBWdJ5FZ00RySGG5P1niSjaLvG5Xk
 Chpw==
X-Gm-Message-State: AOAM5329uzk+PKDEkt5U8Lz4+w+eQqhcO58ULhRbhzZyzPeFP9cbXd5P
 +TMZn6vA8uvATNfy2qtH+ImjCKYc92k=
X-Google-Smtp-Source: ABdhPJy6GnfuR8SXZR2DvTCaQtvt7SdeNlXAF0SdoW7gCFjLO4cLrNfd+J7NRtEsXBXXFdl4QUJr0Q==
X-Received: by 2002:a17:903:40c6:: with SMTP id
 t6mr2197165pld.117.1644597281817; 
 Fri, 11 Feb 2022 08:34:41 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id lb18sm2621945pjb.42.2022.02.11.08.34.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Feb 2022 08:34:41 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 00/13] host: Support macOS 12
Date: Fri, 11 Feb 2022 17:34:21 +0100
Message-Id: <20220211163434.58423-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Few patches to be able to build QEMU on macOS 12 (Monterey).

This basically consists of adapting deprecated APIs.

CI job added to avoid bitrotting.

Since v3:
- Fix --enable-modules
- Ignore #pragma on softfloat3 tests
- Addressed Akihiko Odaki comments
- Include Cameron Esfahani patches

Since v2:
- Addressed Akihiko Odaki comments:
  . use __is_identifier(),
  . remove cocoa setAllowedFileTypes()
- Addressed Daniel Berrangé comment:
  . rebased on testing/next, update libvirt-ci/lcitool

Based on Alex's testing/next

Cameron Esfahani (3):
  hvf: Use standard CR0 and CR4 register definitions
  hvf: Fix OOB write in RDTSCP instruction decode
  hvf: Enable RDTSCP support

Philippe Mathieu-Daudé (10):
  lcitool: refresh
  configure: Allow passing extra Objective C compiler flags
  tests/fp/berkeley-testfloat-3: Ignore ignored #pragma directives
  hvf: Make hvf_get_segments() / hvf_put_segments() local
  hvf: Remove deprecated hv_vcpu_flush() calls
  block/file-posix: Remove a deprecation warning on macOS 12
  audio/coreaudio: Remove a deprecation warning on macOS 12
  audio/dbus: Fix building with modules on macOS
  ui/cocoa: Remove allowedFileTypes restriction in SavePanel
  gitlab-ci: Support macOS 12 via cirrus-run

 .gitlab-ci.d/cirrus.yml                    | 16 ++++++++++
 .gitlab-ci.d/cirrus/macos-12.vars          | 16 ++++++++++
 audio/coreaudio.c                          | 17 +++++++----
 audio/meson.build                          |  2 +-
 block/file-posix.c                         | 14 ++++++---
 configure                                  |  8 +++++
 meson.build                                |  5 ++++
 target/i386/hvf/hvf.c                      | 26 +++++++++++------
 target/i386/hvf/vmcs.h                     |  3 +-
 target/i386/hvf/vmx.h                      | 19 ++++++------
 target/i386/hvf/x86.c                      |  6 ++--
 target/i386/hvf/x86.h                      | 34 ----------------------
 target/i386/hvf/x86_cpuid.c                |  7 +++--
 target/i386/hvf/x86_decode.c               | 11 +++++--
 target/i386/hvf/x86_mmu.c                  |  2 +-
 target/i386/hvf/x86_task.c                 |  4 +--
 target/i386/hvf/x86hvf.c                   | 14 ++++++---
 target/i386/hvf/x86hvf.h                   |  3 +-
 tests/docker/dockerfiles/ubuntu1804.docker |  2 --
 tests/docker/dockerfiles/ubuntu2004.docker |  2 --
 tests/fp/meson.build                       |  1 +
 tests/lcitool/refresh                      |  1 +
 ui/cocoa.m                                 |  6 ----
 23 files changed, 127 insertions(+), 92 deletions(-)
 create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars

-- 
2.34.1


