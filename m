Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8736A318839
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:34:56 +0100 (CET)
Received: from localhost ([::1]:59768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9JH-0008ER-El
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA96b-0001nT-SG
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:21:49 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA96a-000186-5N
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:21:49 -0500
Received: by mail-ej1-x62e.google.com with SMTP id l25so9207299eja.9
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=acSyKHWe5yh5UbRNd6Wx1f1U4j7Bi7hwkk2LkQQNJkU=;
 b=EFnVdSMCjMSpb0d22xMIpRJdZ34ncMjZxc3rzrN+R1CsmwLQrXEvL4Pb/QHLplUHc/
 /Cl+X711Fl//sqyEwtg/7GSNrFpWGUQoiPDxaXb33Xvk8lpo/v9Y1Ppqeee9OjusiPo3
 5LkCRFUEPNyygdx/6LypBNd9kUGdkcWfJll8zgvhD9vdsK4oBOZzNsf27kU0jf0RFvcf
 NR9eTmOOVtzRKVvhpqaUi/GEU9bSi3mHd4FAk4ppoXKBjFBOgs9DxgH7xMTGcWKwJUTw
 +QGGq/s+Pyju4yuWF+9JY23oCQ1zRaDIn4orzOgVajLTMHCFwDEodGgmDn1xA5khctK1
 ETxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=acSyKHWe5yh5UbRNd6Wx1f1U4j7Bi7hwkk2LkQQNJkU=;
 b=I/x3F49mqkhkHrIk6HR7h55wOimaEnQBNnreQ44Yx2esRJOdXIFmbTLSE22wu6mJFz
 Rad0qUs0w8ku5U15hRQZ4rtkvLCjDU6SnEpBZzfnFCcCdEz4vde2ufiIjk6PJms7OIKE
 amMio/yCtZcbG9Y9lTaZUnLu4G7nJsfQalOtnInU3d/VrwNj6Eitp/uzYFlZUpEDKI57
 sSkL+R6o7eGucjGoNz5GLaWmkjLfvkMtCTRWPG4sg8Zwj8FbnpPt0BPRwcmeWmmY16vm
 /GtRCbQemkPxLyxirit6hYDozn7dG5ghoVmyO+N9C7CKuBU3lbLqRdJzyf0qgEJGKA0C
 zuYg==
X-Gm-Message-State: AOAM532WYmfBBz8ZcFpdYMj7tomoi0fwFlAXBSEkZjDdt73U2HVkBpw8
 mFZU43Qf8AOq0ACby8w5IKU=
X-Google-Smtp-Source: ABdhPJyQPYoHzo1/bCoFgu3FvltQ8PyxyuTYq1vskdP6Tk+wqCEW8f0HPtWf0LI93fO9K0IMfJj+yA==
X-Received: by 2002:a17:906:b50:: with SMTP id
 v16mr7497740ejg.298.1613038906546; 
 Thu, 11 Feb 2021 02:21:46 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bk2sm3817982ejb.98.2021.02.11.02.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 02:21:46 -0800 (PST)
Subject: Re: [PATCH v2 16/21] accel/tcg: actually cache our partial icount TB
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-17-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ef56fb67-4424-335f-45d2-a96dcefb1b2f@amsat.org>
Date: Thu, 11 Feb 2021 11:21:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210221053.18050-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 2/10/21 11:10 PM, Alex Bennée wrote:
> When we exit a block under icount with instructions left to execute we
> might need a shorter than normal block to take us to the next
> deterministic event. Instead of creating a throwaway block on demand
> we use the existing compile flags mechanism to ensure we fetch (or
> compile and fetch) a block with exactly the number of instructions we
> need.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210209182749.31323-8-alex.bennee@linaro.org>
> 
> ---
> v2
>   - drop pointless assert
> ---
>  accel/tcg/cpu-exec.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index d9ef69121c..5b6a4fe84b 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -730,16 +730,17 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
>      /* Ensure global icount has gone forward */
>      icount_update(cpu);
>      /* Refill decrementer and continue execution.  */
> -    insns_left = MIN(0xffff, cpu->icount_budget);
> +    insns_left = MIN(CF_COUNT_MASK, cpu->icount_budget);

Can you describe this change a bit please?

>      cpu_neg(cpu)->icount_decr.u16.low = insns_left;
>      cpu->icount_extra = cpu->icount_budget - insns_left;
> -    if (!cpu->icount_extra && insns_left < tb->icount) {
> -        /* Execute any remaining instructions, then let the main loop
> -         * handle the next event.
> -         */
> -        if (insns_left > 0) {
> -            cpu_exec_nocache(cpu, insns_left, tb, false);
> -        }
> +
> +    /*
> +     * If the next tb has more instructions than we have left to
> +     * execute we need to ensure we find/generate a TB with exactly
> +     * insns_left instructions in it.
> +     */
> +    if (!cpu->icount_extra && insns_left > 0 && insns_left < tb->icount)  {
> +        cpu->cflags_next_tb = (tb->cflags & ~CF_COUNT_MASK) | insns_left;
>      }
>  #endif
>  }
> 


