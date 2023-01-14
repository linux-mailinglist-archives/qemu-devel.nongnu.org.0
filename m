Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D3666AC85
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 17:15:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGjAI-0008B4-GF; Sat, 14 Jan 2023 11:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pGjAG-0008Aq-Bn; Sat, 14 Jan 2023 11:13:52 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pGjAE-0005z7-Ix; Sat, 14 Jan 2023 11:13:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id bk16so23631017wrb.11;
 Sat, 14 Jan 2023 08:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3541pRrn8lpJE4sW30oitbMJnzbaSEbBU6oloBO7whE=;
 b=kCgUde19pA8R7rDD0R4+Uks6v7VasNd9LqbmpnR6FtXMt0B6ilEsB3bB7yJBu1oj2q
 /NxRMXw65rrHBBc58tWCPf+Fyv+/qzmD2Xq0a9mKugigSxVvS+swci8LRw4pgDJxpZso
 ryjAoVYdLDToaaeULXsZiYJbe+t+bKY4s3R/eBNEf+NAt6H5vJbSGw82AnlaTePd3GT6
 cerTdyCRN4Bz2UTJ3VnmNqf7u2Z7sws6/N/QCCIUCtVpVzscQAo7vTp84C+0vF0QzgiC
 X7CYCLhNpY7/R3gpmqUYOSEcipsk4BU6mfg2BCj98USD4f75DcmSZvAqZIHrRfppjhrj
 lD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3541pRrn8lpJE4sW30oitbMJnzbaSEbBU6oloBO7whE=;
 b=vMdkd+3KbRaOauwE4GQsZe0FS+1eGVYk9VafLWieBkptyxAxNuxIx/EsPjo3R6w1AT
 EVHBX4jVO79RaHPbB3w3V3CevJgJ4aesZhOFbr2YlbBXrOvacTrC0kAEwbaaL1Y2se6U
 OhNI5XqiKzHb40bablxwLxyvetcONnmQG1j4+DUtTZC1/N4VKCof56PGsfrAL1kxqLld
 EQnPUnSznEkqLHotlm6s511S9c5PVW6yTHotUFe/VnTIkSSvYWbbI1Jgaf63r7fLcqHR
 FHMB78vdK0s0KMDnFqEakiyGTZlGGPbvaE3/0iGU43zCmPYPcofwXU8E9q1p2Ea9wtZi
 6e8g==
X-Gm-Message-State: AFqh2ko70qDRQR1Tr/5ak5GmphCW4Wcdg8j63xZH2QCqS+RAKBGYLu80
 Th8CtY1ZORjQQ3J3+vHKAJuqzQfsuP1rcg==
X-Google-Smtp-Source: AMrXdXtq1PwCgIxN+MfRDjRl7cC4rUOOIdiTmqBfWJI9xFUjs7WBfwSp3LndOkUTp8Hn9WLo/5773g==
X-Received: by 2002:a5d:688b:0:b0:2bd:db42:36cd with SMTP id
 h11-20020a5d688b000000b002bddb4236cdmr5820999wru.0.1673712828245; 
 Sat, 14 Jan 2023 08:13:48 -0800 (PST)
Received: from omega.lan (194.46.205.77.rev.sfr.net. [77.205.46.194])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d6152000000b002425be3c9e2sm21330040wrt.60.2023.01.14.08.13.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 14 Jan 2023 08:13:47 -0800 (PST)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk, dirty@apple.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com,
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH v3 0/3] Add gdbstub support to HVF
Date: Sat, 14 Jan 2023 17:12:59 +0100
Message-Id: <20230114161302.94595-1-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-wr1-x432.google.com
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

The patch has been most recently tested working on macOS Ventura 13.1
hosts and Linux kernel 5.19 guests with the test script
'tests/guest-debug/test-gdbstub.py' (slightly updated to make it work
with Linux kernels compiled on macOS).

v3:
* Keep separate views of DBG*_EL1 registers while guest debugging is
  enabled  
  NOTE: Should be implemented as Peter and Alex suggested, and works as
  intended in my (limited) tests. Any other register to handle beside
  DBG*_EL1?
* Handle singlestepping over instructions triggering a VM exit
  NOTE: I'm not aware of unwanted side effects, please double-check the
  fix is adequate.
* Merge patches 2 and 3 from previous patch series

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
  hvf: handle singlestepping over instructions which trigger a VM exit

 accel/hvf/hvf-accel-ops.c | 123 ++++++++
 accel/hvf/hvf-all.c       |  24 ++
 cpu.c                     |   3 +
 include/sysemu/hvf.h      |  29 ++
 include/sysemu/hvf_int.h  |   1 +
 target/arm/hvf/hvf.c      | 635 +++++++++++++++++++++++++++++++++++++-
 target/arm/hyp_gdbstub.c  | 242 +++++++++++++++
 target/arm/internals.h    |  50 +++
 target/arm/kvm64.c        | 276 -----------------
 target/arm/meson.build    |   3 +-
 10 files changed, 1107 insertions(+), 279 deletions(-)
 create mode 100644 target/arm/hyp_gdbstub.c

-- 
2.39.0


