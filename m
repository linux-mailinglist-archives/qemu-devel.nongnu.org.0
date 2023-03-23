Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A076C68E1
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 13:53:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfKQF-0005Ij-II; Thu, 23 Mar 2023 08:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pfKQ9-0005HM-Bp
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 08:51:57 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pfKQ7-0005OE-9X
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 08:51:57 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-17e140619fdso14054030fac.11
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 05:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679575914;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kJI8DswckpudvMDvkDJM53MsKQQsmSH2ZjBuYr1I5UQ=;
 b=hEkhZ9jRiVd58XuQBSTca/RZCfFS602IUtU3KZb199HArPMQ25EZXdUZBz7UB4n3h6
 IMZ0nOLGa45jVNHrmxgdXOj0ojh6Fw6bFfYKQLW7QVs8+h8CjiiPCQFgYHbHhNzhjcV5
 R9mM/cnq2xfkE0mE3QhRIcVS+fbytjMYAdKnQo0BXGx4vqD68C7hf14ZunHlzjr5b4Rc
 dxquf/2Ivuc8bnlBbrflsK2I8sJP3QoREwnQREE6TONoUeHQAdYXGnw6LD81BHDRh6MW
 7MPACEq93UVzp7JPKQcq3pa7XWVaE7nfexhz2RsiUkAHlaMJ3GEjZkKFhsu1tVedRQd7
 cq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679575914;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kJI8DswckpudvMDvkDJM53MsKQQsmSH2ZjBuYr1I5UQ=;
 b=Xcsuh+woGJI2xHm31u64ADzae0tjFHNEEjUySJi2XIxybkhb1a3UcHwpvhQQnHSy21
 pI6IPJY2qfMABvn32BoWNiTPgoMBWVN5PVn2rz6N3D222F2N8+gBgl7JnKTxMDzv6VU3
 /wsUL+4pOAsvma35A5uVImaYUj661INSxBoRo8hB9LkOjwknyYtJqOWN4NCtF1kbjfQz
 XLwyN15Cip/1xRFZpPgVw5Z2KdTl6tJ9N/rqBKqux/kk4v+rC14jzSE5pxuH4ceu8rUa
 +IPfG4r5LAibHSx0wYcQ3sxiDmTDBviy84cj0M1LOS8xx/Fnc0+hhh0AIyRDClrnWNsd
 qe4Q==
X-Gm-Message-State: AO0yUKXYlrCSMjFkCWmhXoIjhIz1WMAD8xFmaqy4DEqN+Q3ABSTu6hUs
 w8JGy0C/CAO6b9wdOAbWlsB2qA==
X-Google-Smtp-Source: AKy350YH4AjPFT8jCZ/7ULb9Td07pnG3zpfiJ9Jazj+jT5yydulFSDSOs4XXRYWioqgKsihxi9ff+g==
X-Received: by 2002:a05:6870:330f:b0:177:abd2:f867 with SMTP id
 x15-20020a056870330f00b00177abd2f867mr2189539oae.9.1679575913775; 
 Thu, 23 Mar 2023 05:51:53 -0700 (PDT)
Received: from ?IPV6:2804:14c:f435:9162::1009? ([2804:14c:f435:9162::1009])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a056870b0c600b00172289de1besm5804042oag.18.2023.03.23.05.51.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 05:51:53 -0700 (PDT)
Message-ID: <b3d8e7e8-a5c0-3f1b-1bf7-1474544ab297@ventanamicro.com>
Date: Thu, 23 Mar 2023 09:51:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 00/45] Add RISC-V vector cryptographic instruction set
 support
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org
References: <20230310160346.1193597-1-lawrence.hunter@codethink.co.uk>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230310160346.1193597-1-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/10/23 13:03, Lawrence Hunter wrote:
> NB: this is an update over the patch series submitted today (2023/03/10) at 09:11. It fixes some accidental mangling of commits 02, 04 and 08/45.
> 
> This patchset provides an implementation for Zvkb, Zvkned, Zvknh, Zvksh, Zvkg, and Zvksed of the draft RISC-V vector cryptography extensions as per the 20230303 version of the specification(1) (1fcbb30). Please note that the Zvkt data-independent execution latency extension has not been implemented, and we would recommend not using these patches in an environment where timing attacks are an issue.
> 
> Work performed by Dickon, Lawrence, Nazar, Kiran, and William from Codethink sponsored by SiFive, as well as Max Chou and Frank Chang from SiFive.
> 
> For convenience we have created a git repo with our patches on top of a recent master. https://github.com/CodethinkLabs/qemu-ct
> 
> 1. https://github.com/riscv/riscv-crypto/releases

For the next versions I suggest CCing qemu-riscv@nongnu.org as well. It's an
easier way to keep track of RISC-V contributions since qemu-devel has a lot of
traffic.

Thanks,


Daniel

> 
> Dickon Hood (2):
>    qemu/bitops.h: Limit rotate amounts
>    target/riscv: Add vrol.[vv,vx] and vror.[vv,vx,vi] decoding,
>      translation and execution support
> 
> Kiran Ostrolenk (7):
>    target/riscv: Refactor some of the generic vector functionality
>    target/riscv: Refactor some of the generic vector functionality
>    target/riscv: Refactor some of the generic vector functionality
>    target/riscv: Add vsha2ms.vv decoding, translation and execution
>      support
>    target/riscv: Add zvksh cpu property
>    target/riscv: Add vsm3c.vi decoding, translation and execution support
>    target/riscv: Expose zvksh cpu property
> 
> Lawrence Hunter (17):
>    target/riscv: Add vclmul.vv decoding, translation and execution
>      support
>    target/riscv: Add vclmul.vx decoding, translation and execution
>      support
>    target/riscv: Add vclmulh.vv decoding, translation and execution
>      support
>    target/riscv: Add vclmulh.vx decoding, translation and execution
>      support
>    target/riscv: Add vaesef.vv decoding, translation and execution
>      support
>    target/riscv: Add vaesef.vs decoding, translation and execution
>      support
>    target/riscv: Add vaesdf.vv decoding, translation and execution
>      support
>    target/riscv: Add vaesdf.vs decoding, translation and execution
>      support
>    target/riscv: Add vaesdm.vv decoding, translation and execution
>      support
>    target/riscv: Add vaesdm.vs decoding, translation and execution
>      support
>    target/riscv: Add vaesz.vs decoding, translation and execution support
>    target/riscv: Add vsha2c[hl].vv decoding, translation and execution
>      support
>    target/riscv: Add vsm3me.vv decoding, translation and execution
>      support
>    target/riscv: Add zvkg cpu property
>    target/riscv: Add vgmul.vv decoding, translation and execution support
>    target/riscv: Add vghsh.vv decoding, translation and execution support
>    target/riscv: Expose zvkg cpu property
> 
> Max Chou (5):
>    crypto: Create sm4_subword
>    crypto: Add SM4 constant parameter CK
>    target/riscv: Add zvksed cfg property
>    target/riscv: Add Zvksed support
>    target/riscv: Expose Zvksed property
> 
> Nazar Kazakov (11):
>    target/riscv: Add zvkb cpu property
>    target/riscv: Refactor some of the generic vector functionality
>    target/riscv: Add vrev8.v decoding, translation and execution support
>    target/riscv: Add vandn.[vv,vx] decoding, translation and execution
>      support
>    target/riscv: Expose zvkb cpu property
>    target/riscv: Add zvkned cpu property
>    target/riscv: Add vaeskf1.vi decoding, translation and execution
>      support
>    target/riscv: Add vaeskf2.vi decoding, translation and execution
>      support
>    target/riscv: Expose zvkned cpu property
>    target/riscv: Add zvknh cpu properties
>    target/riscv: Expose zvknh cpu properties
> 
> William Salmon (3):
>    target/riscv: Add vbrev8.v decoding, translation and execution support
>    target/riscv: Add vaesem.vv decoding, translation and execution
>      support
>    target/riscv: Add vaesem.vs decoding, translation and execution
>      support
> 
>   accel/tcg/tcg-runtime-gvec.c                 |   11 +
>   accel/tcg/tcg-runtime.h                      |    1 +
>   crypto/sm4.c                                 |   10 +
>   include/crypto/sm4.h                         |    9 +
>   include/qemu/bitops.h                        |   24 +-
>   target/arm/tcg/crypto_helper.c               |   10 +-
>   target/riscv/cpu.c                           |   36 +
>   target/riscv/cpu.h                           |    7 +
>   target/riscv/helper.h                        |   71 ++
>   target/riscv/insn32.decode                   |   49 +
>   target/riscv/insn_trans/trans_rvv.c.inc      |   93 +-
>   target/riscv/insn_trans/trans_rvzvkb.c.inc   |  220 ++++
>   target/riscv/insn_trans/trans_rvzvkg.c.inc   |   40 +
>   target/riscv/insn_trans/trans_rvzvkned.c.inc |  170 +++
>   target/riscv/insn_trans/trans_rvzvknh.c.inc  |   84 ++
>   target/riscv/insn_trans/trans_rvzvksed.c.inc |   57 +
>   target/riscv/insn_trans/trans_rvzvksh.c.inc  |   43 +
>   target/riscv/meson.build                     |    4 +-
>   target/riscv/op_helper.c                     |    5 +
>   target/riscv/translate.c                     |    6 +
>   target/riscv/vcrypto_helper.c                | 1001 ++++++++++++++++++
>   target/riscv/vector_helper.c                 |  240 +----
>   target/riscv/vector_internals.c              |   81 ++
>   target/riscv/vector_internals.h              |  222 ++++
>   24 files changed, 2192 insertions(+), 302 deletions(-)
>   create mode 100644 target/riscv/insn_trans/trans_rvzvkb.c.inc
>   create mode 100644 target/riscv/insn_trans/trans_rvzvkg.c.inc
>   create mode 100644 target/riscv/insn_trans/trans_rvzvkned.c.inc
>   create mode 100644 target/riscv/insn_trans/trans_rvzvknh.c.inc
>   create mode 100644 target/riscv/insn_trans/trans_rvzvksed.c.inc
>   create mode 100644 target/riscv/insn_trans/trans_rvzvksh.c.inc
>   create mode 100644 target/riscv/vcrypto_helper.c
>   create mode 100644 target/riscv/vector_internals.c
>   create mode 100644 target/riscv/vector_internals.h
> 

