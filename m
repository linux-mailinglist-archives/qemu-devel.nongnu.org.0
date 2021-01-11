Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA3D2F1C43
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:25:05 +0100 (CET)
Received: from localhost ([::1]:38346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz0wC-0006di-TX
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:25:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rB-00030W-LA
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:19:53 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:34077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0r9-0008WV-OT
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:19:53 -0500
Received: by mail-pf1-x431.google.com with SMTP id m6so333512pfk.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EGOdfJedeZkUbzwXSObgSFTXXj7WGsh9bQTSB/2402k=;
 b=GlCNW1Hppk2i0sfkwOD+oEp+MzSNluJViwkoFVvNm/flwjjQJkZFMEI4nzSmtdgzbM
 62r6OTN9pI/XfRSxD4z963UJiQpXivKtmUuopr4MZNiuFzJCmisrCZblsqK/tWOunmcj
 7ZPUQ49iwCEFtw6w2XxstkmokYZt2FwHHUNcwfGiv3IqkWTWU3cribRUWoLbd0H0P718
 Srd1UTAR5O3gnB16OzBPlZEo0KTtS1zObdbQzWboF8jOXLILAQOQSxuhufsH1tWd27Ja
 URtQYdJqV36f66fsrW8Oz4B0zn2NpXRI/ed80lqxkqxG+anfDlFdc1Ya2yRyaqhyXIrr
 msQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EGOdfJedeZkUbzwXSObgSFTXXj7WGsh9bQTSB/2402k=;
 b=F/nSwFw4hQ4UjjxZqKq/cuK5f47Go0tXr5LVrv2LxIGtLqe2UGj05ClYUexKY7KP6+
 K8efx3R9Lq/ydmcGa0XQtRzFkDeFwdcKEsYyWmk9G/Mpx+Pxoe3BhKd4l0+xVfSS1qFB
 KA69Bn9vXhoGbswevrV2q6+cQGwCCThG9vFD1Cq+TV7aEzMfJNPif7A2GMsy+bciSNol
 zP/AFnFSfkwxmrcW7/Ngt8VspoawII/aap1269mcjuKatVehiX1MDfXX8Y5oyOVZRo/0
 T2olsZheox4mB2q7khU5zWIOZw3WpX/bgaJllsGMybq8dToTFBVseLBB2dc+TnUSEo3G
 6lJQ==
X-Gm-Message-State: AOAM533wKd6QSiIRA+s9bL4LQl5yzTCl+vz/GzScENDsx0jjvoXYlSF2
 3hjSoS9S4acZIZyWyq544Gew24wyh2FD4w==
X-Google-Smtp-Source: ABdhPJwr80MYWFr9svvxucRMBLh8++4XQ/s0jAtAg0j22Oi8SuRxFtoQI2UBsCTnwgL/1wZV2pBS2g==
X-Received: by 2002:a63:4082:: with SMTP id n124mr542896pga.340.1610385589801; 
 Mon, 11 Jan 2021 09:19:49 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.19.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:19:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/23] tcg: Better handling of constants
Date: Mon, 11 Jan 2021 07:19:23 -1000
Message-Id: <20210111171946.219469-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v6:

Minor rebase conflict fixed.

Changes for v5:

Moved the clearing of the hash table from the end of compilation
to the beginning of compilation.  We skip the former when we long
jump out of the translator loop, e.g. touching a code page that
is unmapped.

Patches without review:

02-tcg-Increase-tcg_out_dupi_vec-immediate-to-int64_.patch
05-tcg-Expand-TCGTemp.val-to-64-bits.patch
07-tcg-Expand-TempOptInfo-to-64-bits.patch
08-tcg-Introduce-TYPE_CONST-temporaries.patch
09-tcg-optimize-Improve-find_better_copy.patch
11-tcg-optimize-Use-tcg_constant_internal-with-const.patch
12-tcg-Convert-tcg_gen_dupi_vec-to-TCG_CONST.patch
14-tcg-Use-tcg_constant_-i32-i64-with-tcg-int-expand.patch
16-tcg-Use-tcg_constant_-i32-i64-vec-with-gvec-expan.patch
19-tcg-Add-tcg_reg_alloc_dup2.patch
22-tcg-ppc-Use-tcg_constant_vec-with-tcg-vec-expande.patch
23-tcg-aarch64-Use-tcg_constant_vec-with-tcg-vec-exp.patch

Note that patch 1 fixes the clang Werror reported here:
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01572.html


r~


Richard Henderson (23):
  tcg: Use tcg_out_dupi_vec from temp_load
  tcg: Increase tcg_out_dupi_vec immediate to int64_t
  tcg: Consolidate 3 bits into enum TCGTempKind
  tcg: Add temp_readonly
  tcg: Expand TCGTemp.val to 64-bits
  tcg: Rename struct tcg_temp_info to TempOptInfo
  tcg: Expand TempOptInfo to 64-bits
  tcg: Introduce TYPE_CONST temporaries
  tcg/optimize: Improve find_better_copy
  tcg/optimize: Adjust TempOptInfo allocation
  tcg/optimize: Use tcg_constant_internal with constant folding
  tcg: Convert tcg_gen_dupi_vec to TCG_CONST
  tcg: Use tcg_constant_i32 with icount expander
  tcg: Use tcg_constant_{i32,i64} with tcg int expanders
  tcg: Use tcg_constant_{i32,i64} with tcg plugins
  tcg: Use tcg_constant_{i32,i64,vec} with gvec expanders
  tcg/tci: Add special tci_movi_{i32,i64} opcodes
  tcg: Remove movi and dupi opcodes
  tcg: Add tcg_reg_alloc_dup2
  tcg/i386: Use tcg_constant_vec with tcg vec expanders
  tcg: Remove tcg_gen_dup{8,16,32,64}i_vec
  tcg/ppc: Use tcg_constant_vec with tcg vec expanders
  tcg/aarch64: Use tcg_constant_vec with tcg vec expanders

 include/exec/gen-icount.h    |  25 +-
 include/tcg/tcg-op.h         |  17 +-
 include/tcg/tcg-opc.h        |  11 +-
 include/tcg/tcg.h            |  50 +++-
 accel/tcg/plugin-gen.c       |  49 ++--
 tcg/optimize.c               | 249 +++++++++---------
 tcg/tcg-op-gvec.c            | 129 ++++-----
 tcg/tcg-op-vec.c             |  52 +---
 tcg/tcg-op.c                 | 227 ++++++++--------
 tcg/tcg.c                    | 488 +++++++++++++++++++++++++++--------
 tcg/tci.c                    |   4 +-
 tcg/aarch64/tcg-target.c.inc |  32 +--
 tcg/arm/tcg-target.c.inc     |   1 -
 tcg/i386/tcg-target.c.inc    | 112 ++++----
 tcg/mips/tcg-target.c.inc    |   2 -
 tcg/ppc/tcg-target.c.inc     |  90 ++++---
 tcg/riscv/tcg-target.c.inc   |   2 -
 tcg/s390/tcg-target.c.inc    |   2 -
 tcg/sparc/tcg-target.c.inc   |   2 -
 tcg/tci/tcg-target.c.inc     |   6 +-
 20 files changed, 884 insertions(+), 666 deletions(-)

-- 
2.25.1


