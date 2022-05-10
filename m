Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79FD521113
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 11:36:58 +0200 (CEST)
Received: from localhost ([::1]:35598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMIb-0007UT-Nj
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 05:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1noLuc-000145-E6
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:12:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45326 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1noLuZ-0006oW-F6
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:12:09 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL9tfLHpiFOoPAA--.62655S3; 
 Tue, 10 May 2022 17:11:59 +0800 (CST)
Subject: Re: [PATCH v3 38/43] hw/loongarch: Add LoongArch ls7a rtc device
 support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-39-yangxiaojuan@loongson.cn>
 <f446d2f5-5503-8a73-73fa-4dd7703e6200@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <d44f18b6-4724-e855-0b11-183437c03ef3@loongson.cn>
Date: Tue, 10 May 2022 17:11:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f446d2f5-5503-8a73-73fa-4dd7703e6200@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxL9tfLHpiFOoPAA--.62655S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtr4Dtry5Xw4rKrWDJw47Jwb_yoW3Gw1Upr
 1kAryDtry8Xr4kJr10qF1DZry7Xw15Jw1jyr4rXF45tFWDJr10gFy09r4qgr1UXr4kXr13
 G3W8XrZxZr43JFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
 8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
 xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
 8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E
 87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
 ZFpf9x0JUywZ7UUUUU=
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


On 2022/5/8 上午5:55, Richard Henderson wrote:
> On 4/29/22 05:07, Xiaojuan Yang wrote:
>> +/*
>> + * Shift bits and filed mask
>> + */
>> +#define TOY_MON_MASK   0x3f
>> +#define TOY_DAY_MASK   0x1f
>> +#define TOY_HOUR_MASK  0x1f
>> +#define TOY_MIN_MASK   0x3f
>> +#define TOY_SEC_MASK   0x3f
>> +#define TOY_MSEC_MASK  0xf
>> +
>> +#define TOY_MON_SHIFT  26
>> +#define TOY_DAY_SHIFT  21
>> +#define TOY_HOUR_SHIFT 16
>> +#define TOY_MIN_SHIFT  10
>> +#define TOY_SEC_SHIFT  4
>> +#define TOY_MSEC_SHIFT 0
>> +
>> +#define TOY_MATCH_YEAR_MASK  0x3f
>> +#define TOY_MATCH_MON_MASK   0xf
>> +#define TOY_MATCH_DAY_MASK   0x1f
>> +#define TOY_MATCH_HOUR_MASK  0x1f
>> +#define TOY_MATCH_MIN_MASK   0x3f
>> +#define TOY_MATCH_SEC_MASK   0x3f
>> +
>> +#define TOY_MATCH_YEAR_SHIFT 26
>> +#define TOY_MATCH_MON_SHIFT  22
>> +#define TOY_MATCH_DAY_SHIFT  17
>> +#define TOY_MATCH_HOUR_SHIFT 12
>> +#define TOY_MATCH_MIN_SHIFT  6
>> +#define TOY_MATCH_SEC_SHIFT  0
>
> While this is ok, it would be better to use <hw/registerfields.h>
> This becomes
>
> FIELD(TOY, MON, 26, 6)
> FIELD(TOY, DAY, 21, 5)
> FIELD(TOY, HOUR, 16, 5)
>
> You then extract with FIELD_EX32(val, TOY, MON), etc.
>
> I will also mention that "millisec" is misnamed in the documentation.  
> Since it represents units of 0.1 seconds, the prefix should be "deci".
>
Thanks very much, i changed it to this format:

+FIELD(TOY, MON, 26, 6)
+FIELD(TOY, DAY, 21, 5)
+FIELD(TOY, HOUR, 16, 5)
+FIELD(TOY, MIN, 10, 6)
+FIELD(TOY, SEC, 4, 6)
+FIELD(TOY, MSEC, 0, 4)
+
+FIELD(TOY_MATCH, YEAR, 26, 6)
+FIELD(TOY_MATCH, MON, 22, 4)
+FIELD(TOY_MATCH, DAY, 17, 5)
+FIELD(TOY_MATCH, HOUR, 12, 5)
+FIELD(TOY_MATCH, MIN, 6, 6)
+FIELD(TOY_MATCH, SEC, 0, 6)
+
+FIELD(RTC_CTRL, RTCEN, 13, 1)
+FIELD(RTC_CTRL, TOYEN, 11, 1)
+FIELD(RTC_CTRL, EO, 8, 1)

  get time from the value, like this:
...
case SYS_TOYWRITE0:
          qemu_get_timedate(&tm, s->offset);
+        tm.tm_sec = FIELD_EX32(val, TOY, SEC);
+        tm.tm_min = FIELD_EX32(val, TOY, MIN);
+        tm.tm_hour = FIELD_EX32(val, TOY, HOUR);
+        tm.tm_mday = FIELD_EX32(val, TOY, DAY);
+        tm.tm_mon = FIELD_EX32(val, TOY, MON) - 1;
...

>> +#define TOY_ENABLE_BIT (1U << 11)
> ...
>> +enum {
>> +    TOYEN = 1UL << 11,
>> +    RTCEN = 1UL << 13,
>> +};
>
> You have two copies of the same bit.  It would be best to fill in the 
> rest of the bits in RTCCTRL, using FIELD().
>
>> +    case SYS_RTCREAD0:
>> +        val = s->rtccount;
>> +        break;
>
> Surely this needs to examine qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) and 
> scale the offset back to 32kHz.
>
>> +    case SYS_TOYMATCH0:
>> +        s->toymatch[0] = val;
>> +        qemu_get_timedate(&tm, s->offset);
>> +        tm.tm_sec = (val >> TOY_MATCH_SEC_SHIFT) & TOY_MATCH_SEC_MASK;
>> +        tm.tm_min = (val >> TOY_MATCH_MIN_SHIFT) & TOY_MATCH_MIN_MASK;
>> +        tm.tm_hour = ((val >> TOY_MATCH_HOUR_SHIFT) & 
>> TOY_MATCH_HOUR_MASK);
>> +        tm.tm_mday = ((val >> TOY_MATCH_DAY_SHIFT) & 
>> TOY_MATCH_DAY_MASK);
>> +        tm.tm_mon = ((val >> TOY_MATCH_MON_SHIFT) & 
>> TOY_MATCH_MON_MASK) - 1;
>> +        year_diff = ((val >> TOY_MATCH_YEAR_SHIFT) & 
>> TOY_MATCH_YEAR_MASK);
>> +        year_diff = year_diff - (tm.tm_year & TOY_MATCH_YEAR_MASK);
>> +        tm.tm_year = tm.tm_year + year_diff;
>> +        alarm_offset = qemu_timedate_diff(&tm) - s->offset;
>> +        if ((alarm_offset < 0) && (alarm_offset > -5)) {
>> +            alarm_offset = 0;
>> +        }
>> +        expire_time = qemu_clock_get_ms(rtc_clock);
>> +        expire_time += ((alarm_offset * 1000) + 100);
>> +        timer_mod(s->timer, expire_time);
>> +        break;
>> +    case SYS_TOYMATCH1:
>> +        s->toymatch[1] = val;
>> +        break;
>> +    case SYS_TOYMATCH2:
>> +        s->toymatch[2] = val;
>> +        break;
>
> Why does only register 0 affect expire time, and not all 3 registers?
>
Thanks, the toymatch[1]/[2] should also affect expire time. I fixed it 
like this:

+static void rtc_toymatch_write(LS7ARtcState *s, struct tm *tm, uint64_t 
val)
+{
+    int64_t alarm_offset, year_diff, expire_time;
+
+    qemu_get_timedate(tm, s->offset);
+    tm->tm_sec = FIELD_EX32(val, TOY_MATCH, SEC);
+    tm->tm_min = FIELD_EX32(val, TOY_MATCH, MIN);
+    tm->tm_hour = FIELD_EX32(val, TOY_MATCH, HOUR);
+    tm->tm_mday = FIELD_EX32(val, TOY_MATCH, DAY);
+    tm->tm_mon = FIELD_EX32(val, TOY_MATCH, MON) - 1;
+    year_diff = FIELD_EX32(val, TOY_MATCH, MON);
+    year_diff = year_diff - (tm->tm_year & TOY_MATCH_YEAR_MASK);
+    tm->tm_year = tm->tm_year + year_diff;
+    alarm_offset = qemu_timedate_diff(tm) - s->offset;
+    if ((alarm_offset < 0) && (alarm_offset > -5)) {
+        alarm_offset = 0;
+    }
+    expire_time = qemu_clock_get_ms(rtc_clock);
+    expire_time += ((alarm_offset * 1000) + 100);
+    timer_mod(s->timer, expire_time);
+}

...
case SYS_TOYMATCH0:
      s->toymatch[0] = val;
+     rtc_toymatch_write(s, &tm, val);
      break;
case SYS_TOYMATCH1:
     s->toymatch[1] = val;
+    rtc_toymatch_write(s, &tm, val);
     break;
case SYS_TOYMATCH2:
      s->toymatch[2] = val;
+     rtc_toymatch_write(s, &tm, val);
      break;
...
>> +    case SYS_RTCCTRL:
>> +        s->cntrctl = val;
>> +        break;
>
> Need to check REN, TEN, and EO fields.
>
Thanks, i fixed the rtc_ctrl writing function like this:
...
      case SYS_RTCCTRL:
-        s->cntrctl = val;
+        if (FIELD_EX32(val, RTC_CTRL, RTCEN) &&
+            FIELD_EX32(val, RTC_CTRL, TOYEN) &&
+            FIELD_EX32(val, RTC_CTRL, EO)) {
+            s->cntrctl = val;
+        }
...
>> +    case SYS_RTCWRTIE0:
>> +        s->rtccount = val;
>> +        break;
>
> Need to compute a new rtc_offset from QEMU_CLOCK_VIRTUAL, to match 
> RTCREAD0 above.
>
>> +    case SYS_RTCMATCH0:
>> +        s->rtcmatch[0] = val;
>> +        break;
>> +    case SYS_RTCMATCH1:
>> +        val = s->rtcmatch[1];
>> +        break;
>> +    case SYS_RTCMATCH2:
>> +        val = s->rtcmatch[2];
>> +        break;
>
> Why do these not affect expire time?
>
Sorry, i could not understand this very clearly, could you please 
explain it in more detail? Thanks very much.
>> +    d->timer = timer_new_ms(rtc_clock, toy_timer, d);
>> +    timer_mod(d->timer, qemu_clock_get_ms(rtc_clock) + 100);
>
> Where does this number come from?  In any case, after reset I would 
> expect (1) the rtc and toy to be disabled (documentation says must 
> initialize rtcctrl bits) and (2) I would expect all of the comparison 
> registers to be 0 and thus no timer enabled.
> I guess this 100 milliseconds thing is trying to match 1 decisecond 
> from TOYMATCH0?
>
Thanks, I think i should delete the it.

Thanks.
Xiaojuan


