Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D66A817F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:48:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhQN-00024c-OK; Thu, 02 Mar 2023 06:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXhQM-00024H-03
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:48:38 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXhQK-0005aM-BX
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:48:37 -0500
Received: by mail-oi1-x22d.google.com with SMTP id r40so12274552oiw.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677757714;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bfxtFo75Vbs6nbCD7jh08npMAeE5QGd1IbzegI4Xkyk=;
 b=lI0LnPmEcS00r5Y2hoKEbZv5i8RoEfu3QIJaM99obXn3odAkzf6nFJu46NN/3MzweC
 yviXXrqmDpfrh/2H27CsX3Y9JHc9Om1SL12JEv9JJO/OmbFTfk34DgH2PeFAFoYMBpOj
 5yNFo0cNKNYu1X3vqSq9TOuRDl9c6bxjiyWOnaM4fksCKpNlfxlxUFBZadpQUvacHyfa
 XkQiDQzTs5/0nhODOC/Ruao1wUAKtmBXEuN/rE6g1rflA3oYy6R9QZTW2uvVGtIFXkbV
 2TktQEOEdHKnK/BbKRzFGlEv2dAGmC5SZcn03WzxODQqOnqiAjAnYZkXSz6VFf2fI0hq
 vs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677757714;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bfxtFo75Vbs6nbCD7jh08npMAeE5QGd1IbzegI4Xkyk=;
 b=uYL9qtGMgbakpm9tG8InTQeLekuuTBmksN4bhxo5A0vtTYFi+gKTZ6pJcSSTqEUKVw
 8bxVnWThA7BOB9YGO2QJIcHOxKL5kGeNdLLz+xV5XuV5R3zwveCPTS9YXcXveBrL3JQe
 k43G3s4ewC4ut5JCDvXMTLUSw0jhdxqMyJYvcV5XYBg49XXt8qzhEdkGCKUtK3DOOwRT
 PFGynx5KK5MC+nOboYVPP5eugqdeUJCBxma0SMTDRJT48HRgLsFltVLlxK25PPunLxBx
 POf/dfGz26gpfjjfxKs3uOym2MSQ16bB03UG5hiEH7LhVahRrQVPfWkTzbaOqQQApQ0N
 PMDQ==
X-Gm-Message-State: AO0yUKXZg7lFp9QZShNzJoFn9z18XI6blLmhwUn+NEhZmLzpGJG8jp97
 G0IQOu4sC2JcMyDdQyRdEDqqD7yBD6SCc79u
X-Google-Smtp-Source: AK7set/u1tKeKUPsUhY+eA4Rt8n5bg/E84YjSk3Cd8PcLpvK+i99oIgH9ch0tS/1T+MsgM/1tzPqMA==
X-Received: by 2002:a05:6808:3a7:b0:378:69f4:7f6c with SMTP id
 n7-20020a05680803a700b0037869f47f6cmr4870434oie.43.1677757714050; 
 Thu, 02 Mar 2023 03:48:34 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 x124-20020acae082000000b0038440f0f63dsm4065344oig.37.2023.03.02.03.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 03:48:33 -0800 (PST)
Message-ID: <38da764e-3cc8-14cb-4f9a-5b3b4014e042@ventanamicro.com>
Date: Thu, 2 Mar 2023 08:48:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 0/4] riscv: Add support for Zicbo[m,z,p] instructions
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, Palmer Dabbelt <palmer@rivosinc.com>
References: <20230224132536.552293-1-dbarboza@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230224132536.552293-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

Thanks everyone for the reviews. Palmer, patch 1 just landed upstream (commit
1770b2f2d3d6). You can pick patches 2-4 cleanly now.

There is another patch in the ML:

[PATCH v2 0/1] hw/riscv/virt.c: add cbo[mz]-block-size fdt properties​3 messages

that can be picked together as well.


Thanks,


Daniel

On 2/24/23 10:25, Daniel Henrique Barboza wrote:
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
>    other patches
> - patch 2:
>    - changed check_zicbo_envcfg() to trigger the virtual faults
>      before triggering the illegal exception from S mode.
> - v7 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg07041.html
> 
> Christoph Muellner (3):
>    target/riscv: implement Zicboz extension
>    target/riscv: implement Zicbom extension
>    target/riscv: add Zicbop cbo.prefetch{i,r,m} placeholder
> 
> Daniel Henrique Barboza (1):
>    tcg: add 'size' param to probe_access_flags()
> 
>   accel/stubs/tcg-stub.c                      |   2 +-
>   accel/tcg/cputlb.c                          |  17 ++-
>   accel/tcg/user-exec.c                       |   5 +-
>   include/exec/exec-all.h                     |   3 +-
>   semihosting/uaccess.c                       |   2 +-
>   target/arm/ptw.c                            |   2 +-
>   target/arm/sve_helper.c                     |   2 +-
>   target/riscv/cpu.c                          |   7 +
>   target/riscv/cpu.h                          |   4 +
>   target/riscv/helper.h                       |   5 +
>   target/riscv/insn32.decode                  |  16 ++-
>   target/riscv/insn_trans/trans_rvzicbo.c.inc |  57 +++++++++
>   target/riscv/op_helper.c                    | 135 ++++++++++++++++++++
>   target/riscv/translate.c                    |   1 +
>   target/s390x/tcg/mem_helper.c               |   6 +-
>   15 files changed, 250 insertions(+), 14 deletions(-)
>   create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc
> 

