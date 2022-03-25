Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFE54E75A7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 16:04:20 +0100 (CET)
Received: from localhost ([::1]:54526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXlUB-00046s-43
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 11:04:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXlQh-0008JP-2I
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 11:00:45 -0400
Received: from [2607:f8b0:4864:20::232] (port=43878
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXlQf-0004ps-Dh
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 11:00:42 -0400
Received: by mail-oi1-x232.google.com with SMTP id w127so8394620oig.10
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 08:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=21WrEwm+iKPvZqfL+OFo5clmBf0Fq8epx3HlOXKEQxM=;
 b=E13CJ/NKu6ue0c8bFoJKuvxLuLjW3ZUJHWxCao2ELA0XvA4J+nLrtxBFknGlVRBl4e
 r1dDddN8a4SXmseSP4l2PUQ8Ze1hwhD/cwklQDUnGFv/15/UUXmbXcyLppOlqKOJvgay
 S4Mop4/xva51q9rJg6SYkLb1tvRbzgvvG9lP7yryt1gxycQPajnvN2JOQm2pL/wEIyTW
 L+aPV18oEvMQAaufhBaK71/cgVWoE1nR4yvSG7/A/LaFq7cWFAruIoYjh/AuolI+05SS
 Dry7IsuIuS7/SZKajlIrVlGXeLxzAvwlQJfTVKxOzurfykaT4nw983pcDR8SWuAIv+cw
 bgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=21WrEwm+iKPvZqfL+OFo5clmBf0Fq8epx3HlOXKEQxM=;
 b=WlABhXowkBhapaaYw0UtTkY6/yNHTr93FqsBoZ4YCkc7q0tXnQ1YHclAfkEQtY3TGk
 6t20RVCRIG3OUh5SJsdlrzTu8fU1p9na+JmoOGmUa5woK+yhBz0Fn/LmfJsPbvoks7Wt
 fUg9a7RnjUOtuOCYMRudTnad3xuem7jbWux0JXeydV3vwPXbgwOvw5aOjpeu4gTYd+U3
 ZstDZtLhMsTEz15TNl6t/GBkNxxmHAHlVOM11cWHsE8BWv3itjyMHQly/QzSlmttxxtb
 CrErLqfxjRTkXLEHWNNL9rQ1hyEyAyY9FF11H55LsR3IukzJb3tiDLDgpWD/fn0R3F69
 7RCQ==
X-Gm-Message-State: AOAM53049bSErggUhpzZaZWd8fI1B7cnrb9vRY36qYtbNo/xgWKHRivE
 D+lB+o3O07PLnIznxR3ZXJOvdhFS0tfnsCoXvNQ=
X-Google-Smtp-Source: ABdhPJwM9p3U8I5XtSAayEXULyIk5h6l1QaOIM1cn67gWT8jYOuH8QFQajP/xNBJ/efwRChlS/TB/Q==
X-Received: by 2002:a05:6808:2004:b0:2da:cf4:feb with SMTP id
 q4-20020a056808200400b002da0cf40febmr5397165oiw.50.1648220440151; 
 Fri, 25 Mar 2022 08:00:40 -0700 (PDT)
Received: from [172.24.8.129] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 i4-20020a4addc4000000b00324bd261e5fsm2255039oov.11.2022.03.25.08.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 08:00:39 -0700 (PDT)
Message-ID: <731db1db-50e1-cd10-7e70-fe0d37afac07@linaro.org>
Date: Fri, 25 Mar 2022 09:00:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL for-7.1 08/36] *: Use fprintf between qemu_log_lock/unlock
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-9-richard.henderson@linaro.org>
 <87a6dg4m2h.fsf@linaro.org> <3df76126-e4ab-7821-831a-c1a21e31fbc5@linaro.org>
 <87sfr72zd9.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87sfr72zd9.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/22 08:30, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 3/23/22 10:22, Alex Bennée wrote:
>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>
>>>> Inside qemu_log, we perform qemu_log_lock/unlock, which need
>>>> not be done if we have already performed the lock beforehand.
>>>>
>>>> Always check the result of qemu_log_lock -- only checking
>>>> qemu_loglevel_mask races with the acquisition of the lock
>>>> on the logfile.
>>> I'm not sure I like introducing all these raw fprintfs over
>>> introducing
>>> a function like qemu_log__locked().
>>
>> There's no way to implement qemu_log__locked with rcu.  The lookup
>> itself is what needs the locking; the return value of the FILE* is
>> then valid until the unlock.  To lookup the FILE* again would require
>> more atomic operations.
> 
> That's not what I'm suggesting. qemu_log__locked would be a fairly
> simple wrapper around the fprintf:
> 
> modified   include/qemu/log.h
> @@ -70,6 +70,25 @@ void qemu_log_unlock(FILE *fd);
>           }                                               \
>       } while (0)
>   
> +/**
> + * qemu_log__locked() - log to a locked file
> + * @logfile: FILE handle from qemu_log_lock()
> + * @fmt: printf format
> + * ...: varargs
> + */
> +static inline void G_GNUC_PRINTF(2, 3)
> +    qemu_log__locked(FILE *logfile, const char *fmt, ...)
> +{
> +    if (logfile) {
> +        va_list ap;
> +
> +        va_start(ap, fmt);
> +        vfprintf(logfile, fmt, ap);
> +        va_end(ap);
> +    }
> +}

If the lock succeeded, then we *know* that logfile != NULL -- indeed, that is exactly the 
test that is required following qemu_log_lock().  There is no point in structuring the 
code otherwise.

If you remove that, then you're left with

#define qemu_log__locked  fprintf

Can you tell me that's really an improvement?

>> And I do prefer the printfs over repeated qemu_log.
> 
> The main benefit from my point of view is it keeps qemu_log operations
> grouped together and easier to fix if we for example want to tweak how
> we deal with log files in the future.

I can't see that.  If we have a radical adjustment to logfiles that requires something 
other than fprintf, then we're probably going to change the type of logfile too.  At which 
point all of the other existing places that we pass the FILE*, e.g. cpu_dump_state are 
also affected.


r~

