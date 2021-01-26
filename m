Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2E1303753
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:32:39 +0100 (CET)
Received: from localhost ([::1]:41164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Iq6-0002aZ-LP
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4Inq-00022L-JI
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:30:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4Ini-0005wC-Hy
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611646208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KFah76GRJxnSrQWzHQc8DkRM/Ys/tnwA1e+ziEl3mo=;
 b=TEySJewVGvG619nNTPSQprqJYC9+2bUcx3vageF947JWsy2m0Ef6jgx7U+cl+NdLWRxT3d
 1VKtM5JmCPqvHhsTB0E1vwlHOmoFFEFJGVachhbkfFB4HhKg+a93858qvy4jhk1NFAQ0H7
 Uo4GJRmhZIO1bJ/zTSE7IsJT02AC4fo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-ntY6q6wvNDKmLjpshVggiQ-1; Tue, 26 Jan 2021 02:30:06 -0500
X-MC-Unique: ntY6q6wvNDKmLjpshVggiQ-1
Received: by mail-ej1-f70.google.com with SMTP id md20so4664124ejb.7
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 23:30:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1KFah76GRJxnSrQWzHQc8DkRM/Ys/tnwA1e+ziEl3mo=;
 b=YIAVHm39fm/N2gUnTLAcgSHi9c2gmFAQjkKvCsGjDVzJzZwPNuKjBZRs7HjoVJtvUj
 314EbKnsHCJnNNnu4S0doLgFoaLFmr+1YKLqYlgoyU/PujZso54/8pLZtSqkC/5+lu2p
 cCMmOIcRYmYtIEjLRVyjoeuQc+f8IkSL1MlItQCOdg4MD/5RH/CZMUMjdaQWkLV9ACqy
 zW2pfEruCa5hSY/7hGySX8n69dyLM0WRfiGuBcip2jYcVEGG5SodUR8lPY+/7ZNnjkkY
 1Br7BfbogTiQGIlwepsVy1xIokDqM/zN22gOb3mctHyAABLScSPWVQib/Mo7xAe8efBN
 e/mQ==
X-Gm-Message-State: AOAM531BrPlRpSlA/k3tNvik1QEMquM4zdf9Vk/eqvL1xpHpSDvhVbrn
 +W+LW2PUHI4YEf6fv/xzJ11C6n94zDVfu5t5vg0NwY7jgbwj98c5rfEeZ2Csz9iMxI/ohuvBNOx
 OC79SnmWP6hB5s9g=
X-Received: by 2002:a17:906:34c3:: with SMTP id
 h3mr2634345ejb.132.1611646205239; 
 Mon, 25 Jan 2021 23:30:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGaS9jsoLeb5v3CRyn3xHknloUwF5Q0BPIyLh40wNkJmbIhlIGV/W84tF2XcB6k+SNjzaBew==
X-Received: by 2002:a17:906:34c3:: with SMTP id
 h3mr2634332ejb.132.1611646205075; 
 Mon, 25 Jan 2021 23:30:05 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id gb14sm9030767ejc.61.2021.01.25.23.30.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 23:30:04 -0800 (PST)
Subject: Re: [PATCH v9 04/11] slirp: feature detection for smbd
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
References: <20210126012457.39046-1-j@getutm.app>
 <20210126012457.39046-5-j@getutm.app>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3431d35b-774d-9c49-b6ef-615866b8341e@redhat.com>
Date: Tue, 26 Jan 2021 08:30:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126012457.39046-5-j@getutm.app>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 2:24 AM, Joelle van Dyne wrote:
> Replace Windows specific macro with a more generic feature detection
> macro. Allows slirp smb feature to be disabled manually as well.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  configure   | 22 +++++++++++++++++++++-
>  meson.build |  2 +-
>  net/slirp.c | 16 ++++++++--------
>  3 files changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/configure b/configure
> index 8d8a4733d7..d72ab22da5 100755
> --- a/configure
> +++ b/configure
> @@ -464,6 +464,7 @@ fuse="auto"
>  fuse_lseek="auto"
>  
>  malloc_trim="auto"
> +slirp_smbd="auto"
>  
>  # parse CC options second
>  for opt do
> @@ -845,7 +846,18 @@ do
>      fi
>  done
>  
> +# Check for smbd dupport
>  : ${smbd=${SMBD-/usr/sbin/smbd}}
> +if test "$slirp_smbd" != "no" ; then

Here slirp_smbd is always "auto".

> +  if test "$mingw32" = "yes" ; then
> +    if test "$slirp_smbd" = "yes" ; then
> +      error_exit "Host smbd not supported on this platform."
> +    fi
> +    slirp_smbd=no
> +  else
> +    slirp_smbd=yes
> +  fi
> +fi

So this check ...

>  
>  # Default objcc to clang if available, otherwise use CC
>  if has clang; then
> @@ -1560,6 +1572,10 @@ for opt do
>    ;;
>    --disable-fuse-lseek) fuse_lseek="disabled"
>    ;;
> +  --enable-slirp-smbd) slirp_smbd=yes
> +  ;;
> +  --disable-slirp-smbd) slirp_smbd=no
> +  ;;
>    *)

... should be placed after the cmdline options processing,
isn't it?


