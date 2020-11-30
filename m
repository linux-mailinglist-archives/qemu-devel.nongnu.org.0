Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330EE2C8CBC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:28:04 +0100 (CET)
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjnu7-0000NK-5d
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kjnsJ-000754-Ad
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:26:11 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kjnsH-0002BC-Ll
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:26:11 -0500
Received: by mail-ot1-x342.google.com with SMTP id y24so12268766otk.3
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 10:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hY10WBSX00MiSBiCWmu51+xN9j1uxrl7nY/xuRnn0iU=;
 b=NjacEqBhM864QAWV72NQTaNGAyjo6+poHe859FkRochmQg0CJbjoR/c8/e+HiwkUQl
 4phvEjUBj6X/9FgWmx4vesEomytD8BEPvixAmOblojQ9fnrT71UawEDL5UkKb04qoZEo
 BBcu6muwoW1VPe1zCgyf5dCwDGMev5z2If1ViioPmaIF7b+IgJf/03sFX0+K09cjKWZf
 QzwJ8u6EexmFJsz6/jHwoBTmc60kiuxzYjz+nYa4oz6Sxa3pZyWEth3L9MnuFNuFy2DO
 Urora/JbfK9TaXUm3IPcUuP6/AIW6rTnDPKSSE3Wd/4NOVHqe8/cBzPyzah30L5Zj8YE
 eVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hY10WBSX00MiSBiCWmu51+xN9j1uxrl7nY/xuRnn0iU=;
 b=XdXSmlKsqAd7H/qau51eprkNLL3vPELRW+SXBg1m0E2l+DepKWJtS5UDOxkKVbQE3n
 f5FIbM1T6IPAGRObky0Ourc4Md1rZqhpqy1XDb/qLtzxN0nx+m4kbi5bz+tpE84/+a1r
 aVlF/98SWHkIuK+DVEZFiQZODS1fWdDAPQosiEXmCtR3jqgZEZMdC2dZpdo3OipaFTpU
 Ld91D+ntwS3zmAuXyOe8Hc0a5i/j7juBCEoa/gqzCDja5U9MrAW08z4+lP6KkF4CU+hq
 IfXea47cs/VCvX4eEurJnoWtsmLg0s67r86PtQWNNnRs4DnepeypAXJKAVjOiHFlkAT4
 ZVIw==
X-Gm-Message-State: AOAM533rdLyCbi2KlE890t+ItuyGnuTZ4HzEaIsCT6QBDrL/uPfdlLP9
 5VHKDdJzqeNlD7EUg6x0rANyADLbMXzplLko
X-Google-Smtp-Source: ABdhPJx+7wCiI5wX9FwZpeg06V5tlNdoIf/UQevkUjsCPqmJT7T6aCK1B60yxVCNsEHLmPvwWa1eGQ==
X-Received: by 2002:a05:6830:18f8:: with SMTP id
 d24mr17636048otf.44.1606760768499; 
 Mon, 30 Nov 2020 10:26:08 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id y62sm9945205oia.23.2020.11.30.10.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 10:26:07 -0800 (PST)
Subject: Re: [PATCH 2/4] hw/core/loader.c: Improve reporting of ROM overlap
 errors
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201129203923.10622-1-peter.maydell@linaro.org>
 <20201129203923.10622-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c69e0a30-f6e3-aab8-048a-1a4129ff7dc4@linaro.org>
Date: Mon, 30 Nov 2020 12:26:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201129203923.10622-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/20 2:39 PM, Peter Maydell wrote:
> In rom_check_and_register_reset() we report to the user if there is
> a "ROM region overlap". This has a couple of problems:
>  * the reported information is not very easy to intepret
>  * the function just prints the overlap to stderr (and relies on
>    its single callsite in vl.c to do an error_report() and exit)
>  * only the first overlap encountered is diagnosed
> 
> Make this function use error_report() and error_printf() and
> report a more user-friendly report with all the overlaps
> diagnosed.
> 
> Sample old output:
> 
> rom: requested regions overlap (rom dtb. free=0x0000000000008000, addr=0x0000000000000000)
> qemu-system-aarch64: rom check and register reset failed
> 
> Sample new output:
> 
> qemu-system-aarch64: Some ROM regions are overlapping
> These ROM regions might have been loaded by direct user request or by default.
> They could be BIOS/firmware images, a guest kernel, initrd or some other file loaded into guest memory.
> Check whether you intended to load all this guest code, and whether it has been built to load to the correct addresses.
> 
> The following two regions overlap (in the cpu-memory-0 address space):
>   phdr #0: /home/petmay01/linaro/qemu-misc-tests/ldmia-fault.axf (addresses 0x0000000000000000 - 0x0000000000008000)
>   dtb (addresses 0x0000000000000000 - 0x0000000000100000)
> 
> The following two regions overlap (in the cpu-memory-0 address space):
>   phdr #1: /home/petmay01/linaro/qemu-misc-tests/bad-psci-call.axf (addresses 0x0000000040000000 - 0x0000000040000010)
>   phdr #0: /home/petmay01/linaro/qemu-misc-tests/bp-test.elf (addresses 0x0000000040000000 - 0x0000000040000020)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


