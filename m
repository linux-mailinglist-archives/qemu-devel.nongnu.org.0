Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB073296B9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 08:59:13 +0100 (CET)
Received: from localhost ([::1]:54118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGzw0-0002V2-NO
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 02:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lGzv0-00024n-0C
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 02:58:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:41898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lGzuy-00082I-FY
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 02:58:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0CB2AAC5;
 Tue,  2 Mar 2021 07:58:06 +0000 (UTC)
Subject: Re: [RFC v2 10/24] target/arm: only perform TCG cpu and machine inits
 if tcg enabled
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-11-cfontana@suse.de>
 <ed6d6ebf-d32f-7204-eaba-faea8a073d17@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <8dcd7c1c-0c1d-5d55-1eab-1ddd69053f50@suse.de>
Date: Tue, 2 Mar 2021 08:58:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ed6d6ebf-d32f-7204-eaba-faea8a073d17@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 4:36 AM, Richard Henderson wrote:
> On 3/1/21 8:49 AM, Claudio Fontana wrote:
>> @@ -1321,6 +1323,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>           }
>>       }
>>   
>> +#ifdef CONFIG_TCG
>>       {
>>           uint64_t scale;
>>   
>> @@ -1346,7 +1349,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>           cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
>>                                                     arm_gt_hvtimer_cb, cpu);
>>       }
>> -#endif
>> +#endif /* CONFIG_TCG */
> 
> You can use tcg_enabled here.

It is not possible currently. I probably could write a comment about it.

It would break migration for the --enable-kvm --enable-tcg build, due to

+#ifdef CONFIG_TCG
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
+#else
+        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
+        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
+#endif /* CONFIG_TCG */



> 
>> -        }
>>   
>>   #ifndef CONFIG_USER_ONLY
>> -        cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, arm_pmu_timer_cb,
>> -                cpu);
>> +            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, arm_pmu_timer_cb,
>> +                                          cpu);
> 
> Incorrect indentation change.
> Otherwise, LGTM.
> 
> 
> r~
> 

you need more lines of context in this patch than what you are quoting here,
the indentation change is intended.

The whole code, including cpu->pmu_timer is now only executed under tcg_enabled().

Thanks,

CLaudio


