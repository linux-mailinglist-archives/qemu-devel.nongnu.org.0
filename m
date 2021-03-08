Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75994330BAC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:49:53 +0100 (CET)
Received: from localhost ([::1]:48768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDSS-00056u-F7
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJDR5-0004Dd-8j
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:48:27 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJDR3-0005oc-Ro
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:48:26 -0500
Received: by mail-ej1-x62e.google.com with SMTP id ci14so19282655ejc.7
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 02:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4lPah+8Zzw4mE/ERQLelT6wUkLB+X8v5KZ4ZfSDmnEY=;
 b=KucZLUhNS7OxYisjQ7k++xFFN1YxlXCoUCgsfM0bqOjlnNC3L2+8nNfwLEvyVI82ua
 AVmwsIGKILFXwn54PaZCJe+50OJx5K+q49ixHQq5r6VTiYxugAm+AtLI/5gNwsmjR475
 zlb6YiU6q3yEJtIKwCvtPCc/f1XpPNp4cLnBvbP6XtDo/hrwl+BVqoCUi3grdSt1Ex2J
 0RIzHiEuEtKzcsuR5VQ/RxhfeS6cxlHNRv+6SEHlhw8Q1dG5nlgxq7FTDb55qbuAJIs9
 hOpsb5g7teg8O6s+0/iHe1XjuHjXod5OItPR6LkTg9tPQ8ffB6K5COHyeKFxwR76mF/X
 0TIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4lPah+8Zzw4mE/ERQLelT6wUkLB+X8v5KZ4ZfSDmnEY=;
 b=r4Pw5gyfrlrijR/v1cm2+o+v+p+Lmxvq8rscmaARnwRhh/RcayoFpX4VZ93KXhkhnd
 vIF5fCVGxbIE5xFhzj8yu/OoJZnBUQanXxAGGTOU4+0ZqFgnHet9XlqfXwPLLDXzHJrw
 1d1iRWwNCVWH2Y9Gj2xsXY5YTTQcz2XA0wZefhjidMIMKG3wN4lecPSBkXxE1iO1gFXZ
 I5Jjda1VOwU0vJLHoiIrUuNR9EeVSy7qr3M5EIfvA7+zBn5TXSJ60SDLwI7sNIv7G8Qd
 B0vyTT8THpADIXPskSqfM7ZinkH7FjS67pqa7LrxIm0tmbmWJHzmzi/GGnHAdWw/+Ggj
 Ifhw==
X-Gm-Message-State: AOAM532iFLaH6YOS9d0+lqj1Ktfzv3GVSMkoyER/iqkD6A2jnwVaTkqx
 KfY0ep7364FMjVTaEariWVU=
X-Google-Smtp-Source: ABdhPJzae2VuFEHj28gOAfKNIc/g8IuLBfEooY4IKPNAOnDFwrQPIIFSWO4AW1Xgdlz578TOUmstgg==
X-Received: by 2002:a17:906:2314:: with SMTP id
 l20mr14790088eja.178.1615200504266; 
 Mon, 08 Mar 2021 02:48:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o4sm6533205ejj.45.2021.03.08.02.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 02:48:23 -0800 (PST)
Subject: Re: [RFC PATCH 11/42] target/mips/tx79: Move PCPYH opcode to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-12-f4bug@amsat.org>
 <fdb4b0c2-f2f7-4355-c3ce-7729f108f87e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ea4efce2-3f14-60e9-e4dc-13c9c07b6180@amsat.org>
Date: Mon, 8 Mar 2021 11:48:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <fdb4b0c2-f2f7-4355-c3ce-7729f108f87e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 5:26 PM, Richard Henderson wrote:
> On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
>> +    if (a->rt == 0) {
>> +        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
>> +        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
>> +        return true;
>> +    }
> 
> Is there a good reason not to use gen_load_gpr?

I suppose you meant gen_store_gpr*().

We need to check $rt anyway to not do the deposit calls
if it is non-zero.

As it is mostly code movement, I prefer to keep it as it
for now, we might improve it later.

> 
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

