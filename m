Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476E26CA457
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:45:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmBg-00082k-5G; Mon, 27 Mar 2023 08:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmBd-00081W-Q1
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:42:57 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmBb-0001xH-SZ
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:42:57 -0400
Received: by mail-oi1-x233.google.com with SMTP id bm2so6220213oib.4
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 05:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679920973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jBmSIiMDyIOCY46vN1MeVe8iJfkxtnhZ8Ri8VdpjgDY=;
 b=DVxhNc2bK+hwOnSvQsyeIqj7c8m6A+rAWDeHX6azDoMFJM8/4pvIHAm/PpvUC4XTTC
 NoWRRegYjpBwnPG1Lcf0oag0I2Mgy1xRslkMBhnRfy5MbSvj/jQAAFBjotJu+TtyrE2u
 LjZkfvmS/Xoubpnr5zXiCms8QHKI27uV0lzJba3ZurqjvEsskNjarpuKqO22gQGAs0xK
 HT2A3trDfAkmh1z/MlJFgw/17LxDM+84OqsOJ9YL9o11uSxJ9wBnnEham4a0yMs2HMQp
 xiKBvau6Hw0R0NVjCwJPTc58TVJVN5slixRF7mqYcFpRIzXXKF3GVFlHiGodIiBjfHk2
 w34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679920973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jBmSIiMDyIOCY46vN1MeVe8iJfkxtnhZ8Ri8VdpjgDY=;
 b=jc78Pegygkn1i52gZpOWYnpHKtIOqNHFgyC0DzOlmR1pDY630EDnZgBOnLsKJii4H4
 GGC5kpRXGdon2qXTriXEY+HqrfQX2SN40bVKPYJMtOk5ztCD33U9hrfVHYA/lIJeQ8Af
 sqO8xTsH9hyKc6GsJ0p1Noyg+EMZxnoxoFXYGLB2BmVvy8i9zlQTrAQ2CmQiD49AWDUG
 lcw5Ox3OuOD7hWx1SpYOV6vPlC8psQyc3UIcOCoOSSeVSAgd1UBa/WWktx87zm8enGuc
 Ap9hhmulzBcG7eVTOe415w1LsOEJwMD30BMgZpFc5anPuPPDxzD73MNTXUjiApo90qYT
 jKRg==
X-Gm-Message-State: AAQBX9eJNf85r0hVlvJRYZXIMOkGwfvv0QkjXDZAUrgeA4p2mlXtt+xE
 IgcnLF+75frUCcx34ehsBbW6UW5LAUAG9wrr80Q=
X-Google-Smtp-Source: AKy350ZlUgFQZ7pOcTzn+6CHEKyzALbpOv+tu/fdcgVnaTfe+gq1F31lbNdEnn7221NEHmjkqp76Pw==
X-Received: by 2002:a05:6808:1a06:b0:389:21:9483 with SMTP id
 bk6-20020a0568081a0600b0038900219483mr3972648oib.59.1679920973683; 
 Mon, 27 Mar 2023 05:42:53 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:42:53 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 00/19] remove MISA ext_N flags from cpu->cfg
Date: Mon, 27 Mar 2023 09:42:28 -0300
Message-Id: <20230327124247.106595-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
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

This is a work I was intending to do later but the reviews in the
"[PATCH for-8.1 v4 00/25] target/riscv: rework CPU extensions
validation" series [1] really made me realize it's better to do it now.

We store CPU extension state in two places: cpu->cfg.ext_N flags and
env->misa_ext. This was done a while ago when the cpu->cfg object was
introduced, where cpu->cfg.ext_N flags are exposed to users to allow
them to enable/disable extensions.

This forces the code to always have to mirror env->misa_ext and
cpu->cfg.ext_N changes. The code in target/riscv/cpu.c uses the cfg
flags, and the rest of the code uses env->misa_ext. This worked for us
so far, but when implemeting write_misa() this really started to get in
the way - we have a handful of patches and code juggling happening there
just to deal with cpu->cfg and env->misa_ext mirroring.

In the end, what we need is to provide users with a way to set CPU MISA
extensions.  It doesn't have to be in cpu->cfg.ext_N, and in this series
we're going to address that. In patch 3 we have the machinery used to
expose the same MISA user flags we have today, but updating directly in
env->misa_ext*. Patches 4 and onward will then eliminate each
cpu->cfg.ext_N flag for each MISA bit we have, until we eliminate all of
cpu->cfg.ext_N flags from the code.

It is worth mentioning that patch 3 had a strong inspiration from
hw/ppc/spapr_caps.c, the code that handles PowerPC64 capabilities for
the pSeries machine. 

After this series, we'll have a more pleasant time dealing with user
input in the extensions code. I'll postpone the v5 of [1] until we get
this in a good shape, since this cleanup will really go a long way in
the centralization work.

The only behavioral change made is in patch 2, where we're erroring out
in the RVH priv spec mismatch instead of silently disabling. User API is
still the same, default values of each extension is still the same.


[1] https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05785.html


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


