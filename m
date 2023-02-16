Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717A06999D2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:21:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSh0t-0008MD-Fa; Thu, 16 Feb 2023 11:21:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh0q-0008Lv-AF
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:21:36 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh0o-0005uT-CP
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:21:35 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-16debd2786aso3097111fac.7
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HY0DOmena3fzRb4vDPJG4HFE5q+jsBAnTqDOLdMK3L4=;
 b=i0tutQfX3Z1ot8HnjXrerno5GD4DPTdwcsatHlT7ldvvrihKRq7WH19l6Ufn/J1QYx
 tTI+7euMUjOeBXJrVC+RjHsolF8O0wyALDHWtNXZZE5NhHeqKVQV1V+/Rk+D+cschcqP
 Ia0Kd23q7bA5ZAb+gp8/Bt4i8iOtHrSqtSPLB3Rf2v9P4XnHkXpLu4nBkqPgvpNoKBqH
 SD1RiE206EaqzfYezdOP7x9Ola3UNysNxGxIUpSoOTfjFIZF4N/80O1c7WDH4suBzRNV
 Zrb+dZq79ZGhHWjzpfVQcwQVyXQQoanggXZL9bDhdbOVKhYByB435lf+ypUaGHQqsh3T
 WLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HY0DOmena3fzRb4vDPJG4HFE5q+jsBAnTqDOLdMK3L4=;
 b=Vs84MGsd9dwiutCuT7gBcYgOPnNtbVKDMl73Yi2e2TfxsF3BWoZxworvaL0aklArEk
 Qgxmvzo9kYhDVVIsf7suXNcvaSvs3EI8oBS5rYBDXpFhHBV1wNpAdno2Mfl622uucBis
 lyZbC+fx2ukalEkScAyGe1mBiqKKXUOF3D8pUWTrsS75DyfHmXImjUMH+vp6z+5dm4Q1
 0jtE33W8OxAEbpZkwQx6JBn0lwpYayHf8gQgHGwFHyhkp3nLJqZ9UGJjgfwOr6C3cbn7
 Yk/tNGzoA3T8MH1IVfQybRDxVpYA8LCyRKa9TeiFDAoaygznicEoe3fbfyrHTZ1rnCb5
 akjg==
X-Gm-Message-State: AO0yUKXaOJah4SKXgw7aypwFcvCCLROG/qaaUPWWbrS/XZ9Xwt1vVCFJ
 KYZv+lecJucxxcUbOPm11Zfsue0wH2Njs6So
X-Google-Smtp-Source: AK7set9BrYcsOWVQyvxVfxr01Q3YQnWX4kQhxwvzcSVAmEyuLpMruucKlsR5XZnukhv+bGNUyTFZEQ==
X-Received: by 2002:a05:6871:54c:b0:16e:27cd:b24a with SMTP id
 t12-20020a056871054c00b0016e27cdb24amr3762651oal.4.1676564492846; 
 Thu, 16 Feb 2023 08:21:32 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a056870e15100b001600797d1b5sm693029oaa.41.2023.02.16.08.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:21:32 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 0/9] make write_misa a no-op and FEATURE_* cleanups
Date: Thu, 16 Feb 2023 13:21:17 -0300
Message-Id: <20230216162126.809482-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi,

This new version squashed patches 1 and 2 together and there's more
detail in patch 1 about why we're not violating the spec by keeping
write_misa() as a no-op.

All patches are acked.

Changes from v4:
- patches 1 and 2 from v4: squashed together
- patch 1:
  - added more detail in the commit msg about why a no-op misa write is
    spec compliant
- v4 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg04780.html

Daniel Henrique Barboza (9):
  target/riscv: turn write_misa() into an official no-op
  target/riscv: introduce riscv_cpu_cfg()
  target/riscv: remove RISCV_FEATURE_DEBUG
  target/riscv/cpu.c: error out if EPMP is enabled without PMP
  target/riscv: remove RISCV_FEATURE_EPMP
  target/riscv: remove RISCV_FEATURE_PMP
  hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
    create_fdt_socket_cpus()
  target/riscv: remove RISCV_FEATURE_MMU
  target/riscv/cpu: remove CPUArchState::features and friends

 hw/riscv/virt.c           |  7 +++--
 target/riscv/cpu.c        | 19 +++---------
 target/riscv/cpu.h        | 28 +++--------------
 target/riscv/cpu_helper.c |  6 ++--
 target/riscv/csr.c        | 65 +++------------------------------------
 target/riscv/machine.c    | 11 +++----
 target/riscv/monitor.c    |  2 +-
 target/riscv/op_helper.c  |  2 +-
 target/riscv/pmp.c        |  8 ++---
 9 files changed, 31 insertions(+), 117 deletions(-)

-- 
2.39.1


