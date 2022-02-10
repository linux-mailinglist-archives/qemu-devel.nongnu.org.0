Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121214B12FD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:39:25 +0100 (CET)
Received: from localhost ([::1]:47446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nICTc-0001JQ-7E
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:39:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9WN-0002xE-FI
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:03 -0500
Received: from [2607:f8b0:4864:20::832] (port=41518
 helo=mail-qt1-x832.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9WL-0004Cb-Fy
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:03 -0500
Received: by mail-qt1-x832.google.com with SMTP id y8so5138832qtn.8
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 05:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YGTBh0r/qBn9R7FOXrrwAJK0z7eMBhOQCM4KptCKBg8=;
 b=p1flewHXdHQcOC3+OVJwfVZ8MSAICU7HMSBoa0hVWw96d8dcT7WiDkliHSlTAN0v2s
 yOI3mASbDSkSlXSZM5mgbRgIW04yx+Mp56r5+E861HDgkZ6fVtxZcwOSQ0ptC0dqVei2
 KGA4x/Z9bwjDYCGYTtkvDnKvv3RAdMBnkp34qvjo8aVwOc1eZJNpjQDye4A4E3zRWhMi
 YSTg4Li44nafxZkyaXvpXrtu34GffDBg8cGoddx6xRwrHsGyN2gzVyQdMwpQmPQ3R2r0
 jU7vdnwjKuhk+v5HF951vnMJw3rSbN5Yqgj/xj1GeqAluAiYuMJ3XoPsrpwXn6u8vHJi
 E2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YGTBh0r/qBn9R7FOXrrwAJK0z7eMBhOQCM4KptCKBg8=;
 b=Or/3sH/To5HZSzWHLuswFOvTtiilrS/KK96xCs6noVOFxt3Po7r1SUc8wEcalSM7MJ
 lCqNVICDmLjJv8rGEXLj7b+QjwjRRPz1C310nW92sTELJBr0NeEdLCkmj9REOi6D2grm
 xGegW0GkThjtak1Ws2zYTMd3R1d/Z+0JNhdDkuMHDZUvOKDQAX7s50WZ3K9zWupH9fif
 P/HnjDCZ5E7VRvOCq+m1wW2tm61wB7qSTop2Z8cObTAIUPdN5dBzIvpVXHYtUL/UCHiN
 UZMUbKVtkjYLnpEC8afMV8iLmxv7s8O4n/GOOk6lvzOtywiBp6/6UAapjnUTg69+SvT1
 BGjw==
X-Gm-Message-State: AOAM533PIdFu7+Hj/hXr+XrvUeOYnyepxbkbSjqpZc1JOUcF93yrbOt3
 j2VRvkvy+Hj9+BZo4jT6Iz8zPTbv7trbbw==
X-Google-Smtp-Source: ABdhPJxuOUTXXkemRiE15kIm+0fr8V2ow5gtC9D5HsF/w1YmpTSdhUTFTSPYAOevFvOTQTUoWOWQdA==
X-Received: by 2002:a05:622a:2d0:: with SMTP id
 a16mr4796287qtx.136.1644499799597; 
 Thu, 10 Feb 2022 05:29:59 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id t1sm11289616qtc.48.2022.02.10.05.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 05:29:56 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/11] 9p: Add support for darwin
Date: Thu, 10 Feb 2022 08:29:35 -0500
Message-Id: <20220210132946.2303-1-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::832
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x832.google.com
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

This is a followup to https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01506.html,
adding 9p server support for Darwin.

Since v5, the following changes have been made to the following patches:

Patch 6/11: 9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
- For P9_XATTR_SIZE_MAX, ensure that Linux uses XATTR_SIZE_MAX, Darwin uses 64k, and error out for undefined hosts

Patch 9/11: 9p: darwin: Implement compatibility for mknodat
- Move pthread_fchdir_np declaration only to osdep
- Declare pthread_fchdir_np with __attribute__((weak)) to allow checking for its presence before usage
- Move declarations above cplusplus guard

Patch 10/11: 9p: darwin: Adjust assumption on virtio-9p-test (formerly v5 Patch 11/11)
- Move this patch before 9p: darwin: meson patch to avoid qtest breakage during bisecting

Patch 11/11: 9p: darwin: meson: Allow VirtFS on Darwin (formerly v5 Patch 10/11)
- Fully adjust meson virtfs error note to specify macOS

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
 meson.build                            | 14 ++++--
 os-posix.c                             | 35 ++++++++++++++
 tests/qtest/virtio-9p-test.c           |  2 +-
 17 files changed, 291 insertions(+), 25 deletions(-)
 create mode 100644 hw/9pfs/9p-util-darwin.c
 rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (97%)

-- 
2.34.1


