Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D2A6AB21F
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 21:40:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYv8a-0001V9-CN; Sun, 05 Mar 2023 15:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYv8T-0001Rh-Tu
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 15:39:15 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYv8P-0004gI-SW
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 15:39:12 -0500
Received: by mail-pl1-x62b.google.com with SMTP id v11so8139279plz.8
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 12:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678048746;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=7J6j/4agfd4Y4pX8rd9P7oUh0cuzgfjTgPnmtdnvbaM=;
 b=NgRsGTHS79rV2qHmIi+2P+wfK9OPEl1eQc6xjwB6ilCvuVnLAKvyQtNroXZy/GT9db
 rVl/nEYeLvSoW3Jgcz7Mhsr3/2iVSR/CDNNzfgcDko6744RDYdgzj5ftHdTKV6sKXhc3
 C33+g68dX62DjU+OGCFPc9C7wEk1WnZSOqxx9NibJgmEfP2Ix1NMhOb4/Thr4vF7vjdv
 QV4qthXvrvYfvcCiCqBFz800PGxpk3JP7OQ4uOjTeAv5bkiwLaPi9R0jYyzWJxegwBvV
 9/S9TXFekWwZID/0BhIsH2kIJh0fdkY41jRa5kKkV6XHJHeCbwb9jfXUPJAMkiSP6xwg
 ZveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678048746;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7J6j/4agfd4Y4pX8rd9P7oUh0cuzgfjTgPnmtdnvbaM=;
 b=VqZI2kaCOE07UF13OgjbHFJXqFDtB1Wev/PbMgVkjlAdJDWt0nDuta2U12PZUWHZ/a
 pQg5TS+h0AbtkLXicmc46qkOOuFLx1dyXTuiOiv7o1hOrk5pPpfIfxVTrjPzOypta1jW
 Pc2IxANqeCCo5RPwJyjpAQRvPgcM0vn4hScTdA3kAIz4y5ZxUqqtcZaMFl6yNbYikWbX
 n6pXmy4Ed76jhOgwSd0pwNpGN0IrZlKqknTlEjUJNlTIF+mIG5TsfFJWfVdps1zt827w
 f4qOAtnvhfnjwzN4ty/i78avdnfzDe2KM9M4YA5GDJb7wpzibKFYOXlnLus+ySstoJWo
 XatQ==
X-Gm-Message-State: AO0yUKVY2dBNWuGYskq5De1ndbtKfxuEj8umYWlaMnGy+3B1xdhGoxkV
 t847Qu/+kD39pdb002V9fZfgITvNWHCAefzmoQY=
X-Google-Smtp-Source: AK7set+8XsvINpjjddeXkV8bXli8MYS7HVglDI8EHthN/9Rn6556U+os+ZZsr24oKCwsI+MEMcuelg==
X-Received: by 2002:a17:902:f54c:b0:19c:a9b8:4349 with SMTP id
 h12-20020a170902f54c00b0019ca9b84349mr10819344plf.32.1678048746588; 
 Sun, 05 Mar 2023 12:39:06 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 x7-20020a1709029a4700b0019339f3368asm5179861plv.3.2023.03.05.12.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 12:39:06 -0800 (PST)
Date: Sun, 05 Mar 2023 12:39:06 -0800 (PST)
X-Google-Original-Date: Sun, 05 Mar 2023 12:31:49 PST (-0800)
Subject: Re: [PATCH v8 0/4] riscv: Add support for Zicbo[m,z,p] instructions
In-Reply-To: <20230224132536.552293-1-dbarboza@ventanamicro.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 Richard Henderson <richard.henderson@linaro.org>, dbarboza@ventanamicro.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: dbarboza@ventanamicro.com
Message-ID: <mhng-529e116a-4b71-4af8-87e2-959c13c5a7d0@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, 24 Feb 2023 05:25:32 PST (-0800), dbarboza@ventanamicro.com wrote:
> Hi,
>
> This version has a change in patch 2, proposed by Weiwei Li, where we're
> now triggering virt_instruction_fault before triggering illegal_insn
> fault from S mode.
>
> Richard already queued patch 1 is queued in tcg-next already. I'm still
> including it here to allow for easier testing of the remaining patches.
>
> Changes from v7:
> - patch 1: queued in tcg-next, included here to facilitate testing the
>   other patches
> - patch 2:
>   - changed check_zicbo_envcfg() to trigger the virtual faults
>     before triggering the illegal exception from S mode.
> - v7 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg07041.html
>
> Christoph Muellner (3):
>   target/riscv: implement Zicboz extension
>   target/riscv: implement Zicbom extension
>   target/riscv: add Zicbop cbo.prefetch{i,r,m} placeholder
>
> Daniel Henrique Barboza (1):
>   tcg: add 'size' param to probe_access_flags()
>
>  accel/stubs/tcg-stub.c                      |   2 +-
>  accel/tcg/cputlb.c                          |  17 ++-
>  accel/tcg/user-exec.c                       |   5 +-
>  include/exec/exec-all.h                     |   3 +-
>  semihosting/uaccess.c                       |   2 +-
>  target/arm/ptw.c                            |   2 +-
>  target/arm/sve_helper.c                     |   2 +-
>  target/riscv/cpu.c                          |   7 +
>  target/riscv/cpu.h                          |   4 +
>  target/riscv/helper.h                       |   5 +
>  target/riscv/insn32.decode                  |  16 ++-
>  target/riscv/insn_trans/trans_rvzicbo.c.inc |  57 +++++++++
>  target/riscv/op_helper.c                    | 135 ++++++++++++++++++++
>  target/riscv/translate.c                    |   1 +
>  target/s390x/tcg/mem_helper.c               |   6 +-
>  15 files changed, 250 insertions(+), 14 deletions(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc

Thanks, 2-4 are queued up in riscv-to-apply.next (1 made it already via 
the TCG tree).

