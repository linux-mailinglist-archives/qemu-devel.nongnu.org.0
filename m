Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5D76A1CF6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 14:27:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVY5N-0003kA-OJ; Fri, 24 Feb 2023 08:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVY58-0003ie-9N
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:25:55 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVY55-0005S1-I8
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:25:50 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-172334d5c8aso15805580fac.8
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 05:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x438lhnqLWnsij7LFZqkqujUA0LyPmecv6xNdpATafo=;
 b=XXDrAFKPf4wK/CftAoLaOuQjUBitVNcsog7KnQCky0ydPbWGRBT7J+3ayPWjQlndMh
 GSz6Mxgnf50OSDLDyNM9JhYp6KA0V75DATz7o6dGk1q4nG7vLz8xvnCppOXM33KwD7Pe
 Wa0K4pj+scxR6Lyde3iNASCGGfYAUMi2wEocMlp5vzPEjEZQoFqWlZ+jZ8Dlx1m5We4k
 XST0CWofTftvwpc8bc1aguLe7yRq4oS4IVCkk3eyu1YfPGsvx9obf6eSkV85U/Q4WUls
 0oBLQcjT9n87hvhc92GYMiBCKxTnixDawiJPdHp7jtz9JAxkMA84bkuRFIJru2SLOPte
 ROUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x438lhnqLWnsij7LFZqkqujUA0LyPmecv6xNdpATafo=;
 b=QerPu4CKPbAn9S0/bqWTsETWJuh7ECeuxCeWVD3XDUXBQgfhZVssyzCq4uOu1zMxw2
 NRlIq7zArXVy0N/Y0lwlPY4zdE838fU3UrP+HyNYNhKGWJ97gncghXcoj3lVU+CX5Csl
 h1FHRgyedyABsJ/LW2T3hh8ukKo+4TO2naw4WTHtpD88nOLPfdJTE7UUPk7c66Jogkmk
 O9Iej9EaVJNqr+8oAraQUgDzz5bvL5oJi9qehOJ9sDbqJ6Or/EJ8Ipvp0rMii+S7bIWi
 V8hwFIJl1oBFBzC2aWVBf8I20GeJ4suWlJdAH57DCEgAlehgzLihMiNH+/rIv2jRq1v1
 pFfA==
X-Gm-Message-State: AO0yUKUAts6+uCE06WRBFn7fpCDQ9Kvvc05W/1E+ewRcJyCOgD9Z9vW6
 FmbkJfOSASN+NqEvTHA8z8X+GooNOaUtbEv8
X-Google-Smtp-Source: AK7set/wt9LJOOm7z/7XTQIP9e4UqZ/+31vJCRIHo3+TCx/8v8Lp0CZ6yBkS/sLkakJiZqk7dBWqAg==
X-Received: by 2002:a05:6870:b312:b0:172:1457:64d7 with SMTP id
 a18-20020a056870b31200b00172145764d7mr8693737oao.0.1677245145282; 
 Fri, 24 Feb 2023 05:25:45 -0800 (PST)
Received: from grind.. ([2804:18:18bc:fbbd:3c90:eebc:7544:73fd])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a05687061c500b001435fe636f2sm3383763oah.53.2023.02.24.05.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 05:25:44 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 0/4] riscv: Add support for Zicbo[m,z,p] instructions
Date: Fri, 24 Feb 2023 10:25:32 -0300
Message-Id: <20230224132536.552293-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
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

This version has a change in patch 2, proposed by Weiwei Li, where we're
now triggering virt_instruction_fault before triggering illegal_insn
fault from S mode. 

Richard already queued patch 1 is queued in tcg-next already. I'm still
including it here to allow for easier testing of the remaining patches.

Changes from v7:
- patch 1: queued in tcg-next, included here to facilitate testing the
  other patches
- patch 2:
  - changed check_zicbo_envcfg() to trigger the virtual faults
    before triggering the illegal exception from S mode.
- v7 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg07041.html

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
 target/riscv/cpu.c                          |   7 +
 target/riscv/cpu.h                          |   4 +
 target/riscv/helper.h                       |   5 +
 target/riscv/insn32.decode                  |  16 ++-
 target/riscv/insn_trans/trans_rvzicbo.c.inc |  57 +++++++++
 target/riscv/op_helper.c                    | 135 ++++++++++++++++++++
 target/riscv/translate.c                    |   1 +
 target/s390x/tcg/mem_helper.c               |   6 +-
 15 files changed, 250 insertions(+), 14 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc

-- 
2.39.2


