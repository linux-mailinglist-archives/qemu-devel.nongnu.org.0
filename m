Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7863722AE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:52:13 +0200 (CEST)
Received: from localhost ([::1]:35834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgU8-0007KQ-FC
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldgSY-0006oO-1e
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:50:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldgSP-00049u-Us
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:50:27 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 j3-20020a05600c4843b02901484662c4ebso154958wmo.0
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zjHsktvM8VAcWn0F296IU1gH84NSjCIOjJq4DTNxp8o=;
 b=owmXafJFAhatym4T+nSXKDbqHrhlivbi9m0pfYWm5sNhdFlISZ8WADxNod7Irspppt
 wKaigyZlICdO1G6MzPhN61dBSYKqoVvRHZ9BOjYb3U1GszqIgs08fFuhT5vJKmMPivXz
 UJzbvhvCyDf/+pXVVg5jGOs5Eyef7wX7Red2JaKxaPytJ8UuzFWDNY9L/Ev+yd5FXa+m
 l+wozlopJSXx2dFrGSNU7nHshRyvhWbZF36DCSNZfl3So6vyLiqvy2M3HpDoO0VrqCVH
 0dMB23gmrk0jMNDNhvhBQcwOujaZwvXVk5wQL2kGjW7SyTr8EgliKQR83A3fAzfJmwgN
 MZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zjHsktvM8VAcWn0F296IU1gH84NSjCIOjJq4DTNxp8o=;
 b=qvwO8xgMFnBEa/+EjJdELUuR/DWVUP4q7CNBEJ9RjbaXIZc8yJfpoLB59cXmWZSTjP
 TknJPNZXKWxD8oD8uzRJHojc6qApk9mL1zjDKsFpz/urq3+e9fLFN883bnbxnKBBKFD4
 DPHe9VJ167OiKZTx6SXUxyXfGrZhsB7upex8El/MJR8ylIOMww50fMcf/AEhdJ9jeCed
 EREmAfVTVn9H+FTk0rwryDP/gCyBEd+id6sb/GOycvAlihTLpvY0nsnhArohdhIFw7On
 epaSW4xCXxuWdmb9yOcdSSxYMx1sZ8m0uU9NfQnUzA1tVR5t+uYAebLpff1XImXY175X
 X5vw==
X-Gm-Message-State: AOAM532xE+r82TNtFPIGZvGC3xX7Hb8OTTkhVjim5a9zmdzHa0Rhh3LQ
 Loc1YWxTpDFs4TbHPH7JxZbc+cFGEEn6yQ==
X-Google-Smtp-Source: ABdhPJx/K0UlY0LRAOmo1fh3Z/M8Olcn3AhdHBLzUDS1qo6osbqEDUBkBG/xD1IlxC+ImNWN+OF1vg==
X-Received: by 2002:a1c:9897:: with SMTP id a145mr653639wme.9.1620078621675;
 Mon, 03 May 2021 14:50:21 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id 61sm14380464wrm.52.2021.05.03.14.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 14:50:20 -0700 (PDT)
Subject: Re: [PATCH v6 07/26] tcg: Add tcg_call_func
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0de997d8-407d-652c-f0ac-cce3365297ea@amsat.org>
Date: Mon, 3 May 2021 23:50:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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

Hi Richard,

On 5/3/21 1:57 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/internal.h | 5 +++++
>  tcg/tcg.c      | 5 ++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/tcg/internal.h b/tcg/internal.h
> index c2d5e9c42f..cd128e2a83 100644
> --- a/tcg/internal.h
> +++ b/tcg/internal.h
> @@ -32,6 +32,11 @@ typedef struct TCGHelperInfo {
>      unsigned typemask;
>  } TCGHelperInfo;
>  
> +static inline void *tcg_call_func(TCGOp *op)
> +{
> +    return (void *)(uintptr_t)op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op)];

Why not return tcg_insn_unit* type?

> +}
> +
>  static inline const TCGHelperInfo *tcg_call_info(TCGOp *op)
>  {
>      return (void *)(uintptr_t)op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op) + 1];
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index d42fa6c956..1e5e165bff 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -2310,7 +2310,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
>              }
>          } else if (c == INDEX_op_call) {
>              const TCGHelperInfo *info = tcg_call_info(op);
> -            void *func;
> +            void *func = tcg_call_func(op);
>  
>              /* variable number of arguments */
>              nb_oargs = TCGOP_CALLO(op);
> @@ -2324,7 +2324,6 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
>               * Note that plugins have a template function for the info,
>               * but the actual function pointer comes from the plugin.
>               */
> -            func = (void *)(uintptr_t)op->args[nb_oargs + nb_iargs];
>              if (func == info->func) {
>                  col += qemu_log("%s", info->name);
>              } else {
> @@ -4346,7 +4345,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
>      int allocate_args;
>      TCGRegSet allocated_regs;
>  
> -    func_addr = (tcg_insn_unit *)(intptr_t)op->args[nb_oargs + nb_iargs];
> +    func_addr = tcg_call_func(op);
>      flags = tcg_call_flags(op);
>  
>      nb_regs = ARRAY_SIZE(tcg_target_call_iarg_regs);
> 


