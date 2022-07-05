Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FA5566518
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:34:25 +0200 (CEST)
Received: from localhost ([::1]:45690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8e0m-00014J-Ij
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8dy2-0006ue-Lo
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:31:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8dxy-0003uX-Vc
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657009890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1obvb41oebtqi3jwQOB0iSR/vviQDOM0O90F1W0jlMM=;
 b=QHZj7aHaTZmE8udvKTFhJHXRmFXCYGv8mHqKI6/6ToB3caW8+OovhewHz+BMOUD4sh1QjB
 9UPWCw/K7TKo5vLm+QLOm2eTznY5Y1psFTyAU2J3js+YhVwWVsUsAxAVEhzDVxI3nwAiAa
 gr2hB40NS3/0OMxAIkA9O0cl9jTlKeU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-ihk0hmFyMeSvVN8HTn3zhQ-1; Tue, 05 Jul 2022 04:31:26 -0400
X-MC-Unique: ihk0hmFyMeSvVN8HTn3zhQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 h125-20020a1c2183000000b003a0374f1eb8so8542885wmh.8
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1obvb41oebtqi3jwQOB0iSR/vviQDOM0O90F1W0jlMM=;
 b=M8XGlz28pdvw/XTjVmcM6pPKlvolH8K5cqUFvl5jALbq7lXyd9nn7+k8SZW4AqQ7U2
 bqhWadpXM+n4r0vFxZlioKN87HgVNvPnFjPhrFpUTmJWz440ytWGdkrd/KIJWTxwmhhP
 Rmt6bTX80BePw8l3q1Pw7UZuNw1pYMXmPw65CLrocy3J6ojteunUKNu1mtO5QnT4KMNM
 4T8XAPkV6cNuLlGc0Rb6sPLof2h4/woQuIGhRaFZ0WYeCebqkOp6IBoU4pAABP2ZbdZG
 UCDw5wIH1qY/PHAhJK1Pf4320XWqbkLPFWdWPAYWAlxn+sD9oCXzuiJTHe/il1uqBima
 lrjA==
X-Gm-Message-State: AJIora/c2ktyAaAagfp5nS5Ki2eJ5s/Vgug21chdFio7AxB0HmXLy69I
 f4ht3lG10tNSXga2xczXflyeDpG4kKwAtqEJuS4Ox4JyS/oPJVZ8hpo6rHxVln8Bx9nSe53Vuk7
 TI9cWaK95wNZU8As=
X-Received: by 2002:a05:600c:3510:b0:3a0:f957:116e with SMTP id
 h16-20020a05600c351000b003a0f957116emr34302864wmq.179.1657009885834; 
 Tue, 05 Jul 2022 01:31:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uIlnkBVKgsx8BgUssniiCCl0sRRR2eqXHYePjXH4ShBGUwNeGRvkb5ysYXPDIhMVLvuzgjKA==
X-Received: by 2002:a05:600c:3510:b0:3a0:f957:116e with SMTP id
 h16-20020a05600c351000b003a0f957116emr34302838wmq.179.1657009885553; 
 Tue, 05 Jul 2022 01:31:25 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-21.web.vodafone.de.
 [109.43.176.21]) by smtp.gmail.com with ESMTPSA id
 e29-20020a5d595d000000b0021bc663ed67sm27225471wri.56.2022.07.05.01.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 01:31:25 -0700 (PDT)
Message-ID: <720d6853-1439-5e9e-9d78-21e62a94a4a8@redhat.com>
Date: Tue, 5 Jul 2022 10:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] hw/rtc/ls7a_rtc: Drop unused inline functions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: yangxiaojuan@loongson.cn, gaosong@loongson.cn,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220705082836.1141160-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220705082836.1141160-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 05/07/2022 10.28, Richard Henderson wrote:
> Remove toy_val_to_time_mon and toy_val_to_time_year as unused,
> and to avoid a build failure with clang.  Remove all of the
> other inline markers foo so that this does not creep back in.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/rtc/ls7a_rtc.c | 27 ++++++---------------------
>   1 file changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
> index e8b75701e4..1f9e38a735 100644
> --- a/hw/rtc/ls7a_rtc.c
> +++ b/hw/rtc/ls7a_rtc.c
> @@ -86,46 +86,31 @@ struct LS7ARtcState {
>   };
>   
>   /* switch nanoseconds time to rtc ticks */
> -static inline uint64_t ls7a_rtc_ticks(void)
> +static uint64_t ls7a_rtc_ticks(void)
>   {
>       return qemu_clock_get_ns(rtc_clock) * LS7A_RTC_FREQ / NANOSECONDS_PER_SECOND;
>   }
>   
>   /* switch rtc ticks to nanoseconds */
> -static inline uint64_t ticks_to_ns(uint64_t ticks)
> +static uint64_t ticks_to_ns(uint64_t ticks)
>   {
>       return ticks * NANOSECONDS_PER_SECOND / LS7A_RTC_FREQ;
>   }
>   
> -static inline bool toy_enabled(LS7ARtcState *s)
> +static bool toy_enabled(LS7ARtcState *s)
>   {
>       return FIELD_EX32(s->cntrctl, RTC_CTRL, TOYEN) &&
>              FIELD_EX32(s->cntrctl, RTC_CTRL, EO);
>   }
>   
> -static inline bool rtc_enabled(LS7ARtcState *s)
> +static bool rtc_enabled(LS7ARtcState *s)
>   {
>       return FIELD_EX32(s->cntrctl, RTC_CTRL, RTCEN) &&
>              FIELD_EX32(s->cntrctl, RTC_CTRL, EO);
>   }
>   
> -/* parse toy value to struct tm */
> -static inline void toy_val_to_time_mon(uint64_t toy_val, struct tm *tm)
> -{
> -    tm->tm_sec = FIELD_EX32(toy_val, TOY, SEC);
> -    tm->tm_min = FIELD_EX32(toy_val, TOY, MIN);
> -    tm->tm_hour = FIELD_EX32(toy_val, TOY, HOUR);
> -    tm->tm_mday = FIELD_EX32(toy_val, TOY, DAY);
> -    tm->tm_mon = FIELD_EX32(toy_val, TOY, MON) - 1;
> -}
> -
> -static inline void toy_val_to_time_year(uint64_t toy_year, struct tm *tm)
> -{
> -    tm->tm_year = toy_year;
> -}
> -
>   /* parse struct tm to toy value */
> -static inline uint64_t toy_time_to_val_mon(struct tm *tm)
> +static uint64_t toy_time_to_val_mon(const struct tm *tm)
>   {
>       uint64_t val = 0;
>   
> @@ -137,7 +122,7 @@ static inline uint64_t toy_time_to_val_mon(struct tm *tm)
>       return val;
>   }
>   
> -static inline void toymatch_val_to_time(LS7ARtcState *s, uint64_t val, struct tm *tm)
> +static void toymatch_val_to_time(LS7ARtcState *s, uint64_t val, struct tm *tm)
>   {
>       qemu_get_timedate(tm, s->offset_toy);
>       tm->tm_sec = FIELD_EX32(val, TOY_MATCH, SEC);

I wonder why the other Clang-based CI jobs (running on Linux) did not 
complain about this...?

Reviewed-by: Thomas Huth <thuth@redhat.com>


