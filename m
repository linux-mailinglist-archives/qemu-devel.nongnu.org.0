Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C7B6CF10D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 19:30:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZbo-0004I4-It; Wed, 29 Mar 2023 13:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZbl-0004Hj-54
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:29:13 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZbj-00012Q-FY
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:29:12 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 o15-20020a4ae58f000000b00538c0ec9567so2554334oov.1
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 10:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=srykymGZSHMWyT9lGb70r0X8KXpaRiUlM8J4gZTg6/4=;
 b=pP7AjHtY7RkroEzC+8/my7CXmCjq02HllQ8EG7FeUj1slorOQe/CiUNBPLePWso+Df
 7a0hJQbxD14Hq3zU4GQ4rrERJvjGqIvwbKXabfnRmObTONj6TeL/jfEyn0AlRR3UM2GU
 2Q4qPDn+og3YFYVleZmHV5uc0D7PjgLeQ/SgCWyfWiRQMZRRCBS9iFgsdW7V10UFW3kJ
 bR1UnGrFL4O9koLaQfcp63WaYcGpCrsGRB7MGq0k1f4gfj6BeCnsq9x6tx30C7ipRrA4
 HugZD1IwtVBrfpLhMq1EhXsDbUOK9m56i/siZsjmTrNsdIimRS3zew901ivLaV+1HHzK
 ZNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=srykymGZSHMWyT9lGb70r0X8KXpaRiUlM8J4gZTg6/4=;
 b=h9e1UH9kIhN/96Amzn2rRhg3FA9uwcQDtCLJXJF4QFMwfBZGtz5xXfDfNoxKEdyION
 OIefRy5mIyDSOWeA+mtA1wwj50S4UDsBjJEAllW5Sczp0hJfy8VX6ByxBLhWoXFxdz/v
 itMG7zJqUQ8WqiNCkr+gpUgjszPGNQFVjckb3S4cevKVMQIHJrK97fR7P6JYO+Ud34/r
 A9iai83BdScRq09jUlB1IwMW0eTI28L2MJWiVbJ/KDxMMFFdwBBHtFOtdQkuBOIUAVbc
 rFGI3Gg++8RS9D+vHNmlKSEsF7iLcex/5EHltFuuQwua3aaIeGNPVIIUZktzgezm69ed
 dREg==
X-Gm-Message-State: AO0yUKX6Pgi8QscwKgmPZRJJ7AoEO1M5aMnfcp4zXyvAtNYhDsltDNcc
 9/Z/tTSAGrgWPuJZe7caT+pRfS41tfjEj+v0rR4=
X-Google-Smtp-Source: AK7set+0APOf5msa52aPX4rtKxjuCjRN64ResEMwA6tAMjvb/AYZpbxGxrZ2vQ47QMHrWixEEWbBng==
X-Received: by 2002:a4a:3745:0:b0:53b:700e:378c with SMTP id
 r66-20020a4a3745000000b0053b700e378cmr9748952oor.9.1680110949998; 
 Wed, 29 Mar 2023 10:29:09 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:09 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 00/20]  remove MISA ext_N flags from cpu->cfg, 
Date: Wed, 29 Mar 2023 14:28:43 -0300
Message-Id: <20230329172903.636383-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
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

This new version has a new patch (3) that removes the 'multi_letter'
attribute from isa_ext_data that became redundant after the changes made
in patch 2. The change was proposed by Weiwei Li in the v2.

All patches but patch 3 are acked.

Changes from v2:
- patch 3 (new)
  - remove 'multi_letter' from isa_ext_data
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06493.html

Daniel Henrique Barboza (20):
  target/riscv: sync env->misa_ext* with cpu->cfg in realize()
  target/riscv: remove MISA properties from isa_edata_arr[]
  target/riscv/cpu.c: remove 'multi_letter' from isa_ext_data
  target/riscv: introduce riscv_cpu_add_misa_properties()
  target/riscv: remove cpu->cfg.ext_a
  target/riscv: remove cpu->cfg.ext_c
  target/riscv: remove cpu->cfg.ext_d
  target/riscv: remove cpu->cfg.ext_f
  target/riscv: remove cpu->cfg.ext_i
  target/riscv: remove cpu->cfg.ext_e
  target/riscv: remove cpu->cfg.ext_m
  target/riscv: remove cpu->cfg.ext_s
  target/riscv: remove cpu->cfg.ext_u
  target/riscv: remove cpu->cfg.ext_h
  target/riscv: remove cpu->cfg.ext_j
  target/riscv: remove cpu->cfg.ext_v
  target/riscv: remove riscv_cpu_sync_misa_cfg()
  target/riscv: remove cfg.ext_g setup from rv64_thead_c906_cpu_init()
  target/riscv: add RVG and remove cpu->cfg.ext_g
  target/riscv/cpu.c: redesign register_cpu_props()

 target/riscv/cpu.c | 386 +++++++++++++++++++++++----------------------
 target/riscv/cpu.h |  19 +--
 2 files changed, 202 insertions(+), 203 deletions(-)

-- 
2.39.2


