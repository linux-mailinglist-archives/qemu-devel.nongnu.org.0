Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C9F4C2DCD
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:03:54 +0100 (CET)
Received: from localhost ([::1]:57806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEin-00066Q-C3
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:03:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nNEgX-0003d8-H1
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:01:33 -0500
Received: from [2a00:1450:4864:20::535] (port=36846
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nNEgV-0005nZ-BG
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:01:33 -0500
Received: by mail-ed1-x535.google.com with SMTP id cm8so2994883edb.3
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 06:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EUB9qzJwGlOuxEbe0qpfQKjfYr+WooIbukqxl8A/qyc=;
 b=Rq4DsF5y2N9lo0z0dSgxT1nerpCXcezbY0qskIp0+/BJBFgSdNsEwvqmrtvsaA/q56
 SSg+H9zVgqwu64fUNiBY2l/h+8+lfgObHJ47J6qX5Wlmg+/eOXJz9jSvlLd9ZGNz1HMw
 8K4JORa22EyfOU0CTYOtTK/eTwMAy67Lhzeu1siNogFcPnkB1YpWK68jTa84AKWZZxQQ
 +VLh9dcvuSIEEbv58TfQhWF3yQnqDyvqXYYu3pOwxFNHAibNB4WXWLphtJzb2VC6f5N6
 t0x0yD17yzjPq+TZoGYHT72jk++Yi/vVJJESTxfOSlp1aDj0XepQAz/ZE/auAAEAbWez
 s8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EUB9qzJwGlOuxEbe0qpfQKjfYr+WooIbukqxl8A/qyc=;
 b=ev67APr7TOklJVwcpfBjidwKJjfCZb2ZOicDdy2BbnTBnQFlxKMuaotmTsgImgZymw
 aAmB1I4ds06gpEW1QuFY06ZPL1LwhLCN6Z+PbarqVWU33wDg3lGu0WdFsBLbuKtx+MUD
 X4dMt3lD9kWsThr48l9Ou1/bUB+YoV3l+vEe0IDBSbLPox83zvK3mqqjYxP9O9iMcoYs
 Fyjk9Iwgt5I17x4X5aS/xYSGV1w2GYco9YXHNVX1oT9AmWqXB9DSoQLr7JQFHkcWUqS6
 DmZyPAFZWk9l8DZ8nn1pjfnylZt7LEOlvzSKl/f9cBwf7kDQs1zGtQfWFPB7Xm5a7vBS
 pj5Q==
X-Gm-Message-State: AOAM532nE5+yJanbveMM3pIQdAsDmY0qasAzhz1SZ5Qz7GrWB3Q+imcv
 LGv3bLVLquHRdzdbRKasoiI=
X-Google-Smtp-Source: ABdhPJyZEhSIVffSpwMmHdfHFC2eYZ7uKQxn1cu1ihROg7EtM4SaQx5WsZT7HLZO5ExISZCbWssUgA==
X-Received: by 2002:a50:d6cd:0:b0:413:3bcd:3d0e with SMTP id
 l13-20020a50d6cd000000b004133bcd3d0emr2433007edj.178.1645711286517; 
 Thu, 24 Feb 2022 06:01:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id c29sm1431648ejj.117.2022.02.24.06.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 06:01:25 -0800 (PST)
Message-ID: <cfff4497-f617-0256-9efb-11c58534184d@redhat.com>
Date: Thu, 24 Feb 2022 15:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/8] meson: drop the .fa library suffix
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Oleinik, Alexander" <alxndr@bu.edu>
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
 <20220222194008.610377-5-marcandre.lureau@redhat.com>
 <9cdd93f2-af65-ba5c-c5df-8f9e4d42eeaf@redhat.com>
 <CAMxuvaykS_4tbQwz=EFWATRVdhabwDdM4x-uH-efXUfw3DcEbQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAMxuvaykS_4tbQwz=EFWATRVdhabwDdM4x-uH-efXUfw3DcEbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/22 10:14, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Feb 23, 2022 at 1:08 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 2/22/22 20:40, marcandre.lureau@redhat.com wrote:
>>>
>>> The .fa suffix was a temporary hack introduced in commit
>>> 1f0a1d8a51 ("build-sys hack: link with whole .fa archives") when the
>>> build system was mixed between meson & makefiles. It is no longer
>>> needed.
>>
>> It is still needed to separate internal and system archives, otherwise
>> the oss-fuzz build fails.  Meson adds a --start-group/--end-group pair
> 
> Ah, but gitlab oss-fuzz build passed
> https://gitlab.com/marcandre.lureau/qemu/-/pipelines/476763089

Alexander, do you remember how to reproduce this?

>> around all libraries, and the fork-fuzz.ld linker script should be
>> outside it.  If the libraries are named .a, the --start-group is placed
>> much earlier.
>>
>> This is of course a very ugly workaround; Meson should just use the
>> objects instead of the archives when link_whole is used with an internal
>> convenience archive.
> 
> Any meson github issue we can point to?

#9292 maybe, I'm not sure if there's anything better.

Paolo


