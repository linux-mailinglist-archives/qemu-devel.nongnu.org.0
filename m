Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE4E6C2FC8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 12:08:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peZpq-0002Pe-JS; Tue, 21 Mar 2023 07:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1peZpj-0002PB-QK
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 07:07:18 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1peZpi-0003eI-7k
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 07:07:15 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-177ca271cb8so15877202fac.2
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 04:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679396832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GfJb9TcVVQPMgzv83G7iVHgwIBpZPgbcLNwNqy57ImY=;
 b=ezq3BiI4VvKM6GdgjpzBm9Pra85VGiu0nIvOU1bLjtj9hDBAGt52VH306wdSRbraJ8
 H++rx4gSY38EklLAuyu0WavR0tHAVq00LDwm0re4oGMViWj8g7Jwy3U5dqhWpAAAMlxc
 fAUEVHmedfalBBI9W9zSdWVc2vJ6g3yL/R1Jzrl0qXXtqAyXyYupY2kQpL9V4UC+yk/X
 kqw9YbCq6v7Q8qNg3omkRBAr6IBBVccEw8b37NeDT7mgzRvLMoovaRhlEZe7ZV15lEvp
 lbLTXQaQm06i6ykRudaTohtyrHRiN45/N7H4aiCkW1Dew7LJ91Fg797pjbnJSW9TZJ9M
 zMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679396832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GfJb9TcVVQPMgzv83G7iVHgwIBpZPgbcLNwNqy57ImY=;
 b=ymiR8aC2bXDEe8VSkTnO39XQ5CimFVFn+5iiNr1nhb7x66iuZTlGi4l2j/QzOo66zn
 pJ7y/E7eMh91prP5c3kaj4Nv7/WuH5Op3kMumsVp1wKxyoVAmVF1HCKntAUxl6O7/mTA
 xMauoJoFBNVShcQH+hfsN4TICpCmvSWeILgQM0BUeSDiyVvtRcBi1Vq2xnVdcdNoy9wQ
 8QADtciCs1CE7h7uF7yVCTTdd3GIFqELBbQsHskyMGgHbpiA6vDcwPrHFbqZaW0wL5ci
 2pFFrkIz1aOb/qJlnjHd8sgthdDw2ZMfcAKgr3APj/YImez4nGJfDn4meU5+2MqEQXZT
 oMlg==
X-Gm-Message-State: AO0yUKXcDEs3ApOp/MG//qIbndc6MxDDUy/xzhdBfScUSnz0fNRUx1lm
 XNHywnKHwlejJiOe+41G3C4=
X-Google-Smtp-Source: AK7set/gERklWB5mV1YaKBqn389a9uqsYH7YKEHJKdMj0uJPqChO6Gu9sPkYlAcuiADthEjODCKsWg==
X-Received: by 2002:a05:6870:b616:b0:17e:47db:989e with SMTP id
 cm22-20020a056870b61600b0017e47db989emr834554oab.56.1679396831497; 
 Tue, 21 Mar 2023 04:07:11 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59?
 ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 t26-20020a05683014da00b0068d752f1870sm4976494otq.5.2023.03.21.04.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 04:07:11 -0700 (PDT)
Message-ID: <66d0426d-19ef-00d4-19e8-7d65c8e256c9@gmail.com>
Date: Tue, 21 Mar 2023 08:07:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0 3/3] target/ppc: Fix helper_pminsn() prototype
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230321083322.663561-1-clg@kaod.org>
 <20230321083322.663561-4-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230321083322.663561-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 3/21/23 05:33, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> GCC13 reports an error:
> 
> ../target/ppc/excp_helper.c:2625:6: error: conflicting types for ‘helper_pminsn’ due to enum/integer mismatch; have ‘void(CPUPPCState *, powerpc_pm_insn_t)’ {aka ‘void(struct CPUArchState *, powerpc_pm_insn_t)’} [-Werror=enum-int-mismatch]
>   2625 | void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
>        |      ^~~~~~~~~~~~~
> In file included from /home/legoater/work/qemu/qemu.git/include/qemu/osdep.h:49,
>                   from ../target/ppc/excp_helper.c:19:
> /home/legoater/work/qemu/qemu.git/include/exec/helper-head.h:23:27: note: previous declaration of ‘helper_pminsn’ with type ‘void(CPUArchState *, uint32_t)’ {aka ‘void(CPUArchState *, unsigned int)’}
>     23 | #define HELPER(name) glue(helper_, name)
>        |                           ^~~~~~~
> 
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Fixes: 7778a575c7 ("ppc: Add P7/P8 Power Management instructions")
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/excp_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 287659c74d..199328f4b6 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -2622,7 +2622,7 @@ void helper_scv(CPUPPCState *env, uint32_t lev)
>       }
>   }
>   
> -void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
> +void helper_pminsn(CPUPPCState *env, uint32_t insn)
>   {
>       CPUState *cs;
>   

