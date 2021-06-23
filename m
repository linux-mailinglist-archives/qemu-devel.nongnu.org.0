Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FB23B1BBF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 15:57:14 +0200 (CEST)
Received: from localhost ([::1]:34386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw3NR-0000GO-W8
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 09:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lw3MC-00083R-19
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:55:56 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lw3M9-0000hw-QN
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:55:55 -0400
Received: by mail-pl1-x631.google.com with SMTP id b3so1231699plg.2
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 06:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mpec4kI4socwFL+Zq24jSsLtJKqnE9w9v5JoBspcy+c=;
 b=dPzT/PgVbZ81gc6gbMeDIA5jR/sMaRWB8XcoyePdz1e/zGzBuy86emS+xWOB8hirRU
 C592gugnOT9l0FhG2iJuNBDNW8EfWuaT7BhsHwVXBNYRiKwvcu98RitEpZgvE1GzS220
 eQ0kzkOgdGwGRxAW4l0fIeaKvC+gVy5RMXdfXj8ItdAx34PAOOBV9doGC/wS/T6yrbeh
 HxTpJmc5m8Swlb8Hu++J9T1T8Ic7Ojx9HpT3ty/OtN5DpvtGTeaOdaEoGBanY21p8+OK
 DcJ064X07wD2nOgRLblrrf3acldle90hUfi998fFv+y435CapIPSL6RR2ITiZj3PZ+Xc
 2HYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mpec4kI4socwFL+Zq24jSsLtJKqnE9w9v5JoBspcy+c=;
 b=NJ5wI1ENSllMtOa/RaZgn6mnc0Gg0GW1rtevDC7YUEb7ltlm9fPb5ZUko82yhPwv3n
 ERTh67R5wgqpPrXPnVsh4sTP891KbIXK052dmEH2nQLON4GmTy1UZmr5WCQK4R0YguO1
 Rjlz51fPSdwwbYBvOUETYFhgsibx+1TGrlMJmmIQENAqoX1mzN8VXx4HyqhQ08Ve+eVm
 o9knCIMDDH7wc1KAUlxwLSCj55wspAmv3FnaHjZd4OfEM1jIhCsg+RagXwo1MpT9vy8u
 0RZjLz3dYcY9ZF2aSQhYmvVAI+g04Pt/9b277mF27YTbywq815/IA1s4sofibznD8CCk
 3bGQ==
X-Gm-Message-State: AOAM532nIgxgvXjjfZqz1OmMyMI4k/oeVdt9By6H+1+eNDgWsiOXvKL9
 DF0aF6dr+8ex65dLK+V1CGZzCB+3eunCaw==
X-Google-Smtp-Source: ABdhPJyxU7axuWBo7u0HfScAkRPHuj7fv7uJMi7sMPGAoXhPnh3zgyhXl/uSZ8fL+GOxBbgdyIAPPQ==
X-Received: by 2002:a17:90b:388a:: with SMTP id
 mu10mr9983130pjb.101.1624456550880; 
 Wed, 23 Jun 2021 06:55:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u13sm32894pga.64.2021.06.23.06.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 06:55:50 -0700 (PDT)
Subject: Re: [PATCH v3 11/15] target/cris: Add DISAS_DBRANCH
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
 <20210622154820.1978982-12-richard.henderson@linaro.org>
 <20210623134318.GB3586016@toto>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <685fd02d-b92d-e038-e19d-bf2c870f83f8@linaro.org>
Date: Wed, 23 Jun 2021 06:55:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623134318.GB3586016@toto>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/21 6:43 AM, Edgar E. Iglesias wrote:
> On Tue, Jun 22, 2021 at 08:48:16AM -0700, Richard Henderson wrote:
>> Move delayed branch handling to tb_stop, where we can re-use other
>> end-of-tb code, e.g. the evaluation of flags.  Honor single stepping.
>> Validate that we aren't losing state by overwriting is_jmp.
> 
> Hi Richard,
> 
> This patch breaks my kernel boot test:
> 
> edgar@zapote:cris-axisdev88$ ./qemu-run.sh
> + MACH=-M axis-dev88
> + QEMU_BUILD_PATH=/home/edgar/src/c/qemu/build-qemu/
> + QEMU=/home/edgar/src/c/qemu/build-qemu//cris-softmmu/qemu-system-cris
> + KERNEL=-kernel kimage
> + NIC0=-netdev user,id=net0,hostfwd=tcp::2256-10.0.2.15:21 -net nic,netdev=net0
> + /home/edgar/src/c/qemu/build-qemu//cris-softmmu/qemu-system-cris -M axis-dev88 -netdev user,id=net0,hostfwd=tcp::2256-10.0.2.15:21 -net nic,netdev=net0 -serial stdio -display none -kernel kimage
> Linux version 2.6.33 (edgar@edde) (gcc version 4.3.1 20080521 (prerelease) [gcc-4_3-branch revision 135713] (GCC 4.3.1 Axis release R93/1.93) ) #4 Thu Jan 13 15:11:20 CET 2011
> bootconsole [early0] enabled
> ROM fs in RAM, size 6946816 bytes
> Setting up paging and the MMU.
> Linux/CRISv32 port on ETRAX FS (C) 2003, 2004 Axis Communications AB
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 4080
> Kernel command line: root=/dev/mtdblock3 init=/linuxrc rootfstype=jffs2 mmc_core.use_spi_crc=0 mmc_spi.spi_mode=3
> PID hash table entries: 128 (order: -4, 512 bytes)
> Dentry cache hash table entries: 4096 (order: 1, 16384 bytes)
> Inode-cache hash table entries: 2048 (order: 0, 8192 bytes)
> Memory: 22864k/32768k available (2260k kernel code, 9904k reserved, 504k data, 80k init)
> Hierarchical RCU implementation.
> NR_IRQS:80
> Enabling watchdog...
> Calibrating delay loop... qemu-system-cris: ../qemu/target/cris/translate.c:3236: cris_tr_translate_insn: Assertion `dc->base.is_jmp == DISAS_NEXT || dc->cpustate_changed' failed.
> Aborted (core dumped)

Ach, I see it -- rfe and rfn set DISAS_UPDATE without cpustate_changed.
Could you try adding dc->cpustate_changed = 1 in dec_rfe_etc, please.


r~

