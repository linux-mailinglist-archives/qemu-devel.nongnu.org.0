Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4133B8900
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:07:09 +0200 (CEST)
Received: from localhost ([::1]:36982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfYC-00048C-St
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyfSK-0004Dp-2N
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:01:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyfSH-0001X0-73
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625079660;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XQRhE4m0wawzEdFXoyyVEzIRkGh1Isfwk/2GIkn/fvc=;
 b=PYBG8aSOvCc5/wpOqrrE/aLer76WJVpWbJt5f5STYooh53R+k2UseHgzLAnTPkNA94QlCa
 eE0/EBC41HU2oF4/14haJyNUS7idlnvJmtCywWh9fk9Gi4+o2l+23+eE4drB9+OEToNR/v
 3Q20CUGe5N+3ohzXA32WJxOp6/Q72cI=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-aG48PK5FPWiARWvdgQn3Gg-1; Wed, 30 Jun 2021 15:00:59 -0400
X-MC-Unique: aG48PK5FPWiARWvdgQn3Gg-1
Received: by mail-pf1-f197.google.com with SMTP id
 y29-20020a056a00181db02903062cdadd92so2356422pfa.3
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 12:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=XQRhE4m0wawzEdFXoyyVEzIRkGh1Isfwk/2GIkn/fvc=;
 b=Erx3h01+7VxmUmN3JaRrMwoAnVctja1qhYvzsX87847C4fHwPu0Nqyui1nBAB28xL2
 b6RpyTgsX/CZjWTrYH90/+egEPW84122HUaC72iVn+iibpVstppvvGi90JNyuW4Swz6e
 aUaiQBVcPvmyTrJhyxTuNIcJNH3YsxbkKuRlMWRuqvPF4rUrKnV6Knr2gxwLuQlJ0Ufp
 xPS+wVL0k5fjOGt8qgi+wzdxq80ItGeymzGY5rCUM7XS/RMqRbMEK4JeR0mCYnkzvJ9e
 Lzj1tRSQ5HU7pmqrf1s5ca2I6nXJoOiZHtBC9vSDuGmLJmsvHzoixF7gc7lRJamNf5pJ
 ThBA==
X-Gm-Message-State: AOAM531P6engc6pSEys+5KPJNBADpLjWBteyC6kCimmDBPQ94n6uS0OI
 nRQqyu53s7peFTFF/F+5UUiHuMi8j9ePeeOgb1GQNrO/SvR+JgGB2VatI4gPnA9qzsqpGvg27ov
 ruHLPbRspXkTAzNs=
X-Received: by 2002:a05:6a00:16c7:b029:304:3644:2771 with SMTP id
 l7-20020a056a0016c7b029030436442771mr37556151pfc.73.1625079658006; 
 Wed, 30 Jun 2021 12:00:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz7OEZU+xJXcWcq/FlYGqWtWc9NEV4QuOUDW4sNH8lEky7Dk2XUhveUjb25bfbKOCX/tdvew==
X-Received: by 2002:a05:6a00:16c7:b029:304:3644:2771 with SMTP id
 l7-20020a056a0016c7b029030436442771mr37556127pfc.73.1625079657759; 
 Wed, 30 Jun 2021 12:00:57 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id me4sm7305576pjb.4.2021.06.30.12.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 12:00:57 -0700 (PDT)
Subject: Re: [PATCH 3/3] cirrus: delete FreeBSD and macOS jobs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210625172211.451010-1-berrange@redhat.com>
 <20210625172211.451010-4-berrange@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <d63add8d-44cf-c3ad-289e-49dd358b9d10@redhat.com>
Date: Wed, 30 Jun 2021 16:00:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625172211.451010-4-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Reply-To: wainersm@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/25/21 2:22 PM, Daniel P. Berrangé wrote:
> The builds for these two platforms can now be performed from GitLab CI
> using cirrus-run.
>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .cirrus.yml | 55 -----------------------------------------------------
>   1 file changed, 55 deletions(-)

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/.cirrus.yml b/.cirrus.yml
> index f4bf49b704..02c43a074a 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -1,61 +1,6 @@
>   env:
>     CIRRUS_CLONE_DEPTH: 1
>   
> -freebsd_12_task:
> -  freebsd_instance:
> -    image_family: freebsd-12-2
> -    cpu: 8
> -    memory: 8G
> -  install_script:
> -    - ASSUME_ALWAYS_YES=yes pkg bootstrap -f ;
> -    - pkg install -y bash curl cyrus-sasl git glib gmake gnutls gsed
> -          nettle perl5 pixman pkgconf png usbredir ninja
> -  script:
> -    - mkdir build
> -    - cd build
> -    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
> -    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
> -    - ../configure --enable-werror --disable-gnutls
> -      || { cat config.log meson-logs/meson-log.txt; exit 1; }
> -    - gmake -j$(sysctl -n hw.ncpu)
> -    - gmake -j$(sysctl -n hw.ncpu) check V=1
> -
> -macos_task:
> -  osx_instance:
> -    image: catalina-base
> -  install_script:
> -    - brew install pkg-config python gnu-sed glib pixman make sdl2 bash ninja
> -  script:
> -    - mkdir build
> -    - cd build
> -    - ../configure --python=/usr/local/bin/python3 --enable-werror
> -                   --extra-cflags='-Wno-error=deprecated-declarations'
> -                   || { cat config.log meson-logs/meson-log.txt; exit 1; }
> -    - gmake -j$(sysctl -n hw.ncpu)
> -    - gmake check-unit V=1
> -    - gmake check-block V=1
> -    - gmake check-qapi-schema V=1
> -    - gmake check-softfloat V=1
> -    - gmake check-qtest-x86_64 V=1
> -
> -macos_xcode_task:
> -  osx_instance:
> -    # this is an alias for the latest Xcode
> -    image: catalina-xcode
> -  install_script:
> -    - brew install pkg-config gnu-sed glib pixman make sdl2 bash ninja
> -  script:
> -    - mkdir build
> -    - cd build
> -    - ../configure --extra-cflags='-Wno-error=deprecated-declarations' --enable-modules
> -                   --enable-werror --cc=clang || { cat config.log meson-logs/meson-log.txt; exit 1; }
> -    - gmake -j$(sysctl -n hw.ncpu)
> -    - gmake check-unit V=1
> -    - gmake check-block V=1
> -    - gmake check-qapi-schema V=1
> -    - gmake check-softfloat V=1
> -    - gmake check-qtest-x86_64 V=1
> -
>   windows_msys2_task:
>     timeout_in: 90m
>     windows_container:


