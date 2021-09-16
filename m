Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B8D40D2D7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 07:20:41 +0200 (CEST)
Received: from localhost ([::1]:37274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQjpA-0005PX-0G
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 01:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQjo0-0004kg-2W
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQjnw-0008SC-Aj
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631769563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d9LVP8LmRZsaTQJtdggpaN4EpFnWu9OMDHAUE60RK24=;
 b=hBtBqbEzH13+5/whR3BvdL6cqGEGJtWQzRKf9D+Mkis6SeJK8tleR0Osio3rPQmJ6yc81I
 UoZDV7Zm7ctTQ7JMjS0CtBGes974mUsSsf4pFUgIU6fXdyrQKWn+kx2qfFMstdYl93Z9Sl
 ZwtoljcrJbbgGNeJ6Ez5/Jk/IPR6ivo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-8GbZ2edmOXm_SN4DHW-6KQ-1; Thu, 16 Sep 2021 01:19:18 -0400
X-MC-Unique: 8GbZ2edmOXm_SN4DHW-6KQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so951304wmr.9
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 22:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d9LVP8LmRZsaTQJtdggpaN4EpFnWu9OMDHAUE60RK24=;
 b=SkQ70aPcz01IUN/wDfCHHtCto7Issp6SFiOUEg6HU3IewPOS2oVirBsO1ugSCaJZsW
 ShPRwEvWhNesN5ikEt1mbQ62taAAgrAyWfUzKq0TU110Xu+grP9fGtQRzMG3CUNyXUX8
 tk3+KlJBZZ2pNVkf+ehDIKn9cESziAilkOXB2f3n286hG6e9Yt9f3A0OesjnMYCPk5Qo
 IuDISaZUZ07t9HoXqR8sxZA1rYMZNHGHDmmmY/VqHdyytDUkkSMSqyuff/goaqzA9CTi
 uHG7vtpdnNqspmQ38ZrFDnO8XM5weu2bnvsekda2FeVSfXAuJzjeMNNn0LpuG6/4j0o1
 DMGQ==
X-Gm-Message-State: AOAM533ugBpE7GoQAsTKPmUcnqwOkAQjJ2yWkPRUfcG/FF7oGp6+vaHn
 /FC9Ykt1oNn6ZCbXDR2ojJUg0JZXaoa8Na2MaJHgF7SgUroDXTKB1awnoUxjh3Gx2boWuF5p61E
 UOExQwXQpqeTGHD8=
X-Received: by 2002:adf:fc07:: with SMTP id i7mr3679695wrr.351.1631769557353; 
 Wed, 15 Sep 2021 22:19:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmHkn4voHqpc7B68ix9IsnJyifrxNQ6nowjsbtahk8WBnvg5+JsEYgSUV7SvxooVvXKVUcZw==
X-Received: by 2002:adf:fc07:: with SMTP id i7mr3679685wrr.351.1631769557140; 
 Wed, 15 Sep 2021 22:19:17 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-144-075.46.114.pool.telefonica.de. [46.114.144.75])
 by smtp.gmail.com with ESMTPSA id l15sm6149927wme.42.2021.09.15.22.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 22:19:16 -0700 (PDT)
Subject: Re: [PATCH v5 02/16] tcg/s390x: Rename from tcg/s390
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
 <20210915213114.1923776-3-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9c428ce0-0e24-1d2c-1372-775181599e4b@redhat.com>
Date: Thu, 16 Sep 2021 07:19:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915213114.1923776-3-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/09/2021 23.31, Richard Henderson wrote:
> This emphasizes that we don't support s390, only 64-bit s390x hosts.
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   meson.build                              | 2 --
>   tcg/{s390 => s390x}/tcg-target-con-set.h | 0
>   tcg/{s390 => s390x}/tcg-target-con-str.h | 0
>   tcg/{s390 => s390x}/tcg-target.h         | 0
>   tcg/{s390 => s390x}/tcg-target.c.inc     | 0
>   5 files changed, 2 deletions(-)
>   rename tcg/{s390 => s390x}/tcg-target-con-set.h (100%)
>   rename tcg/{s390 => s390x}/tcg-target-con-str.h (100%)
>   rename tcg/{s390 => s390x}/tcg-target.h (100%)
>   rename tcg/{s390 => s390x}/tcg-target.c.inc (100%)
> 
> diff --git a/meson.build b/meson.build
> index 2711cbb789..1cf370ab56 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -265,8 +265,6 @@ if not get_option('tcg').disabled()
>       tcg_arch = 'tci'
>     elif config_host['ARCH'] == 'sparc64'
>       tcg_arch = 'sparc'
> -  elif config_host['ARCH'] == 's390x'
> -    tcg_arch = 's390'
>     elif config_host['ARCH'] in ['x86_64', 'x32']
>       tcg_arch = 'i386'
>     elif config_host['ARCH'] == 'ppc64'
> diff --git a/tcg/s390/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
> similarity index 100%
> rename from tcg/s390/tcg-target-con-set.h
> rename to tcg/s390x/tcg-target-con-set.h
> diff --git a/tcg/s390/tcg-target-con-str.h b/tcg/s390x/tcg-target-con-str.h
> similarity index 100%
> rename from tcg/s390/tcg-target-con-str.h
> rename to tcg/s390x/tcg-target-con-str.h
> diff --git a/tcg/s390/tcg-target.h b/tcg/s390x/tcg-target.h
> similarity index 100%
> rename from tcg/s390/tcg-target.h
> rename to tcg/s390x/tcg-target.h
> diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> similarity index 100%
> rename from tcg/s390/tcg-target.c.inc
> rename to tcg/s390x/tcg-target.c.inc
> 

Good idea!

Reviewed-by: Thomas Huth <thuth@redhat.com>


