Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043AB6CD9FD
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 15:05:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVTx-0006Nl-03; Wed, 29 Mar 2023 09:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phVTu-0006Mt-LX
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 09:04:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phVTq-0006bS-GH
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 09:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680095070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sp2x4y+sd6VzmKIH0yNWC8gaD2DR7HMnW6xI2nt2twU=;
 b=WLFx9h5KrTuY0e6Oydejj+vcSMAACZeJ/RJmxzunrlcL6hGtgBsOZh9rTEz9Xgv6VZABF0
 xXJe+pWG/bKUsEALFkYVTEGoDCamb/qgvnWDyv51cjUKm5AR1csjhAXntuQdEKD8baEGYm
 kw7looRvDbPj+3OrP0XvnfbDAbJnRus=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-SAHSP6QhNN6wvH5cq3Futw-1; Wed, 29 Mar 2023 09:04:26 -0400
X-MC-Unique: SAHSP6QhNN6wvH5cq3Futw-1
Received: by mail-ed1-f72.google.com with SMTP id
 c1-20020a0564021f8100b004acbe232c03so21933304edc.9
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 06:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095064; x=1682687064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sp2x4y+sd6VzmKIH0yNWC8gaD2DR7HMnW6xI2nt2twU=;
 b=FmHLCV1oGW/uQna9KkGAOkmCnEpQi08yIjLxQoHmQd2U6hLN9tK6MvEPkCiRGNbiax
 jnt+M5pIXFfBFRVRNoM5TYkrZz56JSYwpchjxjbE2VTiqi4zodqL2XVQXrhNMqxI9XSI
 Z87ZwnngJma3ybyNM1vsPTWze1RjwEGD8+9435pKRUfa1SACayOZ1UsLlGw+pcxwh+Xo
 /Nh3UAwjaXzv/faSiuGGIg7sXwrWOxTVRA/pWWY1AuhaQ/FPhghiSSxPGjKXQtVdVFvZ
 L5HW4Oeu5r5nmhveHpLg10xmTdwTjxBQRev8oT2FkrCU91Zn9RdBKhM3XugQQbeWCRVQ
 mo7A==
X-Gm-Message-State: AAQBX9cb7kp3PsRB0192b6pdDGmWd7plj3/fV3lpTWyAUYZOiYgwsUw/
 fkMLXFMZUibF0N1pZkMFbWUz2Ah8dlfJecKRxxfelLioAVe8OZWtDGiwKQjgvwjAhaB6DmT8Phx
 ZcWKS4bW7EmHfVE4owXHdTqazOg==
X-Received: by 2002:aa7:d313:0:b0:4f9:e6f1:5c7c with SMTP id
 p19-20020aa7d313000000b004f9e6f15c7cmr19621782edq.32.1680095064283; 
 Wed, 29 Mar 2023 06:04:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350YGmPUlZSqDk0hVOzk+OAVAWicPvXLzfyGMl9cNoqkK+5MWmZSpMDtr5yw85TFrnUQo6vNkzw==
X-Received: by 2002:aa7:d313:0:b0:4f9:e6f1:5c7c with SMTP id
 p19-20020aa7d313000000b004f9e6f15c7cmr19621760edq.32.1680095064055; 
 Wed, 29 Mar 2023 06:04:24 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 z37-20020a509e28000000b005023dc49bdasm4790603ede.83.2023.03.29.06.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 06:04:23 -0700 (PDT)
Message-ID: <be825b7e-689a-a3f7-30f8-ddfd2dc04267@redhat.com>
Date: Wed, 29 Mar 2023 15:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] tests/vm: use the default system python for NetBSD
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Kyle Evans <kevans@freebsd.org>
References: <20230329124601.822209-1-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230329124601.822209-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 3/29/23 14:46, Daniel P. Berrangé wrote:
> Currently our NetBSD VM recipe requests instal of the python37 package
> and explicitly tells QEMU to use that version of python. Since the
> NetBSD base ISO was updated to version 9.3 though, the default system
> python version is 3.9 which is sufficiently new for QEMU to rely on.
> Rather than requesting an older python, just test against the default
> system python which is what most users will have.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/vm/netbsd | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/vm/netbsd b/tests/vm/netbsd
> index aa54338dfa..0b9536ca17 100755
> --- a/tests/vm/netbsd
> +++ b/tests/vm/netbsd
> @@ -30,7 +30,6 @@ class NetBSDVM(basevm.BaseVM):
>           "git-base",
>           "pkgconf",
>           "xz",
> -        "python37",
>           "ninja-build",
>   
>           # gnu tools
> @@ -66,7 +65,7 @@ class NetBSDVM(basevm.BaseVM):
>           mkdir src build; cd src;
>           tar -xf /dev/rld1a;
>           cd ../build
> -        ../src/configure --python=python3.7 --disable-opengl {configure_opts};
> +        ../src/configure --disable-opengl {configure_opts};
>           gmake --output-sync -j{jobs} {target} {verbose};
>       """
>       poweroff = "/sbin/poweroff"

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


