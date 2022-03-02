Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4823D4CAB3A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 18:12:03 +0100 (CET)
Received: from localhost ([::1]:59264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPSWA-0006L0-DN
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 12:12:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPSUe-0004mB-6L; Wed, 02 Mar 2022 12:10:28 -0500
Received: from [2a00:1450:4864:20::430] (port=35719
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPSUc-0004GB-O4; Wed, 02 Mar 2022 12:10:27 -0500
Received: by mail-wr1-x430.google.com with SMTP id b5so3852813wrr.2;
 Wed, 02 Mar 2022 09:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/A/Wf1LVWnIFg005LIj0+B/3iT8p8+uVVjrl/CBEcyY=;
 b=PAZI+7c7kmmiyT3XJwcRO3NMZ9oTNnehWyFoD6+Bt5H7Hl5i39z1hi5MYTDIDyI9wf
 7946oKEnme1wJziXZzu3FqKQwkS+Q/+i/I/6uU0qL8QjT/E8UAZ5IvwGYUEeMWLqI2e0
 SOxjKINJwdByr9Dz9p21rU1LCV0FFX5zbOnetWLk76T0lmEDUxpYtCDCdR75ScjlYK0P
 /fXBLPa5EMXxXNG0z2NyVWioFIyl2KOs3P9hEUoj6nkunntc8+64BtVTh2PuvbOrO8ev
 BH1Ds1wjVQmt4mFXZDlVum+D1Xu7CVSI8wjx75C0GxpFsKHxBnOvUjUXbLvTLeJlNiAf
 sLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/A/Wf1LVWnIFg005LIj0+B/3iT8p8+uVVjrl/CBEcyY=;
 b=1lNzWEzuz7R9mlbp4aR6VUk1fxqwIBc79MrK1Wm3dSZ09wiKPhmcplo+ugeQSH55kR
 bW2Oi91CFtofzOVbrR0FR0BZwh4wxAwBqja4Aw1c2aZeZtPgVudKkQSO4Ev+/sL1kof/
 umf3zbyk26dQaVCu6Ge6kRVLWt6ld1fio8tIE/DJVR7kORUgWDaW0Pxss1F2v/Nww3zC
 IgXO37Qj/PldU2B379CaSRbgTbnO8Mze8+itFqMAIF67NncNpdluodoeO3Haq5ybBwYV
 gTAd21Zgt9qvmYIBBxEseRf0BppSo+bUhnHn/x7FGzaW75mF0W/P2e4DAw9mZwpW5q9w
 q5/Q==
X-Gm-Message-State: AOAM532MyAXFckc9ekn59V3vTeHyzc/ci4q1i7LkEqr8zrxptFk/LmKi
 yq+5v6M5SvTki3h1dhKnFqU=
X-Google-Smtp-Source: ABdhPJxHOez8UfUFF74TDZKGJNkXgRw+DkD5pcjsvwTevsgqS4RaCkwcuDHtzDeNCIDqvvslZPYOpA==
X-Received: by 2002:a05:6000:1548:b0:1f0:48bc:25de with SMTP id
 8-20020a056000154800b001f048bc25demr1034142wry.17.1646241023334; 
 Wed, 02 Mar 2022 09:10:23 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 g20-20020a05600c4ed400b003811fab7f3esm7666700wmq.30.2022.03.02.09.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 09:10:22 -0800 (PST)
Message-ID: <66b68bcc-8d7e-a5f7-5e6c-b2d20c26ab01@redhat.com>
Date: Wed, 2 Mar 2022 18:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] Allow building vhost-user in BSD
Content-Language: en-US
To: Sergio Lopez <slp@redhat.com>, qemu-devel@nongnu.org
References: <20220302113644.43717-1-slp@redhat.com>
 <20220302113644.43717-3-slp@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220302113644.43717-3-slp@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 kvm@vger.kernel.org, John G Johnson <john.g.johnson@oracle.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/22 12:36, Sergio Lopez wrote:
> With the possibility of using pipefd as a replacement on operating
> systems that doesn't support eventfd, vhost-user can also work on BSD
> systems.
> 
> This change allows enabling vhost-user on BSD platforms too and
> makes libvhost_user (which still depends on eventfd) a linux-only
> feature.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>

I would just check for !windows.

Paolo

> ---
>   configure   | 5 +++--
>   meson.build | 2 +-
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index c56ed53ee3..93aa22e345 100755
> --- a/configure
> +++ b/configure
> @@ -1659,8 +1659,9 @@ fi
>   # vhost interdependencies and host support
>   
>   # vhost backends
> -if test "$vhost_user" = "yes" && test "$linux" != "yes"; then
> -  error_exit "vhost-user is only available on Linux"
> +if test "$vhost_user" = "yes" && \
> +    test "$linux" != "yes" && test "$bsd" != "yes" ; then
> +  error_exit "vhost-user is only available on Linux and BSD"
>   fi
>   test "$vhost_vdpa" = "" && vhost_vdpa=$linux
>   if test "$vhost_vdpa" = "yes" && test "$linux" != "yes"; then
> diff --git a/meson.build b/meson.build
> index 8df40bfac4..f2bc439c30 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2701,7 +2701,7 @@ if have_system or have_user
>   endif
>   
>   vhost_user = not_found
> -if 'CONFIG_VHOST_USER' in config_host
> +if targetos == 'linux' and 'CONFIG_VHOST_USER' in config_host
>     libvhost_user = subproject('libvhost-user')
>     vhost_user = libvhost_user.get_variable('vhost_user_dep')
>   endif


