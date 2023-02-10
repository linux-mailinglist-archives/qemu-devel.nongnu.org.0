Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E80691FD5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:37:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTa2-0005JL-1l; Fri, 10 Feb 2023 08:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTZz-0005IZ-Ok
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:36:43 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTZy-0007Tj-5s
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:36:43 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-16346330067so6684701fac.3
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bfD+6csXDxuzwnT7hlSofZkdJy1bIhG8BMRkMVM4vV4=;
 b=WuIJRhys+a2lWjwczwKNlCNS4QRlxnPRNawzv0Vk8DGUvjALAJQGeE0xQAS4o5axVy
 gPGGtziMA98HRJOQyDBbs4fuices5TVUpDch7r6u87lMitMEoFwKy8TN39jPUF7AaeqD
 fn6bVxQe+y/qfZpsKZogkF5oF7p3r0G7A4Ec5KaiExM0zUkqiMeI0xNurE3l9Bk4k+zY
 8WSyNIsyE3lKyuRhOA/hWg7XY3HYnyBHC5ZHjz4NpyA+DIRg1aLSXR8pBK6WL2hUtRET
 RfBWavXSvI55J1BnmrQsOsgt4E6cSJ5SufaTJiMFbU20F7i+1ghy0StKFbLhSi5KwDgi
 AqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bfD+6csXDxuzwnT7hlSofZkdJy1bIhG8BMRkMVM4vV4=;
 b=YOv42W9EtnpeMEzNsZquQI6AOLCovWdzh0H+4STYCRQSSMJVX0TKPJTRlTc5y38qJT
 EDt8Kx899C2ViH5mPwmJs5aZYGZskLttInU/q4I5ka9hGxuLiTJDunAcjFvljmp5Gi+k
 bIg8XP46+Dph5JSrlQtn/Gh7kFu5zHfsn1VKxTdgAL3B3/BR6bazMvdeHIgt84+w6dTi
 JaUR83iFbUw/zTzFK9AbRJUP7D8mW5o4bmlCKEegveggclq6AM/0/adrKSDZuBWpfGCf
 hLl4bt5TW0kCJCFc3Qe13gL1rNlY0lytyvrAFh1oWtmlhxrft/TEs96/46ryNuIFcUw9
 IGAg==
X-Gm-Message-State: AO0yUKVjyKyBR7w5mr/Rd/DbAMlLgNZqFfjsgtTYDufGw8BbiutJawhe
 l3lYrxX6cOMHKrLvGvfRu4i/7/0CVXro/n63
X-Google-Smtp-Source: AK7set9lH7vYSZE30cUA5rWgn51s9jCBXVvtCpWM49KNoZx/Gk48DHLnx+DmGCBkb2dU3eHZ0MbTjw==
X-Received: by 2002:a05:6871:9a:b0:163:a45a:9e3e with SMTP id
 u26-20020a056871009a00b00163a45a9e3emr9628076oaa.21.1676036200468; 
 Fri, 10 Feb 2023 05:36:40 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a05687050e400b0014474019e50sm1890570oaf.24.2023.02.10.05.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:36:40 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 00/11] enable write_misa() and RISCV_FEATURE_* cleanups
Date: Fri, 10 Feb 2023 10:36:24 -0300
Message-Id: <20230210133635.589647-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi,

Initially this was supposed to be just the first 2 patches, where we
enable users to be able to actually write the MISA CSR (yes, at this
moment all the code in write_misa() is a no-op).

During an internal discussion of that code, Andrew Jones pointed out
that I was setting RISCV_FEATURE_MISA by just mirroring the value
already set in cpu->cfg.misa_w, and asked why that was necessary.
Instead of replying "I'm doing it because it's being done for every
other feature in that enum" - which was the truth - I decided to take a
closer look.

The RISCV_FEATURES_* enum and the CPUArchState::features attribute were
introduced 4+ years ago, as a way to retrieve the enabled hart features
that aren't represented via MISA CSR bits. Time passed on, and
RISCVCPUConfig was introduced. With it, we now have a centralized way of
reading all hart features that are enabled/disabled by the user and the
board. All recent features are reading their correspondent cpu->cfg.X
flag.

All but the 5 features in the RISCV_FEATURE_* enum. These features are
still operating in the same way: set it during riscv_cpu_realize() using
their cpu->cfg value, read it using riscv_feature() when needed. There
is nothing special about them in comparison with all the other features
and extensions to justify this special handling.

This series then is doing two things: first we're actually allowing
users to write the MISA CSR if they so choose. Then we're deprecate each
RISC_FEATURE_* usage until, in patch 11, we remove everything related to
it. All 5 existing RISCV_FEATURE_* features will be handled as everyone
else. 

Note: patch 6 is adding an error message that will fire a checkpatch.pl
warning (82 chars). The following patch will put the error message back
into the acceptable 80 chars range. 

Daniel Henrique Barboza (11):
  target/riscv: do not mask unsupported QEMU extensions in write_misa()
  target/riscv: allow users to actually write the MISA CSR
  target/riscv: remove RISCV_FEATURE_MISA
  target/riscv: introduce riscv_cpu_cfg()
  target/riscv: remove RISCV_FEATURE_DEBUG
  target/riscv/cpu.c: error out if EPMP is enabled without PMP
  target/riscv: remove RISCV_FEATURE_EPMP
  target/riscv: remove RISCV_FEATURE_PMP
  hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
    create_fdt_socket_cpus()
  target/riscv: remove RISCV_FEATURE_MMU
  target/riscv/cpu: remove CPUArchState::features and friends

 hw/riscv/virt.c           |  7 ++++---
 target/riscv/cpu.c        | 20 +++++---------------
 target/riscv/cpu.h        | 29 ++++++-----------------------
 target/riscv/cpu_helper.c |  6 +++---
 target/riscv/csr.c        | 17 ++++++++---------
 target/riscv/machine.c    | 11 ++++-------
 target/riscv/monitor.c    |  2 +-
 target/riscv/op_helper.c  |  2 +-
 target/riscv/pmp.c        |  8 ++++----
 9 files changed, 36 insertions(+), 66 deletions(-)

-- 
2.39.1


