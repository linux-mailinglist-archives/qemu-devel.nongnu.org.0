Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CAC4CC590
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:02:03 +0100 (CET)
Received: from localhost ([::1]:51502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPqiA-0002gb-Lp
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:02:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbF-0007Ix-Fs
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:54:54 -0500
Received: from [2607:f8b0:4864:20::335] (port=45712
 helo=mail-ot1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbD-0001j0-DK
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:54:53 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 g6-20020a9d6486000000b005acf9a0b644so5376571otl.12
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 10:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vfG7FK1OPCdsx0kND74abVNHh9tfVIoxxm0LNF72n4o=;
 b=hJSd03ckPZ6gkLrFw3NNElCZW+Ob+m/vOxvXNd+wyHriMthYAlEdohJU2/7EzoUIQr
 OXISr7E2NxFQ579H4NryxXGeK8RBIwH7SKmTqQkltoBG/yANpGs4mWiCEMNS0ARWr5NF
 c426ABaCs2D56dZl4WetlMbGzAB+oRSzReHIE9XPPF3PSarTscj1nJ1DKcGeWVHrEd4Q
 zoh+WMqcSki6ZP597/W3lXSyywxWn58P/a6d5jfs8dkuuBUeLHBNH/G5NQPnivXObN2M
 qJJvNaDcfgxB6TpvQ86wvqzuiHBkCQJmBkYRkOOn6onqOsWV2OMHWgHrPELUuN2pzWN8
 aY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vfG7FK1OPCdsx0kND74abVNHh9tfVIoxxm0LNF72n4o=;
 b=V5onGvUsK8mwvZlEuTqmR+rh3g4DXLHqPgQS59WgZUGHVCaooO5UT1XWhOx4nn7CmS
 RHMuy1m+87EVNaTdGUNeYvWDX+vS5VFFEAe5lK5TfQ7vJbtiw0lX924MsLYlCGPWsMwH
 i8F8TwhJDpWBdLsJ8dLou2AwbjIOYPrUeOF8/6tXbND+eGwY9VwNWDA5HfUpgGSfQlNk
 vu8hzJeYBIEMFDRVDrQwD1sFPgT2sLdJMuKF8lk+y0yT2ummr9D1eQdpI1M/6z8k4KyB
 CBJofVhHobKGnN9hJj1aJg51pMtYM8H1h9z2x93Fu2aB15LvjHpz2ZaWRIiL3Mih1eQV
 REhg==
X-Gm-Message-State: AOAM5312pHIWNeXkSyVRZ2/lZ4GhavcuCdJxX9uNuiN6yY+dpW//uagl
 tW0+Zkm4tn/sqW4nunBXqatv7dvRObEPpg==
X-Google-Smtp-Source: ABdhPJwwPaaQs4kxSfZmOYPHp8C7N/SLWbIdv9kRj804l22kdcIdaku659Hu+ssBXhjQ3AEqN2lBhA==
X-Received: by 2002:a05:6830:44a1:b0:5af:d3df:ae72 with SMTP id
 r33-20020a05683044a100b005afd3dfae72mr18056576otv.238.1646333689986; 
 Thu, 03 Mar 2022 10:54:49 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 u24-20020a4ae698000000b0031c286f2e0csm1331052oot.29.2022.03.03.10.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 10:54:49 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/6] Privilege version update
Date: Thu,  3 Mar 2022 10:54:34 -0800
Message-Id: <20220303185440.512391-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::335
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=atishp@rivosinc.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RISC-V International (RVI) has ratified many RISC-V ISA extensions recently[1].
The privileged specification version is also upgraded to v1.12. It means
certain CSRs introduced in v1.12 should only be accessible only if the
priv specification version supported is equal or greater than v1.12.
Doing this check in predicate function is not scalable as there will be
new CSRs introduced in the future versions of the privileged specification.

This series tries to address this problem by adding a field in the csr_ops
which can be checked in csrrw function before invoking the predicate function.
To keep the code churn to minimum, it is assumed that the minimum version of
the privilege version supported for any CSR is v1.10 unless specified
explicitly in the csr_ops table. Any new CSRs introduced in v1.12 have been
updated accordingly.

This will work fine for any ratified extensions. However, it is bit unclear
what should be done for the stable draft extensions. My suggestion is not
to update the priv field in the CSR ops table until the extension is
marked experimental (i.e. not frozen/ratified). Once the extension is
ratified and graduated from experimental to available stage, the privileged
spec version should be updated in the csr table if required. I am open to
other suggestions as well.

[1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions

Changes from v4->v5:
1. Rebased on top of riscv-to-apply.next

Changes from v3->v4:
1. Added reviewed-by tags.
2. Improved the commit text in PATCH 3 & 6.

Changes from v2->v3:
1. Only update the bits defined in *envcfg CSR

Changes from v1->v2:
1. Unified both [m/h]envcfg & [m/h]envcfgh into one.
2. Changed the priv spec version enumeration
3. Improved csr_ops table to provide better redability.
4. Fixed the compilation error for CONFIG_USER_ONLY
5. Rebased on top of the AIA series.

Atish Patra (6):
target/riscv: Define simpler privileged spec version numbering
target/riscv: Add the privileged spec version 1.12.0
target/riscv: Introduce privilege version field in the CSR ops.
target/riscv: Add support for mconfigptr
target/riscv: Add *envcfg* CSRs support
target/riscv: Enable privileged spec version 1.12

target/riscv/cpu.c      |   8 +-
target/riscv/cpu.h      |  15 ++-
target/riscv/cpu_bits.h |  40 ++++++++
target/riscv/csr.c      | 217 +++++++++++++++++++++++++++++++++-------
target/riscv/machine.c  |  23 +++++
5 files changed, 263 insertions(+), 40 deletions(-)

--
2.30.2


