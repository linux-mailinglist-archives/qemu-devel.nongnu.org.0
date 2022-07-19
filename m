Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050B657A430
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 18:25:59 +0200 (CEST)
Received: from localhost ([::1]:33754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDq2o-0008F5-6l
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 12:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDpz4-0002dq-6m
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:22:06 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDpz2-000521-Cg
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:22:05 -0400
Received: by mail-pl1-x62e.google.com with SMTP id f11so12410941plr.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=bY3LNftqJSxGGMX6DhNavgPYZZpCHsjC9lEj005oQ38=;
 b=Hg1sOcZtCx0VZA3FXGUQZFBkuQ9ott/Um4+zi8+doWA90dbhcK5qIEGv2NthvKzmEn
 b0JbDUV5yPOA9OjDz1S9DJgPNcJt78pgHgUPqGJYHbEeZA2PFEo2Yzvbc9wVMCigUGzl
 3mV5zrkq+o5YZOijDABuR9G/dX9uwVBKPnnD6M+dS5o4335Q6R9uZ1ScBZy+0lOiFYui
 Pw8orW29jnxFQaiInTBNe8IWFh+IG7zz7PykIRKA+u/N6l/pKt79W3lhdSrkkDo6X0W/
 YMFmmsePXJRsqE0hmo9gDw+pWlG+E8ufQrryFwUatEu7+FC0nuUpp4i6zo42HdFnXcn1
 fs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=bY3LNftqJSxGGMX6DhNavgPYZZpCHsjC9lEj005oQ38=;
 b=RzqNPjS/DGxIDGD3UNQB46mjYI916oIztBcn7InJLSa60MiP4XpkrK/IpAm3xjjn5p
 okR75MPu3AEfxz+wsVCBGgnzRNCokx3Cg+KFye4vSk9g1l1oZ4uk1CLwPIxIUoCAaA+k
 W+p2/1umCN9jmOA+Qgm3q4H7HQ4PLy8izFoLk9fYU5/MbRlWPSoyCg5BgZe0/Za1tsjR
 7VYy/8fC6ouSaXwNbeWlVRYSNdKw0Ogn3KQQVOA2hIXFetB7I3KYrURiDY9nFpuVls1g
 usBnPPmTJc9aGvz46wtWLpYlelWBnH/u35+QeyUSmKJAtuvHRw6+DnzIjSxOTmLIMSH1
 Tliw==
X-Gm-Message-State: AJIora87V9cqhSQzYOU0C2mBlgSSz1rzMnvDc18x5EZlQPs0bhgpvGvg
 Gx9eTmmA5z+85G4SxOSzox0l4Q==
X-Google-Smtp-Source: AGRyM1uaS96FawjFm/OkhnIXum9jdqOsdp2UQxUHhbveFsQ78YCxzlszgEfTsHj5JjRCTRdtF6Tt0w==
X-Received: by 2002:a17:90b:4f41:b0:1f0:4785:b9a8 with SMTP id
 pj1-20020a17090b4f4100b001f04785b9a8mr134971pjb.224.1658247722901; 
 Tue, 19 Jul 2022 09:22:02 -0700 (PDT)
Received: from [192.168.113.227] ([123.231.102.160])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a170902cec100b0016a091eb88esm12043256plg.126.2022.07.19.09.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 09:22:02 -0700 (PDT)
Message-ID: <3be3215a-8edd-709a-81c4-9804d39c2e3f@linaro.org>
Date: Tue, 19 Jul 2022 21:51:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 0/6] Support booting bios and kernel for LoongArch
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220712083206.4187715-1-yangxiaojuan@loongson.cn>
 <2af20d3e-6f6d-7da9-5b03-76308c2180a3@linaro.org>
In-Reply-To: <2af20d3e-6f6d-7da9-5b03-76308c2180a3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/22 13:40, Richard Henderson wrote:
> On 7/12/22 14:02, Xiaojuan Yang wrote:
>> This series add some new funcitons for LoongArch virt machine.
>> Support loading uefi bios and linux kernel to boot system, and
>> add fw_cfg table, smbios table, acpi table, fdt table to transmit
>> information for the system.
>>
>> We could get the uefi bios and linux kernel file by this address:
>> The kernel file:
>>     * https://github.com/loongson/linux/tree/loongarch-next
>> The bios file:
>>     * https://github.com/loongson/edk2
>>     * https://github.com/loongson/edk2-platforms
>>
>> Xiaojuan Yang (6):
>>    hw/loongarch: Add fw_cfg table support
>>    hw/loongarch: Add uefi bios loading support
>>    hw/loongarch: Add linux kernel booting support
>>    hw/loongarch: Add smbios support
>>    hw/loongarch: Add acpi ged support
>>    hw/loongarch: Add fdt support
> 
> Queued.
> 
> If there are bugs in the smbios or acpi patches, they can be fixed before hard freeze, but 
> we do want the feature committed before soft freeze.

Patch 3 has a 32-bit error wrt %lx and uint64_t.

Patch 5 misses setting TARGET_NEED_FDT in configs/targets/loongarch64-softmmu.mak.



r~

