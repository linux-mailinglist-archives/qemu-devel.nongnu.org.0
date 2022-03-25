Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D414E7A5B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:11:19 +0100 (CET)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpLC-0004QM-At
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:11:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpJS-0002yK-EL
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:09:30 -0400
Received: from [2607:f8b0:4864:20::32c] (port=36848
 helo=mail-ot1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpJR-0000xf-0f
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:09:30 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 y3-20020a056830070300b005cd9c4d03feso6173669ots.3
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 12:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3hgdcuJnMm6HSry+sTojQ91VOdTDoe1ye23EJ8Y1IXM=;
 b=ms142k8t3a29RBoCIntA7wF3SKxvro2GcMaUkDblmkMG/GZtiNxJOuLLrZ6uaJElq7
 4tFOwlDDcl1Ogw8H2tqQC1z52K8n0ObMvgjkcM3Kghvxh7GsTe+q17uOVfT4NlZFiivf
 GfvukML3UpZHz2TegRM0m08cjml2VOqGYN87o8wSnug6WWg18E6exxdbbkETZK5n1u4Z
 X79hIGY/OVqxWNlVt63KPRSTCAvkG8nAXcAkzrxvsaBYlFmTVo2ogeh6EUHBCtTgpWO+
 6UaeIAjQbTB66//SiGBNwsuAV7wZ4cTtjSWihEakbYkHGyTnuPJbnwJz6UNAATN/ArqM
 Bmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3hgdcuJnMm6HSry+sTojQ91VOdTDoe1ye23EJ8Y1IXM=;
 b=z38mKnrvmLyfjWI0mDKY++KmjKVCxcjCl6y8z70PRbZN7Tq9PVRUCu8ZR6247c8BKI
 qNzsuwtLS+nA1Q14X3rdjwzLwBocMSdkPysDbRzSkwR3jRDCO9xJNN8CjUf2/R4Zh46L
 cihKQD0fkcYQ5suA87WyJ2tCKtFmYS86l+oCx+5mJ0i/cwkUu7CHFBPcPRaruPOrVJlz
 UUGrh/8cNAxaMlGvwfk4g5sqaMNAME0xZV6lbNUC6G3rq1/3XQ6/5YXwLhBZLHrB4p19
 SsFZ53WaaR7TZ1BmtdOHTHaNBELiSyI6j/0s+HM9X0lWFqhl6dyvQkajB5JSE09fR9GP
 tr1w==
X-Gm-Message-State: AOAM532fY4fHAOyLUX/2yZEWGNorO4HjIjRvvsRguASjUhA6humyT0pI
 CUqxKecBRTKGFQUhKWEKQPkpYQ==
X-Google-Smtp-Source: ABdhPJyfGFELeT887XCFh6mC0T+48KlgKC/LnHsMpb+9Ft/AyIej6tk5f63q/a637bhbsz5Z4NLlJA==
X-Received: by 2002:a9d:5f16:0:b0:5cb:51de:6761 with SMTP id
 f22-20020a9d5f16000000b005cb51de6761mr5092726oti.139.1648235367842; 
 Fri, 25 Mar 2022 12:09:27 -0700 (PDT)
Received: from [172.24.8.129] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 v21-20020a4ade95000000b00320f814c73bsm2851413oou.47.2022.03.25.12.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 12:09:27 -0700 (PDT)
Message-ID: <9ca3c82a-c657-91db-8fcf-4fd14476d91d@linaro.org>
Date: Fri, 25 Mar 2022 13:09:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/7] linux-user/nios2: Use QEMU_ESIGRETURN from
 do_rt_sigreturn
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
 <20220320160009.2665152-7-richard.henderson@linaro.org>
 <CAFEAcA_H5u=86Sa4ii86E78ych8Pu9yZx-3fHWf9+E_jsuKfgg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_H5u=86Sa4ii86E78ych8Pu9yZx-3fHWf9+E_jsuKfgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/22 06:16, Peter Maydell wrote:
>> +    return -QEMU_ESIGRETURN;
>>
>>   badframe:
>>       unlock_user_struct(frame, frame_addr, 0);
> 
> Don't you also need to return -QEMU_ESIGRETURN in the badframe
> error-handling case? The other guest architecture implementations
> of do_sigreturn seem to do that.

Yep, good catch.

r~

