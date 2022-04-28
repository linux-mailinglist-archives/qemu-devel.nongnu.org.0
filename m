Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39413512C71
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:12:14 +0200 (CEST)
Received: from localhost ([::1]:42942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njyJx-0005sW-9V
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy20-0008V2-Dc
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:41 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy1y-00054r-JO
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:40 -0400
Received: by mail-ej1-x62a.google.com with SMTP id m20so7574327ejj.10
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6wuyWIGLXbVpNyeICSTjGtg8O6YTKv/dQwb5iS9z9dQ=;
 b=BnbsF7L08BOT9JmLI4AdqxpCgcKgmH3CXBSWiTkmmWVl/4pp05fol5qk7QWz8oYE5I
 fi7sBe5Eeqf6tKeGUoUxFSd2i73inrN9v8MkfA/4dJdzTpjrfaldUEiJcxkJP8+xyULL
 YCpuVVUbmunLI7CxxiiXOlXL2cu+tcY4ByXq2+M3PLcpbCZIvFt0UD6VVRNLOc1QEVOj
 fpTAGUVIb5CntIgaC25W0TL89FZlnpZMMOauGFGtqZMDP6TNNR7gBUZKC9EjOIH+F6+9
 2q/+ez9NNkSwni9tanohQLc0zH/Zb+EQg9Minireref1c6w79FBR8SWzx8XDuWmLnIph
 6Y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6wuyWIGLXbVpNyeICSTjGtg8O6YTKv/dQwb5iS9z9dQ=;
 b=EUlk4MF9kqhzLWs4LgfcNPeoDMK3GwzNJSekWtlYQiAhWBt+1IuK43Jn5bGEhA3h7i
 /xpGZZlGIpz4fR+GPyp0UYKxrhx4+czfOlRqzOVURCkdCNydtcY+OqSaucvpuRx7ZKIz
 rck/AWr6Bzu6FMWIWLPIpI94nuyT41C7rNAKG1gQxP+6x66WA2gprDbXb3crb0xTVoFf
 lpcH+jxD1yJnCsqFyk655DLynkQQFOx4uomQO6ljhs0hYV+AV5NZnb/0/55hNRaQ2shM
 crQk1VApXDsWuGCAlXvfowHtU5GG9LQrXslCjAwNGlogUViHzNEcPUfLn6lv0Lg+7cHb
 4V5g==
X-Gm-Message-State: AOAM5314DTDUvTV4QGfpodqWVzcxPDKpr86WdU/uCnAwrYoRAA/nhw1m
 sc4u6tu9g/e+UnB6/c4DdW9WI1ucszW9FQ==
X-Google-Smtp-Source: ABdhPJxLa3whF610++8L3xqxotBmsKgJvCVi9oEO9carGedptGFHNjTDe9P5tihg3DWXjDdlF7J5vg==
X-Received: by 2002:a17:906:2883:b0:6e8:7012:4185 with SMTP id
 o3-20020a170906288300b006e870124185mr30069741ejd.204.1651128816908; 
 Wed, 27 Apr 2022 23:53:36 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/18] Misc QEMU patches for 2022-04-28
Date: Thu, 28 Apr 2022 08:53:17 +0200
Message-Id: <20220428065335.189795-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit cf6f26d6f9b2015ee12b4604b79359e76784163a:

  Merge tag 'kraxel-20220427-pull-request' of git://git.kraxel.org/qemu into staging (2022-04-27 10:49:28 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 21abf010bb28f0c98db4ee66a990065062c62126:

  qemu-options: Limit the -enable-kvm option to the targets that support it (2022-04-28 08:52:22 +0200)

----------------------------------------------------------------
* Bugfixes
* Meson conversions

----------------------------------------------------------------
Haiyue Wang (1):
      error-report: fix g_date_time_format assertion

Michael Tokarev (1):
      configure: make fortify_source=yes by default

Paolo Bonzini (14):
      remove -writeconfig
      meson: show final set of compiler flags
      configure: remove dead code
      qga: wixl: get path to sysroot from pkg-config as intended
      configure: pc-bios/qemu-icon.bmp does not exist
      configure: gcov should not exclude fortify-source
      configure: move --enable/--disable-debug-info to second option parsing pass
      configure, meson: move OpenGL check to meson
      meson, configure: move RDMA options to meson
      meson, configure: move keyctl test to meson
      meson, configure: move usbfs test to meson
      meson, configure: move libgio test to meson
      meson: remove CONFIG_XEN_PCI_PASSTHROUGH from config-target.h
      meson, configure: move --enable-module-upgrades to meson

Paul Brook (1):
      i386: pcmpestr 64-bit sign extension bug

Thomas Huth (1):
      qemu-options: Limit the -enable-kvm option to the targets that support it

 backends/meson.build            |   2 +-
 configure                       | 348 ++--------------------------------------
 contrib/rdmacm-mux/meson.build  |   4 +-
 crypto/meson.build              |   4 +-
 docs/about/deprecated.rst       |   7 -
 docs/about/removed-features.rst |   7 +
 hw/xen/meson.build              |  20 ++-
 include/qemu/config-file.h      |   1 -
 meson.build                     | 149 ++++++++++++++---
 meson_options.txt               |  12 ++
 migration/meson.build           |   2 +-
 qemu-options.hx                 |  12 +-
 qga/meson.build                 |   2 +-
 scripts/meson-buildoptions.sh   |  19 +++
 softmmu/vl.c                    |  20 ---
 target/i386/ops_sse.h           |  20 ++-
 tests/qtest/meson.build         |   5 +-
 ui/meson.build                  |  24 +--
 util/error-report.c             |   2 +-
 util/meson.build                |   2 +-
 util/qemu-config.c              |  42 -----
 21 files changed, 221 insertions(+), 483 deletions(-)
-- 
2.35.1


