Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A3664D1E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 21:15:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFL0w-0003ST-RX; Tue, 10 Jan 2023 15:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFL0n-0003Ml-Ip
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 15:14:22 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFL0k-0000pP-8S
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 15:14:21 -0500
Received: by mail-oi1-x243.google.com with SMTP id o66so11063449oia.6
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 12:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gGGv7nNdgIZNrOUX9rzYbYN2AmE+oL6fKFxAH29OxDU=;
 b=Rc+0BFt3lvQDMKzXc4Sgj20kuc7k1ImZXQnDD9gxFSEKcDUpEW5mXrIygy638zJvMG
 nU4bH5YYSMxaG4zdO4o1J4wklvREiA7YwB54v5t3MJ4m1VEiFi7AOvj0G3nAVWAWSjdI
 LrNAh0IarWDC0rt+/Oh5h/pfdPSNfQrq9JLCPCjbWpQgDhsr8kPghpL8gc+x+ukbJLln
 bd1uJi+QoKEDw08yBIeNtg3WrmuYprGWo6wkqNXEBSdnAPSDZfG1Nt+gWf3iQLlg6Dnp
 2omCXkVsSo7dkAvWduCxjpuV0kJajscdUIFOe40uWBEe0xcUHJ3+11UG4iCJvcE1oI/M
 fo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gGGv7nNdgIZNrOUX9rzYbYN2AmE+oL6fKFxAH29OxDU=;
 b=4miUYI/O5P3hnT8ABqKExcp2+ybxXm2TOJLCfuLLEJ0QFTOV/TxUqeruUuaQs9PydB
 VbFWT/SIjSd4S2V4XP/LrtmoBVGiXkF8vEb1jhVtTne2qFiI0DQTpJEuJKUiSr0sLjWH
 Bx0PFygOKVwJud4bNN3aOR9Snnw5K+kIw09C+mhLMBwNn7VyGRVRAwxpfeVgyvnnmSMC
 0GVrn84DRu2kmYPf98WSd1PSYAmeX0gBIvftRCqaf7KXUGAcnr/zrT8K7WIKpt6OVaJJ
 GDFiu74Ng+yHwTejzXWXxevqZvBD7o82f6cMz3i67De8EWcQ6TAgwPMnzPxC8AJn5/NV
 4zQg==
X-Gm-Message-State: AFqh2krHr4kC6GfLwwZyD36IMLUiI5eKSIZdCJScdxoABJUR3BAXHrAX
 ghB6ExUihBaO/9wAVvlmsvKI/cobMbsj6RPzrSc=
X-Google-Smtp-Source: AMrXdXsWFPZ54cE583B7Tu/m+tOIEeZ66LotvPMRC69a+CMIJeCicrphYxkgodDU6O8eUBRijVOLWQ==
X-Received: by 2002:aca:1111:0:b0:364:5c52:9923 with SMTP id
 17-20020aca1111000000b003645c529923mr1481850oir.30.1673381651597; 
 Tue, 10 Jan 2023 12:14:11 -0800 (PST)
Received: from grind.. ([152.250.93.24]) by smtp.gmail.com with ESMTPSA id
 l21-20020a9d7a95000000b0067c87f23476sm6453978otn.57.2023.01.10.12.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 12:14:11 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/2] target/riscv/cpu: fix sifive_u 32/64bits boot in
 riscv-to-apply.next
Date: Tue, 10 Jan 2023 17:14:03 -0300
Message-Id: <20230110201405.247785-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x243.google.com
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

I found this bug when testing my avocado changes in riscv-to-apply.next.
The sifive_u board, both 32 and 64 bits, stopped booting OpenSBI. The
guest hangs indefinitely.

Git bisect points that this patch broke things:

8c3f35d25e7e98655c609b6c1e9f103b9240f8f8 is the first bad commit
commit 8c3f35d25e7e98655c609b6c1e9f103b9240f8f8
Author: Weiwei Li <liweiwei@iscas.ac.cn>
Date:   Wed Dec 28 14:20:21 2022 +0800

    target/riscv: add support for Zca extension
    
    Modify the check for C extension to Zca (C implies Zca)
(https://github.com/alistair23/qemu/commit/8c3f35d25e7e98655c609b6c1e9f103b9240f8f8)
    

But this patch per se isn't doing anything wrong. The root of the
problem is that this patch makes assumptions based on the previous
patch:

commit a2b409aa6cadc1ed9715e1ab916ddd3dade0ba85
Author: Weiwei Li <liweiwei@iscas.ac.cn>
Date:   Wed Dec 28 14:20:20 2022 +0800

    target/riscv: add cfg properties for Zc* extension
(https://github.com/alistair23/qemu/commit/a2b409aa6cadc1ed9715e1ab916ddd3dade0ba85)

Which added a lot of logic and assumptions that are being skipped by all
the SiFive boards because, during riscv_cpu_realize(), we have this
code:

    /* If only MISA_EXT is unset for misa, then set it from properties */
    if (env->misa_ext == 0) {
        uint32_t ext = 0;
        (...)
    }

In short, we have a lot of code that are being skipped by all SiFive
CPUs because these CPUs are setting a non-zero value in set_misa() in
their respective cpu_init() functions.

It's possible to just hack in and fix the SiFive problem in isolate, but
I believe we can do better and allow all riscv_cpu_realize() to be executed
for all CPUs, regardless of what they've done during their cpu_init().


Daniel Henrique Barboza (2):
  target/riscv/cpu: set cpu->cfg in register_cpu_props()
  target/riscv/cpu.c: do not skip misa logic in riscv_cpu_realize()

 target/riscv/cpu.c | 525 +++++++++++++++++++++++++--------------------
 target/riscv/cpu.h |   4 +
 2 files changed, 292 insertions(+), 237 deletions(-)

-- 
2.39.0


