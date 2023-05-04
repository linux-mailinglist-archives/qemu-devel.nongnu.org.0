Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A436F6520
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 08:36:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puSYf-000122-FW; Thu, 04 May 2023 02:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puSYQ-00011i-Vw
 for qemu-devel@nongnu.org; Thu, 04 May 2023 02:35:04 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puSYO-0001dv-RC
 for qemu-devel@nongnu.org; Thu, 04 May 2023 02:35:02 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-958bb7731a9so13626366b.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 23:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683182098; x=1685774098;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bwmMybB9UPnrzE9komWOngP7An5/sDATyeO5E1XqFk0=;
 b=iyCvGfXeeiOZRk5Tz28Z2odc2OSjaA3h68tGdFO8yK2VlsMa6JuWJ0m8NMdLQOllUt
 O5p6UFNQ7glCSezICg0jexRCeWlvdlnuYZ5nSoJt1n6p65//L4WqtVF1qF7CChLMBYSO
 pjcwTzPjfk77Ar2Vu/uCdyv8LECRbWa8iBLnZ4qu4FFYs4/O+bDHViHpGlW08LOI76D+
 4F6cOtvybdHZA49X+nlsd1afKlkvbIgzvp5l1bR2IVzuhRcBBDEC6Kuz4t7Ty7Ly8CHS
 DJtw9K6RSt/CUVNJUxD59ZVNYRK8MzhMM2LRiddw/tQ0zLB0ZEvY8v/IcuOyZEPCfxyh
 Fo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683182098; x=1685774098;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bwmMybB9UPnrzE9komWOngP7An5/sDATyeO5E1XqFk0=;
 b=cjgZrrNM61opdf5eShYq9vD33DcXnbXDPTxQQXBipkHkbJrugZpTM1fdLLKA8uNs5G
 UWcNuu40ZWzZb9d9GGgbK30MZIyiHVN6kvhJ28clfGQhprfC+Yfu7hQtcDuRQpa7NnfG
 BwrqtughHPwrLPHOwW+h+pjDC5U9XIK5IbptBSygVHM1xNXOQfpvDgOPEofMN5axwiSu
 PBfSjoB2tau4PAWK3X0OOkEqoj6nf45T1++uhSu+tA8uK6iTFaK+U4izIGYsFDEcYRah
 99SVjOuzGFTT1A+2S9OyNAFu3wxnApq3/twUp30PexGeymZCTHosy932Df6I8CHbjdfH
 eQ8g==
X-Gm-Message-State: AC+VfDy9vL905ExRxrGp+eU67wRQXSi0hP8+Q+b71AMNKCPGKDYemiii
 aNg6ub31jh6AUoOdxXdIQgRyEw==
X-Google-Smtp-Source: ACHHUZ6etkmbxSAy6RUDM3wtY+8KE9CfIQaCKespM4HvABOikUg8NFxmHaizo2HGZ6po7vINvzqRsQ==
X-Received: by 2002:a17:907:844:b0:961:69a2:c8d6 with SMTP id
 ww4-20020a170907084400b0096169a2c8d6mr5571985ejb.69.1683182097724; 
 Wed, 03 May 2023 23:34:57 -0700 (PDT)
Received: from [192.168.0.57] ([82.152.154.96])
 by smtp.gmail.com with ESMTPSA id
 hx11-20020a170906846b00b0096599bf7029sm878908ejc.145.2023.05.03.23.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 23:34:57 -0700 (PDT)
Message-ID: <dd7325e0-7db1-3b1f-7ce1-319aa58ebd1f@linaro.org>
Date: Thu, 4 May 2023 07:34:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL v3 0/10] xenpvh3-tag
To: Vikram Garhwal <vikram.garhwal@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org
References: <alpine.DEB.2.22.394.2305021708010.974517@ubuntu-linux-20-04-desktop>
 <a01d5ddf-b6b3-7fc7-daef-44debf48ca77@linaro.org>
 <1f6b3666-fc7e-083a-50fb-b2e91ac2c012@amd.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <1f6b3666-fc7e-083a-50fb-b2e91ac2c012@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/4/23 06:18, Vikram Garhwal wrote:
> Hi Richard,
> 
> On 5/3/23 12:47 AM, Richard Henderson wrote:
>> On 5/3/23 01:12, Stefano Stabellini wrote:
>>> Hi Peter,
>>>
>>> Vikram fixed the gitlab test problem, so now all the tests should
>>> succeed. There were no changes to the QEMU code. I am resending the pull
>>> request (I rebased it on staging, no conflicts.)
>>>
>>> For reference this was the previous pull request:
>>> https://marc.info/?l=qemu-devel&m=167641819725964
>>>
>>> Cheers,
>>>
>>> Stefano
>>>
>>>
>>> The following changes since commit 4ebc33f3f3b656ebf62112daca6aa0f8019b4891:
>>>
>>>    Merge tag 'pull-tcg-20230502-2' of https://gitlab.com/rth7680/qemu into staging 
>>> (2023-05-02 21:18:45 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://gitlab.com/sstabellini/qemu xenpvh3-tag
>>>
>>> for you to fetch changes up to bc618c54318cbc2fcb9decf9d4c193cc336a0dbc:
>>>
>>>    meson.build: enable xenpv machine build for ARM (2023-05-02 17:04:54 -0700)
>>>
>>> ----------------------------------------------------------------
>>> Stefano Stabellini (5):
>>>        hw/i386/xen/xen-hvm: move x86-specific fields out of XenIOState
>>>        xen-hvm: reorganize xen-hvm and move common function to xen-hvm-common
>>>        include/hw/xen/xen_common: return error from xen_create_ioreq_server
>>>        hw/xen/xen-hvm-common: skip ioreq creation on ioreq registration failure
>>>        meson.build: do not set have_xen_pci_passthrough for aarch64 targets
>>>
>>> Vikram Garhwal (5):
>>>        hw/i386/xen/: move xen-mapcache.c to hw/xen/
>>>        hw/i386/xen: rearrange xen_hvm_init_pc
>>>        hw/xen/xen-hvm-common: Use g_new and error_report
>>>        hw/arm: introduce xenpvh machine
>>>        meson.build: enable xenpv machine build for ARM
>>
>> Errors in CI:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/4216392008#L2381
>>
>> ../hw/i386/xen/xen-hvm.c:303:9: error: implicit declaration of function 'error_report' 
>> is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>>         error_report("relocate_memory %lu pages from GFN %"HWADDR_PRIx
> Thanks for notifying this. I am not sure why this particular build is failing. 
> error_report() is defined in "|qemu/error-report.h" and the header should be included as 
> |||it builds fine for other configs.

You removed qemu/error-report.h in

     xen-hvm: reorganize xen-hvm and move common function to xen-hvm-common

within this patch set.


r~

