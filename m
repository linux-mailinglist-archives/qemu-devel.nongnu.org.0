Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD80C52E9A9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 12:10:44 +0200 (CEST)
Received: from localhost ([::1]:42746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrzal-0002Nu-Gw
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 06:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nrzXz-0001G2-13
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:07:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46986 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nrzXt-0004WM-Ix
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:07:50 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxbypjaIdi8DwdAA--.207S3;
 Fri, 20 May 2022 18:07:31 +0800 (CST)
Subject: Re: [PATCH v4 38/43] hw/loongarch: Add LoongArch ls7a rtc device
 support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca
References: <20220517113023.3051143-1-yangxiaojuan@loongson.cn>
 <20220517113023.3051143-39-yangxiaojuan@loongson.cn>
 <5cb736a8-e502-e9b0-2e9f-a59546de4807@linaro.org>
 <e1ba94fa-d940-da4d-8d48-b6ca5af20f1c@loongson.cn>
 <f1f8457a-a79d-552d-0e15-af7ae688ec90@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <3da10299-7391-7033-c257-1e5c444fa21a@loongson.cn>
Date: Fri, 20 May 2022 18:07:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f1f8457a-a79d-552d-0e15-af7ae688ec90@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxbypjaIdi8DwdAA--.207S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWFy8Kw1DXFW3Jr47Xw1kKrg_yoW5ArWUpr
 48tFyxtFyDtrs5tr12gw18JFy8Jw1DJw1DJr18GFWDAay7Ary2qF10qr109FnrJr48Xr1U
 Jr4rZr9xuF1Uu3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
 IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
 6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
 IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2
 jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
 ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 2022/5/19 下午11:24, Richard Henderson wrote:
> On 5/19/22 06:04, yangxiaojuan wrote:
>>
>> On 2022/5/19 上午3:59, Richard Henderson wrote:
>>> On 5/17/22 04:30, Xiaojuan Yang wrote:
>>>
>>>> +static void ls7a_stop_toymatch(LS7ARtcState *s)
>>>> +{
>>>> +    int i;
>>>> +    uint64_t now;
>>>> +
>>>> +    now = qemu_clock_get_ms(rtc_clock);
>>>> +    for (i = 0; i < TIMER_NUMS; i++) {
>>>> +        if (s->toy_timer[i].flag) {
>>>> +            s->toy_timer[i].enable_offset = 
>>>> s->toy_timer[i].timer->expire_time
>>>> +                                            - now;
>>>> +            timer_del(s->toy_timer[i].timer);
>>>
>>> I don't think you need to check flag here, or update enable_offset.
>>> Just an unconditional timer_del to stop the timer callback from firing.
>>>
>> Thanks very much, and i fixed it like this: Is this modification 
>> appropriate?
>> static void ls7a_rtc_stop(LS7ARtcState *s)
>> {
>>      int i;
>>      int64_t rtc_val, rtc_diff, now;
>>      now = ls7a_rtc_ticks();
>>
>>      for (i = 0; i < TIMER_NUMS; i++) {
>>          if (s->rtc_timer[i].flag) {
>>              rtc_val = s->rtcmatch[i];
>>              rtc_diff = rtc_val - now - s->offset_rtc;
>>              s->rtc_timer[i].save_offset = rtc_diff;
>>          }
>>          timer_del(s->rtc_timer[i].timer);
>> }
>
> I think you should drop "flag" entirely.  I don't see what it 
> accomplishes.  It does not correspond to a bit in the state of the 
> La7a rtc device.
>
> Do you know if the documentation is incomplete, and rtcmatch[n] == 0 
> is a magic number that indicates that the match value is disabled?  
> Because if there is no magic number for disabling the match, I would 
> expect *any* number, including 0, to match every 2**32 / 2**15 seconds 
> ~= 36 hours.
>
The  documentation is indeed not detailed, and we find a colleague in 
hadware  department  to confirm your problem.

The rtc_write and rtc_match both are absolute value, rtc_write will add 
counters if rtc_en enabled.
when rtc_write == rtc_match, rtc interrupt will happen. it also applies 
to this situation: rtc_write=0, rtc_match=0, and the rtc_en enabled, irq 
happens immediately. And the same for TOY.

> It also occurs to me that EO is probably the thing that controls 
> whether RTC "ticks", and RTCEN is probably the thing that controls 
> whether RTC match interrupts are delivered, and the same for TOY.  Can 
> you confirm this?
>
>
If RTC_EN disabled, it do not support to write rtc_write and 
rtc_match[n], and the rtc_write will not add counters, and the interrupt 
is also disabled, EO do not control this. So, we should check rtc_en 
when write rtc_write and rtc_match. And the same for TOY.

Thanks.
Xiaojuan


