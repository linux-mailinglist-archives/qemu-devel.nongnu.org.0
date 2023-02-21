Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6638069DDF8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:37:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQ0S-0005an-Q9; Tue, 21 Feb 2023 05:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUQ0Q-0005aW-ML
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:36:18 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUQ0P-0006ux-0K
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:36:18 -0500
Received: by mail-pl1-x630.google.com with SMTP id s5so4440813plg.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sdMF25/JpGQwIy20l3WCkFbrBMHeTHX8gA+5BHVAJCI=;
 b=hK7Kd55XD3AalEXNnlCiygopplcXyLHouogazNDslO6qwCc9UVeE7+ElT47c/HgpYL
 9mBFdLl6hJiUtJYbdQd28ZtdFkcU8j5piddHE+iEYxCzxnsZYrFBHofkHoszGRBSlaPh
 DfWbroF85hT+eupGqu4ybtou1ypHs2gltKNRf5AdfOeyBwRRnVa/XaEsL90pw8KYNSjL
 Cev8VvwuY7O95njLyZNVcmkHpw2Ba52tN8wcnaf2dHsEm6a93EJ77PJqI5oK4xYp3rpF
 z+943S3tqlBGP4ZSuE90Di8AZoALlPxpK/M54z9H15hyO/m7ouz5gveCMLoeSmWcqWQ3
 KRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sdMF25/JpGQwIy20l3WCkFbrBMHeTHX8gA+5BHVAJCI=;
 b=EkMrMewXHBQsc85T8kSl3LLf0mYsNYR/KxcykyIw7vZqLjwJHdVHBB3jB+q/OPmZx4
 NL95ug3GT35KLvz8mXEDmlz4AL8nUWZPJlhvHnMalBIZGXRQT6EXhvSj47PrkbjsN0x1
 ZsRieFgALspWVuFNAJFhFnq2s6DAYChU1A5D4JEVOK3GPjlrmAg+EziQYyVdj2nGqlyA
 +9aXx0C/hrvm0Q8qvgQk43HznIx/jKOjk9a1VQKu/RoGoPV3Gx77dkOLS7+SXwDg5V8R
 2FaTWzn0xs4VDlr/llwaRmF+6r6ywM5FaUZ89y1VwmSZX/f8A7L09fkECOSpeQPr3ykm
 3/UA==
X-Gm-Message-State: AO0yUKVzjbbW3i0vZ/QLemxLzH7NhjtRSPwojJwFLJMZJdS290zrWFTL
 +5gXUBbB9C6TGVYOpdV4fQd8Hw==
X-Google-Smtp-Source: AK7set8/0GmXASM8Wd33ITs002GHgze+zstxN7tvC8cIVdpkQyXqqBFcBaOEtyGcbHntnGcKp5AZzw==
X-Received: by 2002:a17:902:f644:b0:19a:b588:6fe2 with SMTP id
 m4-20020a170902f64400b0019ab5886fe2mr5135482plg.13.1676975774450; 
 Tue, 21 Feb 2023 02:36:14 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 t18-20020a170902d21200b0019337bf957dsm3957156ply.296.2023.02.21.02.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:36:13 -0800 (PST)
Message-ID: <8e5e407e-641a-f3b3-5547-bd0f3076aaf9@linaro.org>
Date: Tue, 21 Feb 2023 00:36:10 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 06/21] gdbstub: move GDBState to shared internals header
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-7-alex.bennee@linaro.org>
 <0daeb57d-28ec-4595-8b2e-32e4e01348d8@linaro.org> <87v8jvqppn.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87v8jvqppn.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/21/23 00:24, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 1/5/23 08:43, Alex Bennée wrote:
>>> We are about to split softmmu and user mode helpers into different
>>> files. To facilitate this we will need to share access to the GDBState
>>> between those files.
>>> To keep building we have to temporarily define CONFIG_USER_ONLY just
>>> before we include internals.h for the user-mode side of things. This
>>> will get removed once the state is fully moved.
>>
>> You don't have to have this hack if you don't ...
>>
>>> +typedef struct GDBState {
>>> +    bool init;       /* have we been initialised? */
>>> +    CPUState *c_cpu; /* current CPU for step/continue ops */
>>> +    CPUState *g_cpu; /* current CPU for other ops */
>>> +    CPUState *query_cpu; /* for q{f|s}ThreadInfo */
>>> +    enum RSState state; /* parsing state */
>>> +    char line_buf[MAX_PACKET_LENGTH];
>>> +    int line_buf_index;
>>> +    int line_sum; /* running checksum */
>>> +    int line_csum; /* checksum at the end of the packet */
>>> +    GByteArray *last_packet;
>>> +    int signal;
>>> +#ifdef CONFIG_USER_ONLY
>>> +    GDBUserState user;
>>> +#else
>>> +    GDBSystemState system;
>>> +#endif
>>
>> ... nest these.  What's the point?
> 
> Well you end up having to ensure the chardev definitions are then
> available in all files that include internals.h and I'm not sure that is
> better:
> 
> --8<---------------cut here---------------start------------->8---
> modified   gdbstub/internals.h
> @@ -33,18 +33,16 @@ enum RSState {
>   };
>   
>   /* Temporary home */
> -#ifdef CONFIG_USER_ONLY
>   typedef struct {
>       int fd;
>       char *socket_path;
>       int running_state;
>   } GDBUserState;
> -#else
> +
>   typedef struct {
>       CharBackend chr;
>       Chardev *mon_chr;
>   } GDBSystemState;
> -#endif

No, these typedefs and their data can be completely private to the two implementations.


r~

