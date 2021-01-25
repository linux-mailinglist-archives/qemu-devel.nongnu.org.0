Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F33D2302803
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:38:05 +0100 (CET)
Received: from localhost ([::1]:51994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44sP-0004SY-2H
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:38:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l44rF-0003la-4O
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:36:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l44rC-0001Xw-5S
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611592609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mF9FPqUlHWVjoykeqWwi4w08Sp8vJFvJePz1tiRpnBc=;
 b=EulPzYYUcgjQfkbLvtOWu2dFBiuNAwIrJ9vhoB9CLiZ8eN3w2qumkuTt69jF1MDUB7i6i+
 uEd6DpkdarH6UwZcOB5BdRWUnhPeh5kWfpLe4pgge3QK7+mWzyYXIJD54ReqpI7Er62xJB
 R2Azp5fZn5qsZqF9EvPTWANYHJ5O67U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-6RHLaRHoPF2NxBSHl7agkw-1; Mon, 25 Jan 2021 11:36:45 -0500
X-MC-Unique: 6RHLaRHoPF2NxBSHl7agkw-1
Received: by mail-ed1-f71.google.com with SMTP id u17so7798036edi.18
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 08:36:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mF9FPqUlHWVjoykeqWwi4w08Sp8vJFvJePz1tiRpnBc=;
 b=qwt+W8JHRKL5e1c3l8PHKG84Jop8Cfrd8S2nnAC0CFpiIU3gEt0AuZpYip7yXeEk0Q
 tCt1WVuQG/GL+xolMIo6wC/lZdpSgCBS3PTyywqIB2LMUQ1UYy3t5tVarnQFQeDzV5Gr
 Cupr9XbVIGL9kHAB2N2uwmE8U2FWJgcnhb+TT7wuOi8Vq305si7SJycWZbWQsc63Na3Y
 E8XcBsZuNL25Ie5iwBsKzLprsurexZ56cE3f5cUETk6w0VwZsLQq856Lh0mDG5hRuNcD
 yoOxkI2/R2y+mK0sijedLL3j+6oiJ+AS+AtBv7NU5luN3Yy4mip+BJhQNJn+oWCtW4Yj
 1Mxg==
X-Gm-Message-State: AOAM531uYJrx13EGYClieo2mDRZ93wa6QsiY6pGG9vv7qL/XTvmg7tbL
 1lJTzCjip3UczMc4kF53mVNpafs+csSOHfJT189rc3hLwhdozJo/jhaU1s/H/G3y60vNal0B3ub
 Fv4IHxVJnejAfUYg=
X-Received: by 2002:a17:906:d19b:: with SMTP id
 c27mr929811ejz.234.1611592604823; 
 Mon, 25 Jan 2021 08:36:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrjpe+gxYry8LtOI8J+zPGPlrepri8mKhUuZpOHjqkqxoA1OPOrDdBFWd/5yrgSUPMVlRMVQ==
X-Received: by 2002:a17:906:d19b:: with SMTP id
 c27mr929795ejz.234.1611592604666; 
 Mon, 25 Jan 2021 08:36:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c14sm11116372edr.46.2021.01.25.08.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 08:36:43 -0800 (PST)
Subject: Re: [PATCH v4 1/4] configure: Fix --enable-tcg-interpreter
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-2-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2b8b6291-b54c-b285-ae38-21f067a8497d@redhat.com>
Date: Mon, 25 Jan 2021 17:36:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125144530.2837481-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/21 15:45, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> The configure option was backward, and we failed to
> pass the value on to meson.
> 
> Fixes: 23a77b2d18b ("build-system: clean up TCG/TCI configury")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20210124211119.35563-1-richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   configure | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index dcc5ea7d630..526c4cc1306 100755
> --- a/configure
> +++ b/configure
> @@ -1119,9 +1119,9 @@ for opt do
>     ;;
>     --enable-whpx) whpx="enabled"
>     ;;
> -  --disable-tcg-interpreter) tcg_interpreter="true"
> +  --disable-tcg-interpreter) tcg_interpreter="false"
>     ;;
> -  --enable-tcg-interpreter) tcg_interpreter="false"
> +  --enable-tcg-interpreter) tcg_interpreter="true"
>     ;;
>     --disable-cap-ng)  cap_ng="disabled"
>     ;;
> @@ -6361,6 +6361,7 @@ NINJA=$ninja $meson setup \
>           -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
>           -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf \
>           -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
> +        -Dtcg_interpreter=$tcg_interpreter \
>           -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
>           -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
>           -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
> 

Too bad, sorry.

There were two things to do when rebasing before the "automatic command 
line parsing" patch, and I messed up both of them.

Paolo


