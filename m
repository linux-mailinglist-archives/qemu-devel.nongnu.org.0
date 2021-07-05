Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25AC3BB7D4
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 09:30:00 +0200 (CEST)
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0J3H-0007yW-9P
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 03:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0J27-0007K1-3h
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 03:28:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0J23-0002Z1-QL
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 03:28:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625470121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2nH/o5pZVE/3HnDfGwLl3EUarwuL1jFgqy0907mOQg=;
 b=a475fo63qXsLeoaYfG37HrG2Rhd2GAAp8tcEe7mVOx/hwNel4/w7hHpkREEqoNgJZOk9/w
 akow8L1QCZOiDavmIJg5+581GvdZImloUSWPqFZzD0Zr+9VkQJh4aPqMJj1ynoagNbh+PC
 jyIXMUK2bU6RcV7+vR68pkP5Tsarlm4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-VOv5Q9eoNFS2dQJvy4T45w-1; Mon, 05 Jul 2021 03:28:40 -0400
X-MC-Unique: VOv5Q9eoNFS2dQJvy4T45w-1
Received: by mail-wr1-f72.google.com with SMTP id
 y5-20020adfe6c50000b02901258bf1d760so5895537wrm.14
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 00:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M2nH/o5pZVE/3HnDfGwLl3EUarwuL1jFgqy0907mOQg=;
 b=iu4S9p8e3TOdcg7NRxLgs8ie7AO71Ueho7tOOttKigar6GC4dcTQ2X0QFrpokKeodg
 Dht124T3/4THmWJF59uL++4+LvZz9JhF3QF9uk9i/eMDFdJDYmvzhDbOat82rflRla89
 /jGptEkftG9iEZXeUkDyL0T3CRZTb1lGHgwcK2ZjI4vJDSr2ZTJGPwCbLVC54/j8Jj9z
 Gar/NaE/eS/HbyxLc4gxh1UpPDywee1gfuagMtTT8d7WWgd6JQHEh8ET+Gl1xtC+bQAe
 dBHzSnemn1XM4JWjpA+/RTswHhgnyEF4/tM+/QftKiDfR7vtKEsw/ZngSHHHf/SK47ET
 wgPA==
X-Gm-Message-State: AOAM532A92euhe2rLwhisJqXeJkwZ3KmsiC1iKISztBh5CMJmc2cNJHE
 T7WW/XtwIfxBANRqRS8rfXwg0bZk3JGhJ3JuW96WxkLM0zaRLFLXmDC00BzWnayb2IzC1OCCCin
 2Hr4vWQcTerY8TJY=
X-Received: by 2002:a7b:c116:: with SMTP id w22mr10920308wmi.21.1625470119086; 
 Mon, 05 Jul 2021 00:28:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnZqEKjmRH7OMHVf/pjGN6g+r2XXtWjbQhnI0utDIzhwR4Mitvg9UCpN2Oo9WqX3Bo+hP2+A==
X-Received: by 2002:a7b:c116:: with SMTP id w22mr10920285wmi.21.1625470118903; 
 Mon, 05 Jul 2021 00:28:38 -0700 (PDT)
Received: from thuth.remote.csb (pd9575e1e.dip0.t-ipconnect.de. [217.87.94.30])
 by smtp.gmail.com with ESMTPSA id v25sm12385138wrd.65.2021.07.05.00.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 00:28:38 -0700 (PDT)
Subject: Re: [PATCH 1/3] ci: build & store windows installer
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210623091137.1156959-1-kraxel@redhat.com>
 <20210623091137.1156959-2-kraxel@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d8ec34a6-4d1c-7a07-b57f-3216d3f5efbb@redhat.com>
Date: Mon, 5 Jul 2021 09:28:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623091137.1156959-2-kraxel@redhat.com>
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
> Build windows installer for qemu in gitlab CI,
> store the result as artifact.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   .gitlab-ci.d/crossbuild-template.yml               | 5 +++++
>   .gitlab-ci.d/crossbuilds.yml                       | 6 ++++++
>   tests/docker/dockerfiles/fedora-win64-cross.docker | 1 +
>   3 files changed, 12 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
> index 1be541174c91..7d3ad00a1eb9 100644
> --- a/.gitlab-ci.d/crossbuild-template.yml
> +++ b/.gitlab-ci.d/crossbuild-template.yml
> @@ -11,6 +11,11 @@
>             i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
>             mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
>       - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
> +    - if grep -q "EXESUF=.exe" config-host.mak;
> +      then make installer;
> +      version="$(git describe --match v[0-9]*)";
> +      mv -v qemu-setup*.exe qemu-setup-${version}.exe;
> +      fi
>   
>   # Job to cross-build specific accelerators.
>   #
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 6b3865c9e83e..4ff3aa3cfcdd 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -160,6 +160,9 @@ cross-win32-system:
>       job: win32-fedora-cross-container
>     variables:
>       IMAGE: fedora-win32-cross
> +  artifacts:
> +    paths:
> +      - build/qemu-setup*.exe
>   
>   cross-win64-system:
>     extends: .cross_system_build_job
> @@ -167,6 +170,9 @@ cross-win64-system:
>       job: win64-fedora-cross-container
>     variables:
>       IMAGE: fedora-win64-cross
> +  artifacts:
> +    paths:
> +      - build/qemu-setup*.exe
>   
>   cross-amd64-xen-only:
>     extends: .cross_accel_build_job
> diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
> index f53007ac865e..5fbfe8892896 100644
> --- a/tests/docker/dockerfiles/fedora-win64-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
> @@ -13,6 +13,7 @@ ENV PACKAGES \
>       hostname \
>       make \
>       meson \
> +    mingw32-nsis \
>       mingw64-bzip2 \
>       mingw64-curl \
>       mingw64-glib2 \
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


