Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD8664F231
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 21:13:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6H3T-00004r-Sq; Fri, 16 Dec 2022 15:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6H3R-0008Tr-G7
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:11:37 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6H3P-0003jD-MK
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:11:37 -0500
Received: by mail-pl1-x635.google.com with SMTP id g10so3350951plo.11
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 12:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a6aeB6VSrWM1zHfXVvHkjXoNJ4y21hTYm6BdHCxqVw4=;
 b=Lejx0Xzz+fAQggmJjj3Kr7JYY+jdDSFK1VGTCHG+C1eWD9hoP7WaULG/YOOdbI0QtF
 9tZeoJ9tT/7yLEylp5MCadsorHXnbIf53W7kzmD8k2Do6rZ5fQa7++mOdagheBQ1y5Iu
 7Ss1rYpmhgT50CGMNulB5gnZ7W3VNJwhO7D/OxlUbm4kElkm7fa/s3tHHPAcQv359bU2
 cSASyX48otpuLYPdMTXFNoVDfXLrLtnX/BZYbAapotK+ClLBsvLchhN1eW8PcTj99ux1
 Hr+7zNJHLWeUE5A6CSgTkzaDz1/2p5LKXh0Najo16RfHd5Bvm8MMXoud6f835wLsXN6/
 OsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a6aeB6VSrWM1zHfXVvHkjXoNJ4y21hTYm6BdHCxqVw4=;
 b=pE866rvPEdjCDjQfQArY5GRa23ECZxnzXxUftTJZO8o8zbiPBQW24L18MHTjP9NLxx
 MfhIjB5PiLFNp44/+aUuk09l1rf9j7PF1Un2b6GAf3FGPeCYlwfEsUWrfLsNNGHo9LRY
 jqvIzgI7uq0AlMBZAP8bCfS/+vAYnHmvdVARl0Y5LhBb2ZZWZ8we/tb9otblF8L4t3hz
 3M2QXIRqH6SIwtHrGKjeylm1ayK2sP2+dj9jKC6swtrzg1C5l2A5QkPhKLJp1Sy3VOu2
 SeitF+4AQiPH18XgBtZleV9Ebh652g6BmXSaNDglfSZdYL+df0bpkj+H8HBCD+TIfB/W
 OnoQ==
X-Gm-Message-State: ANoB5pmU5lnae1dYTNUmXWRPMyXu/H0pTgFtzghLMmYmDMuIYjFXBNXU
 qKz+kz9xjwx2OPSuq+tDWLeD3g==
X-Google-Smtp-Source: AA0mqf5EG864+ttbOaQ7chgGZq0cMlR0O1MWC0p4eGUoWTh2MC7nCf47PdotjpOYHK1Ocb3lkVBUUg==
X-Received: by 2002:a17:90a:5d06:b0:219:3812:f254 with SMTP id
 s6-20020a17090a5d0600b002193812f254mr33766835pji.19.1671221493528; 
 Fri, 16 Dec 2022 12:11:33 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 nd10-20020a17090b4cca00b002192a60e900sm5111503pjb.47.2022.12.16.12.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 12:11:32 -0800 (PST)
Message-ID: <789ef457-b6b3-9df7-6663-2a142822569f@linaro.org>
Date: Fri, 16 Dec 2022 12:11:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 04/10] gdbstub: split GDBConnection from main structure
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
 <20221216112206.3171578-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216112206.3171578-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/16/22 03:22, Alex Bennée wrote:
> In preparation for moving user/softmmu specific bits from the main
> gdbstub file we need to separate the connection details to what will
> eventually become an anonymous pointer.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c | 99 +++++++++++++++++++++++++++--------------------
>   1 file changed, 58 insertions(+), 41 deletions(-)
> 
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index be88ca0d71..14ce911bf2 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -342,6 +342,20 @@ enum RSState {
>       RS_CHKSUM1,
>       RS_CHKSUM2,
>   };
> +
> +#ifdef CONFIG_USER_ONLY
> +typedef struct {
> +    int fd;
> +    char *socket_path;
> +    int running_state;
> +} GDBConnection;
> +#else
> +typedef struct {
> +    CharBackend chr;
> +    Chardev *mon_chr;
> +} GDBConnection;
> +#endif

You added the struct tag in the next patch.  Move it back if you need it, otherwise drop it.

> +    GDBConnection *connection;
>       bool multiprocess;
>       GDBProcess *processes;
>       int process_num;
> @@ -392,6 +399,12 @@ static void init_gdbserver_state(void)
>       gdbserver_state.supported_sstep_flags = accel_supported_gdbstub_sstep_flags();
>       gdbserver_state.sstep_flags = SSTEP_ENABLE | SSTEP_NOIRQ | SSTEP_NOTIMER;
>       gdbserver_state.sstep_flags &= gdbserver_state.supported_sstep_flags;
> +
> +    /*
> +     * The following is differs depending on USER/SOFTMMU, we just
> +     * hid it in the typedef.
> +     */
> +    gdbserver_state.connection = g_new(GDBConnection, 1);

Does this structure really need this pointer?

Given that GDBState gdbserver_state is a global singleton, I would imagine that 
GDBConnection gdbserver_{sys,user}_state could also be global singletons, static within 
the two respective implementations.


r~


