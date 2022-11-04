Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21DC61A19C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 20:55:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or2lD-0005OM-KL; Fri, 04 Nov 2022 15:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1or1dr-00054K-UG; Fri, 04 Nov 2022 14:42:12 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1or1dq-0004Za-4k; Fri, 04 Nov 2022 14:42:11 -0400
Received: by mail-wr1-x430.google.com with SMTP id o4so8249869wrq.6;
 Fri, 04 Nov 2022 11:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MYr9jl5psSrRQcbaLPKPaO442xdmOLg8RfIuQFPRHEY=;
 b=oHDKHPpfFpD3xGbrP3aYtubfn0lHr+pTNacL4qRYMol9hyM7qZpVzvLazfI8IOy6wB
 ECIPijeLX/2QCkf9KvGHxgKfVHgmHmJURnrHXaSMJ/m2ByiI6RtMtacGhVipJN1REzei
 WPnCTX7VAUqIfPReik+40+lstucdzWvcYhya/Lc1TOmflkaZBtSuCPrZFTwI1nCxHtDW
 5IEf4BCFcS1vuiF0QIGv68U/RpC1uBc9iGA6fQ+nQkt2d/8ykWOT4XgZfEUv3yhLhUlx
 Nf95Mg0jcI+VA4xHqj2ehlYl3IfOJUpI2beTjk4WLNeKPOtQ/A04nQhniCOow/QGpLoA
 ZsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MYr9jl5psSrRQcbaLPKPaO442xdmOLg8RfIuQFPRHEY=;
 b=SqBhJhlbeTcTrKbFoZ3mwPEMXMuu7OocYAXRjGOQxPCOjIesgbb4ZoEWR/axO2I8Rj
 4ME5d0epg+Vp1RVUnJ0XsHuyv4BYdY0SmTUhZ8f2FimjPIGcxdfOf1jSVoKTZbdotgRf
 gFWHlAEoWxCrvDSxBOCc88ZBha2I7RsdcnkZf2Oqbr6lUQrlR/xvEuLjVjEUG5y/l404
 Sq2rvZOgQ1pVnbUKgr9QD3DEUagzU26xWPrw9K2S1HlyKXChBrgwUmsh/eFxLicex8CB
 k8S24HSIe/OPF6mPr2Z1R49niMNDzhKY6KjLFWM1rRikgIGJgpCVBeZYE9BIHGZRCf2e
 wGsQ==
X-Gm-Message-State: ACrzQf1e8f56tCnxCdrQ+iFFUdWy3Z1ZcWTiBuVNZv42WLIwmXNzQ0iB
 EhUavttpkJ6bbOu4lwRbX586sjb4seVWmA==
X-Google-Smtp-Source: AMsMyM55eSVKRnIYaWT+TH9Veu9Hoq/QA6o062dTcY0c8TANDNHfowtdJCo9Z2CexLQ6adv7dEMf1Q==
X-Received: by 2002:adf:f58f:0:b0:236:eea6:d4c with SMTP id
 f15-20020adff58f000000b00236eea60d4cmr11265774wro.39.1667587326053; 
 Fri, 04 Nov 2022 11:42:06 -0700 (PDT)
Received: from localhost.localdomain (216.87.95.79.rev.sfr.net. [79.95.87.216])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a05600000cb00b00236e9755c02sm22217wrx.111.2022.11.04.11.42.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Nov 2022 11:42:05 -0700 (PDT)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: dirty@apple.com, r.bolshakov@yadro.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com,
 Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH 0/3] Add gdbstub support to HVF
Date: Fri,  4 Nov 2022 19:40:58 +0100
Message-Id: <20221104184101.6923-1-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 04 Nov 2022 15:53:47 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Francesco Cagnin <fcagnin@quarkslab.com>

Hello,

This patch series aims to add gdbstub support to HVF (the 'QEMU
accelerator on macOS that employs Hypervisor.framework') on Apple
Silicon hosts.

The proposed implementation, structured like the KVM counterpart,
handles single-stepping, software breakpoints, hardware breakpoints and
hardware watchpoints on single-core guests (i.e. '-smp 1'). (If
possible, I'd like to receive guidance on how to add proper support for
multi-core guests.)

The patch has been most recently tested working on macOS Ventura 13.0
hosts and Linux kernel 5.19 guests with the test script
'tests/guest-debug/test-gdbstub.py' (slightly updated to make it work
with Linux kernels compiled on macOS).

If deemed useful, I can also submit an analogous patch targeting Intel
hosts.

Francesco Cagnin (3):
  arm: move KVM breakpoints helpers
  hvf: implement guest debugging on Apple Silicon hosts
  hvf: handle writes of MDSCR_EL1 and DBG*_EL1

 accel/hvf/hvf-accel-ops.c | 124 ++++++++++++++
 accel/hvf/hvf-all.c       |  24 +++
 cpu.c                     |   3 +
 include/sysemu/hvf.h      |  29 ++++
 include/sysemu/hvf_int.h  |   1 +
 target/arm/debug_helper.c | 241 +++++++++++++++++++++++++++
 target/arm/hvf/hvf.c      | 334 +++++++++++++++++++++++++++++++++++++-
 target/arm/internals.h    |  50 ++++++
 target/arm/kvm64.c        | 276 -------------------------------
 9 files changed, 805 insertions(+), 277 deletions(-)

-- 
2.38.1


