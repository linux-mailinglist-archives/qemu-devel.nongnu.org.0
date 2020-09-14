Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1695B268C32
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 15:29:39 +0200 (CEST)
Received: from localhost ([::1]:58270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHoY6-00029P-6x
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 09:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kHoX6-0001K1-Dr
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 09:28:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kHoX4-0000UP-8t
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 09:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600090113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qk0qO0h8NBEHPVVvul+pQxNN4lsHeEyhmFEWczskJf8=;
 b=WxLwS0E31WFZLQD7w36pKxzTbxmbAT5neuiwgsaVPg/5FUSVS1cRB196xwiVUKCLksHf+c
 7cQB9lYf5N4Wup/ZFdQ5QNgoK2LHAffjOPrNt2BytbTp0Y4n2a81WIGFUWvEm5gUXh6UuB
 cGKTriiJzGt/3TISu1FzfER1aKpXANE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-cJOzmGaCOT6bGehzW_limQ-1; Mon, 14 Sep 2020 09:28:29 -0400
X-MC-Unique: cJOzmGaCOT6bGehzW_limQ-1
Received: by mail-ej1-f71.google.com with SMTP id dc22so7974565ejb.21
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 06:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qk0qO0h8NBEHPVVvul+pQxNN4lsHeEyhmFEWczskJf8=;
 b=ne8D1a1ByKemSCcF7P0jyanoTJeyUCZNlP7mbhXpI19CBkujUwyUwnOXRg1VVXWmka
 9ZP6awSbrMh0eZv3PiH+nEzXChnL2dD9jUC/iTpFr6g6JWw5rmRi8AFUw+Mapcdw4FFs
 rjFf8JEKzEXV/kkYRGDDyopW7DkXBNorkP8unn4LCj0JOi1jfOCTv7cSl0YALg3SCHeC
 VN8Ivz1R/BMRCdxUHFcdWLqaAnlPzk5P78wPqJ/+gEgJMai14E/PHpoMLU/N6MFIrZa8
 W73fcNehHgCyigC0we5VsOF3pxjtv1Rf6g8AocmD+jO/q5toTLnYYRH2EWpQcuuTadhJ
 zC0g==
X-Gm-Message-State: AOAM530RcHG2cZSxNLLLGYin0OqMPPzwQ60Ck3EO6jHO4y5lPNIR3vjc
 CT6Vcy3B4BUTkeMbQppkj+yAdRElP/gHGG5FQYfDuVXx4UDWY/l9zlv94Gc0A/DhNunui9o7FTV
 KsFha9x+CiVraNRg=
X-Received: by 2002:a17:906:9491:: with SMTP id
 t17mr15265022ejx.253.1600090108352; 
 Mon, 14 Sep 2020 06:28:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY+5cCHDUjjO7/59DABhmMLLs/aExxKBUZIdjWIucSzqYEjoLTA4UViqCLavpBjh+8hqmuNw==
X-Received: by 2002:a17:906:9491:: with SMTP id
 t17mr15264994ejx.253.1600090108129; 
 Mon, 14 Sep 2020 06:28:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d386:a377:dd9c:9b59?
 ([2001:b07:6468:f312:d386:a377:dd9c:9b59])
 by smtp.gmail.com with ESMTPSA id be2sm9323845edb.0.2020.09.14.06.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 06:28:27 -0700 (PDT)
Subject: Re: [PATCH 01/11] capstone: Convert Makefile bits to meson bits
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200914000153.1725632-1-richard.henderson@linaro.org>
 <20200914000153.1725632-2-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d5628860-7cc3-04af-601e-3f3941791573@redhat.com>
Date: Mon, 14 Sep 2020 15:28:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200914000153.1725632-2-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:10:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: luoyonggang@gmail.com, alex.bennee@linaro.org, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/09/20 02:01, Richard Henderson wrote:
> 
>  case "$capstone" in
> -  git | internal)
> +  git)
>      if test "$capstone" = git; then
>        git_submodules="${git_submodules} capstone"
>      fi
> -    mkdir -p capstone
> -    if test "$mingw32" = "yes"; then
> -      LIBCAPSTONE=capstone.lib
> -    else
> -      LIBCAPSTONE=libcapstone.a
> -    fi
> -    capstone_libs="-Lcapstone -lcapstone"
> -    capstone_cflags="-I${source_path}/capstone/include"
>      ;;
>  
> -  system)
> -    capstone_libs="$($pkg_config --libs capstone)"
> -    capstone_cflags="$($pkg_config --cflags capstone)"
> +  internal | system | no)
>      ;;
>  
> -  no)
> -    ;;
>    *)
>      error_exit "Unknown state for capstone: $capstone"
>      ;;

We can simplify it further if we move the selection logic to
meson.build.  Here in configure the whole capstone stanza
is replaced by

capstone=auto
...
case "$capstone" in
  auto|git)
    # Simpler to always update submodule, even if not needed
    if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
      git_submodules="${git_submodules} capstone"
    fi
    test "$capstone" = git && capstone=internal
    ;;
esac

and in meson.build:

capstone = not_found
build_internal_capstone = false
if get_option('capstone') != 'no'
  if get_option('capstone') != 'internal'
    capstone = dependency('capstone',
                          required: get_option('capstone') == 'system',
                          method: 'pkg-config',
                          static: enable_static)
  endif
  build_internal_capstone = not capstone.found()
endif
...
if build_internal_capstone
  ...
  capstone = declare_dependency(...)
endif

> +option('capstone', type: 'string', value: 'no',
> +       description: 'capstone support')

That would become:

+option('capstone', type: 'combo', value: 'auto',
+       choices: ['auto', 'system', 'internal', 'no'],
+       description: 'How to find the capstone library')

Thanks,

Paolo


