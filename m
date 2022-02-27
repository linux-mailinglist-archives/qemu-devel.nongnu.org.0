Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC4D4C5F76
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:37:26 +0100 (CET)
Received: from localhost ([::1]:44686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSAP-0008Aw-7F
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:37:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS8j-0005rD-EE
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:35:41 -0500
Received: from [2607:f8b0:4864:20::82e] (port=41831
 helo=mail-qt1-x82e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS8h-00031V-Ph
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:35:41 -0500
Received: by mail-qt1-x82e.google.com with SMTP id n11so7502687qtk.8
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rb3++N3dF+OdnksyIIGgvJDHilnQS1LnqJnYELNslrI=;
 b=NAuG7mO79WvcfHQZ96yCob8lQ+B+tbm+thDrI+b3pQT0wKlUbIHve2PTr3ZqjLQuzA
 /xiXc2loVo3axMtsh+bOUb0KB49O7V3jLIimitqJxhS63KWaoPmaUMg4yOXh1cW0TiLZ
 b6k6fRomQDGiOrOmf6kp6YvWBsKX0wCi2Isw/2KmE6bRJq9plkxs6Y1IhL45DzvYBKND
 arMlzUinzdcvYrmadOegNyX/GAaWTvjI6KisEucpjbhQOc+pFP76sUtvG+RxkiSmflRY
 UiZ/C9QYJ6B3a2JSaVFJt6vH5W7vkxBoRmzOB0KT82ukAEy0pG9XA1mR6TzvHhxHLqms
 QH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rb3++N3dF+OdnksyIIGgvJDHilnQS1LnqJnYELNslrI=;
 b=JTlS0O9cAvgMnoelGI5H/8rkKR10E+2rNUJDU3yqSF7PaVQZvshXVxGMVeSKAPupHo
 3egNAlcgkNV73CjS3TCcHGwWz6iEg51+OJclH0uMaMUaltIATZikeHxUB2etncRCDSd8
 BjEgi9x9wwYvY1eogzAXqm/h1Sw0RCH/Lsmy10wD4cW9jVb9elqsUCbdpzyS7l3inpO8
 rvW5TDQJheALECAFN9jET0P5dp43NTndJ5DII9jm0a5rQTFR0xssr8Db9UkONaeppe9s
 WJMuT9+uk/GfNOzQ+jYQYg+BUo526+rrqsVKcAOR+PUQPi9aUQTA8/D2av5s8HKClJBX
 L4Sw==
X-Gm-Message-State: AOAM533SCxTSRHNqlo3tSCiz82vylW+kSinqgXfr8pOZubfRMBEDIMH2
 w7Xz0hAwSTQx4pbxssWT3V26LUFvSHQaLw==
X-Google-Smtp-Source: ABdhPJxCxp5mOmEaskhBUZnFaowPtVCDJNNyTt1r7K6JwOjqqpyNa8xVodDYcDCjxYDDcZ/7wrVJDw==
X-Received: by 2002:ac8:5756:0:b0:2de:1ce6:bef7 with SMTP id
 22-20020ac85756000000b002de1ce6bef7mr14338659qtx.461.1646001337934; 
 Sun, 27 Feb 2022 14:35:37 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219]) by smtp.gmail.com with ESMTPSA id
 85-20020a370758000000b00648b7e3b8a4sm4206485qkh.111.2022.02.27.14.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 14:35:37 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 00/11] 9p: Add support for darwin
Date: Sun, 27 Feb 2022 17:35:11 -0500
Message-Id: <20220227223522.91937-1-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x82e.google.com
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, hi@alyssa.is,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a followup to https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg04391.html,
adding 9p server support for Darwin.

Since v8, the following changes have been made:

Patch 4/11 (9p: darwin: Handle struct dirent differences)
- Declare qemu_dirent_off as static to prevent linker error
- Move qemu_dirent_off above the end-of-file endif to fix compilation

Patch 9/11 (9p: darwin: Implement compatibility for mknodat)
- Fix line over 90 characters formatting error
- Move qemu_mknodat back from osdep to 9p-util and adjust patch notes accordingly

Patch 11/11 (9p: darwin: meson: Allow VirtFS on Darwin)
- Rebase to master

With these changes, this patch set builds and passes 9p synth tests on both linux and darwin.

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
 hw/9pfs/9p-local.c                     | 27 +++++--
 hw/9pfs/9p-proxy.c                     | 38 +++++++++-
 hw/9pfs/9p-synth.c                     |  6 ++
 hw/9pfs/9p-util-darwin.c               | 97 ++++++++++++++++++++++++++
 hw/9pfs/{9p-util.c => 9p-util-linux.c} |  8 ++-
 hw/9pfs/9p-util.h                      | 46 ++++++++++++
 hw/9pfs/9p.c                           | 42 +++++++++--
 hw/9pfs/9p.h                           | 18 +++++
 hw/9pfs/codir.c                        |  4 +-
 hw/9pfs/meson.build                    |  3 +-
 include/qemu/xattr.h                   |  4 +-
 meson.build                            | 13 ++--
 tests/qtest/virtio-9p-test.c           |  2 +-
 15 files changed, 292 insertions(+), 26 deletions(-)
 create mode 100644 hw/9pfs/9p-util-darwin.c
 rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (90%)

-- 
2.35.1


