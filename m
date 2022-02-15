Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CB24B659D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:14:41 +0100 (CET)
Received: from localhost ([::1]:36846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJsyu-00023N-L5
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:14:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsns-0001hF-S1
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:03:16 -0500
Received: from [2607:f8b0:4864:20::1036] (port=50834
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsnq-00028Q-Qy
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:03:16 -0500
Received: by mail-pj1-x1036.google.com with SMTP id m7so16821271pjk.0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OXMuCBs081l8O57Njz7JdA9FyyCK+ubVvfmh6dFhCOE=;
 b=UXLp+52STYRPrpHzQdnBzXtsTKk+eglTEDo7a3P97Id/EwD4DUNGV23bA6s3XvyZjN
 OXnI0RplZVXPv6lCQcfB+qnmg1EuKc3m38T+8LsJA39/wUqa42wfo/rWkJaf/Sjzs7U3
 D/1Y0xsyFwl4f7hP1DIYYgfFa5vMhkqzbnjjjw+4lRGmymGXtwykHPoGXGESWDO2wBmY
 oT80he1FqAPeWYimJKMMnyxYUF9no01ZxO5WrnRfeDSKD3mviD2FKM2qkyRbnCaHLO9y
 mKzlmjzo22kucUGzDwUFYAxs32pjchY6E8oiO2kM7Wi0Pf3Tu8zMFSaUQ8D6h+53KN7n
 /k6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OXMuCBs081l8O57Njz7JdA9FyyCK+ubVvfmh6dFhCOE=;
 b=tIDOB3lcH4Z9yKw/3ua/w1CRrXJbb8q8VXEY9AV7IMakRXN5P6k8b5DVysKEblpJF4
 yL4OiBiYOGa5Ur5GdG1CUF3xcMGB9STYVvE7j8R1YOuvJUPSjIQNbTrYVJxR4baNPnHI
 qNs0YwoqQjNAIVI9iHhEaS4k2VNuKXaxIGFvZwhMUJsnKeWHh8BHr/DM9pRj9EsYmgVA
 xiTs0Ec2aPNzP3awbVR8p+DIQjaedW+AngBWbEq9rQicBxhqv5ITovRl4je4gbFiPiue
 /AGLeYgj4oXLNhjrTb4A7J038MOBRC7lKt8d2+w1jikU0OZJ6bNVMjdUWVVY6CWeGtSL
 Qvtw==
X-Gm-Message-State: AOAM5311q4oc2I/xoSZO9djJ9Yxa9CnxmjFnbd8Ve9tS9ULuGrLr/2sY
 XL01K0EViCOKx7hSx0vBs6JRO+CPSsU=
X-Google-Smtp-Source: ABdhPJxWVxjK82g9g9VVkHg5UhNOQpb1YkIIYxQNHAMS5z+dAippIW5QP0/JNZEupwHMAZG4S/Nc7A==
X-Received: by 2002:a17:902:7441:: with SMTP id
 e1mr2898139plt.71.1644912193475; 
 Tue, 15 Feb 2022 00:03:13 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id n22sm16161683pjv.24.2022.02.15.00.03.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:03:13 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 00/15] host: Support macOS 12
Date: Tue, 15 Feb 2022 09:02:52 +0100
Message-Id: <20220215080307.69550-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Few patches to be able to build QEMU on macOS 12 (Monterey).

Since v5:
- Fixed failed rebase between patches 10 and 16 (Akihiko)
- Include "ui/cocoa: Fix the leak of qemu_console_get_label"

Since v4:
- Use MAC_OS_X_VERSION_MIN_REQUIRED definition (Akihiko)
- Include patches from Akihiko

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

Akihiko Odaki (4):
  MAINTAINERS: Add Akihiko Odaki to macOS-relateds
  ui/cocoa: Add Services menu
  ui/cocoa: Do not alert even without block devices
  ui/cocoa: Fix the leak of qemu_console_get_label

Cameron Esfahani (1):
  hvf: Use standard CR0 and CR4 register definitions

Philippe Mathieu-Daudé (10):
  configure: Allow passing extra Objective C compiler flags
  tests/fp/berkeley-testfloat-3: Ignore ignored #pragma directives
  hvf: Make hvf_get_segments() / hvf_put_segments() local
  hvf: Remove deprecated hv_vcpu_flush() calls
  block/file-posix: Remove a deprecation warning on macOS 12
  audio/coreaudio: Remove a deprecation warning on macOS 12
  audio/dbus: Fix building with modules on macOS
  ui/cocoa: Remove allowedFileTypes restriction in SavePanel
  lcitool: Refresh
  gitlab-ci: Support macOS 12 via cirrus-run

 .gitlab-ci.d/cirrus.yml                    | 16 ++++++++++
 .gitlab-ci.d/cirrus/macos-12.vars          | 16 ++++++++++
 MAINTAINERS                                |  2 ++
 audio/coreaudio.c                          | 17 +++++++----
 audio/meson.build                          |  2 +-
 block/file-posix.c                         | 14 ++++++---
 configure                                  |  8 +++++
 meson.build                                |  5 ++++
 target/i386/hvf/vmx.h                      | 19 ++++++------
 target/i386/hvf/x86.c                      |  6 ++--
 target/i386/hvf/x86.h                      | 34 ----------------------
 target/i386/hvf/x86_mmu.c                  |  2 +-
 target/i386/hvf/x86_task.c                 |  4 +--
 target/i386/hvf/x86hvf.c                   |  6 ++--
 target/i386/hvf/x86hvf.h                   |  2 --
 tests/docker/dockerfiles/ubuntu1804.docker |  2 --
 tests/docker/dockerfiles/ubuntu2004.docker |  2 --
 tests/fp/meson.build                       |  1 +
 tests/lcitool/refresh                      |  1 +
 ui/cocoa.m                                 | 19 +++++-------
 20 files changed, 95 insertions(+), 83 deletions(-)
 create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars

-- 
2.34.1


