Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B77514FCC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:44:19 +0200 (CEST)
Received: from localhost ([::1]:46304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSn4-0007rW-Dg
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkSe5-0004wO-VG
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:35:03 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkSe4-0007rR-35
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:35:01 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so7650216pjf.0
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXKWBVY3NxhjMBRD0PC/DdAoXy9LX4hKbVNoVoEffA0=;
 b=W5KuxKSDyhDRnNq/qINQYZpdmdV5Kx1HeEi5I1sopMj2kE4QHctH1bjsqy5pKN9IqX
 aBfbFbWaqA5/N3UAFfGyzck5X9FIja2hGSu6GlM9d/ZtMugABcmDwkRt45EgdIyfKXTH
 COFMEIlcj2JXshLdSPmvc4q9Bxp45EpxVi0Sxl4xoYerwlfOygWgoaITt5Wb3pLiJFOl
 Zq4i6VHzfcV+i9bKFeW+3AMlKWZ/RT5dHH/28onHanNIW/Yzygu+y/ADYPSqe1KP5IFI
 LRQLMW3L9pL99/mg9nsC+tY5w5czqKmY2SIwor2dlyO5A8Az2mmw1Ixk9b+mwcNU5R7T
 AXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXKWBVY3NxhjMBRD0PC/DdAoXy9LX4hKbVNoVoEffA0=;
 b=4ReI+hj8BeYmJZN2lwVEh+RGJUnlSEmSznUftS0jSj5A2tLY81vwQmd9OqGXVIv6Mp
 4g5EUriVY71uIfCJLlEmV0f9z1EOR2bER2/10xEK+v+5pMFisI/AxnKOplyRiLY0XC0M
 8GnD5oEWkwuPO9demmTJv8/68GnxSIytorpsD4ZMaoNMNmbiT4lNpOqU9lWgWbOzl1DV
 /xDXICmYBjJNx4Unj2G3fLvaXy9pxnc/pyrFACKR8INM3GV2mGNOC+Rupt0WIEaWeiuu
 uGu707ONisN8xu7ifM4D7tMoJ+Gzt3KCbu1PmOysHQS8u2ZX9fDfeHpQBs8MtIY3pDFQ
 VxDg==
X-Gm-Message-State: AOAM530mDP0qG2s3vDkKPhSSy7eFak/qpPB2sVZB4CHdXSXpxqVQJ/Dl
 lHT4pUHs6PsUxQ+68M77p9C01A==
X-Google-Smtp-Source: ABdhPJzJCwkqTaEk6L1bMMxAcp6g/OgJpmJJKo/gOtlQZeLBJhJUkyQo9GvPWXUj/cGYbnGD4vLGXw==
X-Received: by 2002:a17:903:185:b0:15e:8bfa:ed63 with SMTP id
 z5-20020a170903018500b0015e8bfaed63mr85458plg.153.1651246498719; 
 Fri, 29 Apr 2022 08:34:58 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.167.97.237])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a65608d000000b003c14af50606sm6439380pgu.30.2022.04.29.08.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:34:58 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH 0/3] QEMU RISC-V priv spec version fixes
Date: Fri, 29 Apr 2022 21:04:28 +0530
Message-Id: <20220429153431.308829-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Anup Patel <apatel@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Atish Patra <atishp@atishpatra.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series covers few fixes discovered while trying to detect priv spec
version on QEMU virt machine and QEMU sifive_u machine.

These patches can also be found in riscv_priv_version_fixes_v1 branch at:
https://github.com/avpatel/qemu.git

Anup Patel (3):
  target/riscv: Don't force update priv spec version to latest
  target/riscv: Add dummy mcountinhibit CSR for priv spec v1.11 or
    higher
  target/riscv: Consider priv spec version when generating ISA string

 target/riscv/cpu.c      | 46 ++++++++++++++++++++++-------------------
 target/riscv/cpu_bits.h |  3 +++
 target/riscv/csr.c      |  2 ++
 3 files changed, 30 insertions(+), 21 deletions(-)

-- 
2.34.1


