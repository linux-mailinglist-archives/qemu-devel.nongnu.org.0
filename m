Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8030391FBC
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:53:42 +0200 (CEST)
Received: from localhost ([::1]:52710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyez-0008Ge-Qn
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyde-0006EZ-3W
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:52:18 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llydc-0002TX-Cb
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:52:17 -0400
Received: by mail-pj1-x102c.google.com with SMTP id q6so1323369pjj.2
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 11:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kT1xUNF4f6L25btn+DyiPy9pW7WhAnBXo2uI3qgxwH0=;
 b=mKJkvtKjbYLg1TlGTGWaGXeidfHieEYpKxKvkI9Ddu8WKpUdTc/W5KRS3+dNw/dqIe
 HNNkP3ZAFgju6kugyZW3TCO/JY8u0xZID+8t/q+re1U7KGWarJa0IlljhJV38OBkStl0
 BQSHfSLX4vFxTpNny/fuuvklZZvbOS0PlnWK9BO0XA0Xvut6nklQwgW431gv3Y8LoWXh
 ERdLmu5T92hEWkC7sTyqeir8WmrktuJvyBTZTv0tY+pbRYD0ugj6CbwAieFtVmFGDndi
 EM68anrmoxVFiljABz73ygYjhixdOTXVue096Y585NLXnxkix4mW5zQ6j/YD1FLUWqFI
 lnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kT1xUNF4f6L25btn+DyiPy9pW7WhAnBXo2uI3qgxwH0=;
 b=H4tPTL/oGvStwpWt3svhqUcolCwrrqcQd7Mq4QVGxPReFuEGP7lEtO5SxKD0ZyaWdS
 BURcZK1ylJChCWquVpOadzhAiCkAS++xM/R12j3l7Yn0AWPR559g8nRelKJeKAw+fW8E
 eLbU4sBSJsqs2V4sIDSjFoOwRVJUKI0Ke/zZtc2zVtOyU4Kr/SpjZZy64Yuq6kU//YmK
 frryHKChHWWstGBUrCBmifBL4MsLBDtXeBcV1yEP/UGVBgLHTeKf3nG7QmZfcAZqNG86
 DEDvhBSqa1SCeicyzQs1UbQpcX4QnaC4noPHD0Alb/D6hOa3HAPP4iJCPNB7AAq7gzeK
 wjfQ==
X-Gm-Message-State: AOAM531pcxcbcaXXC5Z5/rdKwFQhBlZEO48dap5cXJc2HjJpXpey5e2v
 wWqTFH5Fo3b/bZIkDJNUyd7e5A==
X-Google-Smtp-Source: ABdhPJyDrAFgcZo2mq2Sa4hMWgPx1CHa0Ly8XcFs8ReNIzIdIKPikZb5K8fh8ZzTr/mTN7oaYdFk1g==
X-Received: by 2002:a17:902:eed5:b029:fd:c6ca:c583 with SMTP id
 h21-20020a170902eed5b02900fdc6cac583mr3174398plb.80.1622055134818; 
 Wed, 26 May 2021 11:52:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h1sm16176901pfh.72.2021.05.26.11.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 11:52:14 -0700 (PDT)
Subject: Re: [RFC PATCH 04/15] accel: Only use TCG when building user-mode
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2eaa27e-7e53-31e1-060a-8f423f6ee768@linaro.org>
Date: Wed, 26 May 2021 11:52:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   accel/meson.build | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)

I think the description should be clearer, since the restriction being applied 
is for system emulation.  How about

meson: Only build hw virtualization with system emulation

> 
> diff --git a/accel/meson.build b/accel/meson.build
> index b44ba30c864..0e296911aea 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -2,11 +2,13 @@
>   softmmu_ss.add(files('accel-softmmu.c'))
>   user_ss.add(files('accel-user.c'))
>   
> -subdir('qtest')
> -subdir('kvm')
>   subdir('tcg')
> -subdir('xen')
> -subdir('stubs')
> +if have_system
> +  subdir('kvm')
> +  subdir('qtest')
> +  subdir('stubs')
> +  subdir('xen')
> +endif

The patch itself looks fine.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

