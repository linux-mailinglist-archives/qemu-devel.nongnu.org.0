Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA103D8D73
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 14:05:40 +0200 (CEST)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8iJf-0003s2-PH
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 08:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8iIY-0003Be-P2
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 08:04:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8iIW-0003Ru-NG
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 08:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627473867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9wA0/zljGcVCZ19v9FxDeVHZJF0gewYR5CbopU64bE=;
 b=M3IsvGCYhVUvjkStQJZlUW0UNLo1Q5X/KNRfRDvzO1/5kX9lWYPrmSajoWEr/LmNlO9fsN
 Zfrp6rdh47wzEetuOGuGM7/zcoydUMzixTmO8wj/ugbXWuPIthFlG67+FhNxh0YK4uqQhP
 gB0l6UGbqDPkw8Dfu78vOqXBezh8mVg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-QiNVi0JhPsKM7Yv97NGHdA-1; Wed, 28 Jul 2021 08:04:26 -0400
X-MC-Unique: QiNVi0JhPsKM7Yv97NGHdA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c41-20020a05600c4a29b0290253935d0f82so1352917wmp.9
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 05:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u9wA0/zljGcVCZ19v9FxDeVHZJF0gewYR5CbopU64bE=;
 b=qxcD9d9kNtPcShhW1oIO/wSQu0YIzNUP+MAyFzlxpD+lzbiUKR5EpqZOx3utvVvvPZ
 iBK2TJRzEJE8XkNyGuZQe9CFmvp5wEwg6ZO1l8WLWhNnBXya3NNiKV0ebA/0RsHDlWSJ
 8rIS2bbzr/XntuUZ1Br3W6FMwapS+mjpIVnmL5Q5+3LPK9xG8FgaSkT/f7BvFoSYdUIG
 LfS+i3dw2tKlgyvIcfjC43/vEO1fApE8U65NZd8f9pntJwBJLQeOzU5OAvkt6JHphEKx
 d8od+ujX60sp4o3KVD4e4Q4zzU2V5fyzR+LHXhsN9jqF7E2R9F4Z++Y1pXKoHeu948nq
 0qUg==
X-Gm-Message-State: AOAM530eAALqcdkXxZnF7zKHTKlcYPvBpOltaLXcIKcgKMTVUpepUMX8
 5IkMmP0ksRX+YgrUdkflcsupzJ8tJ/OMvdjgXP99S5r0VwBJvnNZBNKtP3xsru1LnyFkWE9Nleb
 sEksKueuBlvABCZQ=
X-Received: by 2002:a5d:690e:: with SMTP id t14mr17311005wru.258.1627473865303; 
 Wed, 28 Jul 2021 05:04:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrPUPAbMolLZW6Y8zLKGWOlvy00owyVNMTlSDlQPyTt3Ckx1wSRQDWaxwgcnqNfJCVuzDG3g==
X-Received: by 2002:a5d:690e:: with SMTP id t14mr17310982wru.258.1627473865113; 
 Wed, 28 Jul 2021 05:04:25 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id n8sm6449314wrx.46.2021.07.28.05.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 05:04:24 -0700 (PDT)
Subject: Re: [PATCH] gitlab-ci.d/buildtest: Mark the aarch64 and ppc64-s390x
 CFI jobs as manual
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210728075141.400816-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d9731548-e3ff-d56b-0845-ace112909aef@redhat.com>
Date: Wed, 28 Jul 2021 14:04:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728075141.400816-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 9:51 AM, Thomas Huth wrote:
> These two jobs are currently failing very often - the linker seems to
> get killed due to out-of-memory problems. Since apparently nobody has
> currently an idea how to fix that nicely, let's mark the jobs as manual
> for the time being until someone comes up with a proper fix.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 63f1903f07..3537c6f1a1 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -416,6 +416,12 @@ build-cfi-aarch64:
>      expire_in: 2 days
>      paths:
>        - build
> +  rules:
> +    # FIXME: This job is often failing, likely due to out-of-memory problems in
> +    # the constraint containers of the shared runners. Thus this is marked as
> +    # manual until the situation has been solved.> +    - when: manual
> +      allow_failure: true

Eventually:

    # Except if user explicitly sets the QEMU_CI_CFI_TESTING variable
    - if: '$QEMU_CI_CFI_TESTING'
      when: always

But I agree, better to fix for everybody.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  check-cfi-aarch64:
>    extends: .native_test_job_template
> @@ -452,6 +458,12 @@ build-cfi-ppc64-s390x:
>      expire_in: 2 days
>      paths:
>        - build
> +  rules:
> +    # FIXME: This job is often failing, likely due to out-of-memory problems in
> +    # the constraint containers of the shared runners. Thus this is marked as
> +    # manual until the situation has been solved.
> +    - when: manual
> +      allow_failure: true
>  
>  check-cfi-ppc64-s390x:
>    extends: .native_test_job_template
> 


