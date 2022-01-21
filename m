Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764F3495E95
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:50:54 +0100 (CET)
Received: from localhost ([::1]:60552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAsRQ-0001I6-WE
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:50:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAsHp-0002bE-1E
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:40:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAsHn-0005Sw-4z
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642765254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yBgz8M8oUu2Tix3lbLycU7k738xyvUEkDeHyqEIOIGk=;
 b=Joj2071s9Sg9TdD1ZSRyES1Wz4M+pKO/V03yrWpyW3/ZJtPVba/YRWICcEVBsxDFsNEbaY
 QsWiDchwU/p9d0TzMap6VQh7fW4I229qR1/jX36W68iWTFX6AxLEPlUVB3Rnc8IjykDhFx
 lJttuRVt7WTUC0WN4kj0Fw5tciSIo+4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-PMyMGswlMBaBveGPUQOpkg-1; Fri, 21 Jan 2022 06:40:51 -0500
X-MC-Unique: PMyMGswlMBaBveGPUQOpkg-1
Received: by mail-wm1-f69.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso6123842wme.5
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 03:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yBgz8M8oUu2Tix3lbLycU7k738xyvUEkDeHyqEIOIGk=;
 b=lPCYbWj5TSyRt07q3VyZxNyZ/LQKc42nhXjsRLb6Cju/ASfmbZwuh7GMltNmlaA3XL
 HqvRO3QP/zLez712tr29evdEjgsGjvS+loe2nJoxMCshumD5Pxa3S4dqhMvJd5kP0Zkl
 5NptBG8JS1rDaGTCQJrS3IURQ6D4R180AeACARpmwqxHJXxpjnLU4CHaQ3F4JPl1WSf0
 irCWHMEjK4Sv2I2V1hEJRSjL/vbsoUJ6Cnfrrzz3q1DxhHqCCpa3RoRpbBJPe7l+08pU
 xP1Zl7Sqe+x8cGA13zpc/MJhTTQ+o2yyxZ96sZsc4DNF11hziw3XC6YbWnXGJjl9f+yY
 0lVA==
X-Gm-Message-State: AOAM5330Fk5kdaaZml3WXFc8cKeF9wnMZvp4uKOdPtZAYd8BYGE8sECX
 3s1yqKswtS43+dBc3FYCE4FD2UGtHaZymsoDbA1WfDdF/FqTeT1/FVZE4EfFG11SLy7V9gG1jds
 AKB5jexIqRCUuTzY=
X-Received: by 2002:a05:6000:1d89:: with SMTP id
 bk9mr3394635wrb.561.1642765250009; 
 Fri, 21 Jan 2022 03:40:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHhcituGStsCSYLy2N7DMS/1bJXABXbsmFc2CFc1ro3V453+69sbvKlxytm02tX00OhognwQ==
X-Received: by 2002:a05:6000:1d89:: with SMTP id
 bk9mr3394616wrb.561.1642765249821; 
 Fri, 21 Jan 2022 03:40:49 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id k10sm327051wmi.1.2022.01.21.03.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 03:40:49 -0800 (PST)
Message-ID: <9d09394f-20b3-eb07-d962-9d723b0d3c3d@redhat.com>
Date: Fri, 21 Jan 2022 12:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 4/8] tests: Refresh lcitool submodule
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220121103623.288054-1-f4bug@amsat.org>
 <20220121103623.288054-5-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220121103623.288054-5-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/01/2022 11.36, Philippe Mathieu-Daudé wrote:
> Refresh lcitool submodule and the generated files by running:
> 
>    $ make lcitool-refresh
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitlab-ci.d/cirrus/freebsd-12.vars           | 2 +-
>   .gitlab-ci.d/cirrus/freebsd-13.vars           | 2 +-
>   tests/docker/dockerfiles/alpine.docker        | 3 ++-
>   tests/docker/dockerfiles/centos8.docker       | 3 +--
>   tests/docker/dockerfiles/fedora.docker        | 3 +--
>   tests/docker/dockerfiles/opensuse-leap.docker | 2 +-
>   tests/docker/dockerfiles/ubuntu1804.docker    | 2 +-
>   tests/docker/dockerfiles/ubuntu2004.docker    | 2 +-
>   tests/lcitool/libvirt-ci                      | 2 +-
>   9 files changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
> index 9c52266811f..bdcce578edf 100644
> --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
> +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
> @@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
>   NINJA='/usr/local/bin/ninja'
>   PACKAGING_COMMAND='pkg'
>   PIP3='/usr/local/bin/pip-3.8'
> -PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
> +PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'

Aren't the FreeBSD jobs currently failing due to lttng-ust not being 
available anymore? ... I'd somehow expected that this update might fix this, 
too, but I still see lttng-ust in the list here?

  Thomas


