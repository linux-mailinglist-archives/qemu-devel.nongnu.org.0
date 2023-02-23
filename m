Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B326A13F1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:45:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVLGd-0002kN-83; Thu, 23 Feb 2023 18:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVLGP-0002iB-Pd
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:44:38 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVLGO-00017p-2b
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:44:37 -0500
Received: by mail-oi1-x230.google.com with SMTP id bg11so14380480oib.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CJbRExB8ojRxEX60FycaIeUVQadXxrQm2iLY8irfyRE=;
 b=dKBBL7P2Fpw7fX8IuGshpsf+H1HBgObcqnTl5LehfKwa98CsxX9DHrNL0yHWDxBylR
 37yNFzE8nYZ14tlT7QKjaOO0/hmYMJbvQ3akrmPIzzkN5DDO32MGw/yG8bsSIv93dlkh
 YdnE9eGuQB6YUv/w45unSaZ9wYoA5BBHsAGCchnWLzJg+1QTVPTTeugR9ZNiGzaRcZig
 F6S2caGccUuNoSIbFKRQYKlgEf3hPwVUl0fEvQCVo2VyaAdvqUzR0Zjlo0X1xfu79PJk
 T7N/4s9SUw1w4bBXt2PSTbnyz7fh7Oz6teHmYjhysWZMpRdA6CPKL5NQnxEbqLQIMW7g
 tocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CJbRExB8ojRxEX60FycaIeUVQadXxrQm2iLY8irfyRE=;
 b=GtbxDz0oRQgicNCKthsQC8Nb4XJn17pXMs/hSk/qHPlB31DBWEqr/vN1jSvs8Hwr9S
 IjczqrHpKUPt6GzIjRqGuHYNyUzxMq2bDQIEsejJilB547Uh0FqAaQYZDuWHbiASB6gn
 4B5c3jvS2tlHqS5J3z6H3muMeF67mHurGYHe/KUuPT3juh2Ohe5albgfTuaapMEuQiad
 Z0igmbW3o8cxjI7UlSY2Mw2Hrf48Xs0HN+dY4h1xpbb94m+A8IMhj3yaYSOGsPjD6dYE
 EaCkRSuIYi5cl6ugMQjRDC5GopwJc4atvpxfkuH1tutLc67RvJEF3WY5PyT0vXeylia2
 nQ5A==
X-Gm-Message-State: AO0yUKU6VpMewtqFCFYE+f3ZcYTZ7Trp7+qXHyVMY9JQJ6G6NzuXDFDB
 opBJc4HqVswsxVCPg1H1RpDBXaWkna4cQRIb
X-Google-Smtp-Source: AK7set+7p1BVcbx3hukJyNfO+Q/GUvviPq+P+bDTP21hB6nc+RWQO2P+/WB/2sGpW5+MYIPxHF3JVg==
X-Received: by 2002:a54:410f:0:b0:378:79a4:867 with SMTP id
 l15-20020a54410f000000b0037879a40867mr2667632oic.33.1677195874031; 
 Thu, 23 Feb 2023 15:44:34 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 v6-20020acaac06000000b0037facb2c5fasm2415037oie.1.2023.02.23.15.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 15:44:33 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 0/4] riscv: Add support for Zicbo[m,z,p] instructions
Date: Thu, 23 Feb 2023 20:44:23 -0300
Message-Id: <20230223234427.521114-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
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

This new version has changes based on feedbacks of both v5 and v6.

Patch 1 was revamped. We're modifying probe_access_flags() to accept a
'size' parameter to allow for RISC-V usage with PMP. Changes in the existing
callers are trivial and no behavior change is done (well, at least it's not
intended). And we avoid adding another  probe_* API that only RISC-V
will care about. 

Changes from v6:
- patch 1:
  - no longer adding a new probe_access_flags_range() API
  - add a 'size' param to probe_access_flags()
- patch 2:
  - check for RISCV_EXCP_ILLEGAL_INST first in check_zicbo_envcfg()
  - add a probe for MMU_DATA_STORE after check_zicbo_envcfg()
  - write zeros even if the address isn't mapped to RAM
- patch 3:
  - simplify the verifications in check_zicbom_access() by using probe_write()
- v6 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg05379.html 
 
Christoph Muellner (3):
  target/riscv: implement Zicboz extension
  target/riscv: implement Zicbom extension
  target/riscv: add Zicbop cbo.prefetch{i,r,m} placeholder

Daniel Henrique Barboza (1):
  tcg: add 'size' param to probe_access_flags()

 accel/stubs/tcg-stub.c                      |   2 +-
 accel/tcg/cputlb.c                          |  17 ++-
 accel/tcg/user-exec.c                       |   5 +-
 include/exec/exec-all.h                     |   3 +-
 semihosting/uaccess.c                       |   2 +-
 target/arm/ptw.c                            |   2 +-
 target/arm/sve_helper.c                     |   2 +-
 target/riscv/cpu.c                          |   7 ++
 target/riscv/cpu.h                          |   4 +
 target/riscv/helper.h                       |   5 +
 target/riscv/insn32.decode                  |  16 ++-
 target/riscv/insn_trans/trans_rvzicbo.c.inc |  57 +++++++++
 target/riscv/op_helper.c                    | 132 ++++++++++++++++++++
 target/riscv/translate.c                    |   1 +
 target/s390x/tcg/mem_helper.c               |   6 +-
 15 files changed, 247 insertions(+), 14 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc

-- 
2.39.2


