Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63D46CB1FB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 00:51:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgvex-0005Mv-Ro; Mon, 27 Mar 2023 18:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvew-0005Mc-1E
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:49:50 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvet-0007II-Py
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:49:49 -0400
Received: by mail-oi1-x229.google.com with SMTP id bk5so7628359oib.6
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 15:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957386;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P+ufxyri8zTJKabN15+N81Em2M3bFWNp5L4AXZowQV8=;
 b=Hjx6BzdAaf4m9rlFKmu0490/JhyaL6LsbET4OA4yi+oHyou6HBgMkWB0OgnUbNz17Q
 KPsEPv62rnU8EbB9SsAItayMyeP43YsJXlwQT/oti5MERkMQDahm1ff8GJZVgNIaBRhz
 n/FnGcLH97QDgv+JsBdDbVcGFPy2wIT/XmWWicjX/Oc50nG6KBjYz0i8ZHAPJqtSzoN7
 aHVVUHRTuhvSze3XL6z/KmPcLOKqbKb1KRRyPDMrniI9z9YElvasrPzak0vApaDDFByM
 BZ5haa5H6aOXyLTMBe/54oEbAdZDTCK5WnA19eVVG4Qf1yAGjX58H0ig6QhpUywFhlkf
 k7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957386;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P+ufxyri8zTJKabN15+N81Em2M3bFWNp5L4AXZowQV8=;
 b=N0JfSV5iEhEP+rZ12rglr3bDlkiFK14Rh4j2Mekz66uGk8OKgBSN96buqJqLbwziZM
 5aegM8Z0Ay6/Bvj/6Xn91S+LDewq1DbBbX6fjzAHusAiE0RcNbSZxJPTT5zLgfoRw6K8
 UT9JSaZxR3E/eiRHBVLYhr7XnWgWam0z2oP3SZteUTbBaUDvupD6Ce2KXX9LORtPehLu
 De/2VkrV59Zat1m4KEA9opxyZsxSRgfidpBHzfmrlJBW7Jvl9L66xL2wPEV/KFbmmeoB
 7EueIyZZ5bFddxrVgdxy2mijWwhXcQ3zAqlGYtyD7PFX1UDzDzWMptKARrQbb5IC7xBu
 j3wg==
X-Gm-Message-State: AO0yUKUiNo3GjYotU9Yjz8g9mQtUnuibrad7/NxSCu0jDfeg4bWZQB/J
 2riZghzLBLwom67K1Csq5/ibPw0x99s9W7/w2xY=
X-Google-Smtp-Source: AK7set8oEcw/2A8qO9jFhJuY5OCQy2b15meyqRpaF3tVxSQQsHKhUYcqujfWWjYFNXkgBdp7AznpJA==
X-Received: by 2002:a05:6808:d8:b0:377:ff13:72f8 with SMTP id
 t24-20020a05680800d800b00377ff1372f8mr6031556oic.34.1679957386053; 
 Mon, 27 Mar 2023 15:49:46 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:49:45 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 00/19] remove MISA ext_N flags from cpu->cfg
Date: Mon, 27 Mar 2023 19:49:15 -0300
Message-Id: <20230327224934.363314-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
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

In this version we have changes in patch 3 suggested by Richard
Henderson in the v1 review. 

Patches are based on Alistair's riscv-to-apply.next.

Changes from v1:
- patch 3:
  - change misa_ext_cfgs[] to a const array
  - remove dynamic allocation of strings and use the string literals
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06337.html

Daniel Henrique Barboza (19):
  target/riscv: sync env->misa_ext* with cpu->cfg in realize()
  target/riscv: remove MISA properties from isa_edata_arr[]
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

 target/riscv/cpu.c | 268 ++++++++++++++++++++++++---------------------
 target/riscv/cpu.h |  19 +---
 2 files changed, 144 insertions(+), 143 deletions(-)

-- 
2.39.2


