Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E9F695083
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 20:20:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pReMv-0003qs-Dl; Mon, 13 Feb 2023 14:20:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pReMp-0003lJ-UK
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 14:19:59 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pReMh-00063Z-0Z
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 14:19:59 -0500
Received: by mail-oi1-x22a.google.com with SMTP id bi19so11143087oib.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 11:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yPI3cGjDmvbsnZwustUfBESAjde6ZRZDsHrxObiXtUg=;
 b=Ccmj7kR+6ZS5VulXpFw3Sf1jc2WeAV4r5kdHgZOApu/jYt3s3b5/Rcf2mqbdm4k4cZ
 26fZ/Ywf44+UkT5Mna9gWvAHEXHFFWZUe40xU6aPTtXNhMh8KaDx07eHS25jOdIjaQsN
 /9f1ostLkOzpfnzngoJBSbGLUYNcw2PWOgTpjQCyPaA+IsIx1BKbVHrnsVDAimNTDNRH
 6+ZyQuDEV1osGPrETQjDurFvvx1uTa/aPVxAZJRpjHg0E2vDU7oMqHwPXge14NBe9Iou
 y0o7mt5ap1Pe/dHSDUqBdAtv7OsSSJ1P4QGuwJD+2x3jGGIm8pqckJ9adxYv/qJrBwpz
 CsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yPI3cGjDmvbsnZwustUfBESAjde6ZRZDsHrxObiXtUg=;
 b=XWbtgTPIuYxrxqfY5OlNFq5UdWId6bRbjcNOc2ebbU8hTY1dSvGYHhjwXcowyqfnt3
 af/ORAAi2CLsQaN/oDnd2Q6tbIOj/ZJzjRaxZIV1MPfrllYJOQpGz4qmOPOaEp+gqvcs
 GF03AJZqSbKYtSJ2sIdfg/4NInzuw6brfr+HnMI2pNTQwVX39ADevSnpGxwglSFO8dj9
 v1SEk4kXoxOMdfYGW1yv1DQpiGH+Z7GnZQV219B1gX1U+Zyw/lXH49XiJlRYFd9uakL0
 LAsuO4p8RN6+ozJeynZ97hm9qTzedmxIiooetEz8RHS4+qq8Wb56jZlNdp4oEWqGOzNV
 Onlg==
X-Gm-Message-State: AO0yUKWMmpInBr9B9fGxT1f2OLyVsVQwHu0NIsyso93QkMFipXog5sKv
 sKOEh/wELU6s7Ahv7LsE50yrxw==
X-Google-Smtp-Source: AK7set9WkS2Lb1qvEGA5j0Bs1/PE2vqY0fZDbvX2J/M6j/TBKQ7id0rsPutLstHXUXHdjEDiJmkSYA==
X-Received: by 2002:a05:6808:1b22:b0:37b:15fb:f26a with SMTP id
 bx34-20020a0568081b2200b0037b15fbf26amr11766591oib.4.1676315989640; 
 Mon, 13 Feb 2023 11:19:49 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 i63-20020aca3b42000000b0037b8de5b176sm5436925oia.35.2023.02.13.11.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 11:19:49 -0800 (PST)
Message-ID: <471ae407-3fe2-5e2f-374b-9c4c83a16fdf@ventanamicro.com>
Date: Mon, 13 Feb 2023 16:19:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/18] target/riscv: Various fixes to gdbstub and CSR
 access
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230213180215.1524938-1-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

Bin,


I received only patches 1-11. I don't see the remaining patches in patchwork:


https://patchwork.kernel.org/project/qemu-devel/list/?series=721372


or in the qemu-devel archives:


https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03461.html


Can you please verify? Thanks,



Daniel


On 2/13/23 15:01, Bin Meng wrote:
> At present gdbstub reports an incorrect / incomplete CSR list in the
> target description XML, for example:
> 
> - menvcfg is reported in 'sifive_u' machine
> - fcsr is missing in a F/D enabled processor
> 
> The issue is caused by:
> - priv spec version check is missing when reporting CSRs
> - CSR predicate() routine is called without turning on the debugger flag
> 
> This series aims to generate a correct and complete CSR list for gdbstub.
> 
> 
> Bin Meng (18):
>    target/riscv: gdbstub: Check priv spec version before reporting CSR
>    target/riscv: Correct the priority policy of riscv_csrrw_check()
>    target/riscv: gdbstub: Minor change for better readability
>    target/riscv: gdbstub: Do not generate CSR XML if Zicsr is disabled
>    target/riscv: Coding style fixes in csr.c
>    target/riscv: Use 'bool' type for read_only
>    target/riscv: Simplify {read,write}_pmpcfg() a little bit
>    target/riscv: Simplify getting RISCVCPU pointer from env
>    target/riscv: Avoid reporting odd-numbered pmpcfgX in the CSR XML for
>      RV64
>    target/riscv: gdbstub: Turn on debugger mode before calling CSR
>      predicate()
>    target/riscv: gdbstub: Drop the vector CSRs in riscv-vector.xml
>    target/riscv: Allow debugger to access user timer and counter CSRs
>    target/riscv: Allow debugger to access seed CSR
>    target/riscv: Allow debugger to access {h,s}stateen CSRs
>    target/riscv: Allow debugger to access sstc CSRs
>    target/riscv: Drop priv level check in mseccfg predicate()
>    target/riscv: Group all predicate() routines together
>    target/riscv: Move configuration check to envcfg CSRs predicate()
> 
>   target/riscv/csr.c     | 360 +++++++++++++++++++++++------------------
>   target/riscv/gdbstub.c | 100 +++---------
>   2 files changed, 221 insertions(+), 239 deletions(-)
> 

