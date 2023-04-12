Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07B16DEB66
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 07:41:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmTCz-0006o8-01; Wed, 12 Apr 2023 01:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmTCf-0006nc-Q8
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 01:39:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmTCe-00085r-0l
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 01:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681277970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHCdvDKrd6SHmT5+4IxRxVZw2qNaGEXhrgpsq6j6904=;
 b=eoFBNga4F/5PdNGPAVsNAZeC4YBue/s6g0MWcn1Lj7Rs2BvsPE96FvNP6cKshIUsPbZqs9
 PakWPzkblug7mX9MDD6eUbwtJKWR346Xs8SWCKl1USeAjGU/5PkCYdWRrAHB8FMEOvwPpQ
 YJUfO17fBR1b+WaElrCjyEKhe6klQfQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-Ccg48VELPey-WjY8Kzqf-w-1; Wed, 12 Apr 2023 01:39:29 -0400
X-MC-Unique: Ccg48VELPey-WjY8Kzqf-w-1
Received: by mail-ej1-f72.google.com with SMTP id
 s14-20020a17090699ce00b0093994122eddso3567023ejn.17
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 22:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681277968; x=1683869968;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VHCdvDKrd6SHmT5+4IxRxVZw2qNaGEXhrgpsq6j6904=;
 b=oSvpX6ZfTTwls2080bBLwuVyCb2cV9O6hoKOoRWUuQ5uTtsD7gWLcCHL5xxayTRZVu
 vYPo8CVfU6j49ActnefGczoagfYaCvOPLRHaPUfywkYcwgUER3psta/j7iGXkSoamtS4
 Li2HGH/ZJk9ZUEh/YaioOviaKGZtmu5a/ARQtD5JW76JrIXZzc2IW+LOK5eIi8OLr0FT
 2xgmOdGVg7Qyt9TFdZPXfQM+uFxqe+UD6sMg5ZJrwl3ZRrG1oC88JsYNa0soJMwquuip
 mMkFbLrMuuG4ht+IKSUp4KUd9pNxLlv4EpJftJC9uyi/OLRNmiUzTakPwmDrSXPgtwom
 PM9g==
X-Gm-Message-State: AAQBX9f/spjw10U8HskO5S0wf5R00YUDBEeNamAY0ocoTTj7IX87A0T5
 dWdoQxAD6ZtKLt2paeCGP7fE0O3qEt+KsUQwQodIhLdgLdHjaRfjZL6vnq1/kw5pp+MC6pbHq6d
 ucW/VJWGLbOdUmtw=
X-Received: by 2002:a17:906:1401:b0:94e:5224:b21e with SMTP id
 p1-20020a170906140100b0094e5224b21emr1134982ejc.14.1681277968556; 
 Tue, 11 Apr 2023 22:39:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350aiVhpgQoLUs6/2V6EcX+z/iUJaQs6ANB2YdA1maYchDM3UA/NUeo7RWULN8e+iRtBMgK9+FQ==
X-Received: by 2002:a17:906:1401:b0:94e:5224:b21e with SMTP id
 p1-20020a170906140100b0094e5224b21emr1134974ejc.14.1681277968264; 
 Tue, 11 Apr 2023 22:39:28 -0700 (PDT)
Received: from [192.168.8.105] (tmo-096-44.customers.d1-online.com.
 [80.187.96.44]) by smtp.gmail.com with ESMTPSA id
 s21-20020a1709060c1500b0094a85f6074bsm2889674ejf.33.2023.04.11.22.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 22:39:27 -0700 (PDT)
Message-ID: <895bcdd3-350d-38e7-1982-899948072b93@redhat.com>
Date: Wed, 12 Apr 2023 07:39:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [QEMU][PATCH] gitlab-ci.d/crossbuilds: Drop the '--disable-tcg'
 configuration for xen
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230411210422.24255-1-vikram.garhwal@amd.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230411210422.24255-1-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.17, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/04/2023 23.04, Vikram Garhwal wrote:
> Xen is supported for aarch64 via xenpvh machine. disable-tcg option fails the
> build for aarch64 target.
> 
> Link for xen on arm patch series: https://mail.gnu.org/archive/html/qemu-devel/2023-02/msg03979.html
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 61b8ac86ee..6867839248 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -186,7 +186,7 @@ cross-amd64-xen-only:
>     variables:
>       IMAGE: debian-amd64-cross
>       ACCEL: xen
> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
> +    EXTRA_CONFIGURE_OPTS: --disable-kvm
>   
>   cross-arm64-xen-only:
>     extends: .cross_accel_build_job
> @@ -195,4 +195,4 @@ cross-arm64-xen-only:
>     variables:
>       IMAGE: debian-arm64-cross
>       ACCEL: xen
> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
> +    EXTRA_CONFIGURE_OPTS: --disable-kvm

This patch looks wrong. I'm pretty sure we wanted to test the build without 
TCG here. Building with TCG enabled is already done in other jobs. So 
instead of removing "--disable-tcg" here the question is rather: Why does it 
not build with this flag anymore? Can those problems be fixed instead?

  Thomas


