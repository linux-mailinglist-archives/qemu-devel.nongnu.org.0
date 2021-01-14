Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EDD2F6227
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:39:52 +0100 (CET)
Received: from localhost ([::1]:39820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02qt-0003hN-64
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02Yv-00034v-E4
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:21:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02Yr-0007Np-Ni
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610630472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zx54VInOeGAtFj1R1T6CeZyCVML2mrDtPu4EpwJaHjo=;
 b=XmbWkh6MUwRktgUJcuDHfc1vEHxvkKBf9EdfzCBb+CSol9ErYlLV9uEYR5bp7IHNF4ohBG
 fwZVp9Ky9Qixqk2kiKM2kCD3LY+EYNFwtS5VYoDnVz31PY5D39FogpLXPKzZNxJ5XAK7ia
 aecn7c42s4IhfAfxRzh765P9efNa0YY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-q-eYv4-yO_ayztMtT2WqBA-1; Thu, 14 Jan 2021 08:21:10 -0500
X-MC-Unique: q-eYv4-yO_ayztMtT2WqBA-1
Received: by mail-wr1-f72.google.com with SMTP id q18so2589912wrc.20
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zx54VInOeGAtFj1R1T6CeZyCVML2mrDtPu4EpwJaHjo=;
 b=ZwurU5/5imdA0l8YJn/Hwi2rNWChhUyK97OcDbiwbkvGqtWyDyO1ceXlqIi1r91GAP
 S6V6oRgwDSHC2RP2r/KuFxxnHJY9Kf6Y6mFYaP8CMUL0R8vTawd3AcQ2piZV4PSLBuXu
 AP10AEsMoMdwP2EyGDVHOyCNOKoYQQongfBY/RQS4MuxjP0xrpXwnvAFhZ+OpC/biw/R
 XF3X1saGW7rAWx/4kQgnsDY9LyKLAquccTfD5jhv8ioeG8vZIJ0AOwyPrFT5Ms28Hjv4
 gwEjiteAiYPbOA5ve6jvhwu+0z8x7npOMdecletrusOSDZPcX/M+K2KeSFHmIqaM+3Ai
 NJww==
X-Gm-Message-State: AOAM530cFqXoiMPeQyYkxfSUCOWVKdon774jzV7PAICu+yx+C6Yz3x9f
 JiBKZ/P0gP0IzJ79z8IZijOTieRTpjNclPDDWE9gduQrkaGtQxkjXTqYy88bVxu9P1lS0VqMJm6
 5wKBV1NJj6jgPVvg=
X-Received: by 2002:adf:a34d:: with SMTP id d13mr8013160wrb.194.1610630469389; 
 Thu, 14 Jan 2021 05:21:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytjUuAfAVjGLKO6qLaA6a/J9qa5688Oe+837PgHURqwaKvRXlEoiRarzrHetRmz+C94fhs4Q==
X-Received: by 2002:adf:a34d:: with SMTP id d13mr8013140wrb.194.1610630469221; 
 Thu, 14 Jan 2021 05:21:09 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x66sm8408551wmg.26.2021.01.14.05.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:21:08 -0800 (PST)
Subject: Re: [PATCH v2 03/25] tests/docker: use project specific container
 registries
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-4-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a3c2217c-5d28-a477-a7bf-db94163bb67b@redhat.com>
Date: Thu, 14 Jan 2021 14:21:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-4-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 2:02 PM, Daniel P. Berrangé wrote:
> Since Docker Hub has started to enforce pull rate limits on clients, it
> is preferrable to use project specific container registries where they
> are available. Fedora and OpenSUSE projects provide registries.
> 
> The images in these registries are also refreshed on a more regular
> basis than the ones in docker hub, so the package update should
> generally be faster.
> 
> While CentOS also has a registry it is considerably outdated compared
> to docker.io, and also only provides x86 images, while docker.io images
> are multi-arch.

Following is duplicated:

> tests/docker: use project specific container registries
> 
> Since Docker Hub has started to enforce pull rate limits on clients, it
> is preferrable to use project specific container registries where they
> are available. Fedora and OpenSUSE projects provide registries.
> 
> The images in these registries are also refreshed on a more regular
> basis than the ones in docker hub, so the package update should
> generally be faster.
> 
> While CentOS also has a registry it is considerably outdated compared
> to docker.io, and also only provides x86 images, while docker.io images
> are multi-arch.

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/fedora-cris-cross.docker  | 2 +-
>  tests/docker/dockerfiles/fedora-i386-cross.docker  | 2 +-
>  tests/docker/dockerfiles/fedora-win32-cross.docker | 2 +-
>  tests/docker/dockerfiles/fedora-win64-cross.docker | 2 +-
>  tests/docker/dockerfiles/fedora.docker             | 2 +-
>  tests/docker/dockerfiles/opensuse-leap.docker      | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/docker/dockerfiles/fedora-cris-cross.docker b/tests/docker/dockerfiles/fedora-cris-cross.docker
> index 09e7e449f9..b7f02d18d3 100644
> --- a/tests/docker/dockerfiles/fedora-cris-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-cris-cross.docker
> @@ -2,7 +2,7 @@
>  # Cross compiler for cris system tests
>  #
>  
> -FROM fedora:30
> +FROM registry.fedoraproject.org/fedora:30
>  ENV PACKAGES gcc-cris-linux-gnu
>  RUN dnf install -y $PACKAGES
>  RUN rpm -q $PACKAGES | sort > /packages.txt
> diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
> index a6e411291b..c1fd3ea37b 100644
> --- a/tests/docker/dockerfiles/fedora-i386-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
> @@ -1,4 +1,4 @@
> -FROM fedora:31
> +FROM registry.fedoraproject.org/fedora:31
>  ENV PACKAGES \
>      bzip2 \
>      diffutils \
> diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
> index 087df598a0..8dc4f0d4c9 100644
> --- a/tests/docker/dockerfiles/fedora-win32-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
> @@ -1,4 +1,4 @@
> -FROM fedora:32
> +FROM registry.fedoraproject.org/fedora:32
>  
>  # Please keep this list sorted alphabetically
>  ENV PACKAGES \
> diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
> index d5d2f5f00d..c530e6ba36 100644
> --- a/tests/docker/dockerfiles/fedora-win64-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
> @@ -1,4 +1,4 @@
> -FROM fedora:32
> +FROM registry.fedoraproject.org/fedora:32
>  
>  # Please keep this list sorted alphabetically
>  ENV PACKAGES \
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
> index 19e7a3d28a..0bc66f7293 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -1,4 +1,4 @@
> -FROM fedora:32
> +FROM registry.fedoraproject.org/fedora:32
>  
>  # Please keep this list sorted alphabetically
>  ENV PACKAGES \
> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
> index 0e64893e4a..e7dc14bf99 100644
> --- a/tests/docker/dockerfiles/opensuse-leap.docker
> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> @@ -1,4 +1,4 @@
> -FROM opensuse/leap:15.2
> +FROM registry.opensuse.org/opensuse/leap:15.2
>  
>  # Please keep this list sorted alphabetically
>  ENV PACKAGES \
> 


