Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96B96C2A9B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 07:44:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peVjN-0002JA-Ja; Tue, 21 Mar 2023 02:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1peVjI-0002IZ-Nt
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 02:44:21 -0400
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1peVjE-00041k-Uq
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 02:44:19 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=2; SR=0;
 TI=SMTPD_---0VeLwDzI_1679381048; 
Received: from 30.221.98.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeLwDzI_1679381048) by smtp.aliyun-inc.com;
 Tue, 21 Mar 2023 14:44:08 +0800
Message-ID: <ee34a299-3b57-1f97-cc08-19cebfcc0c6e@linux.alibaba.com>
Date: Tue, 21 Mar 2023 14:44:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] tcg/tcg: Avoid TS_DEAD for basic block ending
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230321045340.838-1-zhiwei_liu@linux.alibaba.com>
 <6a240bc1-4321-9891-3291-1320a96d1310@linaro.org>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <6a240bc1-4321-9891-3291-1320a96d1310@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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


On 2023/3/21 14:06, Richard Henderson wrote:
> On 3/20/23 21:53, LIU Zhiwei wrote:
>> TS_DEAD means we will release the register allocated for this 
>> temporary. But
>> at basic block ending, we can still use the allocted register.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> Test case?

I have run an Ubuntu image after this patch. It can boot.

But I can't find a direct test case.  Because the IRs supported with 
flags TCG_OPF_BB_END do not have  input or output parameter, such as the 
set_label or br.

Best Regards,
Zhiwei

>
>
> r~
>
>> ---
>>   tcg/tcg.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tcg/tcg.c b/tcg/tcg.c
>> index bb52bc060b..0c93e6e6f8 100644
>> --- a/tcg/tcg.c
>> +++ b/tcg/tcg.c
>> @@ -2822,7 +2822,7 @@ static void la_bb_end(TCGContext *s, int ng, 
>> int nt)
>>           case TEMP_FIXED:
>>           case TEMP_GLOBAL:
>>           case TEMP_TB:
>> -            state = TS_DEAD | TS_MEM;
>> +            state = TS_MEM;
>>               break;
>>           case TEMP_EBB:
>>           case TEMP_CONST:

