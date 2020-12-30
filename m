Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44E22E7D03
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 23:41:58 +0100 (CET)
Received: from localhost ([::1]:57304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kukAH-0006f9-29
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 17:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kuk6m-0005bj-LP
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 17:38:20 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kuk6k-00011h-Kb
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 17:38:20 -0500
Received: by mail-pl1-x636.google.com with SMTP id e2so9241797plt.12
 for <qemu-devel@nongnu.org>; Wed, 30 Dec 2020 14:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Aj/bWab8koY6Czj/Y98SO0WFOeHwIQhdjdAZnaEgc1Q=;
 b=EKsWOQPA5RmQuuctMcAhVGd1+zlBXGqeepBBABFmXl5qHLBdRTVEh6jqJTpLNtPTRJ
 MocPXTsysdFEtEK8Ln2qFh4qmIxk4WmOmVFKX2VKU2qzJccCkf9JNaKjKbmAnoH3UmXP
 8b3oRH9ySiT2q/SPc9mJYC1eHBC5zGaSy/NCI+dyqRyTJ+i93wgMVlhIzdmWvEN+Q5Oj
 E18uiIiF4jByDlefinwMdFtwWA7gxFVxbBs4wsTTO1SdPdU0n0ZFtG5ddqS3TJz++Atn
 O7B5JTeU+wugerWJ8X9gAk1DP202DEh3A5NLdqQeCuFWk924FVMUhgXG9O1wM4zHMmI+
 jojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Aj/bWab8koY6Czj/Y98SO0WFOeHwIQhdjdAZnaEgc1Q=;
 b=W6BqkiNdh9AzUnAzaZTv/vCRAIJGIQ0HAs+JWsWNYoZkSBQO3SndsJ8tbYUm46rjLj
 feUXIjWEvNhWBqmLhs1NzmgKxA/cHRG41IoRnM2o15vjoFP65ifLeZJxkCOiJnPZWYv9
 YiBtBuPk9q1cnVe6ps9neSBaOvyJ8C1M4/ouZP8x141YiQeOuM0FlOYDJWh5iAUMJwIe
 xPDDGXhS6e9pi3YZulPjESY3wcfertjvjtm66jFjJrJZdsCX9Z6XQyqFvEMVJSvGeYDh
 QC9g0YHhYivESUB06LpT0FeuAganRCPir5SBQzf42PGHXu6WPmnpD/Qwsqz5zGKAJgCn
 Ms+Q==
X-Gm-Message-State: AOAM533MVkLH6Tc7NWojKE7sB26Bh1fxcAn2DvPRH8givGN24xM0gPLK
 EKiT3XOHoAuISHecXP2TDBN2HsedNPvxeg==
X-Google-Smtp-Source: ABdhPJzM0X8/OJsrhse9YXOfaXGPVbbILwutCuhADA1czbxgMrTMwMHOG/tqDZgwNU8cM5WVdInGdQ==
X-Received: by 2002:a17:90a:eacf:: with SMTP id
 ev15mr10917613pjb.174.1609367896995; 
 Wed, 30 Dec 2020 14:38:16 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 a23sm8406566pjh.19.2020.12.30.14.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Dec 2020 14:38:16 -0800 (PST)
Subject: Re: [PATCH 1/3] target/arm: keep translation start level unsigned
From: Richard Henderson <richard.henderson@linaro.org>
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <7884934.NyiUUSuA9g@basile.remlab.net>
 <20201218143321.102872-1-remi.denis.courmont@huawei.com>
 <c2af03a8-9f56-fb43-485c-91ec0fbdef31@linaro.org>
Message-ID: <002743e6-10d3-88b3-961a-8571efb4d1ed@linaro.org>
Date: Wed, 30 Dec 2020 14:38:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c2af03a8-9f56-fb43-485c-91ec0fbdef31@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.399,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/30/20 2:10 PM, Richard Henderson wrote:
> On 12/18/20 6:33 AM, remi.denis.courmont@huawei.com wrote:
>> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
>>
>> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
>> ---
>>  target/arm/helper.c | 14 ++++++--------
>>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> The patch does more than what is described above.
> 
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index df195c314c..b927e53ab0 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -10821,17 +10821,12 @@ do_fault:
>>   * Returns true if the suggested S2 translation parameters are OK and
>>   * false otherwise.
>>   */
>> -static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>> +static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint32_t level,
>>                                 int inputsize, int stride)
>>  {
>>      const int grainsize = stride + 3;
>>      int startsizecheck;
>>  
>> -    /* Negative levels are never allowed.  */
>> -    if (level < 0) {
>> -        return false;
>> -    }
>> -
> 
> I would expect this to be the only hunk from the patch description.  Probably
> changing this negative check to a >= 3 check.

Having read the next patch, I think you should drop this type change.

>> @@ -11203,7 +11201,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>>  
>>          if (!aarch64 || stride == 9) {
>>              /* AArch32 or 4KB pages */
>> -            startlevel = 2 - sl0;
>> +            startlevel = (2 - sl0) & 3;

This hunk belongs with the next patch, implementing TTST, and should be
conditional.  I.e.

    if (stride == 9) {
        startlevel = 2 - sl0;
        if (aarch64 &&
            cpu_isar_feature(aa64_st, env_archcpu(env)) {
            startlevel &= 3;
        }
    ...


r~

