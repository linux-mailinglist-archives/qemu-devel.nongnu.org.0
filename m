Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE4455C0D6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:06:03 +0200 (CEST)
Received: from localhost ([::1]:39842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69yk-0005lw-1f
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o69x3-0004zC-Qq
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:04:17 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36372 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o69wz-0002wQ-Sb
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:04:17 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj0w17rpiHZFhAA--.8480S3;
 Tue, 28 Jun 2022 20:04:05 +0800 (CST)
Subject: Re: [PULL 38/43] hw/loongarch: Add LoongArch ls7a rtc device support
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Song Gao <gaosong@loongson.cn>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
 <20220606231450.448443-39-richard.henderson@linaro.org>
 <CAFEAcA91qww2x1iO7L+CsMnJA3txA_cmTzAQ=RLd6ftO0HOkuQ@mail.gmail.com>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <9641db0b-816f-ae0a-ea2c-bcbd3d69a5ee@loongson.cn>
Date: Tue, 28 Jun 2022 20:04:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA91qww2x1iO7L+CsMnJA3txA_cmTzAQ=RLd6ftO0HOkuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxj0w17rpiHZFhAA--.8480S3
X-Coremail-Antispam: 1UD129KBjvJXoW3JFyfWrW7tw1UGFyUXryxXwb_yoW7WryxpF
 W7uwnrtFWkXF4UCr18Xr4DZr1ftws5XrnxZr45CaySkryv9wn3JF1kGrW3CFy7ZFnakF15
 ZFWSvr9xJ3Z8KrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9G14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUXVWUAwAv7VCY1x0262k0Y48FwI0_Jr0_Gr1lYx0Ex4A2jsIE14v26r
 1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I
 648v4I1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
 8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
 xVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
 AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
 cIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
 0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjldgJUUUUU==
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

Hi Peter

On 2022/6/28 下午7:05, Peter Maydell wrote:
> On Tue, 7 Jun 2022 at 00:34, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>>
>> This patch add ls7a rtc device support.
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-Id: <20220606124333.2060567-39-yangxiaojuan@loongson.cn>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Hi; Coverity points out some issues with this code, and I
> noticed a few more reading through it.
Thanks for your advice. I am reading your comments carefully now, and I 
will correct it immediately,

Thanks.
Xiaojuan
>> +static inline void toymatch_val_to_time(uint64_t val, struct tm *tm)
>> +{
>> +    tm->tm_sec = FIELD_EX32(val, TOY_MATCH, SEC);
>> +    tm->tm_min = FIELD_EX32(val, TOY_MATCH, MIN);
>> +    tm->tm_hour = FIELD_EX32(val, TOY_MATCH, HOUR);
>> +    tm->tm_mday = FIELD_EX32(val, TOY_MATCH, DAY);
>> +    tm->tm_mon = FIELD_EX32(val, TOY_MATCH, MON) - 1;
>> +    tm->tm_year += (FIELD_EX32(val, TOY_MATCH, YEAR) - (tm->tm_year & 0x3f));
>> +}
>> +
>> +static void toymatch_write(LS7ARtcState *s, struct tm *tm, uint64_t val, int num)
>> +{
> Why does this function take a pointer to a struct tm? The callsites
> all pass in an entirely uninitialized struct tm and don't try to
> read from it after the call. It would be clearer to just define
> the struct tm as a local in this function.
>
>> +    int64_t now, expire_time;
>> +
>> +    /* it do not support write when toy disabled */
>> +    if (toy_enabled(s)) {
>> +        s->toymatch[num] = val;
>> +        /* caculate expire time */
>> +        now = qemu_clock_get_ms(rtc_clock);
>> +        toymatch_val_to_time(val, tm);
>> +        expire_time = now + (qemu_timedate_diff(tm) - s->offset_toy) * 1000;
> Coverity complains (CID 1489766) that we end up using uninitialized
> fields in the struct tm here. There's two reasons for that:
> (1) toymatch_val_to_time() doesn't set all the fields in the struct,
> and we never zero-initialized the struct. This accounts for
> tm_gmtoff, tm_isdst, tm_wday, tm_yday, tm_zone. You need to look
> at whether any of those ought to be initialized, and set them.
> Zero-init the struct to make Coverity happy about the rest of them.
>
> (2) toymatch_val_to_time() sets tm_year based on the previous value
> of tm_year. This doesn't make sense if the struct isn't initialized.
> What was the intention here ?
>
>
>> +        timer_mod(s->toy_timer[num], expire_time);
>> +    }
>> +}
>> +static void ls7a_toy_start(LS7ARtcState *s)
>> +{
>> +    int i;
>> +    uint64_t expire_time, now;
>> +    struct tm tm;
> Coverity issue CID 1489763: we don't zero initialize the struct tm here,
> but we don't individually initialize all its fields. In particular
> the tm_wday field is never set up and Coverity complains it might
> be used uninitialized.
>
> The easy fix is to zero-init everything:
>     struct tm tm = {};
>
>> +    /*
>> +     * need to recaculate toy offset
> typo: "recalculate" (here and in other comments above and below)
>
>> +     * and expire time when enable it.
>> +     */
>> +    toy_val_to_time_mon(s->save_toy_mon, &tm);
>> +    toy_val_to_time_year(s->save_toy_year, &tm);
>> +
>> +    s->offset_toy = qemu_timedate_diff(&tm);
>> +    now = qemu_clock_get_ms(rtc_clock);
>> +
>> +    /* recaculate expire time and enable timer */
>> +    for (i = 0; i < TIMER_NUMS; i++) {
>> +        toymatch_val_to_time(s->toymatch[i], &tm);
>> +        expire_time = now + (qemu_timedate_diff(&tm) - s->offset_toy) * 1000;
>> +        timer_mod(s->toy_timer[i], expire_time);
>> +    }
>> +}
>> +static void toy_timer_cb(void *opaque)
>> +{
>> +    LS7ARtcState *s = opaque;
>> +
>> +    if (toy_enabled(s)) {
>> +        qemu_irq_pulse(s->irq);
>> +    }
>> +}
>> +
>> +static void rtc_timer_cb(void *opaque)
>> +{
>> +    LS7ARtcState *s = opaque;
>> +
>> +    if (rtc_enabled(s)) {
>> +        qemu_irq_pulse(s->irq);
>> +    }
> Does the real hardware really pulse the IRQ line?
>
>> +}
>> +
>> +static void ls7a_rtc_realize(DeviceState *dev, Error **errp)
>> +{
>> +    int i;
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>> +    LS7ARtcState *d = LS7A_RTC(sbd);
>> +    memory_region_init_io(&d->iomem, NULL, &ls7a_rtc_ops,
>> +                         (void *)d, "ls7a_rtc", 0x100);
>> +
>> +    sysbus_init_irq(sbd, &d->irq);
>> +
>> +    sysbus_init_mmio(sbd, &d->iomem);
>> +    for (i = 0; i < TIMER_NUMS; i++) {
>> +        d->toymatch[i] = 0;
>> +        d->rtcmatch[i] = 0;
>> +        d->toy_timer[i] = timer_new_ms(rtc_clock, toy_timer_cb, d);
>> +        d->rtc_timer[i] = timer_new_ms(rtc_clock, rtc_timer_cb, d);
>> +    }
>> +    d->offset_toy = 0;
>> +    d->offset_rtc = 0;
>> +    d->save_toy_mon = 0;
>> +    d->save_toy_year = 0;
>> +    d->save_rtc = 0;
> This device is missing an implementation of the reset method,
> and a lot of this looks like it is code that ought to be in reset.
>
>> +
>> +    create_unimplemented_device("mmio fallback 1", 0x10013ffc, 0x4);
> This call to create_unimplemented_device() is wrong -- device realize
> code must not map anything into the system memory map. That is up to
> board or SoC level code to do. I'm not sure what it's trying to do,
> but it should be done some other way.
>
>> +}
> thanks
> -- PMM


