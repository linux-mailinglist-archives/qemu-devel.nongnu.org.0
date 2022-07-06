Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86EF56911E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 19:53:06 +0200 (CEST)
Received: from localhost ([::1]:41098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o99Cz-00066D-Tz
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 13:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o99Au-00048R-PI
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 13:50:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o99Ar-0006pE-Mr
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 13:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657129852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kL/oLaOPCbMfPcdaFawJxcv+Qs7ZXO1CwqJGZ3Fv6SE=;
 b=eR9qkT74bTkclIGWacWYPa8zKUdb9GBZX6bE32M4SP2i207rZ+9gC16aKfn1EgmCcGlsrT
 mai2yAS+5tN3272WxyRHkDfsQuv6zMKOcBFYR88qyNZs1Men+DiE8bkyft6smfQmNCVK7f
 3ttGNdjp8rjaXAH0z6NzqYG1ntU7Fks=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-RiD-duW1NnaIALyOOHoLoQ-1; Wed, 06 Jul 2022 13:50:51 -0400
X-MC-Unique: RiD-duW1NnaIALyOOHoLoQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n18-20020a05600c501200b003a050cc39a0so6941376wmr.7
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 10:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kL/oLaOPCbMfPcdaFawJxcv+Qs7ZXO1CwqJGZ3Fv6SE=;
 b=kyn48kns/sY81i8lKIt9gqLo1nGYLT6pjYyc+NzczTObpD84G2iXBFwiQR3D/Y1xTK
 D5gZHlI3KjQw/S4qs6uWyV7s9HH2lndlzPr8bdURTHJpcWe6FB0/B/UMZzL6foBW1/V4
 lHhWG3mq9nuhQ6gZiUCFIb++BVOfLgr7AKy5nzveZhcG6Z+LnbnMrbOGPcskg/kOBYzm
 OdrryVGBUXIUxFMjredrCzzPzGI7C5BQKVGNM45woIERSnOIsbPvGOfYYaPyPPCXs8nD
 Y+f/hgf2FvHrAkAni5QHBfZMLzJGF7Gc864a0Q5dd5ONPIq91v1/2Ke/smGkGaD4ZsGO
 3M3w==
X-Gm-Message-State: AJIora83l7tnZs6CUaG4x2b/Uo1oaO4+8bh9I2fLgYe53M+XuyWeXvJe
 3CoPYVBMwBewdfi3kDdEfukybU/r/Axli+lEjqhm5gdcivxuSbZgXMvZFKkRgSSK4Jv8EUHTSG/
 FlnfsXm5NCo9Npk4=
X-Received: by 2002:a5d:5608:0:b0:21d:6be8:4944 with SMTP id
 l8-20020a5d5608000000b0021d6be84944mr16170283wrv.613.1657129850252; 
 Wed, 06 Jul 2022 10:50:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUkjIWHAJLWQ89pPYF8Rt0dmavtBvlFuntH0VjFdBXryZEMcWnPUQtbM3aaOG5A4dlWqkhlQ==
X-Received: by 2002:a5d:5608:0:b0:21d:6be8:4944 with SMTP id
 l8-20020a5d5608000000b0021d6be84944mr16170271wrv.613.1657129850062; 
 Wed, 06 Jul 2022 10:50:50 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com.
 [80.187.98.39]) by smtp.gmail.com with ESMTPSA id
 q9-20020adfdfc9000000b0021d6ec32fdesm6843113wrn.74.2022.07.06.10.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 10:50:49 -0700 (PDT)
Message-ID: <eacfad1b-c6a7-0550-ed1d-5835e032c97e@redhat.com>
Date: Wed, 6 Jul 2022 19:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/4] target/s390x: Exit tb after executing ex_value
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: svens@linux.ibm.com, qemu-s390x@nongnu.org
References: <20220702060228.420454-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220702060228.420454-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/07/2022 08.02, Richard Henderson wrote:
> Ok, version 1 didn't work, so once more with feeling.
> Can you give it a try, Sven?
> 
> 
> r~
> 
> 
> Richard Henderson (4):
>    target/s390x: Remove DISAS_GOTO_TB
>    target/s390x: Remove DISAS_PC_STALE
>    target/s390x: Remove DISAS_PC_STALE_NOCHAIN
>    target/s390x: Exit tb after executing ex_value
> 
>   target/s390x/tcg/translate.c | 42 +++++++++++++++---------------------
>   1 file changed, 17 insertions(+), 25 deletions(-)
> 

Thanks, queued to my s390x-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


