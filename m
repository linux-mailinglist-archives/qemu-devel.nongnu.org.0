Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C8A4BCFFB
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 17:55:13 +0100 (CET)
Received: from localhost ([::1]:47196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLpUO-00025k-15
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 11:55:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQc-0007mK-Nf
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:21 -0500
Received: from [2607:f8b0:4864:20::f2a] (port=41532
 helo=mail-qv1-xf2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQa-0000AW-2r
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:18 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id x3so26031898qvd.8
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 08:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QnSIdDO2NxHK322XMKNJqtkDmIxTI3lD6JCLrCZ1CLQ=;
 b=VhGVKzL1Ozv3mxusyqVxpHlRcG3gbrqVxBssmPfgJwqcKB1lDENs6jvhUBfFOMixyO
 h2SLPMwyFOPgvqMgSXB4tikwQLcE5hSQVewun5qeMtolnGvVCPQWuEuL0Z5ZUWeACc4k
 g/XNKsVM4IAYs/O2t273TI/yWW4ZRH5g46EmxnToKhJm4DLtX3X8C9a1DpyEcoXapfCa
 glHWfM4nY57NiS/xXkz1qX02kevHaI+47/xmrvQElyI43CSN+VD0pl85V0iFMx9fCnW6
 rUhwhIoFfXvJ3iDbgAi6WUdC4vZG84EQ4ePoC3KGgJDFrQ5bG1rIQ8U9YmewTJ/iHA6Y
 7aHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QnSIdDO2NxHK322XMKNJqtkDmIxTI3lD6JCLrCZ1CLQ=;
 b=wpNVfQz8kEOaO90Nm/kZ1mccihPobl5PYJi52KBEvqOFmBG39VSBZHbN2GL83FmlJf
 KWnWvJoex0emR4vpdVCRT3lnAoysifWX49vjua9CmiJOSoY/4RyfnoMhcpU6Ly2YDVnA
 KqltnSjJyUjGCgsg2pZKoHesD7jHMCGcL3vMcYn8EuwaR3R0puSZMw6bahnTivnUGlaq
 zrNf/r9NifVzTERAvaZ4HW8NVki4hWdUt+/GD7ldL9S2yk90Vh38HfZCON+uQ12jGSdx
 mC3OjQvetzJKYvnaCu/Y9gbCA3Pj3oVz8AF+6RU91GUAQDWunv0kM5jivAiHldK2PkTh
 GfVQ==
X-Gm-Message-State: AOAM532wS6jsBsDOZlnkWFw8FZyLWZ0IYG3VJSa5e+vysmujz5yeWvnT
 sghoqMfE5knUtWZADjsv1Jk1hrzp5vUBYg==
X-Google-Smtp-Source: ABdhPJw6Gr++EOKQaCEQoaplw/w59oJbnUspWrQ0AlZ/j8xegNoMY+KhY2nynslDPlpdPyQx+Urhgw==
X-Received: by 2002:ac8:7fcc:0:b0:2de:6ff:4a17 with SMTP id
 b12-20020ac87fcc000000b002de06ff4a17mr2769860qtk.151.1645375871340; 
 Sun, 20 Feb 2022 08:51:11 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id n16sm3190995qkn.115.2022.02.20.08.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 08:51:10 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 00/11] 9p: Add support for darwin
Date: Sun, 20 Feb 2022 11:50:45 -0500
Message-Id: <20220220165056.72289-1-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a followup to https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg04298.html,
adding 9p server support for Darwin.

Since v7, no functional changes have been made to this patch set, but Patch 9/11
(9p: darwin: Implement compatibility for mknodat) was rebased to apply cleanly on top
of the most recent changes to 9pfs, which affected the code changes osdep.h directly
above patch 9’s additions.

WIth these changes, v8 correctly applies and functions on the latest mainline qemu.

Keno Fischer (10):
  9p: linux: Fix a couple Linux assumptions
  9p: Rename 9p-util -> 9p-util-linux
  9p: darwin: Handle struct stat(fs) differences
  9p: darwin: Handle struct dirent differences
  9p: darwin: Ignore O_{NOATIME, DIRECT}
  9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
  9p: darwin: *xattr_nofollow implementations
  9p: darwin: Compatibility for f/l*xattr
  9p: darwin: Implement compatibility for mknodat
  9p: darwin: meson: Allow VirtFS on Darwin

Will Cohen (1):
  9p: darwin: Adjust assumption on virtio-9p-test

 fsdev/file-op-9p.h                     |  9 +++-
 fsdev/meson.build                      |  1 +
 hw/9pfs/9p-local.c                     | 27 ++++++++---
 hw/9pfs/9p-proxy.c                     | 38 +++++++++++++--
 hw/9pfs/9p-synth.c                     |  6 +++
 hw/9pfs/9p-util-darwin.c               | 64 ++++++++++++++++++++++++++
 hw/9pfs/{9p-util.c => 9p-util-linux.c} |  2 +-
 hw/9pfs/9p-util.h                      | 35 ++++++++++++++
 hw/9pfs/9p.c                           | 42 ++++++++++++++---
 hw/9pfs/9p.h                           | 18 ++++++++
 hw/9pfs/codir.c                        |  4 +-
 hw/9pfs/meson.build                    |  3 +-
 include/qemu/osdep.h                   | 12 +++++
 include/qemu/xattr.h                   |  4 +-
 meson.build                            | 15 ++++--
 os-posix.c                             | 35 ++++++++++++++
 tests/qtest/virtio-9p-test.c           |  2 +-
 17 files changed, 292 insertions(+), 25 deletions(-)
 create mode 100644 hw/9pfs/9p-util-darwin.c
 rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (97%)

-- 
2.35.1


