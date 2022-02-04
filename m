Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7484A9555
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 09:42:43 +0100 (CET)
Received: from localhost ([::1]:59862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFuAz-0002IG-Hr
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 03:42:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nFt9j-0008Sn-9n
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:37:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nFt9e-0004Ve-VT
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:37:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643960233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKaukM2NwL5B29048T+GodTeFv+1sZn2X98ezLQaW88=;
 b=hO/apKXS2u6k92TuuHOevdF0N5KvdZutqYuRf4NGoylR0MSJ/YwkLiI4l3TFgf+cN7bh4r
 jgj23S/9wbDHUoQR6kc90VepFGNeSE/KyUvlJanTnM9kpU8hkZuTfF975NeqYE6wQygTs9
 OQMa1SqEw4S5Un9jPCO97AAOMckUt8s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-HIP7JrJGOd20tijmlHftKw-1; Fri, 04 Feb 2022 02:37:12 -0500
X-MC-Unique: HIP7JrJGOd20tijmlHftKw-1
Received: by mail-wr1-f71.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso1630155wrg.7
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 23:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UKaukM2NwL5B29048T+GodTeFv+1sZn2X98ezLQaW88=;
 b=TUEcoSVBQ41+WzyFvdMKoOVzCVBAEprgRBEDnHF9nyqtm8GhbVwg1tuSRrP0j6bqLd
 bv3ZSBotQpvmD9r0tAe0bqsrVUiw7KS5UC0mIKjb5p85VA4+lA57qXObR5yZnbRhEu9+
 cbvs63ArKwQQAJ7mKwrsbfGVldj8kOM4XCZ6yqNnBgkr9RVUfaUxlZ8/jjeAeuM0Hr4F
 hfgNn+anqcmAljB7aBps7oxPa0P7KjoXiXPev6frrKVvfMdeqtQU04BYUXOJY1phlcwy
 G4Rgm46ry78gegHqeYcSEp3iI6ssymvw4Ps8hc+qpo+i7S0NYWDuSe7ahrT/GTCKrjCN
 rKGQ==
X-Gm-Message-State: AOAM53093frYqpoI3MwMaioY5+aY3JKstN2b1h2YYkUYnRjjyTHf2SfD
 vUff76JyOKvOdP6hKFxM50oR73Y3C/YuWXBRD1Kh0OaPPEMVhGAR7S49NgF3d5m7Shj7KDupxtI
 lJOCLeqW8NW9RIZ4=
X-Received: by 2002:a5d:6f18:: with SMTP id ay24mr1357426wrb.668.1643960231418; 
 Thu, 03 Feb 2022 23:37:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVss6UWwBci9xgYKeHnCXT17pLMLz5ppqdsfHe4tcxEr/YyFF9WIm8+7IcHnSwRVTLmASC0w==
X-Received: by 2002:a5d:6f18:: with SMTP id ay24mr1357404wrb.668.1643960231128; 
 Thu, 03 Feb 2022 23:37:11 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id h4sm1351941wre.0.2022.02.03.23.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 23:37:10 -0800 (PST)
Message-ID: <f94843c9-c8f0-d78d-5e6e-a289d8bcb6a8@redhat.com>
Date: Fri, 4 Feb 2022 08:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/21] accel/meson: Only build hw virtualization with
 system emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220203191814.45023-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2022 20.17, Philippe Mathieu-Daudé wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   accel/meson.build | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/accel/meson.build b/accel/meson.build
> index dfd808d2c8..b9a963cf80 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -2,12 +2,14 @@ specific_ss.add(files('accel-common.c'))
>   softmmu_ss.add(files('accel-softmmu.c'))
>   user_ss.add(files('accel-user.c'))
>   
> -subdir('hvf')
> -subdir('qtest')
> -subdir('kvm')
>   subdir('tcg')
> -subdir('xen')
> -subdir('stubs')
> +if have_system
> +  subdir('hvf')
> +  subdir('qtest')
> +  subdir('kvm')
> +  subdir('xen')
> +  subdir('stubs')

Doesn't this render your first patch useless?

> +endif
>   
>   dummy_ss = ss.source_set()
>   dummy_ss.add(files(

Reviewed-by: Thomas Huth <thuth@redhat.com>


