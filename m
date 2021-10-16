Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE124303DF
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 19:18:36 +0200 (CEST)
Received: from localhost ([::1]:40368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbnKN-0003w0-9p
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 13:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGF-0000yp-Uh
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:14:21 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGB-00066H-JX
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:14:19 -0400
Received: by mail-pg1-x532.google.com with SMTP id 66so11678884pgc.9
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 10:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4gLwwRS+S3qLR7K1/Zsn+88po1Ea6GHguAJyPwg+2Xs=;
 b=R/aEOtvSSqzsT7XAOQlQL2K8c73h3OdYAXGyYSQXNFNL75fEAKy/snUm1pwvkQAdQ/
 fVMR/+5c1lQRWwYA+D1JFSeeVDWeoY1GlNf6aFeJWSuTU0M6lqS+go8E04jEX/TV49RP
 q59n3ub86kmib0GdRoAFPZPOo86uDgsQ1BjNX1PFoyn885dZKSs/9oLSt5vdNx3xLNcb
 xW+bkjPFsB03yWaosWTFSRFcfh26XXVSpyv4ciQOBN9rSrnMI5mcIQLpOFQke6l1DXbN
 8EraGKh+xwMkqV23OfqYDgKIhN+rKjqVJxrHsRtSC/Vk0A6LcQIjlWoMjwPxa08LEV4V
 GwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4gLwwRS+S3qLR7K1/Zsn+88po1Ea6GHguAJyPwg+2Xs=;
 b=NSh7gveATmEEig2sonhhpYWGfDeBAl6YGvw9I4PnpvQob5QCF+zhQS1k4oi8tgSi+U
 qV37yZmUceaNSIwCkFLRe5w5Qhd5CIebyeW659NJemQ0Za6VYl8CscmxhRvyFRocC2EW
 dI1V5YRuyIWRN2h5qZhqqQMAfzcn8iRXmxB04CXO0Mj4NFgHNRa+RNX/mGPEKsusuYFy
 FtqybOxJuMIX7Z3pP7Qr3CsZ62UQPuLJ20zGM9o/Kf8TFAfGoYyW2BNsyQ5OyQHGT9Mc
 aWDhYxUv3/ytMRq3fL2hyKzPizbrAm/TTMSh0UF30STlfA6lTtzzXzbuqVhozpqXP5Qp
 JwXw==
X-Gm-Message-State: AOAM531l10PrSahDtVyBCJclsIz4lJ4XReDdmnxLYdY81PV2LHx8bUmt
 kLhx5pJcCQiENvh5/wokP++byPhfFrs=
X-Google-Smtp-Source: ABdhPJxHAekRArzs62rmoBw8N1ikFYH6II1Y2A3n/J6kaGDLn6zumdMOvgw5o90Z0Cn9oMwmZm7W8g==
X-Received: by 2002:a65:5385:: with SMTP id x5mr14758415pgq.140.1634404453693; 
 Sat, 16 Oct 2021 10:14:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l4sm2330281pfc.121.2021.10.16.10.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 10:14:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/14] target/riscv: Rationalize XLEN and operand length
Date: Sat, 16 Oct 2021 10:13:58 -0700
Message-Id: <20211016171412.3163784-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-riscv@nongnu.org, frank.chang@sifive.com, alistair.francis@wdc.com,
 fabien.portas@grenoble-inp.org, frederic.petrot@univ-grenoble-alpes.fr,
 zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a partial patch set attempting to set things in the
right direction for both the UXL and RV128 patch sets.

Notable addition for v3 is the treatment of [MS]STATUS.SD.  Because this
bit changes position depending on XLEN, it's better to split it out.
But since it's read-only and computable from [MS]STATUS.{FS,XS}, it
is even better to not store it at all.  I noticed this while reading
Frank's RVV patches which add VS to be included in SD.


r~


Changes for v3:
  * Fix CONFIG_ typo.
  * Fix ctzw typo.
  * Mark get_xlen unused (clang werror)
  * Compute MSTATUS_SD on demand.

Changes for v2:
  * Set mxl/sxl/uxl at reset.
  * Set sxl/uxl in write_mstatus.




Richard Henderson (14):
  target/riscv: Move cpu_get_tb_cpu_state out of line
  target/riscv: Create RISCVMXL enumeration
  target/riscv: Split misa.mxl and misa.ext
  target/riscv: Replace riscv_cpu_is_32bit with riscv_cpu_mxl
  target/riscv: Add MXL/SXL/UXL to TB_FLAGS
  target/riscv: Use REQUIRE_64BIT in amo_check64
  target/riscv: Properly check SEW in amo_op
  target/riscv: Replace is_32bit with get_xl/get_xlen
  target/riscv: Replace DisasContext.w with DisasContext.ol
  target/riscv: Use gen_arith_per_ol for RVM
  target/riscv: Adjust trans_rev8_32 for riscv64
  target/riscv: Use gen_unary_per_ol for RVB
  target/riscv: Use gen_shift*_per_ol for RVB, RVI
  target/riscv: Compute mstatus.sd on demand

 target/riscv/cpu.h                      |  73 +++-------
 target/riscv/cpu_bits.h                 |   8 +-
 hw/riscv/boot.c                         |   2 +-
 linux-user/elfload.c                    |   2 +-
 linux-user/riscv/cpu_loop.c             |   2 +-
 semihosting/arm-compat-semi.c           |   2 +-
 target/riscv/cpu.c                      | 108 +++++++++------
 target/riscv/cpu_helper.c               |  92 ++++++++++++-
 target/riscv/csr.c                      | 104 ++++++++------
 target/riscv/gdbstub.c                  |  10 +-
 target/riscv/machine.c                  |  10 +-
 target/riscv/monitor.c                  |   4 +-
 target/riscv/translate.c                | 174 ++++++++++++++++++------
 target/riscv/insn_trans/trans_rvb.c.inc | 140 ++++++++++---------
 target/riscv/insn_trans/trans_rvi.c.inc |  44 +++---
 target/riscv/insn_trans/trans_rvm.c.inc |  36 +++--
 target/riscv/insn_trans/trans_rvv.c.inc |  29 ++--
 17 files changed, 532 insertions(+), 308 deletions(-)

-- 
2.25.1


