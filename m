Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107672DA2EF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 23:03:31 +0100 (CET)
Received: from localhost ([::1]:58410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kovwI-0005UL-4p
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 17:03:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kovuu-00052j-Tk
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:02:06 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kovus-00038r-QN
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:02:04 -0500
Received: by mail-wm1-x343.google.com with SMTP id v14so15133259wml.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 14:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MihGWL01vR2v23gUio/O9ymo/xnFGYsxuyxOtxrrSNI=;
 b=m6XUVdyRMIpGCCu3DUtH+pQlf5RzmxAz9z8vUbpZI0LRfMrZbvPAec6Fz9rUquHKW7
 FZdCA5YaqMfARwzOdrB++gwrBhV4MgC1gsU5z87nruGNamq5a05P0aTYSpDKuG+YD1wq
 UXPQEf+/51AZNdSZwNMf5Y1XMuRN9ZGXiB+Kyj4E1OacGRqcArrCugLpgiHfDEVNYrYe
 8aLbbn3vt/YIzoZQ9B98zjec6r7O8z7ZpV8nTqawSyKo1ktOLeoPcVHQqRw3FhgCpnRY
 rbQisorHSynlkPDW6G+B9sb+4hRnv7CMVBRHD6rmhmPXBUPqbv1AfEbzyTmdoRx+Agqx
 utiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MihGWL01vR2v23gUio/O9ymo/xnFGYsxuyxOtxrrSNI=;
 b=E73b9Qq1fkUYxpS4sdfVnNlHh3XQnWCfar0ucT4lELaysn5oCObSnaJNCam2QTllBc
 r8m2QgARTzzfZCo9llyTZyEjwMskPIkytdaI129lF97DefYWeYP8CzuB4Bk7lPY0eBYb
 Pzt4BBGnVC7y+m0/ad2YgVB3YmkQ2FeFHjtkfMZsq+Iy4vgLTwakxNoXZ1bImOba90mi
 QD2vKVSDWPSa+vXQYSDbLPk/E8/zPAUghUSetSabZ9Teg4SGT7U20El0T14EUROTxsKH
 mAieeSYxB2vssyAIFhwg7C9qMHXGrv9yaIfDuci62xWuCoa2SkZKY3R4S/8sDUmpwOWi
 H3JQ==
X-Gm-Message-State: AOAM5307imLZNfyZ7XUxCUC5mqMd3xxaNcxj0LB/K4jkk4UnREfRCsgZ
 5h9j1UgxBI4wvR70xgeQG3E=
X-Google-Smtp-Source: ABdhPJzxK23feOZWuwYUkVffpj7923v4fTkoP5dMg+CaK8nw18fnaUhkHIY1Gito399hJDVm/sjz7g==
X-Received: by 2002:a05:600c:274d:: with SMTP id
 13mr30073725wmw.77.1607983321323; 
 Mon, 14 Dec 2020 14:02:01 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 34sm34117395wrh.78.2020.12.14.14.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 14:02:00 -0800 (PST)
Subject: Re: [PATCH v4 05/43] tcg: Move tcg prologue pointer out of TCGContext
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e1271ac4-5feb-5392-6a64-8243b9875cec@amsat.org>
Date: Mon, 14 Dec 2020 23:01:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201214140314.18544-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 3:02 PM, Richard Henderson wrote:
> This value is constant across all thread-local copies of TCGContext,
> so we might as well move it out of thread-local storage.
> 
> Use the correct function pointer type, and name the variable
> tcg_qemu_tb_exec, which means that we are able to remove the
> macro that does the casting.
> 
> Replace HAVE_TCG_QEMU_TB_EXEC with CONFIG_TCG_INTERPRETER,
> as this is somewhat clearer in intent.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h | 9 ++++-----
>  tcg/tcg.c         | 9 ++++++++-
>  tcg/tci.c         | 3 ++-
>  3 files changed, 14 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index 8ff9dad4ef..9cc412f90c 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -621,7 +621,6 @@ struct TCGContext {
>         here, because there's too much arithmetic throughout that relies
>         on addition and subtraction working on bytes.  Rely on the GCC
>         extension that allows arithmetic on void*.  */
> -    void *code_gen_prologue;
>      void *code_gen_epilogue;
>      void *code_gen_buffer;
>      size_t code_gen_buffer_size;
> @@ -1222,11 +1221,11 @@ static inline unsigned get_mmuidx(TCGMemOpIdx oi)
>  #define TB_EXIT_IDXMAX    1
>  #define TB_EXIT_REQUESTED 3
>  
> -#ifdef HAVE_TCG_QEMU_TB_EXEC
> -uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr);
> +#ifdef CONFIG_TCG_INTERPRETER
> +uintptr_t tcg_qemu_tb_exec(CPUArchState *env, void *tb_ptr);
>  #else
> -# define tcg_qemu_tb_exec(env, tb_ptr) \
> -    ((uintptr_t (*)(void *, void *))tcg_ctx->code_gen_prologue)(env, tb_ptr)
> +typedef uintptr_t tcg_prologue_fn(CPUArchState *env, void *tb_ptr);
> +extern tcg_prologue_fn *tcg_qemu_tb_exec;
>  #endif
>  
>  void tcg_register_jit(void *buf, size_t buf_size);
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 675334e844..67065c2ede 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -162,6 +162,10 @@ static TCGContext **tcg_ctxs;
>  static unsigned int n_tcg_ctxs;
>  TCGv_env cpu_env = 0;
>  
> +#ifndef CONFIG_TCG_INTERPRETER
> +tcg_prologue_fn *tcg_qemu_tb_exec;
> +#endif
> +
>  struct tcg_region_tree {
>      QemuMutex lock;
>      GTree *tree;
> @@ -1055,7 +1059,10 @@ void tcg_prologue_init(TCGContext *s)
>      s->code_ptr = buf0;
>      s->code_buf = buf0;
>      s->data_gen_ptr = NULL;
> -    s->code_gen_prologue = buf0;
> +
> +#ifndef CONFIG_TCG_INTERPRETER
> +    tcg_qemu_tb_exec = (tcg_prologue_fn *)buf0;
> +#endif
>  
>      /* Compute a high-water mark, at which we voluntarily flush the buffer
>         and start over.  The size here is arbitrary, significantly larger
> diff --git a/tcg/tci.c b/tcg/tci.c
> index 82039fd163..d996eb7cf8 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -475,8 +475,9 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
>  #endif
>  
>  /* Interpret pseudo code in tb. */
> -uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
> +uintptr_t tcg_qemu_tb_exec(CPUArchState *env, void *v_tb_ptr)
>  {
> +    uint8_t *tb_ptr = v_tb_ptr;
>      tcg_target_ulong regs[TCG_TARGET_NB_REGS];
>      long tcg_temps[CPU_TEMP_BUF_NLONGS];
>      uintptr_t sp_value = (uintptr_t)(tcg_temps + CPU_TEMP_BUF_NLONGS);
> 


