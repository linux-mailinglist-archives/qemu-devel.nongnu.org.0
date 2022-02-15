Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D04B74AD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:25:33 +0100 (CET)
Received: from localhost ([::1]:33268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3S7-0002o6-Tn
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:25:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK37w-0000Ke-A2
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:40 -0500
Received: from [2607:f8b0:4864:20::f30] (port=45033
 helo=mail-qv1-xf30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK37u-0002hK-8R
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:40 -0500
Received: by mail-qv1-xf30.google.com with SMTP id p7so6334qvk.11
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sXmsG9GQdfk4QLExesW/XeK4xKPBLtyhCUNVK0aDsPA=;
 b=L7NJIBHbWc38MAjt66qyewZ580/JKRaP+8xQuWRq2Yn5CwY39oYAS2O4LmN6QTm31U
 iOI7fa7LRdO2daRxN4a3AQjCd2WKcU2LunQYPT9sK6blmJVviGnsvt0QMUOCSyYRd5fd
 FODETK0d0ii+MZ9k6BKZimEebGVykVGQKVo9wy7t8sqBD6a5L9Gm+gXxq+p2omDdrCxV
 E++57LbNc4XmeGldwSVF76Mk7+d/8R5eHLF86+TRd7GHB1qVf2ztjHaC0pjgalZy2W8h
 QcNHK/s5n743jBdR/xt/FLDUJyGh9C39ott0cuy/2fz9kQ3/8MbdHkBrl2FIzVN2VK27
 0l1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sXmsG9GQdfk4QLExesW/XeK4xKPBLtyhCUNVK0aDsPA=;
 b=2EtZnZ6cEphKLoGHmQm1owutmGjhomMLXLbwrtKLhHvqvc+UDHxw/dJFfKIQZzoGNd
 7kFEsfjHPFOtmyv0j3YS2k1lhH2Wgo2dNtcFdFlk0Urp+MZROav3Eh8BoDMecc9iRs41
 50CgS22j9OUmn9h3T4ENi2DEAylWlVvo2LoxfNsBbGMD8e4vfquX3D5vtxhZijDg37EJ
 2CxDRaPgDgA4j8QcJxv3OpVtY+3MAL9Io9+U4maGgLLVHu9ZWTXuB+WBmsWp9yczD6Xj
 IFuIX9TZ94D8cOEgLq1LPEBhJGpcadclfDQcDul1aQgAoJGPmwDmHteI/GBHw3FJf/9Z
 h5Ng==
X-Gm-Message-State: AOAM530NGmUqxCpsTmo6asXoQuHEd80eraZ4Fb5UL/u+Jul9ulkSQqIF
 cQgdkX1/4J6ReYxYMc5rAsmKEdI5N7tpww==
X-Google-Smtp-Source: ABdhPJwh5i3iOujisMJGBZjmD2Ht/hQAfyvIqggmJR/LaFVHt1vVsHT7hcyz9v9TVWj3oWTA8IqL7A==
X-Received: by 2002:ad4:5ce7:: with SMTP id iv7mr451298qvb.30.1644951876631;
 Tue, 15 Feb 2022 11:04:36 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w10sm21364527qtj.73.2022.02.15.11.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 11:04:35 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/11] 9p: Add support for darwin
Date: Tue, 15 Feb 2022 14:04:15 -0500
Message-Id: <20220215190426.56130-1-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

This is a followup to https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg02313.html,
adding 9p server support for Darwin.

Since v6, the following changes have been made to the following patches:

Patch 9/11: 9p: darwin: Implement compatibility for mknodat
- Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for
  presence in osdep.h and os-posix.c

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
2.34.1


