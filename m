Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC1C66C376
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:20:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRH8-0006CG-Ur; Mon, 16 Jan 2023 10:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHRGr-00069s-2f; Mon, 16 Jan 2023 10:19:43 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHRGp-0006MB-Dl; Mon, 16 Jan 2023 10:19:36 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 6DFB620DFE75;
 Mon, 16 Jan 2023 07:19:30 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6DFB620DFE75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673882371;
 bh=Mmwbj8+DX6iQDBlbEOQlcM7mW/eeiXMLStuoVmG8PiY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KGPASYhMnekUUzcBZDAd1bV1+7nPkOjYL/1HHlCuDE+4kJ0ze2LdDtiPfXjJSEukv
 RUmbKInCw9HwIKM9VHgXXZuCwFbB/bbLjcBCgSqcjZpQizh3l67QRlYl4BdXS1xNWG
 KuIQpyCSMmu32ngxTVBlgTaa/WN/zImLcpfDX0DE=
Message-ID: <d1a57714-efde-cc5d-1e3a-be4724fe6b50@linux.microsoft.com>
Date: Mon, 16 Jan 2023 16:19:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] target/arm: allow writes to SCR_EL3.HXEn bit when
 FEAT_HCX is enabled
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 qemu-stable <qemu-stable@nongnu.org>
References: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
 <20230105221251.17896-4-eiakovlev@linux.microsoft.com>
 <CAFEAcA_1K6jC1aM3DX3iNN503pqw14yyCUiORoHPSfxN7g8Xzg@mail.gmail.com>
Content-Language: en-US
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
In-Reply-To: <CAFEAcA_1K6jC1aM3DX3iNN503pqw14yyCUiORoHPSfxN7g8Xzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -198
X-Spam_score: -19.9
X-Spam_bar: -------------------
X-Spam_report: (-19.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 1/13/2023 14:20, Peter Maydell wrote:
> On Thu, 5 Jan 2023 at 22:13, Evgeny Iakovlev
> <eiakovlev@linux.microsoft.com> wrote:
>> ARM trusted firmware, when built with FEAT_HCX support, sets SCR_EL3.HXEn bit
>> to allow EL2 to modify HCRX_EL2 register without trapping it in EL3. Qemu
>> uses a valid mask to clear unsupported SCR_EL3 bits when emulating SCR_EL3
>> write, and that mask doesn't include SCR_EL3.HXEn bit even if FEAT_HCX is
>> enabled and exposed to the guest. As a result EL3 writes of that bit are
>> ignored.
>>
>> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
>> ---
>>   target/arm/helper.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index bac2ea62c4..962affdd52 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -1844,6 +1844,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>>           if (cpu_isar_feature(aa64_sme, cpu)) {
>>               valid_mask |= SCR_ENTP2;
>>           }
>> +        if (cpu_isar_feature(aa64_hcx, cpu)) {
>> +            valid_mask |= SCR_HXEN;
>> +        }
>>       } else {
>>           valid_mask &= ~(SCR_RW | SCR_ST);
>>           if (cpu_isar_feature(aa32_ras, cpu)) {
>> --
> Oops. This is worth
> Cc: qemu-stable@nongnu.org
>
> I think.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> I'll take this 3rd patch into target-arm.next now; I've left
> review comments for the other 2.
>
> thanks
> -- PMM


Thanks, Peter! I'll be addressing the comments today and post a v2 with 
changes for the first 2.



