Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D5B487754
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 13:06:04 +0100 (CET)
Received: from localhost ([::1]:52792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5o0Q-00077J-TX
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 07:06:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5nuc-0004LF-Uz
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 07:00:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5nub-0004cb-75
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 07:00:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641556800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yat/Qsy2FZlmD3f4lls8Zub2EBCLL2GaAVY4ykhLn98=;
 b=M8jdXo4JrpmL5nOmctxZex6rLe9w4axG8dRjhjiGiMtpleDEQB+cI0g/0g3j2zkiuWY/tL
 PRyPneppcMy2v2z78SOtWBTWEUBNfTa2wjOZXdcix7NuGR9rq3H1oKC9YNHR+QpB2DJdS1
 QHcFCvmiOhl8V1/xSCjaT5Uhp96tRcU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-xWCtQnNeMp-MqBPoae9jGw-1; Fri, 07 Jan 2022 06:59:57 -0500
X-MC-Unique: xWCtQnNeMp-MqBPoae9jGw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j8-20020a05600c1c0800b00346504f5743so4544736wms.6
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Yat/Qsy2FZlmD3f4lls8Zub2EBCLL2GaAVY4ykhLn98=;
 b=rm9QqR47aDkYq8glVAk2KIqH1GabKqq5Wvhxqc2UEXSeGYet9RWYGfm2VSLchew+RJ
 D5qtNvhKi2qLJreo48P8MEkmfvsHV2H5l6VclOje28gLx4FXYrD7pHZG5AJonD/WtZm2
 ftTNJsKirg9BM+Tu3X5AbWbg5kCn6oQ9BmaijX189jcLd2T+KU4LIg8PCPbScKzkC45F
 ukErbyMLo0PGfK5r8EJv55BMmdfiXk6tQJD88bCW4L7dgW4yLpaWnL6J9uPbbxY1k9Zn
 zzdvsrELEfwyYulV3qBU2IF2wHunPbtETRHlqiQ3eGx1ZG18fXL7Y3gXjvQaBt0qkxNW
 BDsg==
X-Gm-Message-State: AOAM530rZZHWeV2kqo2fArP1ZJGxXKejhmBfwefrpYSECzPYousInihO
 8aXoTANpeus86x1UNJ1eszR3jOwm5Dx4Fj68lk3daum5XAh8J22rUr5/6WmzvRjvqnHcqJ+szqG
 RE03/0plUSeeMPOr4TlY/KnVCBooFAYKMudDTBlfuzNMsGeFlDFfjwH0FfgtYamI=
X-Received: by 2002:adf:f14b:: with SMTP id y11mr51898478wro.493.1641556796160; 
 Fri, 07 Jan 2022 03:59:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXtfZh3AKHQeuTZFSgJQOz28emXWn8v60WvbU0KGs3HT0yLDvkshD1zoJwcadLVHKEj6G+zA==
X-Received: by 2002:adf:f14b:: with SMTP id y11mr51898462wro.493.1641556795967; 
 Fri, 07 Jan 2022 03:59:55 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id az1sm1632135wrb.104.2022.01.07.03.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 03:59:55 -0800 (PST)
Message-ID: <1b6fa831-f99e-3693-d2d4-48bc271c9d46@redhat.com>
Date: Fri, 7 Jan 2022 12:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] meson.build: Print gtk version in the summary info
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
References: <20220105190804.649316-1-thuth@redhat.com>
In-Reply-To: <20220105190804.649316-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/2022 20.08, Thomas Huth wrote:
> The "gtk" variable is re-declared as "dependencies: [gtk, gtkx11]",
> so there is just a "YES" in the summary info if gtk has been found.
> Let's use the info from the library detection instead so that the
> library version is printed in the summary instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   meson.build | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 82769749db..798811dfbb 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1058,11 +1058,11 @@ gtk = not_found
>   gtkx11 = not_found
>   vte = not_found

Drat, I'm missing a "libgtk = not_found" here ... I'll send a v2.

  Thomas


>   if not get_option('gtk').auto() or (have_system and not cocoa.found())
> -  gtk = dependency('gtk+-3.0', version: '>=3.22.0',
> -                   method: 'pkg-config',
> -                   required: get_option('gtk'),
> -                   kwargs: static_kwargs)
> -  if gtk.found()
> +  libgtk = dependency('gtk+-3.0', version: '>=3.22.0',
> +                      method: 'pkg-config',
> +                      required: get_option('gtk'),
> +                      kwargs: static_kwargs)
> +  if libgtk.found()
>       gtkx11 = dependency('gtk+-x11-3.0', version: '>=3.22.0',
>                           method: 'pkg-config',
>                           required: false,
> @@ -3410,7 +3410,7 @@ if targetos == 'darwin'
>   endif
>   summary_info += {'SDL support':       sdl}
>   summary_info += {'SDL image support': sdl_image}
> -summary_info += {'GTK support':       gtk}
> +summary_info += {'GTK support':       libgtk}
>   summary_info += {'pixman':            pixman}
>   summary_info += {'VTE support':       vte}
>   summary_info += {'slirp support':     slirp_opt == 'internal' ? slirp_opt : slirp}


