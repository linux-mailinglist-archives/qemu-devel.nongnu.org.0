Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0796BF947
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 11:12:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdTWZ-0001dY-Ig; Sat, 18 Mar 2023 06:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pdTWW-0001bl-9Y
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 06:10:52 -0400
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pdTWU-0007Ao-0C
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 06:10:52 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R861e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=2; SR=0;
 TI=SMTPD_---0Ve5dUiH_1679134233; 
Received: from 192.168.3.95(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Ve5dUiH_1679134233) by smtp.aliyun-inc.com;
 Sat, 18 Mar 2023 18:10:34 +0800
Message-ID: <4572b81f-593b-3628-26c4-5658d1347c11@linux.alibaba.com>
Date: Sat, 18 Mar 2023 18:10:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Question about TCG liveness_pass_1
To: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <66de3418-1fbf-ead1-bf29-f9e06523cdf2@linux.alibaba.com>
 <a8d13f61-6354-454d-2983-eeb65cb6bc61@linaro.org>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <a8d13f61-6354-454d-2983-eeb65cb6bc61@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.118;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-118.freemail.mail.aliyun.com
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


On 2023/3/17 22:02, Richard Henderson wrote:
> On 3/16/23 19:57, LIU Zhiwei wrote:
>> Hi Richard,
>>
>> When I read the tcg code, I find a corner case which may be a bug in 
>> liveness_pass_1.
>>
>> I see all TEMP_TBs or global temps are set to TS_DEAD | TS_MEM when 
>> enter liveness_pass_1. Think about the  sequence.
>>
>>
>> 1)Write_global_temp_0 // 0->TS_DEAD, but not recorded in arg_life
>
> Here TS_MEM->TS_DEAD, so *is* recorded in arg_life.
>
>> 2)INDEX_op_qemu_st   //trigger an exception here.
>
> Here TCG_OPF_SIDE_EFFECTS is set, so call la_global_sync, so 0->TS_MEM.

Oops! I missed this. Thanks.

>
>>
>> 3)Ref_global_temp_0   // TS_DEAD->0
>>
>> 4)Write_global_temp_0 // TS_DEAD | TS_MEM -> TS_DEAD
>>
>> As 1) will not write to memory, its register will be reused by the 
>> 3). I think it may miss a write to global_temp_0 when enter an 
>> exception.
>
> Was there a specific test case that you find is miscompiled?

No.

Best Regards,
Zhiwei

>
>
> r~

