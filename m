Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E2C6A6CDB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:07:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMAZ-0003oO-DG; Wed, 01 Mar 2023 08:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXMAV-0003dJ-6u
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:06:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXMAT-00087M-99
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677676008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4azAcB8meYWKy1CT87t3qVCO3nvZ3/e9PmKCNrOdLuc=;
 b=G0SGLFSyVTBGv7GNwL6PewdE28bMzME6CzCWLXzm+DfG0vrQRjiCPpzA8ZYKyCDehY1W05
 azcotfutffpkLi0EmQZq7VIxwf1naLTnP3MAJ8arAoW2xFMw2MACoSPocGaLbfxNQnc2tL
 y+s7XUqG2GiDikpxhnYYSxztrFAwmQY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-600-D26I0ELWPpWYz2Jjphm0UQ-1; Wed, 01 Mar 2023 08:06:41 -0500
X-MC-Unique: D26I0ELWPpWYz2Jjphm0UQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so4545797wms.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 05:06:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4azAcB8meYWKy1CT87t3qVCO3nvZ3/e9PmKCNrOdLuc=;
 b=G5WrzmKiDjmby6QMpgB+dZ45UKrswi5rlp53QZiE3O4GgimBcddS1PUY542Auog89y
 aX4quVFNePmyiClGu2GjDyHUZEXgUalCQ7s6jz/LtGmnQq7nX4HKxiyqMj1esy5GhOHW
 KC+HQ7KZuBSaFxxe02dDGWlGBudaNj2f+Dc9Zgg1PT2t/WNSvYc8ieuZtn02HD9FiDKw
 L1tR3FV4+yvAFVnXGy2kI6HoPDA2uCayj48SUIuQrSqcN/0mqffDIiqJfiWpNltrR7YE
 zgu4rjEPQYFaJgyV5vmATMMSUwXFeVnlnDUah1BtO6KWHlBSNDG+KlnvnyKgIB5B5Jw2
 sBOg==
X-Gm-Message-State: AO0yUKU/YuIcM85eQx8dvmptnCeiBpCO7+Ohs/qSMzxJePRpZylkFbhZ
 8Yu+yvroCjzYEWgtebzvdTlifkoiLinZsmE6zgvCbsDZ1Pe2jkdF6mSRWEBIUWOJrjS1K2hVGLD
 Aihnj2ZuoJKVYqpWj3MikX2s=
X-Received: by 2002:a05:600c:746:b0:3ea:e4bb:340c with SMTP id
 j6-20020a05600c074600b003eae4bb340cmr4913481wmn.18.1677675998240; 
 Wed, 01 Mar 2023 05:06:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/F/gKQk6NnNwcpYMNNxZhJL1v87hhUKdkJjD1ljGLWEr2sYAJaDLSLWMZ/0dwCQRuJPLglVg==
X-Received: by 2002:a05:600c:746:b0:3ea:e4bb:340c with SMTP id
 j6-20020a05600c074600b003eae4bb340cmr4913460wmn.18.1677675997932; 
 Wed, 01 Mar 2023 05:06:37 -0800 (PST)
Received: from [192.168.8.101] (tmo-122-219.customers.d1-online.com.
 [80.187.122.219]) by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003e2096da239sm19390165wmq.7.2023.03.01.05.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 05:06:37 -0800 (PST)
Message-ID: <84e43a02-cecb-402c-1dbc-a4bbffcb1b66@redhat.com>
Date: Wed, 1 Mar 2023 14:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND v7 4/9] target/arm: move cpu_tcg to tcg/cpu32.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-5-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230228192628.26140-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 28/02/2023 20.26, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> move the module containing cpu models definitions
> for 32bit TCG-only CPUs to tcg/ and rename it for clarity.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
...
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 1cb08138ad..1555b0bab8 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -506,9 +506,15 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>           QDict *resp;
>           char *error;
>   
> -        assert_error(qts, "cortex-a15",
> -            "We cannot guarantee the CPU type 'cortex-a15' works "
> -            "with KVM on this host", NULL);
> +        if (qtest_has_accel("tcg")) {
> +            assert_error(qts, "cortex-a15",
> +                         "We cannot guarantee the CPU type 'cortex-a15' works "
> +                         "with KVM on this host", NULL);
> +        } else {
> +            assert_error(qts, "cortex-a15",
> +                         "The CPU type 'cortex-a15' is not a "
> +                         "recognized ARM CPU type", NULL);
> +        }
>   
>           assert_has_feature_enabled(qts, "host", "aarch64");
>   

FWIW:
Acked-by: Thomas Huth <thuth@redhat.com>


