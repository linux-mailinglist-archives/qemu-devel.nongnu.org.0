Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E3A4A9C9E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 17:01:45 +0100 (CET)
Received: from localhost ([::1]:34770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG11s-0006pV-Fv
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 11:01:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0wj-0000z6-RE
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:56:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0we-0001JY-Tw
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643990172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UMNmS+2NXVbAAqTxNrA9vOZxctrbzX+rtlWaipPWRTw=;
 b=IN2ckS/sz7vETNJ3MAhPh1/AJybNFRq14f4WSnZFmOqwH54UnxHmAmCNhXZAxawXSAhVPh
 HixeRZeElLDd+bSuT6+p9owKEYiYgWre2jBLk8tpEox8BK8J/Iv1eUOhPIaVcNM08nJ9pF
 sxniODOg6ziojoPzkYb2jf3sDD6Qovk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-pfZvVb2cM2qLTle4JMObOA-1; Fri, 04 Feb 2022 10:56:11 -0500
X-MC-Unique: pfZvVb2cM2qLTle4JMObOA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m18-20020a7bca52000000b003552c4e2550so2417029wml.0
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 07:56:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UMNmS+2NXVbAAqTxNrA9vOZxctrbzX+rtlWaipPWRTw=;
 b=1dfzi5NMayYiHV4snVOSGYREYWy8jRJBBqGK7I6+KTNE4HUJJXTz1BH7S7GDnorAKN
 BjRXVAsnn9CfV1oeDSeh9Plrfd7m46oPbVscOJobLY7HedEpNTrCNdL0LeZJ2SoyaKyJ
 WWFoIt6Ro/nmMKw8iQcBkvnJvhzZn2yMCBiu28wjEiJKOgDUm5TLX55f4hkQj7nuNKUC
 30ewYrBse1tFCUB4KQXynOkUTJWt7VlBoXUl/3mRazIGKdYfKT9ywuhGDesED48uYDxa
 K9oFMce/Qmels7yj63j5hg461+lVxVPz9tmB+68TVvevFf+6v+G5wpOYWfXJLarP+u/N
 0Z1A==
X-Gm-Message-State: AOAM532h6t5sKO1SWIrVAFAHppAGKs1bcMfyD9v4RGDgKKBcS9l2p7Lg
 SDdKsVu8jZ3Mc4l9Fdbx9+mcJmsejtNcjNo1K9UflJNkskbU3Erdvl/blbQCIL4xlHlPvBPyTtB
 hPusjG9B8+pV83yk=
X-Received: by 2002:a5d:59aa:: with SMTP id p10mr2989828wrr.418.1643990170514; 
 Fri, 04 Feb 2022 07:56:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLo+2qW76ow6xXfzGOMojT5R17y6HiWrBlwc67kjJ3O6D/NpQTZZxYH9tGfVSODQ4Xc7a95A==
X-Received: by 2002:a5d:59aa:: with SMTP id p10mr2989808wrr.418.1643990170308; 
 Fri, 04 Feb 2022 07:56:10 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id n15sm1964747wmr.26.2022.02.04.07.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 07:56:09 -0800 (PST)
Message-ID: <ef2f4459-9c30-c9c1-73cb-02d439ec3a92@redhat.com>
Date: Fri, 4 Feb 2022 16:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] qom: Remove user-creatable objects from user emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220204152924.6253-1-f4bug@amsat.org>
 <20220204152924.6253-4-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220204152924.6253-4-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/2022 16.29, Philippe Mathieu-Daudé wrote:
> user-mode don't use user-creatable objects. Restrict it to
> sysemu / tools.
> 
> Add a stub to avoid a link failure with the global callback:
> 
>    /usr/bin/ld: libqom.fa(qom_object.c.o): in function `object_initialize_child_with_propsv':
>    ../qom/object.c:578: undefined reference to `user_creatable_complete'
>    /usr/bin/ld: libqom.fa(qom_object.c.o): in function `object_new_with_propv':
>    ../qom/object.c:801: undefined reference to `user_creatable_complete'
>    collect2: error: ld returned 1 exit status
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   qom/meson.build           | 7 ++++++-
>   qom/user_creatable-stub.c | 8 ++++++++
>   tests/unit/meson.build    | 2 +-
>   3 files changed, 15 insertions(+), 2 deletions(-)
>   create mode 100644 qom/user_creatable-stub.c
> 
> diff --git a/qom/meson.build b/qom/meson.build
> index 062a3789d8..afc60cc19d 100644
> --- a/qom/meson.build
> +++ b/qom/meson.build
> @@ -2,9 +2,14 @@ qom_ss.add(genh)
>   qom_ss.add(files(
>     'container.c',
>     'object.c',
> -  'object_interfaces.c',
>     'qom-qobject.c',
>   ))
>   
> +if have_system or have_tools
> +  qom_ss.add(files('object_interfaces.c'))
> +else
> +  qom_ss.add(files('user_creatable-stub.c'))
> +endif

Could you please name the new file object_interfaces_stub.c, so that it is 
clear that they belong together?

  Thanks,
   Thomas


