Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED25423358
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 00:18:32 +0200 (CEST)
Received: from localhost ([::1]:60400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXsla-0001Rq-Kp
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 18:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXsjn-0008P8-G9
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 18:16:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXsjj-0008TG-8O
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 18:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633472194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HtcxNewNO1YYwC2gyzxOYC1wBMx5WkCMMbPwh2WAiwY=;
 b=VxRKoE8I1E3e0Mpho3mw6havqdroqnlsaEbNADEDIltayfvXUuSSSTJ/k3hFC4uHxCTiRp
 MgHDWShjhUjan3p88epsre6TZSXCi/t7t8MB0/jRX2yVX8Z8GpSzRmmEONf1xdIeFWq4nW
 NB/70zlnF+/smnwU3uZQb0UGPGGCRvM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-wmBNhsgHNC-B62ZtSWzP0A-1; Tue, 05 Oct 2021 18:16:31 -0400
X-MC-Unique: wmBNhsgHNC-B62ZtSWzP0A-1
Received: by mail-ed1-f70.google.com with SMTP id
 h12-20020aa7c5cc000000b003dad185759bso679827eds.6
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 15:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HtcxNewNO1YYwC2gyzxOYC1wBMx5WkCMMbPwh2WAiwY=;
 b=xGffVqLUEw8+6qokpkqzp47t5GjdfId0SK7An6AwvdMe1/ghDjYwrfZbal1CYrU6Fl
 pkqTJOMZxiiYqdS4VMsYhO8paIxGj60ZlfYQ5MCyPudPYpVhbkVFVbAXMQv+4ISmSUue
 TEM+ELazhGUCy6JP97O6b7P3jaLOBVPu1RPoyNE+q0iT9RO5NzQP+UwMPuXwP6KBhBTm
 CspeGz84gFP1eRfKImt9Q52LoIkUbjnIExiNIPMrhwg+RdMvGBw+Hr1FZpaUJNb15nZC
 2wjGf9QlxGQG2UH8v5EKrddUWiKz0RClKvn7Fzyrxks5lB5fA15BUzSmmmF9yJd3QPO1
 j1Wg==
X-Gm-Message-State: AOAM531hNaVeX2mk2tR/WxN9HM27ofuHaW+mKP7B+njj13KGU69tnRpp
 zzCsbhXPcQX0mk2fOSZOxjHOnM5WM5ICllD4vxifX87lxeVfm1ZZL2G0Y/mmVc9ImlMmFrywYBB
 1eGyUcuNhvTgiAbM=
X-Received: by 2002:a05:6402:3128:: with SMTP id
 dd8mr28557963edb.383.1633472190469; 
 Tue, 05 Oct 2021 15:16:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL+hDN5Lubp1aDJUy+8b/IMIKD1wuATsThSa4pAasZJiz+0+waQyDkI2djzWYcxqnxFv1T1Q==
X-Received: by 2002:a05:6402:3128:: with SMTP id
 dd8mr28557940edb.383.1633472190266; 
 Tue, 05 Oct 2021 15:16:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id u4sm428493edj.33.2021.10.05.15.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 15:16:29 -0700 (PDT)
Message-ID: <2499dfbd-e037-cc31-3004-3517bbbd9b31@redhat.com>
Date: Wed, 6 Oct 2021 00:16:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] tests/docker/dockerfiles: Bump fedora-i386-cross to
 fedora 34
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211005205846.153724-1-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211005205846.153724-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/10/21 22:58, Richard Henderson wrote:
> For unknown and unrepeatable reasons, the cross-i386-tci test has
> started failing.  "Fix" this by updating the container to use fedora 34.
> 
> Add sysprof-capture-devel as a new dependency of glib2-devel that
> was not correctly spelled out in the rpm rules.
> 
> Use dnf update Just In Case -- there are presently out-of-date
> packages in the upstream docker registry.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/docker/dockerfiles/fedora-i386-cross.docker | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
> index 820740d5be..f62a71ce22 100644
> --- a/tests/docker/dockerfiles/fedora-i386-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
> @@ -1,4 +1,5 @@
> -FROM registry.fedoraproject.org/fedora:33
> +FROM registry.fedoraproject.org/fedora:34
> +
>   ENV PACKAGES \
>       bzip2 \
>       ccache \
> @@ -20,10 +21,11 @@ ENV PACKAGES \
>       pcre-devel.i686 \
>       perl-Test-Harness \
>       pixman-devel.i686 \
> +    sysprof-capture-devel.i686 \
>       zlib-devel.i686
>   
>   ENV QEMU_CONFIGURE_OPTS --cpu=i386 --disable-vhost-user
>   ENV PKG_CONFIG_LIBDIR /usr/lib/pkgconfig
>   
> -RUN dnf install -y $PACKAGES
> +RUN dnf update -y && dnf install -y $PACKAGES
>   RUN rpm -q $PACKAGES | sort > /packages.txt
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

I would say, go ahead and apply it to the tree directly to unbreak CI.

Paolo


