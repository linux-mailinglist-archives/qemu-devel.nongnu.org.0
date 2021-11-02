Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55364442D5C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:00:59 +0100 (CET)
Received: from localhost ([::1]:47374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsTK-0000wz-E7
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhrmP-000309-RA
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:16:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhrmI-0004Wh-NQ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635851788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4aB1tDISQ5VLT3FZXUqnx5+jKAJUMTjQxjpx3IGWs4=;
 b=Q0tkJ5zMW2PFNjX0jYPq+VPdsAByniqzWIXFEqwm+nr0XbryeH6oN52dTsahRX012/6zbp
 pNb5byzw/45w7gPbPhKMmbht4S91XdZ2V+cjx704zTmPNbQiLha4G7Zzg7jT78PSrZqa0U
 WqrWpxXKk1MeHPdMJcKILW7wjGrAcso=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-wYppxfoBM2iqvha9lug_TA-1; Tue, 02 Nov 2021 07:16:27 -0400
X-MC-Unique: wYppxfoBM2iqvha9lug_TA-1
Received: by mail-wm1-f72.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so380508wmb.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x4aB1tDISQ5VLT3FZXUqnx5+jKAJUMTjQxjpx3IGWs4=;
 b=VWmOLxB0tixxOmqicTj9syW2t6VBdWTJDAJtsKYmBnMETajxKe9arN/Bkv+akU5Srw
 yyb5Yc3lgj/sokS1Ym6ZOOy+O+vaB7qWE2UMRWeUyHe+F4xMs6ltMEW6n77qLt/zhXnj
 jtOgWdXPO+Is8uUHj2LLNI+6RL/FueZwgJhMS2wEDtxyFLfhtGSm5n/N5fXli53kabRv
 YHWZxk/ec8FKQe9bnaRNdnLBlnmjRiHsIH3mlvBdNtfyaDvS2HLxnnQrk7Xuuc9qq9yz
 K+kABW/sFKDBA+EfhmyHuQOlSrRqDRrORkf/mH4MQEKAuycBGRWk8dVQ8p2f+q3a1/cV
 vWHg==
X-Gm-Message-State: AOAM531GhbrZV1WAbx9DW6QLOniSg8fl1lZ5/6YAtn9sfwgXIU/5hchf
 iH9c3l0ZEt/rBNxg5AfAMxELCA5pC3Gshpbk4bgcZtU5Fe2oHwzAyrxfWdPEeDL95mO+qbqhevS
 kWlHLKwdjHG/JQVk=
X-Received: by 2002:a5d:4909:: with SMTP id x9mr42747321wrq.313.1635851786228; 
 Tue, 02 Nov 2021 04:16:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLI6MzOHv2iBMWPT/YEe9ENVaAb8hQhuvxRIg1mEtACdIxFyUz+KtLMGNNF2te0yeDjtJ6Fg==
X-Received: by 2002:a5d:4909:: with SMTP id x9mr42747291wrq.313.1635851785962; 
 Tue, 02 Nov 2021 04:16:25 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k8sm2404881wms.41.2021.11.02.04.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:16:25 -0700 (PDT)
Message-ID: <7ec62eaf-d8e6-a27c-d6cd-64d09d17cb58@redhat.com>
Date: Tue, 2 Nov 2021 12:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] meson.build: Allow to disable OSS again
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211102105822.773131-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211102105822.773131-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/11/21 11:58, Thomas Huth wrote:
> If sys/soundcard.h is available, it is currently not possible to
> disable OSS with the --disable-oss or --without-default-features
> configure switches. Improve the check in meson.build to fix this.
> 
> Fixes: 87430d5b13 ("configure, meson: move audio driver detection to Meson")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Only ever look for OSS if we also have system emulation enabled
> 
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 6dec5dd5cc..2848917602 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -915,7 +915,7 @@ if liblzfse.found() and not cc.links('''
>   endif
>   
>   oss = not_found
> -if not get_option('oss').auto() or have_system
> +if have_system and not get_option('oss').disabled()
>     if not cc.has_header('sys/soundcard.h')
>       # not found
>     elif targetos == 'netbsd'
> 

Queued, thanks.

Paolo


