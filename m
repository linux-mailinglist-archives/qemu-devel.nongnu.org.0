Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECA1401CA0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:49:23 +0200 (CEST)
Received: from localhost ([::1]:59126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEzy-00034P-BQ
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNEe1-0006u4-OV
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:26:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNEdv-0003Ax-I4
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630934794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k++R1LDoKiCbCpb/pIGR+6lQbFuV2LJZTiJZ38lQtGI=;
 b=fXYjAxUG9+Ufl02H77SiPi74SoQ2n7UzS6mANi8gXQJitvXx3D6+uXJXIsiNivdWMZ9gPZ
 uKstMyXVulgYNgKiXO6RpKx2JQKslZjmoFpV3rJZuI/wsInga7wz8D5x+HigeO+kcVGvJa
 mC80/cSz8Vcx+ZwDAt4R0Ja2uBZOcTc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-tn_9eOsuNneYIBVwKESj_g-1; Mon, 06 Sep 2021 09:26:21 -0400
X-MC-Unique: tn_9eOsuNneYIBVwKESj_g-1
Received: by mail-wr1-f71.google.com with SMTP id
 v6-20020adfe4c6000000b001574f9d8336so1192425wrm.15
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k++R1LDoKiCbCpb/pIGR+6lQbFuV2LJZTiJZ38lQtGI=;
 b=QZtv97WVh5OV6PfAYy91mHetnb3ooKz4tVa24lpOnb9M0cYVnNgcYatmomHr9QtkbA
 50fMkVR0B9JshyinzJWMrk70A9xuc9aVwifdphSpkcnfEWU2QdkaCIVgSe8alpsnjNuV
 X+MPX35DfYQcxYHSUN9s4kfSIclB26xFmMWLl2s+Rwl3C+JzZn2DCX5NCqkZJgyv3QGw
 dLNcnEGAFzt0KFPOa2YC47RsN+PsxZKOXIQKpmoRQEOlAaNAsEQ1zxTAopc3oZa6nCBW
 iUk4xdtx7Vcx1AWmaNUEhNK2eo71m9QoSaBnqlExzlsgWpikY6aAKFlAO5fm+C1dv0/m
 uWJQ==
X-Gm-Message-State: AOAM531BuhxJU4+kvISqdpsFa0YzeIisVM45eknBAtkXtf+jaigPjfW8
 VWKCW/Ltmp92nh7+1CQJHWgmWTUdHkcBDHnXPs4HgmHDEwD0rXtZB7lNpsmG7fAvxbofGEcdAu0
 p4196a8RHqRy5FVHQaV9D0XOSgBDcyQRyuybGwp6jPvrcaxey22ScjtKOMjDVNII=
X-Received: by 2002:a05:600c:295:: with SMTP id
 21mr11402815wmk.37.1630934780173; 
 Mon, 06 Sep 2021 06:26:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJnRt1RYVsc2SYN8h8tsfASA3lDI9arPfqNBRNzZ9++mQKBqweytlgbZr/6dHwg9v/3y8mbg==
X-Received: by 2002:a05:600c:295:: with SMTP id
 21mr11402796wmk.37.1630934779883; 
 Mon, 06 Sep 2021 06:26:19 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831a0.dip0.t-ipconnect.de.
 [217.232.49.160])
 by smtp.gmail.com with ESMTPSA id u9sm7990289wrm.70.2021.09.06.06.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 06:26:19 -0700 (PDT)
Subject: Re: [PULL 08/36] configure / meson: Move the GBM handling to
 meson.build
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210906131059.55234-1-pbonzini@redhat.com>
 <20210906131059.55234-9-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <809702cb-4d56-b5e8-2734-9aa39e3a4cfc@redhat.com>
Date: Mon, 6 Sep 2021 15:26:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210906131059.55234-9-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/09/2021 15.10, Paolo Bonzini wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> The GBM library detection does not need to be in the configure script,
> since it does not have any user-facing options (there are no
> --enable-gbm or --disable-gbm switches). Let's move it to meson.build
> instead, so we don't have to clutter config-host.mak with the related
> switches.
> 
> Additionally, only check for GBM if it is really required, i.e. if we
> either compile with OpenGL or with virglrenderer support.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20210713111516.734834-1-thuth@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure                          | 14 --------------
>   contrib/vhost-user-gpu/meson.build |  5 ++---
>   meson.build                        | 14 ++++++++------
>   3 files changed, 10 insertions(+), 23 deletions(-)
> 
> diff --git a/configure b/configure
> index bd823307a6..8adf2127c3 100755
> --- a/configure
> +++ b/configure
> @@ -3451,13 +3451,6 @@ esac
>   ##########################################
>   # opengl probe (for sdl2, gtk)
>   
> -gbm="no"
> -if $pkg_config gbm; then
> -    gbm_cflags="$($pkg_config --cflags gbm)"
> -    gbm_libs="$($pkg_config --libs gbm)"
> -    gbm="yes"
> -fi
> -
>   if test "$opengl" != "no" ; then
>     epoxy=no
>     if $pkg_config epoxy; then
> @@ -4688,13 +4681,6 @@ if test "$opengl" = "yes" ; then
>     echo "OPENGL_LIBS=$opengl_libs" >> $config_host_mak
>   fi
>   
> -if test "$gbm" = "yes" ; then
> -    echo "CONFIG_GBM=y" >> $config_host_mak
> -    echo "GBM_LIBS=$gbm_libs" >> $config_host_mak
> -    echo "GBM_CFLAGS=$gbm_cflags" >> $config_host_mak
> -fi
> -
> -
>   if test "$avx2_opt" = "yes" ; then
>     echo "CONFIG_AVX2_OPT=y" >> $config_host_mak
>   fi
> diff --git a/contrib/vhost-user-gpu/meson.build b/contrib/vhost-user-gpu/meson.build
> index 4cb52a91d7..92c8f3a86a 100644
> --- a/contrib/vhost-user-gpu/meson.build
> +++ b/contrib/vhost-user-gpu/meson.build
> @@ -1,6 +1,5 @@
> -if 'CONFIG_TOOLS' in config_host and virgl.found() \
> -    and 'CONFIG_GBM' in config_host and 'CONFIG_LINUX' in config_host \
> -    and pixman.found()
> +if 'CONFIG_TOOLS' in config_host and virgl.found() and gbm.found() \
> +    and 'CONFIG_LINUX' in config_host and pixman.found()
>     executable('vhost-user-gpu', files('vhost-user-gpu.c', 'virgl.c', 'vugbm.c'),
>                dependencies: [qemuutil, pixman, gbm, virgl, vhost_user, opengl],
>                install: true,
> diff --git a/meson.build b/meson.build
> index bf63784812..13df8c37c7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -472,11 +472,6 @@ if not get_option('zstd').auto() or have_block
>                       required: get_option('zstd'),
>                       method: 'pkg-config', kwargs: static_kwargs)
>   endif
> -gbm = not_found
> -if 'CONFIG_GBM' in config_host
> -  gbm = declare_dependency(compile_args: config_host['GBM_CFLAGS'].split(),
> -                           link_args: config_host['GBM_LIBS'].split())
> -endif
>   virgl = not_found
>   if not get_option('virglrenderer').auto() or have_system
>     virgl = dependency('virglrenderer',
> @@ -816,11 +811,17 @@ coreaudio = not_found
>   if 'CONFIG_AUDIO_COREAUDIO' in config_host
>     coreaudio = declare_dependency(link_args: config_host['COREAUDIO_LIBS'].split())
>   endif
> +
>   opengl = not_found
>   if 'CONFIG_OPENGL' in config_host
>     opengl = declare_dependency(compile_args: config_host['OPENGL_CFLAGS'].split(),
>                                 link_args: config_host['OPENGL_LIBS'].split())
>   endif
> +gbm = not_found
> +if virgl.found() or 'CONFIG_OPENGL' in config_host
> +  gbm = dependency('gbm', method: 'pkg-config',
> +                   required: false, kwargs: static_kwargs)
> +endif

Please drop this version of the patch, it caused a new warning in Peter's 
merge tests, see:

  https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg01026.html

I've got a fixed version in my pull request from today.

  Thomas


