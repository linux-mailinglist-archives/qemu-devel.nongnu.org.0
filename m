Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91163A4DEA
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 11:37:28 +0200 (CEST)
Received: from localhost ([::1]:48124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ls051-0006Uy-6W
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 05:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ls046-0005nw-Pv
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 05:36:30 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ls045-0001LX-A2
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 05:36:30 -0400
Received: by mail-wm1-x32c.google.com with SMTP id b205so4621723wmb.3
 for <qemu-devel@nongnu.org>; Sat, 12 Jun 2021 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KDEQuHFcdsxTwXeMt/+rzl196kOKs3pV/3LxM/ALank=;
 b=MlJj/0yO4aDSW1TlhGI4FmNPAIyOzPK/QCoUyz3KqaLrteo2P2ayer04BmpJjsJhY5
 5hEqi6UFuF4hcBFIerIwhT9QlDAE+SFPUdptSLhbcQep4TNeQN8pWWYjkiCL2e8jT6Qf
 On6tz1X+H9C00I+auVyyNli7TASSnk+rtgRAHjbYgNNXnxWVcGDVHKsNIG0ybkDR+y6s
 2bDj4KXhoqSR51aZgbg7zDXrO1o7d304Nv/o21kcrtoyG4zgFHqeHSfVFo4xbhUNjkqz
 dTe++RxgbORa1OexsAO3G4IjL7SeroaCs7G2aFGlupMcz29gEfoj8sj4Jyx/2IMIGakF
 iNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KDEQuHFcdsxTwXeMt/+rzl196kOKs3pV/3LxM/ALank=;
 b=gkbuS74eMrQFsuBAw8kawIL38K79IGt9kiJCC+v8kfFk+t+OtbGeGDkmwVtLQqzCl0
 fXQoAkr5uNPmd/tOdO4lq0/A1sQGIlaQG+7K4G9TjDiYqFDCyaxmZp577R7FyNGugvcV
 LMWZw7yzQmQDDIgNu3xvcwow4ikPKcs4XEKIdjPZdbtSDN+uyF1fi1oLqlc/bge+FXEF
 KxGBiWM3pSFXZRW+7Nk8h3Vyu3KSktro4Xi/Yq5ZwjMRML+31U3/N2oimg9xU61+MbDQ
 OOWUjhAfuGhXBRaLDhLZIy+Y+ouyhVaEDEb5HyBZXzJBYPMe8QXbqa30wTZyB5Ovb4be
 CEkA==
X-Gm-Message-State: AOAM530lDzF3n++IiFqwnk0yXF/XtlzKpVKPOB+P7or0o3PJ0wTmxDJo
 EYsvXb5C6Y4bBCZpr+6JsqwsazDG1eE1zA==
X-Google-Smtp-Source: ABdhPJww9tw/bZJg2Psr25kvHMjXgIlxA19s3UfhThAhjH79N/oucr50EZ2ScPcGnjr1gcW5CQqHdg==
X-Received: by 2002:a1c:98d0:: with SMTP id a199mr24114292wme.22.1623490586468; 
 Sat, 12 Jun 2021 02:36:26 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id j7sm9986453wrm.93.2021.06.12.02.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jun 2021 02:36:26 -0700 (PDT)
Subject: Re: [PATCH v7 22/27] tcg/tci: Implement add2, sub2
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8f985e22-606e-397c-b81c-a647be309927@amsat.org>
Date: Sat, 12 Jun 2021 11:36:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601150106.12761-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 6/1/21 5:01 PM, Richard Henderson wrote:
> We already had the 32-bit versions for a 32-bit host; expand this
> to 64-bit hosts as well.  The 64-bit opcodes are new.
> 
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.h     |  8 ++++----
>  tcg/tci.c                | 40 ++++++++++++++++++++++++++--------------
>  tcg/tci/tcg-target.c.inc | 15 ++++++++-------
>  3 files changed, 38 insertions(+), 25 deletions(-)

> +#if TCG_TARGET_HAS_add2_i64
> +        case INDEX_op_add2_i64:
> +            tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
> +            T1 = regs[r2] + regs[r4];

// lo

> +            T2 = regs[r3] + regs[r5] + (T1 < regs[r2]);

// hi + lo ovf

> +            regs[r0] = T1;

// lo

> +            regs[r1] = T2;

// hi

OK.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +            break;
> +#endif
> +#if TCG_TARGET_HAS_add2_i64
> +        case INDEX_op_sub2_i64:
> +            tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
> +            T1 = regs[r2] - regs[r4];
> +            T2 = regs[r3] - regs[r5] - (regs[r2] < regs[r4]);
> +            regs[r0] = T1;
> +            regs[r1] = T2;
> +            break;
> +#endif

