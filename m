Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E097636181
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:21:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqbO-0001hN-9p; Wed, 23 Nov 2022 09:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oxqbL-0001h8-O2
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:19:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oxqbK-0004Fw-3L
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669213184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i7zXu+gcqOTw390Ta5MqRRnQNwqiAr0yoxAJ24DcHbg=;
 b=YEX4Fei/axwWgsQhCeVvTAiEyMFo047JU8xnuIi4J8mkJLk5xY5yWxPPUeOtEEMGC4aeVa
 hfHK6ZLu3FnU7+G+5gxJxCDOj9Z2n0RrhOPFSrVvdcxIbPpLuWfBc2U/Sq1tiQrNloFJVT
 dHrq6fIdnw63xNzfGjB0hi1Y1So2QQ0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-253-qY7FIBqkMx6tLd0JZBLiDg-1; Wed, 23 Nov 2022 09:19:43 -0500
X-MC-Unique: qY7FIBqkMx6tLd0JZBLiDg-1
Received: by mail-wr1-f71.google.com with SMTP id
 u24-20020adfa198000000b00241da98e057so2583807wru.22
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 06:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i7zXu+gcqOTw390Ta5MqRRnQNwqiAr0yoxAJ24DcHbg=;
 b=rXd+iOgdyhqv9ak6UsSHlQMqVXjyOfMVcCfIz9nCdo8ZsggwfPgLS/Pf+tdsttN2YY
 p1VrHc0ZL32dA/l8ZtnKQq0z9A4Sn5AR4VuQXzjhcYO/BnIl2mVFjzA5DpVXX82WAqZt
 DtICtJ3DOyCuGzEo/4OkHgmfvCQD4hg89V74eeZfQP3p6c8+cdS5oudX1SoHgEkIAZWo
 5w6yqBmlDxFODbOwXhrsMCz6xf0WYALyDswL5K2R5FQ4Vv7sUCNpwmdEnzRhixDQUzzU
 eZiDjhpkq+sL/vymAK+9kBVo2cu9+DxvFy1ewE0GLa5zWgXKxjAu/cNpdpvW1VTuC9+o
 MOug==
X-Gm-Message-State: ANoB5pn2xIcU8XxjunYalqEUAUoB04t8rXHG55NmrP+y+XCqa/wLdUYt
 ijl7lExcoe+YfnjYjDiguuRWnEeuJH7zfmMquTwMea2vjna0FEI8rDdKNUXksbvClFWxJ6kdXny
 uDAElZAt5dAl+U7U=
X-Received: by 2002:adf:de03:0:b0:236:c820:97e6 with SMTP id
 b3-20020adfde03000000b00236c82097e6mr16988359wrm.215.1669213181660; 
 Wed, 23 Nov 2022 06:19:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7wwH/eNhSzu28YoSL333Tl4BLbwuIzpxEm0NQSILwLdnonO6oK25MFazUFV/maITQwsDm8rQ==
X-Received: by 2002:adf:de03:0:b0:236:c820:97e6 with SMTP id
 b3-20020adfde03000000b00236c82097e6mr16988344wrm.215.1669213181413; 
 Wed, 23 Nov 2022 06:19:41 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-58.web.vodafone.de.
 [109.43.178.58]) by smtp.gmail.com with ESMTPSA id
 r24-20020adfa158000000b00236b2804d79sm17402645wrr.2.2022.11.23.06.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 06:19:40 -0800 (PST)
Message-ID: <3e3178f9-73a7-031a-6cd0-4a315989b567@redhat.com>
Date: Wed, 23 Nov 2022 15:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 11/11] tests/qtest: Enable qtest build on Windows
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <20221028045736.679903-12-bin.meng@windriver.com>
 <CAJ+F1CJnW-95ZpfBBKFX=O_XsFOZ+quTU4dYmK8Cr8B-Ww_Hqw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJ+F1CJnW-95ZpfBBKFX=O_XsFOZ+quTU4dYmK8Cr8B-Ww_Hqw@mail.gmail.com>
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

On 23/11/2022 15.13, Marc-André Lureau wrote:
> Hi Bin
> 
> On Fri, Oct 28, 2022 at 9:06 AM Bin Meng <bin.meng@windriver.com> wrote:
>>
>> Now that we have fixed various test case issues as seen when running
>> on Windows, let's enable the qtest build on Windows.
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> We haven't solved the CI timing out or eating all the CPU time, right?
> 
> Can we simply exclude it from CI for now, ie add to this patch
> 
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index 093276ddbc..ba9045ec38 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -62,7 +62,7 @@ msys2-64bit:
>     - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
>         --enable-capstone'
>     - .\msys64\usr\bin\bash -lc 'make'
> -  - .\msys64\usr\bin\bash -lc 'make check || { cat
> build/meson-logs/testlog.txt; exit 1; } ;'
> +  - .\msys64\usr\bin\bash -lc 'make check MTESTARGS="--no-suite
> qtest" || { cat build/meson-logs/testlog.txt; exit 1; } ;'
> 
>   msys2-32bit:
>     extends: .shared_msys2_builder
> @@ -96,4 +96,4 @@ msys2-32bit:
>     - cd output
>     - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
>     - ..\msys64\usr\bin\bash -lc 'make'
> -  - ..\msys64\usr\bin\bash -lc 'make check || { cat
> meson-logs/testlog.txt; exit 1; } ;'
> +  - ..\msys64\usr\bin\bash -lc 'make check MTESTARGS="--no-suite
> qtest" || { cat meson-logs/testlog.txt; exit 1; } ;'

I think it's only the 64-bit job that is really problematic, so we could 
still run the qtests in the 32-bit job?

Alternatively, what about switching the 64-bit to another target that does 
not have so many qtests enabled? Some mips-softmmu or riscv-softmmu maybe? 
... we still check x86_64-softmmu in the .cirrus.yml builds, so this is 
hopefully not such a big loss...

  Thomas


