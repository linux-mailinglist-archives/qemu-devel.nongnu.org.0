Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD6F69EBB1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 01:09:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUchQ-0004FY-4j; Tue, 21 Feb 2023 19:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUchK-00044W-GV
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 19:09:26 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUchH-0002vB-PZ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 19:09:26 -0500
Received: by mail-pj1-x1035.google.com with SMTP id y2so2674769pjg.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 16:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P3ANgmzBX0gQHq68hMpCCdGBs8Ma1plXZMaMTNQ14ik=;
 b=cuaFSfYs4wGsDakJ2bGnfBCd2ccjPR9gpZgO1FwQtWLfcfmv6bI7HFMKhtO5Hj6yzH
 AnhVKn1tX7WIEavbF6iYcXxAUt1dLF9PY8Vs5YBIksKj+9ITixQa8XA0B4SC4I8XRtAS
 Jn9rHfYooUUUP/QgmJLjsB7DCblA2lCAZ9hDl0ICJlDdhKJwEmwZyG6yVogoMEiioiGO
 Our1E9JynPJPoPwZDYdxNkbUy16EWfNeH72lLtIGvSl8TPEzVqu58Ia/mHXGnQ9rAHtK
 vYNs0NqC5zj+lG9C+Mxj0kAbyvoQat8UuwVXxTclJPf48PMIvyJuItPux21ltEEKH5+n
 Bh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P3ANgmzBX0gQHq68hMpCCdGBs8Ma1plXZMaMTNQ14ik=;
 b=rcAO4UBwoInKuUFltsUNJQPksoVAkU0NKtXFh1KQuaZqqnhnH/eqqk/C9/aM3xjUsN
 kkwuppi9Jp7CcDMOy/aKcyahLhTlBWKMqNkX/XyinC61ZCOpEJBryDCPQKtgFeKv+JFi
 xy8yeisPGnhtTh56wGHJyzIZLteJkp4nXLD90J7Z0XH6keDmU+ZcN33Z/1RAJkRqqt5g
 XnrYe7Nar0V+BTmR7ADhWuovzMxbOiL4tCmOH0n6xr7gjYWU0wkqFLT1XqBrIJYsOGrL
 xjtdUa7am6P1b+klh7nGPb1ec5HBBISeTsbOg+3O8dHMIkvxQSK51xJmCagq2CJXL63S
 sTzg==
X-Gm-Message-State: AO0yUKVvFq4bBuPZ03sAtAZFkJhj/T7Y6ktc+jy6UArGKaDtiFrigxwZ
 CG62wYTBAH8cZZPGp6+cn1noNA==
X-Google-Smtp-Source: AK7set+mLMq5ilgk5MqU5Pl1a7WNC44dejq4OIQk2+RhTH6nECEQUCt+AxnrhMOnImj9E+wp7YnnBA==
X-Received: by 2002:a17:902:c408:b0:19a:b869:f2ef with SMTP id
 k8-20020a170902c40800b0019ab869f2efmr9413078plk.15.1677024562375; 
 Tue, 21 Feb 2023 16:09:22 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 ja17-20020a170902efd100b0019acd3151d0sm5139862plb.114.2023.02.21.16.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 16:09:21 -0800 (PST)
Message-ID: <c15e3031-66f3-12a6-d867-13b9a93a526f@linaro.org>
Date: Tue, 21 Feb 2023 14:09:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/5] block/vvfat: Remove pointless check of NDEBUG
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230221232520.14480-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/21/23 13:25, Philippe Mathieu-Daudé wrote:
> Since commit 262a69f428 ("osdep.h: Prohibit disabling
> assert() in supported builds") 'NDEBUG' can not be defined,
> so '#ifndef NDEBUG' is dead code. Remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   block/vvfat.c | 3 ---
>   1 file changed, 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/block/vvfat.c b/block/vvfat.c
> index d7d775bd2c..fd45e86416 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -2784,13 +2784,10 @@ static int handle_commits(BDRVVVFATState* s)
>               fail = -2;
>               break;
>           case ACTION_WRITEOUT: {
> -#ifndef NDEBUG
> -            /* these variables are only used by assert() below */
>               direntry_t* entry = array_get(&(s->directory),
>                       commit->param.writeout.dir_index);
>               uint32_t begin = begin_of_direntry(entry);
>               mapping_t* mapping = find_mapping_for_cluster(s, begin);
> -#endif
>   
>               assert(mapping);
>               assert(mapping->begin == begin);


