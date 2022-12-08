Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D3646C55
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 11:01:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Dhy-0001Na-TZ; Thu, 08 Dec 2022 05:00:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Dhp-0001M9-Ez
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:00:43 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Dhm-0001hy-Vb
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:00:40 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 ay8-20020a05600c1e0800b003d0808d2826so3806954wmb.1
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 02:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GJ50jxDBDZBqPO1S1/AiOkiV5SH+QutZxvNt+Nyjdh0=;
 b=ri1MwmePuDG9az3e6T50b9E2KZcStgd2SVhKhmhN/dCMizq/+YUG3saAypCLp6J5cL
 6VhN9h3jP6J9zyLejD5GWRkE3JIApTvjATcGr8sMyUWAYH0EAQgZtC0r8lpqJg/kIeOp
 mLSdmkKzwQuOBRjA8DIadu5ekuQ4ODjPW3fzxCVOc6maxMe2k7aS0hTqWkJq+zs3DM9L
 o2W+nKaEOR8IeEHTG9y+fNL9UCIwwbQWr9/I8wr/yD7TfJrIYGouFrTvpTiyLklnqaHr
 rrfsOF+TfQggScBNVMyKj9GfTEnwv+rgT9dUHFBq2EZC3UpLkKC0rf4rB5oppDncwJQG
 uXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GJ50jxDBDZBqPO1S1/AiOkiV5SH+QutZxvNt+Nyjdh0=;
 b=BOq3pDk+TECyeHmlqwSUoIzE88JhKhgqsX6rgIPSD4bhTmUD2Ico8PfaiXiTJ6X2K3
 LYdaDWf2LV4Ntkf9VDqIG4dF7UChCdlRQ8ze4NvG2YIuDutaRpEL97gS3G7oCzRRLSN8
 QS6qtAFq0rFX3ic2Ed84qg1aLk1IO0EJTfbS6NLoxOFN/k3c10TV5UjktE5BMpfMwTvE
 Nom9iHc0X5hoKZ9U/zr+Q3rqrScr04orXwV1t0e0EUXswGTGOgxQQPwlFgPsSETV2wpl
 D3WDKtmPLJJQLFM2l+2KrQYkCUze0zwOcwMoQW0fvvRbIyQ1kOaoArgAINKSrfZg5VKW
 mCrw==
X-Gm-Message-State: ANoB5plQ+AlhaW9uxTR0qHo3I9eVCsqSQ10PcMuL2pnduXqqvUWoHH3a
 YW2YX+A1mox8713DQMCWHRysig==
X-Google-Smtp-Source: AA0mqf4CmVXO7K1o3zspVy5UDmeVF+0NOBVHGCfvrmxFSyPCyl7E31K66DJPidcPQRMxc8C0kgyEsQ==
X-Received: by 2002:a05:600c:1d1f:b0:3d1:d1a8:f34d with SMTP id
 l31-20020a05600c1d1f00b003d1d1a8f34dmr9926414wms.179.1670493634626; 
 Thu, 08 Dec 2022 02:00:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y7-20020adfe6c7000000b002423edd7e50sm17905451wrm.32.2022.12.08.02.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 02:00:34 -0800 (PST)
Message-ID: <880d8315-24ab-7c4a-8649-d6f4ba36373f@linaro.org>
Date: Thu, 8 Dec 2022 11:00:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 1/4] cputlb: Restrict SavedIOTLB to system
 emulation
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Stafford Horne <shorne@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Yanan Wang <wangyanan55@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Greg Kurz <groug@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Anton Johansson <anjo@rev.ng>,
 qemu-ppc@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20221207174129.77593-1-philmd@linaro.org>
 <20221207174129.77593-2-philmd@linaro.org> <87lenis2xs.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87lenis2xs.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
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

On 8/12/22 09:40, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Commit 2f3a57ee47 ("cputlb: ensure we save the IOTLB data in
>> case of reset") added the SavedIOTLB structure -- which is
>> system emulation specific -- in the generic CPUState structure.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   accel/tcg/cputlb.c    | 4 ++--
>>   include/hw/core/cpu.h | 6 ++++--
>>   2 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index 6f1c00682b..0ea96fbcdf 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -1395,7 +1395,7 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
>>   static void save_iotlb_data(CPUState *cs, MemoryRegionSection *section,
>>                               hwaddr mr_offset)
>>   {
>> -#ifdef CONFIG_PLUGIN
>> +#if defined(CONFIG_PLUGIN) && !defined(CONFIG_USER_ONLY)
> 
> cputlb is softmmu only so I don't think we need to check CONFIG_USER_ONLY here.
Indeed, only "hw/core/cpu.h" requires it, thanks!

