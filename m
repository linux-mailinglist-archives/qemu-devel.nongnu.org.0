Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CF13BB7E6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 09:32:31 +0200 (CEST)
Received: from localhost ([::1]:33690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0J5i-0001K3-J5
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 03:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0J4a-0000dX-Sv
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 03:31:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0J4Y-0004cp-PE
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 03:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625470277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vRUXkfqtOkgAUvH5L2Or6JFZttWy/B8XnoKE9fntgvs=;
 b=BWvlPbH9grnwruMyiDmYCjOgbx6dEiXQm3l2dstX17PQs5R+Fyq5asgCY9T63DT+gm3pw0
 FY9SD41pVrFBqYcgkUfqK7JUgBNpBkw3rfIbJQ9rTWIRIqHbyZZBIWD6u0HSnTyakwba74
 xvR3fW+TlYLTXZYb5AnTPrAoy+9gXa8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-QjdnLormMNilgRDuYLE-Qw-1; Mon, 05 Jul 2021 03:31:16 -0400
X-MC-Unique: QjdnLormMNilgRDuYLE-Qw-1
Received: by mail-wr1-f71.google.com with SMTP id
 l12-20020a5d410c0000b029012b4f055c9bso5670130wrp.4
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 00:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vRUXkfqtOkgAUvH5L2Or6JFZttWy/B8XnoKE9fntgvs=;
 b=D9VVLUokTUn9dxnB2fF7aybBY71AOwsXq8VbEEnq6mQh0NoHBhrQS3buxFOojXEQrP
 j419LyXM9vldTLiI5yZoFLt9r9r9fqHqd3g9kngt1uM7RHpbkB5aroVN4xOtDbuH4o1u
 wl1+ZMdGISfp/eaiub/a+0hvAsSBxRXY508ZBGp69G6fbLhHSTxjrar6n0uER0uln7I4
 0lhS2TpjAv7in8We/vv7hfQ6bQJQ+ivs1v7xNcx/9qZ3zKDJgPRZs7ERM01SHh+IM5eb
 nxwj6Lq9HHA+yynRi/4tlUdmS5ijTclWyeKWAfG/sKD8eoiopoVNWN7xdRm4o1P66T/W
 oR0g==
X-Gm-Message-State: AOAM5319d9rigOkJY8nf/ueZrt0CUZxWvaLq0CqLyzYkyyG5ADalth3o
 UnjvonM3FLWCj84YKGIWMS2/XIoxVjO+ezxMFzoxK6lfY0MBE/aK06hRb9vC9ZacbNHM0i5NQoP
 1DfcBqeE7d8V4EXg=
X-Received: by 2002:a5d:4d04:: with SMTP id z4mr13956756wrt.133.1625470275678; 
 Mon, 05 Jul 2021 00:31:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6T5VuHuWmoNfCQt1hHkq476JEL5YTq54GTfPZss9Oi8DQGS0oqpXSqkg5BpJzLtT7pxau4w==
X-Received: by 2002:a5d:4d04:: with SMTP id z4mr13956735wrt.133.1625470275458; 
 Mon, 05 Jul 2021 00:31:15 -0700 (PDT)
Received: from thuth.remote.csb (pd9575e1e.dip0.t-ipconnect.de. [217.87.94.30])
 by smtp.gmail.com with ESMTPSA id c7sm12248105wrs.23.2021.07.05.00.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 00:31:15 -0700 (PDT)
Subject: Re: [PATCH 3/3] ci: build & store guest agent msi
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210623091137.1156959-1-kraxel@redhat.com>
 <20210623091137.1156959-4-kraxel@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fc59bbd5-2f5b-8d47-4960-a2b129f28a55@redhat.com>
Date: Mon, 5 Jul 2021 09:31:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623091137.1156959-4-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/06/2021 11.11, Gerd Hoffmann wrote:
> Build guest agent windows msi install package in gitlab CI,
> store the result as artifact.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   .gitlab-ci.d/crossbuild-template.yml               | 3 ++-
>   .gitlab-ci.d/crossbuilds.yml                       | 2 ++
>   tests/docker/dockerfiles/fedora-win32-cross.docker | 1 +
>   tests/docker/dockerfiles/fedora-win64-cross.docker | 1 +
>   4 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
> index 5411177935fc..507440af0f4e 100644
> --- a/.gitlab-ci.d/crossbuild-template.yml
> +++ b/.gitlab-ci.d/crossbuild-template.yml
> @@ -13,9 +13,10 @@
>       - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>       - if grep -q "EXESUF=.exe" config-host.mak;
>         then scripts/copy-dlls;
> -      make installer;
> +      make installer msi;
>         version="$(git describe --match v[0-9]*)";
>         mv -v qemu-setup*.exe qemu-setup-${version}.exe;
> +      mv -v qga/*.msi $(basename qga/*.msi .msi)-${version}.msi;
>         fi
>   
>   # Job to cross-build specific accelerators.
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 4ff3aa3cfcdd..fc14a1cf5c10 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -163,6 +163,7 @@ cross-win32-system:
>     artifacts:
>       paths:
>         - build/qemu-setup*.exe
> +      - build/qemu-ga*.msi
>   
>   cross-win64-system:
>     extends: .cross_system_build_job
> @@ -173,6 +174,7 @@ cross-win64-system:
>     artifacts:
>       paths:
>         - build/qemu-setup*.exe
> +      - build/qemu-ga*.msi
>   
>   cross-amd64-xen-only:
>     extends: .cross_accel_build_job
> diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
> index a638afb525ce..9fffc8e73881 100644
> --- a/tests/docker/dockerfiles/fedora-win32-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
> @@ -28,6 +28,7 @@ ENV PACKAGES \
>       mingw32-pixman \
>       mingw32-pkg-config \
>       mingw32-SDL2 \
> +    msitools \
>       perl \
>       perl-Test-Harness \
>       python3 \
> diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
> index 5fbfe8892896..d748c37c4aa4 100644
> --- a/tests/docker/dockerfiles/fedora-win64-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
> @@ -25,6 +25,7 @@ ENV PACKAGES \
>       mingw64-libtasn1 \
>       mingw64-pixman \
>       mingw64-pkg-config \
> +    msitools \
>       perl \
>       perl-Test-Harness \
>       python3 \
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


