Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800DA303761
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:38:45 +0100 (CET)
Received: from localhost ([::1]:45702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Iw0-0004u1-K0
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4IuL-0004RC-OM
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:37:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4IuK-00084l-1O
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611646616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qq77+YRvB3jyIF9f7GjZX7uXRhB1u+/UeC87pC0XZgw=;
 b=OJL+2sLklMNZi/u4DCww2Ik52vOABrfH+7c8hoP32WvYBDWuYKM3xMBQyqpFtOqhjKyoS3
 ZP/5tW7a4FPLshyNhRr84oY6U0nRTRFmlFsTFXe3A6TcYGy4/3o15QTv39UWzB9LE5axor
 f/SMg3l8ngJGALrHkLe5sawL2rCahzU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-1NObnBsUPr219nM40w6Xag-1; Tue, 26 Jan 2021 02:36:55 -0500
X-MC-Unique: 1NObnBsUPr219nM40w6Xag-1
Received: by mail-ed1-f70.google.com with SMTP id a26so9017010edx.8
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 23:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qq77+YRvB3jyIF9f7GjZX7uXRhB1u+/UeC87pC0XZgw=;
 b=Urx1i7xnVjpojq922qlZjfkpLLjxTt5WjEbevi8MF1s94g9S+SmzaQLdPk3wp1R6ym
 b7kjkTsGn/47KTP8uRQ5RPwj7JwUIYvxJOd5rxEIU3l4XMM6YrIMxvBXoExp2jgO40vG
 UOq9ot+COagQIzcMmAh2DUQ9dMKO7o7hFbBDS5KtbPxQ14yUcNoI+z/y62poYUy0SJv+
 /87D/8GzKnq6qDBOHndF3HxQF83yQ2gntmn9OGiucaITLvFDMF/cpsqwOj1IT7KIyg8f
 DnaUFxOosVLorTwvH8KW/JH+YRttZuNxXytCbZPma3AMtVpUIQoECMMF6wouUTANrn8N
 JUjA==
X-Gm-Message-State: AOAM530aY8Go1/SxAbhe4EiuLCdgd2KNIBMpGCKkKxa111MTAXyR8/jt
 vbfc0WEmne5WN8TfIz8KMdttStpmtFMCc5Fq/Opshc5bGjUitd+hCY3Ih7lj1km1zPyfbxH7Uwo
 wiokLVndzFjN7QNc=
X-Received: by 2002:a17:906:1f8b:: with SMTP id
 t11mr2641482ejr.224.1611646613879; 
 Mon, 25 Jan 2021 23:36:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQqttLClTwRL+I9U+yfBXs4ozn/9W+6TL3+ZQR+1LkOXl+FydadW8ngGaUYpJQhXr5s2/57Q==
X-Received: by 2002:a17:906:1f8b:: with SMTP id
 t11mr2641474ejr.224.1611646613711; 
 Mon, 25 Jan 2021 23:36:53 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w17sm9368839ejk.124.2021.01.25.23.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 23:36:52 -0800 (PST)
Subject: Re: [PATCH] gitlab-ci.yml: Avoid recompiling the sources in the test
 jobs
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210126065757.403853-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ed621c17-43e4-3ae4-2a5f-56fb8d054e3f@redhat.com>
Date: Tue, 26 Jan 2021 08:36:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126065757.403853-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 7:57 AM, Thomas Huth wrote:
> Currently, our check-system-* jobs are recompiling the whole sources
> again. This happens due to the fact that the jobs are checking out
> the whole source tree and required submodules again, and only try
> to use the "build" directory with the binaries and object files as an
> artifact from the previous stage - which simply does not work right
> anymore (with the current version of meson). Due to some changed
> time stamps, meson/ninja are always trying to rebuild the whole tree.
> 
> In the long run, we could likely use "meson test --no-rebuild", but
> there is still some work going on in that area to improve the user
> experience. So until this has been done, simply avoid recompiling the
> sources with a trick: pass NINJA=":" to the make process in the test
> jobs. Also check out the submodules manually before updating the
> timestamps in the build folder, so that the binaries are definitely
> newer that all the source files.
> This saves ca. 10 - 15 minutes of precious CI cycles in each run.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.yml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index de3a3d25b5..16fea25ba9 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -38,9 +38,11 @@ include:
>    stage: test
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>    script:
> +    - scripts/git-submodule.sh update
> +        $(grep GIT_SUBMODULES build/config-host.mak | sed 's/GIT_SUBMODULES=//')
>      - cd build
>      - find . -type f -exec touch {} +
> -    - make $MAKE_CHECK_ARGS
> +    - make NINJA=":" $MAKE_CHECK_ARGS

This ninja trick deserves a comment in the YAML file.

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  
>  .acceptance_template: &acceptance_definition
>    cache:
> 


