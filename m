Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BA646D311
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 13:12:36 +0100 (CET)
Received: from localhost ([::1]:41096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muvoI-0001M5-KD
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 07:12:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1muvku-0008Vc-QG
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 07:09:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1muvkr-0004mI-9q
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 07:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638965338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HejwnoASmPW+NscQGVCM2JML649xX/Ry8ZVmmstxdmo=;
 b=A+m0nzCrtmjyI6tuY0AiHlAc7rTt4U0mwBdTuK9VPKtNKMHfTpjwh04HXcPtHquA1Q4BRT
 Sry9Q8+Ge2KY3jBmqfhMjFN0Adtu/ooaPudkH8+nsvEhbNCozApLeWKob1kG75ixYr87vP
 MKPkUTy/Jz8P1LISiZr0lc73NOxp/pM=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-7D5P8aBDPFuAhcaoJaaxFQ-1; Wed, 08 Dec 2021 07:08:55 -0500
X-MC-Unique: 7D5P8aBDPFuAhcaoJaaxFQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 v16-20020a9f2d90000000b002e18753e8afso1429745uaj.2
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 04:08:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HejwnoASmPW+NscQGVCM2JML649xX/Ry8ZVmmstxdmo=;
 b=zgYMwx0YH+OLATp/nLB2N2ygFm5/7nKw3UpCWJuvGWY845eGBhi1C9QvBRTVnktzY0
 k9CFwlLEIH0sB7U08mIOLfbPMX9AxMGtqIcK5J2GJ/liewrHAL905aFUUYZ4Lw71lfmD
 g8XryLAr1w3cSVNRVbcWMqDYsE6pI4blAARYgh72jl7pCW8SDirPX/vZImn/XJylg90R
 bI328li3Pw8T+G/ANVFk/VibgpzRXNMXBMYj3wlCJspkdFcNDChse5VHVHy7WWI/Fvln
 UCaBZ//ogRnYeLA37dLa5mktd36s9zJwsv90KQGKO8AvJ6+wLfmtF7i3cF8rqKCkuYvD
 84jw==
X-Gm-Message-State: AOAM530To/FKqU5+/lnfUEML2v8RpnxmHHTYXuUeNRjZPpqhqls2nkxi
 1sVLEoFslxb18ltb05zv9DI4D2+YnSjVXpEISo3cGcwrf1E433tw+az3mzDNhKAmgEO1pa4IZIQ
 B5g5po9u4NZEUkUo=
X-Received: by 2002:ab0:324e:: with SMTP id r14mr8034763uan.117.1638965334945; 
 Wed, 08 Dec 2021 04:08:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHsPFoCR5M2tUUNcZNxidSuks6NhXjzCODpb4pCf8BprruuQxPiR4tD2GOjqkR2sH4i8L5pA==
X-Received: by 2002:ab0:324e:: with SMTP id r14mr8034751uan.117.1638965334777; 
 Wed, 08 Dec 2021 04:08:54 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id o5sm1611271vsa.4.2021.12.08.04.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 04:08:54 -0800 (PST)
Date: Wed, 8 Dec 2021 09:08:52 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] tests/docker: add libfuse3 development headers
Message-ID: <20211208120852.kde54dotiqmcf5wh@laptop.redhat>
References: <20211207160025.52466-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211207160025.52466-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Richard W . M . Jones" <rjones@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 07, 2021 at 04:00:25PM +0000, Stefan Hajnoczi wrote:
> The FUSE exports feature is not built because most container images do
> not have libfuse3 development headers installed. Add the necessary
> packages to the Dockerfiles.
> 
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tests/docker/dockerfiles/alpine.docker        | 1 +
>  tests/docker/dockerfiles/centos8.docker       | 1 +
>  tests/docker/dockerfiles/fedora.docker        | 1 +
>  tests/docker/dockerfiles/opensuse-leap.docker | 1 +
>  tests/docker/dockerfiles/ubuntu.docker        | 1 +
>  tests/docker/dockerfiles/ubuntu2004.docker    | 1 +
>  6 files changed, 6 insertions(+)
> 
> diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
> index 7e6997e301..9ddb3c2ebc 100644
> --- a/tests/docker/dockerfiles/alpine.docker
> +++ b/tests/docker/dockerfiles/alpine.docker
> @@ -12,6 +12,7 @@ ENV PACKAGES \
>  	ccache \
>  	coreutils \
>  	curl-dev \
> +	fuse3-dev \
>  	g++ \
>  	gcc \
>  	git \
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> index 7f135f8e8c..a2dae4be29 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -19,6 +19,7 @@ ENV PACKAGES \
>      device-mapper-multipath-devel \
>      diffutils \
>      findutils \
> +    fuse3-devel \
>      gcc \
>      gcc-c++ \
>      genisoimage \
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
> index c6fd7e1113..a3a712c87b 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -20,6 +20,7 @@ ENV PACKAGES \
>      device-mapper-multipath-devel \
>      diffutils \
>      findutils \
> +    fuse3-devel \
>      gcc \
>      gcc-c++ \
>      gcovr \
> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
> index 3bbdb67f4f..2beb61bd7e 100644
> --- a/tests/docker/dockerfiles/opensuse-leap.docker
> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> @@ -15,6 +15,7 @@ ENV PACKAGES \
>      dbus-1 \
>      diffutils \
>      findutils \
> +    fuse3-devel \
>      gcc \
>      gcc-c++ \
>      gcovr \
> diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
> index f0e0180d21..0c694a2bf0 100644
> --- a/tests/docker/dockerfiles/ubuntu.docker
> +++ b/tests/docker/dockerfiles/ubuntu.docker
> @@ -29,6 +29,7 @@ ENV PACKAGES \
>      libepoxy-dev \
>      libfdt-dev \
>      libffi-dev \
> +    libfuse3-dev \
>      libgbm-dev \
>      libgnutls28-dev \
>      libgtk-3-dev \
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index 15a026be09..a46feaecdd 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -34,6 +34,7 @@ ENV PACKAGES \
>      libepoxy-dev \
>      libfdt-dev \
>      libffi-dev \
> +    libfuse3-dev \
>      libgbm-dev \
>      libgcrypt20-dev \
>      libglib2.0-dev \

Reviewed-by: Beraldo Leal <bleal@redhat.com>
Tested-by: Beraldo Leal <bleal@redhat.com>

Tested against package names on those repositories.

--
Beraldo


