Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EB26E8DD5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:21:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQTc-0007wB-25; Thu, 20 Apr 2023 05:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTY-0007vy-SB
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:21:12 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTX-00070D-2T
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:21:12 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 bb7-20020a056820160700b00546d9935668so466392oob.8
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681982469; x=1684574469;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dxr4sxZmEZ4iSRFgGuOB89jZmhbavK8vt2DYRuWiHlc=;
 b=L9lt+kgxKofmR0R9RU17RKItegKCfnQhtg0zPakzpYhyVlrCi7OziUKctS/YqvRwP0
 tpCUICTfs4x9nQDWRrl0LDHj5QOfOGayxjHAQXLiom1GWrDG5pWDwjb991try76PYqd1
 Jj7JBIhIFxx3jcW3DjFbyTIUd47NPgCqKomH/cdWHAP8BmKX7mSY9o+htptDCHDG33U8
 FH/B4vE+cT0ez7RPmVDy33VASatDaNyNRSx+QAcBik31eamn18T5/mTnnbt4YDgWujel
 dYOXy3mlpT+4lrn0XSmT9teohyhBDq6w0dRIbgDEfQe4fL/wQNyXGrrQ7ciF7cX2lGkc
 bnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982469; x=1684574469;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dxr4sxZmEZ4iSRFgGuOB89jZmhbavK8vt2DYRuWiHlc=;
 b=TjYKvVzR37ZbWHO+Unm0UmUww6Vtjt3a0xlfODZuxcTP8PSEgfsQkG+lkkADYfo/l9
 kvKsEF9qUEpY2u6ZtU3fXPIliSjITIqrJaaCN2hIvE0E7vcInGR94c5/6TRdacXb7rDj
 A8Nsasa2s4S4lgbytxTZErmEwhYbRPCZjPZIeRU/Ojiw+FTdQ0frQqV1UcTCKMMtu/ot
 +bwwiX8DqdN2Rgv6v4fBAfIhjwVGuuZ1in4IcfTFujm1oy9qEsAfcMcRaxf0fkX/SDlY
 LRU88xRUcji/bydNVVcaM9oCErxYSUsa8/Wk3MURURm4zrw0boj+UywgHsAPLwVim269
 IWbw==
X-Gm-Message-State: AAQBX9c6TZ+VBvy2dVpeI+6leM37iP9dKwxccKl9blGZhENtUpBGJYQk
 +XAOiP04qacQ58R9W/4MxO2Dz9S33tehMzLV2FE=
X-Google-Smtp-Source: AKy350baXOsFbSdaNXiwUO9wwT6mYawA6tZ0+DP4/TG0KUefcGcgZR7sphmKdzmuZd8+TlJLL1YbFw==
X-Received: by 2002:a4a:9450:0:b0:546:8c05:991e with SMTP id
 j16-20020a4a9450000000b005468c05991emr542331ooi.1.1681982467874; 
 Thu, 20 Apr 2023 02:21:07 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a056870e74100b0017280f7d653sm529668oak.35.2023.04.20.02.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 02:21:07 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v7 00/12] target/riscv: rework CPU extensions validation
Date: Thu, 20 Apr 2023 06:20:48 -0300
Message-Id: <20230420092100.177464-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

(--- Re-sending because Alistair's acks from v6 were missing ---)

Hi,

In this v7 we have three extra patches: 

- patch 4 [1] and 5 [2], both from Weiwei Li, addresses an issue that
we're going to have with Zca and RVC if we push the priv spec
disabling code to the end of validation. More details can be seen on
[3]. Patch 5 commit message also has some context on it;

- patch 12 is something that was able to do with the recent changes from
Alistair's riscv-to-apply.next branch. We're using the bits from the
query-cpu-definitions work to filter out static CPUs from write_misa();

Patches missing acks: patch 12.

Patches based on top of current Alistair's riscv-to-apply.next.

Changes from v6:
- patches 4 and 5 from Weiwei Li were added
- patch 12 (new):
  - make write_misa a no-op when we're running a static CPU
- v6 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06934.html


[1] https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg01010.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg01950.html
[3] https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg00994.html


Daniel Henrique Barboza (10):
  target/riscv/cpu.c: add riscv_cpu_validate_v()
  target/riscv/cpu.c: remove set_vext_version()
  target/riscv/cpu.c: remove set_priv_version()
  target/riscv: add PRIV_VERSION_LATEST
  target/riscv/cpu.c: add priv_spec validate/disable_exts helpers
  target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
  target/riscv/cpu.c: validate extensions before riscv_timer_init()
  target/riscv/cpu.c: remove cfg setup from riscv_cpu_init()
  target/riscv: rework write_misa()
  target/riscv: forbid write_misa() for static CPUs

Weiwei Li (2):
  target/riscv: Mask the implicitly enabled extensions in isa_string
    based on priv version
  target/riscv: Update check for Zca/Zcf/Zcd

 target/riscv/cpu.c                      | 338 ++++++++++++++----------
 target/riscv/cpu.h                      |   5 +
 target/riscv/csr.c                      |  48 ++--
 target/riscv/insn_trans/trans_rvd.c.inc |  12 +-
 target/riscv/insn_trans/trans_rvf.c.inc |  14 +-
 target/riscv/insn_trans/trans_rvi.c.inc |   5 +-
 target/riscv/translate.c                |   5 +-
 7 files changed, 254 insertions(+), 173 deletions(-)

-- 
2.40.0


