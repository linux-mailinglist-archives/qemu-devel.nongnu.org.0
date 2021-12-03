Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFDC46795F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 15:24:39 +0100 (CET)
Received: from localhost ([::1]:49322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt9UL-0000pq-IC
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 09:24:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mt9Rp-0006FL-J5
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:22:02 -0500
Received: from [2607:f8b0:4864:20::633] (port=44589
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mt9Rl-0003sP-EE
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:22:00 -0500
Received: by mail-pl1-x633.google.com with SMTP id q17so2194562plr.11
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 06:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F4Hvvhb3BhmxPlBZaOOvD+jygEG+UEzZzZxFida2t50=;
 b=nuuJKTaSM4SjKhYE0mKHLkVxSGq2XP92qOzs1RNs/gHq1htSft9M+4Owjv/WsA8v1G
 /+Dkdawi8PnH3gbuhmjr7SQ8lJBVrcTtZj6J8bxXPsnoY3K9PgT/03cHHBV5UIKPY4AE
 5xICFIRIzbIQS2RnQVSgqlzG4zcC4pv0X+GZLjwI7zzOGvrYqPVl1ku5fu9HiwZdnmFt
 v5dsi/IiHOZS7sn/EDba51EPKFEeZ42Ti6WMOgmwQ1fzfIseuU3+DpDE0Rpc8Uo10Mwq
 bwrn7pcHrZbvmdNvX9q6zIUa/+gDb/JZs5jX8/QscjR8LzwYzAevqybVnPjusibfzGfn
 OTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F4Hvvhb3BhmxPlBZaOOvD+jygEG+UEzZzZxFida2t50=;
 b=Ng+7HVQy1wENn3XC8uKUbvCPWxXe50SRmiSJLpfwtOYWp+Sv58n3NrCY1HmFC40sqp
 lgC1rDoDFOq1Exd5P8X8kQXDLvLn5IDndCvYy6/D6FIHTu10FPDZIV+llXSp6lnsrSjY
 qRIP0mYa15evJTl42pvijgpXuFsXdus3La5R3ZnPRjNNDebzxhviTaqBd485zeCkRWaq
 MdOH/ie3DcwX63g3/oYRhsI3kyJMxBKF4BoctsnpgraSY3uNSK1EJRvS1X7FXqEH1CHU
 6HEmlK5Y6eiDzlG9d6PZDmK5EOW9Mu6rtYa2srAmtzRV5dsXy+3SdsZAMqYdATS+qWs8
 UlIw==
X-Gm-Message-State: AOAM532otZntGACDYwWvyCYX1ppUN1RUtkwyyKi9eCoXJdEoVcMlzosG
 pTnHglaz28oduALv7iSmLOcOD03tcOJStg==
X-Google-Smtp-Source: ABdhPJzZ7iaoK9jfoTS8qXsPE0T9LAeKXiGDs7XvcooI5jigtnX/5j2Za32nIhslEI27tA4aiHAzkw==
X-Received: by 2002:a17:902:a60b:b0:142:7621:be0b with SMTP id
 u11-20020a170902a60b00b001427621be0bmr22776567plq.58.1638541314410; 
 Fri, 03 Dec 2021 06:21:54 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t3sm3722105pfj.207.2021.12.03.06.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 06:21:53 -0800 (PST)
Subject: Re: [PATCH v2 08/15] target/m68k: Fix address argument for EXCP_TRACE
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211202204900.50973-1-richard.henderson@linaro.org>
 <20211202204900.50973-9-richard.henderson@linaro.org>
Message-ID: <26119f68-93ee-003e-c016-241185a0938a@linaro.org>
Date: Fri, 3 Dec 2021 06:21:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211202204900.50973-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 12:48 PM, Richard Henderson wrote:
> +static void gen_raise_exception_format2(DisasContext *s, int nr)
> +{
> +    /*
> +     * Pass the address of the insn to the exception handler,
> +     * for recording in the Format $2 (6-word) stack frame.
> +     * Re-use mmu.ar for the purpose, since that's only valid
> +     * after tlb_fill.
> +     */
> +    tcg_gen_st_i32(tcg_constant_i32(s->base.pc_next), cpu_env,
> +                   offsetof(CPUM68KState, mmu.ar));
> +    gen_raise_exception(nr);
> +    s->base.is_jmp = DISAS_NORETURN;
> +}

Hmph, I think this only really works from within m68k_tr_translate_insn. But most of the 
uses are from within m68k_rt_tb_stop, where we have already advanced pc_next to the next 
instruction.

I'm not sure how to test this...


r~

