Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4770E6D86A1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 21:15:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk8Zx-0002sm-3c; Wed, 05 Apr 2023 15:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pk8Zu-0002rr-W1
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 15:13:55 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pk8Zs-0003nJ-UT
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 15:13:54 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 6-20020a9d0106000000b006a177038dfeso10396211otu.7
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 12:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680722031;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9jVHEoVonGCOo26+u9IMJJuRLp2Wov+OVgK3XrIXGuY=;
 b=WRXkCjvYwdoX7Pgi2XXkD3OIrJsp6ZA4URhrKvumTdEPIwZoMLr5eJxF/pSrFjnALK
 P5dvpSVVaIhklMmaQTYoMUgvbOs7q1VU8va/gEYtq3weZZofLAosFOjXmXa7Un6l1Fb/
 AdO+YnNWFyL9bymlj5x4GFOjHdePujj5krusYRl8vhOJgg6wFXsACNB0P3RCPRkhTX1b
 grdoxI8yXMpxXKjTUbOgMaDvM+3GpAWw/RelsS64/mJfvnrBmKwKJKf9528u0vpcIGkz
 eWd2pISjFcuIJDdrI4D00NUvyvPIaiE4mDfiIXKiV0o2PQySpaAQs8U4G+jxNpO8cwWx
 MgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680722031;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9jVHEoVonGCOo26+u9IMJJuRLp2Wov+OVgK3XrIXGuY=;
 b=M6TopEyW5uM9Il3MpeOhKcH3PiNUbdG1Jrw2cT2irIZE/E+hBj5caCbWVbS7qinlbc
 GlUkG0bD0cfDfEuzNMmnPumDr3M5DG5iVm38CltftgHHw224zHz09gcH34Bc5RXJa9gp
 Gugbilf+MNpl+SgWqIlrjP/wszVWZ3Fd4I+8urPRgUPOG0y6igwQGt31ZwP/psJvGl0W
 WfMxzhNAJEE93A4MBw9Wl/17aOh6NNhWogJpGfZMS/wBDCVXGWcOMQX632GAHoh11sdN
 efRFdp/bgCBbEAv2DIdd9qcmD0GpwtvtiSmY0Z8tVD7w5aecUV04g828LPlM8LgED8q1
 NLbg==
X-Gm-Message-State: AAQBX9cGCNqT3sos7Upa5y64rOhqTbzTtVfweMNF6kDbcpqqG+N03j8D
 hf6RE8EOIuNF8gwoWxPUFekhKw==
X-Google-Smtp-Source: AKy350bIh3sOazRAdKHuNzcag73pdPSDTFp4jxLdmHUHq3QYhYooNnQgfWtr+rJ7BS1xayW2TManmg==
X-Received: by 2002:a05:6830:10e:b0:69f:382d:4212 with SMTP id
 i14-20020a056830010e00b0069f382d4212mr3076096otp.19.1680722031561; 
 Wed, 05 Apr 2023 12:13:51 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a0568301bc700b00690dc5d9b9esm7117497ota.6.2023.04.05.12.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 12:13:51 -0700 (PDT)
Message-ID: <8add0945-742d-5b8a-9582-b565fb6602cc@ventanamicro.com>
Date: Wed, 5 Apr 2023 16:13:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 0/4] target/riscv: Simplification for RVH related check
 and code style fix
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230405085813.40643-1-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230405085813.40643-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355,
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



On 4/5/23 05:58, Weiwei Li wrote:
> This patchset tries to simplify the RVH related check and fix some code style problems, such as problems for indentation, multi-line comments and lines with over 80 characters.
> 
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-virtfix-upstream
> 
> v2:
> * add comment to specify riscv_cpu_set_virt_enabled() can only be called when RVH is enabled in patch 4 (suggested by Richard Henderson)
> * merge patch from LIU Zhiwei(Message-ID: <20230325145348.1208-1-zhiwei_liu@linux.alibaba.com>) to patch 5
> * use env->virt_enabled directly instead of riscv_cpu_virt_enabled() in patch 6 (suggested by LIU Zhiwei)
> * remain the orginal identation for macro name in patch 8 (suggested by LIU Zhiwei)
> 
> v3:
> * rebase on riscv-to-apply.next (partial patches in v2 have been applied)
> * Fix new found format problem in patch 2,3,4 of v3

All patches:

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> 
> Weiwei Li (4):
>    target/riscv: Remove riscv_cpu_virt_enabled()
>    target/riscv: Fix format for indentation
>    target/riscv: Fix format for comments
>    target/riscv: Fix lines with over 80 characters
> 
>   target/riscv/arch_dump.c                |   7 +-
>   target/riscv/cpu.c                      |  47 ++--
>   target/riscv/cpu.h                      |  31 +--
>   target/riscv/cpu_bits.h                 |   2 +-
>   target/riscv/cpu_helper.c               | 274 ++++++++++----------
>   target/riscv/csr.c                      |  90 +++----
>   target/riscv/debug.c                    |  21 +-
>   target/riscv/fpu_helper.c               |  24 +-
>   target/riscv/gdbstub.c                  |   3 +-
>   target/riscv/insn_trans/trans_rvv.c.inc |  36 +--
>   target/riscv/m128_helper.c              |  16 +-
>   target/riscv/machine.c                  |  18 +-
>   target/riscv/op_helper.c                |  20 +-
>   target/riscv/pmp.c                      |  66 ++---
>   target/riscv/pmp.h                      |   9 +-
>   target/riscv/pmu.c                      |   7 +-
>   target/riscv/sbi_ecall_interface.h      |   8 +-
>   target/riscv/translate.c                |  26 +-
>   target/riscv/vector_helper.c            | 317 ++++++++++++++----------
>   19 files changed, 552 insertions(+), 470 deletions(-)
> 

