Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B16062C6C9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 18:49:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovMWF-0006K2-8G; Wed, 16 Nov 2022 12:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1ovMWD-0006Jm-OT; Wed, 16 Nov 2022 12:48:13 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1ovMWC-00013X-3f; Wed, 16 Nov 2022 12:48:13 -0500
Received: by mail-wr1-x42a.google.com with SMTP id w14so31121415wru.8;
 Wed, 16 Nov 2022 09:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RMBo7pxLDFqLDNCPbIFxjqDC8i1LyC537dC2FLVS84U=;
 b=hNJ0gudQrRDr/N7kRIsybLmm6C+5zrDakidGGKTNQqMT9PsFoBk1C8tlAlw2BXa+8U
 jx9/o/W9K9Anw3mrj6eSkhQZ/6PuG9GWoffBs7Ylf90vNMRqbBMEB6JxBoQ5DVoJrM2S
 wIRjrwHKzrf6Y8hFrL2E+BvxmlEzPrA8L1uJS79Y0RDzaCT1xlLt/nMlaZGNNU8rE6qQ
 jYY2vEfh3opWjYiwI+ZP8xBh14NWUFL0JolH+/R8zNQHe/g7hvyo2mGbfUrTg3lxsa3n
 N59soeW0wNITsot8dz6iYYbpqRyse16VA/gBN0SlFqiIM1sp5cZMdc9/ubGDFSqtZcl6
 WCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RMBo7pxLDFqLDNCPbIFxjqDC8i1LyC537dC2FLVS84U=;
 b=h2gxftoU6WstgoUvq+SQpsxbf4zORANk7NgkKnqbU0AYHaB9b/EUAoA0aac9aIZFM4
 INLTOA/yt4a+YetqkGyy+XmAyu1bwrZpyJKLI9SpDWm2D0boRzxqVM4rK6PY7LWRDVFx
 kz+BiuN7tAGGlwdX43i3d2QFrd91Q0JRTl1YuMg294YtDFwh48C5L3s7FyzDm8RKhjwd
 jXlKPvEJg7JA54O4UheqN2CZBaRpJY/LMCvdJnjLeTCWWW2a/gDOqefA0lZpIt8ZY0G4
 2Ty/ifJM0PiDutAg6l1AMX/cIHI0fH0JMO+tmBNkz21HYwxKP3HEB67ZRkZlQPzuldEe
 R6BQ==
X-Gm-Message-State: ANoB5pkuXFkuz4AVrlmUCv6EBo8nE7JlHpaoUtF+06nijrZqd/FUHe4u
 cDWWW7WrPf0y8bXlj5gKcN0zVM3z/yMnow==
X-Google-Smtp-Source: AA0mqf6B9Kh4eluxLtg+JE+UNkpsgtUA5oRZc2qflhr5qaskoG+yVaDRVcOV9s14iWaMedN1PFTT/Q==
X-Received: by 2002:a5d:4386:0:b0:22e:3177:1401 with SMTP id
 i6-20020a5d4386000000b0022e31771401mr14091256wrq.148.1668620889856; 
 Wed, 16 Nov 2022 09:48:09 -0800 (PST)
Received: from localhost.localdomain (229.19.205.77.rev.sfr.net.
 [77.205.19.229]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c465100b003cf483ee8e0sm2477490wmo.24.2022.11.16.09.48.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 16 Nov 2022 09:48:09 -0800 (PST)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk, dirty@apple.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com,
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH v2 0/3] Add gdbstub support to HVF
Date: Wed, 16 Nov 2022 18:47:46 +0100
Message-Id: <20221116174749.65175-1-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Francesco Cagnin <fcagnin@quarkslab.com>

This patch series aims to add gdbstub support to HVF (the 'QEMU
accelerator on macOS that employs Hypervisor.framework') on Apple
Silicon hosts.

The proposed implementation, structured like the KVM counterpart,
handles single-stepping, software breakpoints, hardware breakpoints and
hardware watchpoints.

The patch has been most recently tested working on macOS Ventura 13.0
hosts and Linux kernel 5.19 guests with the test script
'tests/guest-debug/test-gdbstub.py' (slightly updated to make it work
with Linux kernels compiled on macOS).

If deemed useful, I can also submit an analogous patch targeting Intel
hosts.

v2:
* Move debug helpers to 'target/arm/hyp_gdbstub.c'
* Add support for SSTEP_NOIRQ and multi-core (thanks Mads Ynddal)
* Move calls to 'hv_vcpu_set_trap_debug_exceptions()' to
  'hvf_arch_update_guest_debug()'
* Use 'arm_num_brps()' and 'arm_num_wrps()' to compute the number of
  breakpoints and watchpoints available (thanks Peter Maydell)

Francesco Cagnin (3):
  arm: move KVM breakpoints helpers
  hvf: implement guest debugging on Apple Silicon hosts
  hvf: handle writes of MDSCR_EL1 and DBG*_EL1

 accel/hvf/hvf-accel-ops.c | 123 ++++++++++++++
 accel/hvf/hvf-all.c       |  24 +++
 cpu.c                     |   3 +
 include/sysemu/hvf.h      |  29 ++++
 include/sysemu/hvf_int.h  |   1 +
 target/arm/hvf/hvf.c      | 334 +++++++++++++++++++++++++++++++++++++-
 target/arm/hyp_gdbstub.c  | 242 +++++++++++++++++++++++++++
 target/arm/internals.h    |  50 ++++++
 target/arm/kvm64.c        | 276 -------------------------------
 target/arm/meson.build    |   3 +-
 10 files changed, 806 insertions(+), 279 deletions(-)
 create mode 100644 target/arm/hyp_gdbstub.c

-- 
2.38.1


