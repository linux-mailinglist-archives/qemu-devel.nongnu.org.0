Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76324436D26
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:56:34 +0200 (CEST)
Received: from localhost ([::1]:60452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdg37-0002JG-Ic
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfmf-0007nm-Oq
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:39:33 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfmc-0006x6-8b
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:39:33 -0400
Received: by mail-pj1-x1031.google.com with SMTP id oa4so1478587pjb.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L6bK8S+2nF6FyT1Sf6rg4dtm9bXgM1Oedv2NGQm6GCk=;
 b=nIp6Cfrfs2pONDtwDuN+EeFgb37X85cCnomj6cpe75py2ZLHOJDO+xPrPmgYduzxg6
 GRJIw33wc+hduJcmw/ApUzAlj+V/hMcUj81qPTMqY/EDLR3ZPHIJa0zrx54+TgwVgquk
 ULiBaMwWBrI4KffTyh/113q/pdng6sqTjycagBNHsZXZzNMdCZSw09UEkoH5LgHAkzGi
 pV+Tkqx6elD7fBSXzMpWO1e/+oqqlLOjVRsU9fv2VuQYjDlZ3vSVza8D+E3eqM23xA+1
 QWCBZeiWukupGuiSkYoJHqdLewLiimFntz4loLTzrK3dr0QoDr/CgimoPPb/beb7QzFz
 xOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L6bK8S+2nF6FyT1Sf6rg4dtm9bXgM1Oedv2NGQm6GCk=;
 b=bMvysA7nO1ZARHbwufy9aWg3akYtGPxnnNZGdlouvNfSaFdW/IeKumOWu7rS70Vh/8
 /3WW7hnXlGodhjsGy7N6JSA017E/y8uMUFb26rkmxBExZcbXVayX5kJqW8RePpnvlOxZ
 AkAsp3g/qLQ7a1B5fHIOaAlhX9SDwoyYEl6QV7U1QQT93aFMxDK91a5u+sDl2Ci3spJl
 8OsvXkcgDUBAUR+ng0LkbTiYDphWEAkMkY5qfg39nvo2m814lkfGozCvrYppx6+M3b+z
 u9yPMMQkiP4fRQhqYATKWR0ycyUqS+4LamvkyF6qidHPFFfg7i+w9GZuqm4ce8okoRFp
 uXbA==
X-Gm-Message-State: AOAM532AmnBd69g4qqlpTQ9vsEdoborOxoXFpxj2nX/nmtLlimZDd/lP
 ViW1YXnVz+cCBF7r2EIcpdMzPA==
X-Google-Smtp-Source: ABdhPJyi+ToIR/HKb097H0D09MaROU2ZQRqDclhsUF6Z0nTuTabmd+GMf+SNJ8CogLcpYLYU7/DMkw==
X-Received: by 2002:a17:90b:4f87:: with SMTP id
 qe7mr9717020pjb.29.1634852368689; 
 Thu, 21 Oct 2021 14:39:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x6sm7760903pfh.77.2021.10.21.14.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 14:39:28 -0700 (PDT)
Subject: Re: [PATCH v3 15/22] target/ppc: Implement DCTFIXQQ
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-16-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dc3ebde7-5f80-9a88-2165-b7b69eda5e05@linaro.org>
Date: Thu, 21 Oct 2021 14:39:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910112624.72748-16-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 4:26 AM, Luis Pires wrote:
> --- a/target/ppc/dfp_helper.c
> +++ b/target/ppc/dfp_helper.c
> @@ -51,6 +51,12 @@ static void set_dfp128(ppc_fprp_t *dfp, ppc_vsr_t *src)
>       dfp[1].VsrD(0) = src->VsrD(1);
>   }
>   
> +static void set_dfp128_to_avr(ppc_avr_t *dst, ppc_vsr_t *src)
> +{
> +    dst->VsrD(0) = src->VsrD(0);
> +    dst->VsrD(1) = src->VsrD(1);
> +}

Given that these two are typedef of one another, I would think this is unnecessary and you 
should just write *dst = *src.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

