Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974B952D38B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 15:06:54 +0200 (CEST)
Received: from localhost ([::1]:46074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfrh-0007Tp-7W
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 09:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nrfq0-0006Ts-8Y
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:05:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51372 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nrfpu-0001Zf-Mw
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:05:07 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxQNpvQIZiIDUcAA--.29370S3; 
 Thu, 19 May 2022 21:04:48 +0800 (CST)
Subject: Re: [PATCH v4 38/43] hw/loongarch: Add LoongArch ls7a rtc device
 support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca
References: <20220517113023.3051143-1-yangxiaojuan@loongson.cn>
 <20220517113023.3051143-39-yangxiaojuan@loongson.cn>
 <5cb736a8-e502-e9b0-2e9f-a59546de4807@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <e1ba94fa-d940-da4d-8d48-b6ca5af20f1c@loongson.cn>
Date: Thu, 19 May 2022 21:04:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5cb736a8-e502-e9b0-2e9f-a59546de4807@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9BxQNpvQIZiIDUcAA--.29370S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZr4UArW8ZFW8Jw1xZFWUArb_yoW5GFWfpF
 48XF4UJFyUGrn5tr18Jr1DXry8Jr1DJw1jqr18Ga1DA34Utr1qqF18Xr1jgF4DGr48Jr1U
 Jw1rJr13Zr1UW37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
 026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
 JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
 vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
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


On 2022/5/19 上午3:59, Richard Henderson wrote:
> On 5/17/22 04:30, Xiaojuan Yang wrote:
>
>> +static void ls7a_stop_toymatch(LS7ARtcState *s)
>> +{
>> +    int i;
>> +    uint64_t now;
>> +
>> +    now = qemu_clock_get_ms(rtc_clock);
>> +    for (i = 0; i < TIMER_NUMS; i++) {
>> +        if (s->toy_timer[i].flag) {
>> +            s->toy_timer[i].enable_offset = 
>> s->toy_timer[i].timer->expire_time
>> +                                            - now;
>> +            timer_del(s->toy_timer[i].timer);
>
> I don't think you need to check flag here, or update enable_offset.
> Just an unconditional timer_del to stop the timer callback from firing.
>
Thanks very much, and i fixed it like this: Is this modification 
appropriate?
static void ls7a_rtc_stop(LS7ARtcState *s)
{
     int i;
     int64_t rtc_val, rtc_diff, now;
     now = ls7a_rtc_ticks();

     for (i = 0; i < TIMER_NUMS; i++) {
         if (s->rtc_timer[i].flag) {
             rtc_val = s->rtcmatch[i];
             rtc_diff = rtc_val - now - s->offset_rtc;
             s->rtc_timer[i].save_offset = rtc_diff;
         }
         timer_del(s->rtc_timer[i].timer);
}
>
>> +    case SYS_RTCWRTIE0:
>> +        s->offset_rtc = val - ls7a_rtc_ticks();
>
> This needs to behave differently when !rtc_enabled, and when 
> rtc_enabled reinit the timers for RTCMATCHn, because the time 
> differential has changed.
>
Thanks, I fixed it as this:
     case SYS_RTCWRTIE0:
         if (rtc_enabled(s)) {
             s->offset_rtc = val - ls7a_rtc_ticks();
         } else {
             s->rtc_write_save = val;
          }
     break;

static void ls7a_rtc_start(LS7ARtcState *s)
{
     int i;
     int64_t expire_time, now;

     now = ls7a_rtc_ticks();

     if (rtc_save_val) {
         old_offset = s->offset_rtc;
         s->offset_rtc = rtc_save_val - now;
         offset_diff = s->offset_rtc - old_offset;
     }

     for (i = 0; i < TIMER_NUMS; i++) {
         if (s->rtc_timer[i].flag && rtc_enabled(s)) {
             expire_time = ticks + s->rtc_timer[i].save_offset + 
offset_diff;
             expire_time = (expire_time * 1000 / LS7A_RTC_FREQ);
             timer_mod(s->rtc_timer[i].timer, expire_time);
         }
     }
}

Thanks.
Xiaojuan


