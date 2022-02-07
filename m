Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E674ACC2B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 23:43:37 +0100 (CET)
Received: from localhost ([::1]:37774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHCjP-0006ml-IN
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 17:43:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCgU-0003u5-G4
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:40:34 -0500
Received: from [2607:f8b0:4864:20::72d] (port=35811
 helo=mail-qk1-x72d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCgO-0005gq-T5
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:40:31 -0500
Received: by mail-qk1-x72d.google.com with SMTP id 200so12313669qki.2
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 14:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gCko5cR5pSnQ/aYSMvucvq/LH2CuPK3HksNutoqqh9M=;
 b=DoDASi08FzdfdmxS7VfD5o535F+cRS4wiICXk5xzKk2m5oxVq3pcCqfBDND4+NS26s
 YAoAfDxOkv993siUdHjmbHBm8zcdqoml77h3nDDY5zZmnYoqACY2Nz/FACw1CM+Ub6K0
 rRbzQBOjzgGTzNtYsC4oXYQKQaG9efz5yVo/T5bzh/1Npk10b25MPnNV0qLhNvsBkYZi
 ttIJdSMQlqGxnisBZBejb0mFqrs1LM+NG3g3M4Tq9ghYYDwLl20iPPmPZOZZUMQtyRMH
 cfWDTRtw447rjS39plsf8k5Fik3q8ootXiug548uYWCawisqxdYzjxY0pWjLp+IURJiH
 HeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gCko5cR5pSnQ/aYSMvucvq/LH2CuPK3HksNutoqqh9M=;
 b=5tfsrHP59DcWworq2mV5o5ZIBSNervtQUBWUnsHYj2g/kKaZcaRm1FimDSz0mA0LqA
 tZjlpNlkRlpiuta8FY8tZR9ncoEt5zVo6VtZK8qK206lPsGJrJ78MplWm5dvrI52f3rM
 qDVzMjR8SJB/8KsLwcchL5wtCOo0UqrkAjJlSawWEt5vdFTYPmUluFBRSTdBuTGN29BK
 6dH4uMpa9meBEOqojdTCFnr4qgGlmOJhKxzsvKJnTW8lTyAadNtH2vEUqQ3Txuut65BE
 WeWjG8QP0vQRrZvdCeZT2+atlCdkxZOAsLgjgm7iAuZiNKQ4Iw2MaOi4CT25pHuEyeI6
 cTpQ==
X-Gm-Message-State: AOAM530t3k/5/sc1MVv+8K827FEpUDDoOA/AaAVW8c7EE8G5iIFAoib+
 EYsWH93fn9XhIcOX65Gx2SFQuA53zsfxOg==
X-Google-Smtp-Source: ABdhPJxr5tv4miFMpilA4n8ni/mF3nnQM4J/CAhweaxToFM61lK4McMm7Ow3D1cR/qNHjMTWZZs0nQ==
X-Received: by 2002:a05:620a:400e:: with SMTP id
 h14mr1129570qko.521.1644273626876; 
 Mon, 07 Feb 2022 14:40:26 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j14sm6444744qko.10.2022.02.07.14.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 14:40:26 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/11] 9p: Add support for darwin
Date: Mon,  7 Feb 2022 17:40:13 -0500
Message-Id: <20220207224024.87745-1-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x72d.google.com
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

This is a followup to https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01223.html,
adding 9p server support for Darwin.

Since v4, the following changes have been made to the following patches:

Patch 4/11: 9p: darwin: Handle struct dirent differences
- Cleanup of telldir error handling
- Remove superfluous error handling for qemu_dirent_off
- Removal of superfluous whitespace
- Adjust codir.c to use qemu_dirent_off instead of duplicating the logic

Patch 9/11: 9p: darwin: Implement compatibility for mknodat
- Move qemu_mknodat from 9p-util to osdep and os-posix

Patch 10/11: 9p: darwin: meson: Allow VirtFS on Darwin
- Add comments to patch commit
- Note that virtfs_proxy_helper does not work on Darwin and adjust
- Adjust meson virtfs error note to specify macOS

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
 hw/9pfs/9p.h                           | 11 +++++
 hw/9pfs/codir.c                        |  4 +-
 hw/9pfs/meson.build                    |  3 +-
 include/qemu/osdep.h                   | 10 ++++
 include/qemu/xattr.h                   |  4 +-
 meson.build                            | 14 ++++--
 os-posix.c                             | 34 ++++++++++++++
 tests/qtest/virtio-9p-test.c           |  2 +-
 17 files changed, 281 insertions(+), 25 deletions(-)
 create mode 100644 hw/9pfs/9p-util-darwin.c
 rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (97%)

-- 
2.32.0 (Apple Git-132)


