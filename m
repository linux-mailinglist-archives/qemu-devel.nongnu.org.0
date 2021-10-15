Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7254742EECB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 12:31:29 +0200 (CEST)
Received: from localhost ([::1]:58722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbKUq-00030O-1q
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 06:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbKRv-00014z-Bo
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:28:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbKRq-0001Ov-Kk
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634293700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0l3ZaCE/yAGlsKg5+5EzUh3n4EVHhpjledtGWqdZ+I=;
 b=SrYTYYpMT8hYenZNMMgy2wrMl2BtYSsvgFHj1VTAHNpeDbMWxATcSE7GA3HsLxi27KDfct
 SqVNt2JcGk/t1GgUpaRMJumLnrdI9bN8fTbqWPWuJOYJ/mccUk8sVoKKHjqqMyPmHApmEq
 XUvQV/3ZFeqrQ1wjl0jWhQmGngSd38c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-ZnD1NRl0PqSgQPWrc5QiNg-1; Fri, 15 Oct 2021 06:28:19 -0400
X-MC-Unique: ZnD1NRl0PqSgQPWrc5QiNg-1
Received: by mail-ed1-f71.google.com with SMTP id
 s12-20020a50dacc000000b003dbf7a78e88so4803873edj.2
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 03:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b0l3ZaCE/yAGlsKg5+5EzUh3n4EVHhpjledtGWqdZ+I=;
 b=f9bayBmFpKaQ5RI7LCTiUlZWlm/AFmi2vzUxTYfeg6AeLBRvZt1tQbqwNzq9wYJAfa
 Z1mxQXKOVZsEd7vjArf+0qD0Pxk7lk3Diz025CLvwxa6HZJZR2XKRbeCDQ7AQgtxqDvY
 jLVOBGnKNZoyjxragblTx3e6G72pyvnlUiTX6HnXLmnheUmLNpUtOZVT1u3lJ/o9FsJs
 HeFGFRkSmuob22AbCeZ2urBZF89M/oVtd03APRTiuV3dX86dyoB/VtnG/u0zuRK+B4Db
 b8sbcmQTsIGYQc6cfSQJQd+r7oLYBmOJzWxJCnuhQhaMw+zQuGx6Ee8qgJUqBiibDzUX
 N/zw==
X-Gm-Message-State: AOAM530Bhdke9/3Z8OjdK0Rbdo08Lr1JQKYy7kngNZ6Son3wT9NElGsH
 3JYikhI6HE1XKl0b1Yn2gWwosKloDuV/M2okJC9JN5+FECL7975ht9SQoBBQWZr/b1Q6D5I9RsP
 Y4bZOwhMmPmgT0L0=
X-Received: by 2002:a05:6402:10da:: with SMTP id
 p26mr16760200edu.283.1634293698262; 
 Fri, 15 Oct 2021 03:28:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtUgevThNWZVf2Sm7woGoZQ4zff685OeZWWJ172sGvdgv07V3bY8LyouEKDerECYT26yOdZg==
X-Received: by 2002:a05:6402:10da:: with SMTP id
 p26mr16760175edu.283.1634293698050; 
 Fri, 15 Oct 2021 03:28:18 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r3sm4102108ejr.79.2021.10.15.03.28.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 03:28:17 -0700 (PDT)
Message-ID: <43f5a2b0-0483-9e43-9d6e-d897dd30273a@redhat.com>
Date: Fri, 15 Oct 2021 12:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] Partially revert "build: -no-pie is no functional
 linker flag"
To: Jessica Clarke <jrtc27@jrtc27.com>, qemu-devel@nongnu.org
References: <20210805191430.37409-1-jrtc27@jrtc27.com>
 <20210805192545.38279-1-jrtc27@jrtc27.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210805192545.38279-1-jrtc27@jrtc27.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-stable@nongnu.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/21 21:25, Jessica Clarke wrote:
> This partially reverts commit bbd2d5a8120771ec59b86a80a1f51884e0a26e53.
> 
> This commit was misguided and broke using --disable-pie on any distro
> that enables PIE by default in their compiler driver, including Debian
> and its derivatives. Whilst -no-pie is not a linker flag, it is a
> compiler driver flag that ensures -pie is not automatically passed by it
> to the linker. Without it, all compile_prog checks will fail as any code
> built with the explicit -fno-pie will fail to link with the implicit
> default -pie due to trying to use position-dependent relocations. The
> only bug that needed fixing was LDFLAGS_NOPIE being used as a flag for
> the linker itself in pc-bios/optionrom/Makefile.
> 
> Note this does not reinstate exporting LDFLAGS_NOPIE, as it is unused,
> since the only previous use was the one that should not have existed. I
> have also updated the comment for the -fno-pie and -no-pie checks to
> reflect what they're actually needed for.
> 
> Fixes: bbd2d5a8120771ec59b86a80a1f51884e0a26e53
> Cc: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
> Changes in v2:
>    * Actually include the comment change; didn't add the hunk when
>      amending...
> 
>   configure | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 9a79a004d7..8aecd277ed 100755
> --- a/configure
> +++ b/configure
> @@ -2246,9 +2246,11 @@ static THREAD int tls_var;
>   int main(void) { return tls_var; }
>   EOF
>   
> -# Check we support --no-pie first; we will need this for building ROMs.
> +# Check we support -fno-pie and -no-pie first; we will need the former for
> +# building ROMs, and both for everything if --disable-pie is passed.
>   if compile_prog "-Werror -fno-pie" "-no-pie"; then
>     CFLAGS_NOPIE="-fno-pie"
> +  LDFLAGS_NOPIE="-no-pie"
>   fi
>   
>   if test "$static" = "yes"; then
> @@ -2264,6 +2266,7 @@ if test "$static" = "yes"; then
>     fi
>   elif test "$pie" = "no"; then
>     CONFIGURE_CFLAGS="$CFLAGS_NOPIE $CONFIGURE_CFLAGS"
> +  CONFIGURE_LDFLAGS="$LDFLAGS_NOPIE $CONFIGURE_LDFLAGS"
>   elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
>     CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
>     CONFIGURE_LDFLAGS="-pie $CONFIGURE_LDFLAGS"
> 

Queued, thanks.

Paolo


