Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BFD6B0023
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 08:47:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZoV6-0005gB-Ix; Wed, 08 Mar 2023 02:46:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZoV3-0005ZG-B1
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 02:46:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZoV1-0003ZT-B9
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 02:46:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678261569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5sCnaxaMkZ5FTgU0PUuLw7oOVMtJq0TMWGZFH+y3aI=;
 b=iDfy+otf9QGcRz8iUcZBKOqdvFIGcVKKFO4ZicRw25xg/ioA1JQ+mVssj2jiA9bxnVZp27
 WfGkH/DGjRD3TBxq7kogORsBF+XEGLZb5WVMmLwV6xPryyvoQ2/5b5rUy75DYk8C1oukaE
 6c+kYQCna0dKOcFrtgUN6ARhcxGjt1w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-KowjG4rdNI-ROOmZRZdUHQ-1; Wed, 08 Mar 2023 02:46:08 -0500
X-MC-Unique: KowjG4rdNI-ROOmZRZdUHQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so598837wma.7
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 23:46:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678261567;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n5sCnaxaMkZ5FTgU0PUuLw7oOVMtJq0TMWGZFH+y3aI=;
 b=7JvKUNn1dp4IYBaMGDzOV+6BGeS0nR9hD4ZWyvXG7byEWOkH1WM2odVdh/ZuU1cYDl
 u0zTf2rfkdRWPwrVf6rS6Wdg1zT3d17EqxTXKzzUMilmSGtd+RMHB36Zyh4ZmhgXGCWB
 HsNc88UYM947UN48SoLi4MoMUqpmL9Px4bhsgKf6DEfXaMyO3RbM+bzLGx7WIJ+bw8eH
 sWS33dNWWS56VUEWsJsTzwmFdr53YsDzL3etfxqfYw8IhPxHW87SqtvtZURpCD31GAoR
 FW66U8lsFo9c8V7242f28m8ZJXj16sX0y7OwkCSQ7SqFJ9prG+JKMX8wmsIyMb+iTJve
 8zZw==
X-Gm-Message-State: AO0yUKUYv2Skhq0qs/gzf2eW0om9VHti/8UupvK3lWIt3h0dTPF2TtTF
 akZ0YPI5lSLTaMjC5ZrUWQhEuRbBYFlUOSoKCl1j/WqAbA//AYXNQISr8znP+GPmeNtMS5RPrOY
 dp1Htqs7UyMzP6gg=
X-Received: by 2002:adf:ee90:0:b0:2c8:9cfe:9e29 with SMTP id
 b16-20020adfee90000000b002c89cfe9e29mr11036553wro.38.1678261567213; 
 Tue, 07 Mar 2023 23:46:07 -0800 (PST)
X-Google-Smtp-Source: AK7set/Pn8yUbV+8ypKbUOgo1Nv9OnZ3D763OrX5DyPquTgPsrrYFX1c3zIcWnt90Cepk/iZaKsNJQ==
X-Received: by 2002:adf:ee90:0:b0:2c8:9cfe:9e29 with SMTP id
 b16-20020adfee90000000b002c89cfe9e29mr11036539wro.38.1678261566945; 
 Tue, 07 Mar 2023 23:46:06 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-166.web.vodafone.de.
 [109.43.179.166]) by smtp.gmail.com with ESMTPSA id
 s17-20020a5d4ed1000000b002c5584d0e3dsm14223848wrv.24.2023.03.07.23.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 23:46:06 -0800 (PST)
Message-ID: <083a95ed-b208-64bb-09e2-b2298f726a8c@redhat.com>
Date: Wed, 8 Mar 2023 08:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/4] gitlab-ci: Remove mips64-softmmu from
 build-without-defaults job
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230308000745.56394-1-philmd@linaro.org>
 <20230308000745.56394-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230308000745.56394-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 08/03/2023 01.07, Philippe Mathieu-Daudé wrote:
> With the introduction of the MIPS virt machine in a pair
> of commits, all MIPS targets will require libfdt.
> Since the 'build-without-defaults' job is configured with
> '--disable-fdt', it won't be able to build any MIPS target.
> In particular this job triggers:
> 
>    ../meson.build:2809:2: ERROR: Problem encountered: fdt not available but required by targets mips64-softmmu
> 
> Remove 'mips64-softmmu' from the job TARGETS.
> To still cover a big-endian target in qtests, replace it by
> the s390x target.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 44b8275299..4897229f1a 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -526,9 +526,9 @@ build-without-defaults:
>         --disable-pie
>         --disable-qom-cast-debug
>         --disable-strip
> -    TARGETS: avr-softmmu mips64-softmmu s390x-softmmu sh4-softmmu
> +    TARGETS: avr-softmmu s390x-softmmu sh4-softmmu
>         sparc64-softmmu hexagon-linux-user i386-linux-user s390x-linux-user
> -    MAKE_CHECK_ARGS: check-unit check-qtest-avr check-qtest-mips64
> +    MAKE_CHECK_ARGS: check-unit check-qtest-avr check-qtest-s390x

Did you check whether this really works? IIRC the qtests fail with s390x if 
it is compiled with --without-default-devices ...?

  Thomas


