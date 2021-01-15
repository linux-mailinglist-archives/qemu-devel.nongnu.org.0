Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9D82F8348
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:07:58 +0100 (CET)
Received: from localhost ([::1]:33402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0TVt-0008Bu-FN
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l0TUh-0007cg-Kh
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:06:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l0TUd-0001SO-Hn
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:06:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610733998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFhe0K7+u5qN3n80GogojJkKr8YqBfBA4lNpDa5V2xQ=;
 b=ibsPkOT5R05sF9XQRmFRPk9fIs1Su3pbiT5Pz03i3wsyFh1SZnz/GIqYRCn3v4dMLiTh7p
 tlKQZwuKNCHNf4AUzjZ+KGGkXuARyZ2yeqJ3NETdL0fANDDTvs6EE7bX5PgbKff7i1Td5B
 1KXMgJUG1j2a0hotGtP6h6K07sDlxHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-64e7EQWgNLmnMP-gpOaElA-1; Fri, 15 Jan 2021 13:06:35 -0500
X-MC-Unique: 64e7EQWgNLmnMP-gpOaElA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0551B9CC03;
 Fri, 15 Jan 2021 18:06:34 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BF5D648A1;
 Fri, 15 Jan 2021 18:06:29 +0000 (UTC)
Subject: Re: [PATCH v2 07/25] tests/docker: fix sorting in package lists
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-8-berrange@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <d82625fc-0742-4461-3bc9-2bc7b6ee3f61@redhat.com>
Date: Fri, 15 Jan 2021 15:06:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-8-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/14/21 10:02 AM, Daniel P. Berrangé wrote:
> This will make diffs in later patches clearer.
>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/docker/dockerfiles/centos7.docker       |  4 ++--
>   tests/docker/dockerfiles/fedora.docker        |  4 ++--
>   tests/docker/dockerfiles/opensuse-leap.docker | 16 ++++++++--------
>   tests/docker/dockerfiles/ubuntu1804.docker    |  4 ++--
>   tests/docker/dockerfiles/ubuntu2004.docker    |  8 +++++---
>   5 files changed, 19 insertions(+), 17 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
> index 66d805dec3..b2a4719284 100644
> --- a/tests/docker/dockerfiles/centos7.docker
> +++ b/tests/docker/dockerfiles/centos7.docker
> @@ -5,13 +5,14 @@ RUN yum -y update
>   
>   # Please keep this list sorted alphabetically
>   ENV PACKAGES \
> +    SDL2-devel \
>       bzip2 \
>       bzip2-devel \
>       ccache \
>       csnappy-devel \
>       dbus-daemon \
> -    gcc-c++ \
>       gcc \
> +    gcc-c++ \
>       gettext \
>       git \
>       glib2-devel \
> @@ -32,7 +33,6 @@ ENV PACKAGES \
>       perl-Test-Harness \
>       pixman-devel \
>       python3 \
> -    SDL2-devel \
>       spice-glib-devel \
>       spice-server-devel \
>       tar \
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
> index d9b764aea2..03b88f1cfe 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -2,6 +2,7 @@ FROM registry.fedoraproject.org/fedora:32
>   
>   # Please keep this list sorted alphabetically
>   ENV PACKAGES \
> +    SDL2-devel \
>       bc \
>       brlapi-devel \
>       bzip2 \
> @@ -74,10 +75,10 @@ ENV PACKAGES \
>       mingw64-pixman \
>       mingw64-pkg-config \
>       mingw64-SDL2 \
> -    nmap-ncat \
>       ncurses-devel \
>       nettle-devel \
>       ninja-build \
> +    nmap-ncat \
>       numactl-devel \
>       perl \
>       perl-Test-Harness \
> @@ -91,7 +92,6 @@ ENV PACKAGES \
>       python3-sphinx \
>       python3-virtualenv \
>       rdma-core-devel \
> -    SDL2-devel \
>       snappy-devel \
>       sparse \
>       spice-server-devel \
> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
> index e7dc14bf99..ed194125a7 100644
> --- a/tests/docker/dockerfiles/opensuse-leap.docker
> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> @@ -8,46 +8,46 @@ ENV PACKAGES \
>       cyrus-sasl-devel \
>       gcc \
>       gcc-c++ \
> -    mkisofs \
>       gettext-runtime \
>       git \
>       glib2-devel \
>       glusterfs-devel \
> -    libgnutls-devel \
>       gtk3-devel \
> +    libSDL2-devel \
> +    libSDL2_image-devel \
>       libaio-devel \
>       libattr-devel \
>       libcap-ng-devel \
>       libepoxy-devel \
>       libfdt-devel \
> +    libgnutls-devel \
>       libiscsi-devel \
>       libjpeg8-devel \
> +    libnuma-devel \
> +    libpixman-1-0-devel \
>       libpmem-devel \
>       libpng16-devel \
>       librbd-devel \
>       libseccomp-devel \
> +    libspice-server-devel \
>       libssh-devel \
>       lzo-devel \
>       make \
> -    libSDL2_image-devel \
> +    mkisofs \
>       ncurses-devel \
>       ninja \
> -    libnuma-devel \
>       perl \
> -    libpixman-1-0-devel \
>       python3-base \
>       python3-virtualenv \
>       rdma-core-devel \
> -    libSDL2-devel \
>       snappy-devel \
> -    libspice-server-devel \
>       systemd-devel \
>       systemtap-sdt-devel \
>       tar \
>       usbredir-devel \
>       virglrenderer-devel \
> -    xen-devel \
>       vte-devel \
> +    xen-devel \
>       zlib-devel
>   ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.6
>   
> diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
> index 3534111637..58a373e205 100644
> --- a/tests/docker/dockerfiles/ubuntu1804.docker
> +++ b/tests/docker/dockerfiles/ubuntu1804.docker
> @@ -45,9 +45,9 @@ ENV PACKAGES \
>       libxen-dev \
>       libzstd-dev \
>       make \
> -    python3-yaml \
> -    python3-sphinx \
>       ninja-build \
> +    python3-sphinx \
> +    python3-yaml \
>       sparse \
>       xfslibs-dev
>   RUN apt-get update && \
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index 552b57f903..2bb7e2ab1e 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -1,7 +1,9 @@
>   FROM docker.io/library/ubuntu:20.04
> -ENV PACKAGES flex bison \
> +ENV PACKAGES \
> +    bison \
>       ccache \
>       clang-10\
> +    flex \
>       gcc \
>       genisoimage \
>       gettext \
> @@ -60,8 +62,8 @@ ENV PACKAGES flex bison \
>       sparse \
>       tesseract-ocr \
>       tesseract-ocr-eng \
> -    xfslibs-dev\
> -    vim
> +    vim \
> +    xfslibs-dev
>   RUN apt-get update && \
>       DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
>   RUN dpkg -l $PACKAGES | sort > /packages.txt


