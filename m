Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979652DA301
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 23:10:42 +0100 (CET)
Received: from localhost ([::1]:33004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kow3F-0006we-Ff
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 17:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kow2K-0006WK-4X
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:09:44 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kow2I-0003tf-K4
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:09:43 -0500
Received: by mail-wr1-x442.google.com with SMTP id c5so14300573wrp.6
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 14:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mUR1G6d80YSPipWF1EFeWboGIZN+XDZ64qyVu+dL3tw=;
 b=sUM17p75IKfvXf10ZtDbGDOLvfDFSVSUY0Dl/5HkjSsphg9xvSLFDimxwx5YpOHeLr
 8s2GWCzZlXnypKKKe3gcWNPgHkEARtdXs5Y/Z5d+5NvAmgr6akLU2XymsedpTtge3fbl
 NBi7RIC5ngOjszsIT6zvk+wdMaf4Z3tW2ORuyC9HqEfDGugMOm+UABkGXYxuNehNLeo9
 Jht6cmmBJ9IC2SXUJkCMS3TmZklBb5wLOQxuS57yA6qj0cfnUTqknQht+B9CnbEs4Vzo
 Nze1zOHqDWUFcymLRLva/VYmkJkV+oWjZVsOy4YoezT63US8D1f07PvsfGhj4pGg/yFa
 PQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mUR1G6d80YSPipWF1EFeWboGIZN+XDZ64qyVu+dL3tw=;
 b=AnTjEZiUb05WyKrr7Z1eHmWSJmsJZrsKsa+0BNGNAgn8K4y0llpWp6swJm5UnSfyLa
 XhvaSV/718moSOA1bhnMNyxXgdSLwAMHp0xW0L/5H+qiRxtwR6hHF/2eEVVg17qg0n+g
 mUAwGFwU/sZW6sZxHdG300znddY/TJbXFgeJpxwPbrUtbqbgk8210zvDKZRGHRedQrjo
 MRoawu1tLjHaesxX/6BXxsxrUK0wP+i/Z8Wln3W2uRSvd6xuBaKd7D1Oi8DFR6389k9r
 slg54rdV9Kp5GUQs3LlO2FBxtu4R4VdNwJVoYQ4LW0OoWfLKE1cnAdpe4b+2wS39VoLx
 QFHg==
X-Gm-Message-State: AOAM532bw896cU/t0U+GEU4gulvwooeHJbleKcZMKMUmmS2N+JatxePV
 NF/Wt223WshI4DGoM6SO/jtFwoAjs80=
X-Google-Smtp-Source: ABdhPJzeaHwqtPb+WRNztvuIa59dJGhg8DWTSvY20JB1us2e7fB5JKDAdwjPb3R3s+xf0yXMh9i09g==
X-Received: by 2002:a5d:4a10:: with SMTP id m16mr31605136wrq.18.1607983780901; 
 Mon, 14 Dec 2020 14:09:40 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id j59sm5096279wrj.13.2020.12.14.14.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 14:09:39 -0800 (PST)
Subject: Re: [PATCH v4 07/43] tcg: Add in_code_gen_buffer
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0ca448f1-bbd1-36b3-67c7-d430005db00d@amsat.org>
Date: Mon, 14 Dec 2020 23:09:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201214140314.18544-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 3:02 PM, Richard Henderson wrote:
> Create a function to determine if a pointer is within the buffer.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h         |  6 ++++++
>  accel/tcg/translate-all.c | 26 ++++++++------------------
>  2 files changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index bb1e97b13b..e4d0ace44b 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -680,6 +680,12 @@ extern __thread TCGContext *tcg_ctx;
>  extern void *tcg_code_gen_epilogue;
>  extern TCGv_env cpu_env;
>  
> +static inline bool in_code_gen_buffer(const void *p)
> +{
> +    const TCGContext *s = &tcg_init_ctx;
> +    return (size_t)(p - s->code_gen_buffer) <= s->code_gen_buffer_size;

If 'p == s->code_gen_buffer + s->code_gen_buffer_size',
is it really "in" the buffer?

> +}
> +
>  static inline size_t temp_idx(TCGTemp *ts)
>  {
>      ptrdiff_t n = ts - tcg_ctx->temps;
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 4572b4901f..744f97a717 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -392,27 +392,18 @@ void tb_destroy(TranslationBlock *tb)
>  
>  bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
>  {
> -    TranslationBlock *tb;
> -    bool r = false;
> -    uintptr_t check_offset;
> -
> -    /* The host_pc has to be in the region of current code buffer. If
> -     * it is not we will not be able to resolve it here. The two cases
> -     * where host_pc will not be correct are:
> +    /*
> +     * The host_pc has to be in the region of the code buffer.
> +     * If it is not we will not be able to resolve it here.
> +     * The two cases where host_pc will not be correct are:
>       *
>       *  - fault during translation (instruction fetch)
>       *  - fault from helper (not using GETPC() macro)
>       *
>       * Either way we need return early as we can't resolve it here.
> -     *
> -     * We are using unsigned arithmetic so if host_pc <
> -     * tcg_init_ctx.code_gen_buffer check_offset will wrap to way
> -     * above the code_gen_buffer_size
>       */
> -    check_offset = host_pc - (uintptr_t) tcg_init_ctx.code_gen_buffer;
> -
> -    if (check_offset < tcg_init_ctx.code_gen_buffer_size) {
> -        tb = tcg_tb_lookup(host_pc);
> +    if (in_code_gen_buffer((const void *)host_pc)) {
> +        TranslationBlock *tb = tcg_tb_lookup(host_pc);
>          if (tb) {
>              cpu_restore_state_from_tb(cpu, tb, host_pc, will_exit);
>              if (tb_cflags(tb) & CF_NOCACHE) {
> @@ -421,11 +412,10 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
>                  tcg_tb_remove(tb);
>                  tb_destroy(tb);
>              }
> -            r = true;
> +            return true;
>          }
>      }
> -
> -    return r;
> +    return false;
>  }
>  
>  static void page_init(void)
> 


