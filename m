Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550544AB1EE
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 21:10:49 +0100 (CET)
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGnrx-0003gg-Jm
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 15:10:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnp0-0000zN-7F
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:42 -0500
Received: from [2607:f8b0:4864:20::f2a] (port=47046
 helo=mail-qv1-xf2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnoy-0001L0-Io
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:41 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id n6so1635362qvk.13
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 12:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BwegfLzfVKDb9+CtAXgJC90PUNM2RiyyFfTERPby6g0=;
 b=dATi5gaSzb6OYSHjcpTKAd8ImgFsqhnyTljcw90FmMwd6+zppjsklTKJ9M3PuJhmck
 m4A9BMhKMO8+JWrqkdOgUX3di5KghcQkduOYlVzp2k6b9PsFeiJzgBOENDPboMEIuT9s
 6UIwm9kjKdeickrVbmqsqKQblc4l0VeQPXqLhGA+QrnaloZiY5meWAjVTU8XN4EZWs58
 npDm6z0HEyYO+Gx/UABLX0boz8T87he0MTbzimDJTa2OATxQyJB1Gqbb5EJOriQ1v4nl
 IGpwrYZrYPbAB7fzd5u8HX1YRqpYHupmEi5oDcVM6ylu0BNjXuWkPAuFiuRQ6koVGMdm
 BrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BwegfLzfVKDb9+CtAXgJC90PUNM2RiyyFfTERPby6g0=;
 b=OJxfzcAJ55KK9y6d/3jmc0Gg/3GeZXAovAk4Wk6rR5d9BGIxixSJWZxIrwY6WyDJ26
 k/1q2IUZQteNJGRY3NYi2LfRus49duq3DeW5QB3hO+2cXxkPlAcx8P3atbWzkYnVl0og
 2MzCa0R/IycyTQxxJ5DuvcSDS8lncRo7Rco/TaJEWnSZK9WVWkvOE1JbUsGDWp73SND1
 V6GcKrSe76AhWyL7v1XomZDJNZu8IIicxM7SljRkFrelctjO6UGh95DzNT3HsfhqZW1Q
 4Ker3xU+a7jj9JwmkNKHp0/TLAK1wxU7p8SFxVMJsUVvDYlrQjRWhB/P8xKSB/khu46q
 PyQQ==
X-Gm-Message-State: AOAM5336bTMldtzyyzdLCSWbqlkqhBI6NKtULrSMjE8gx32Ac3+Vv6UL
 aQgXl7wSKB0LJ1xVc76ERNuLbZAW7fuckA==
X-Google-Smtp-Source: ABdhPJxWj9Lx6hSUk9cA9mF9r292sF2el8S0PixbiNRw5SvDD1iQyknV6Rl6cmRJbK686JnDH51apg==
X-Received: by 2002:a05:6214:5014:: with SMTP id
 jo20mr8585040qvb.28.1644178055875; 
 Sun, 06 Feb 2022 12:07:35 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j11sm4625999qtj.74.2022.02.06.12.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 12:07:34 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/11] 9p: Add support for darwin
Date: Sun,  6 Feb 2022 15:07:08 -0500
Message-Id: <20220206200719.74464-1-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a followup to https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg05993.html,
adding 9p server support for Darwin.

Since v3, the following changes have been made:

- Move XATTR_SIZE_MAX to P9_XATTR_SIZE MAX in 9p.h, and provide explanatory context as preliminary solution
- Add explanatory note surrounding virtio-9p-test with output of pre-patch failing test
- Remove superfluous header guards from file-opt-9p
- Add note about virtfs-proxy-helper being disabled on non-linux for this patch series
- Note radar filed with Apple for missing mknodat syscall
- Replace direct syscall to pthread_fchdir with pthread_fchdir_np, and add check for this function’s presence in meson
- Ensure that d_seekoff is filled using telldir on darwin, and create qemu_dirent_off helper to decide which to access.
- Ensure that [amc]tim.tv_sec are all initialized alongside [amc]tim.tv_nsec in 9p-proxy
- Ensure that all patch email addresses are valid
- Add telldir error handling for dirent on darwin

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

 fsdev/file-op-9p.h                     |  9 ++-
 fsdev/meson.build                      |  1 +
 hw/9pfs/9p-local.c                     | 28 ++++++--
 hw/9pfs/9p-proxy.c                     | 38 ++++++++++-
 hw/9pfs/9p-synth.c                     |  6 ++
 hw/9pfs/9p-util-darwin.c               | 91 ++++++++++++++++++++++++++
 hw/9pfs/{9p-util.c => 9p-util-linux.c} |  7 +-
 hw/9pfs/9p-util.h                      | 38 +++++++++++
 hw/9pfs/9p.c                           | 50 ++++++++++++--
 hw/9pfs/9p.h                           | 11 ++++
 hw/9pfs/codir.c                        |  7 ++
 hw/9pfs/meson.build                    |  3 +-
 include/qemu/xattr.h                   |  4 +-
 meson.build                            | 14 ++--
 tests/qtest/virtio-9p-test.c           |  2 +-
 15 files changed, 285 insertions(+), 24 deletions(-)
 create mode 100644 hw/9pfs/9p-util-darwin.c
 rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (90%)

-- 
2.32.0 (Apple Git-132)


