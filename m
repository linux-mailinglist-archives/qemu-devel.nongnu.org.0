Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF2354F42E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 11:24:41 +0200 (CEST)
Received: from localhost ([::1]:42558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o28DY-0003AM-Qh
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 05:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o289R-0001e7-0q
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 05:20:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o289O-00077G-Jl
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 05:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655457622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F3zoF6V26AB4etg2QtWfxr7tZYJkCZSSP4rRqPhnrG8=;
 b=QFY1B+E3TUZjU6PEImAw9ppKCkfUQBz3zemM4tV4akCZPJq3nGBFVwW0spxtkVxENybzfm
 oWbywa42fXSslWWFyOQOMARuw/8nj/lsFFnOH/L/1H7ScWxYrzuJgGNAAPK69RhNm4BjmE
 4HF5HUQOgGKEImUulbrhZFLm9weX20w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-reenwYzRPUSD2hjV0wGcdA-1; Fri, 17 Jun 2022 05:20:20 -0400
X-MC-Unique: reenwYzRPUSD2hjV0wGcdA-1
Received: by mail-wr1-f71.google.com with SMTP id
 n5-20020adf8b05000000b00219ece7272bso814866wra.8
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 02:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F3zoF6V26AB4etg2QtWfxr7tZYJkCZSSP4rRqPhnrG8=;
 b=7unW9xi1mD1Vgg+2e1zHMs8ez4nX0XTNKWiJ0+9KQcq6ZRwMw7GuY6KQVdtWyjLOWv
 AQBTDDD3A7kSCaOGi+XZcmzcshur7ZmsQnr2cz5ypnbjZ9yb0SfqP5P3ppLblrSh162Q
 ZQWBBheWwwD6NfAp2MAnzB6gIdYiWq5q/j9ki+26hd3Yj/cWLxhmfXuHbWzOAGXejOBL
 Ie8M7K6iYt/9NK6VtiVNasC2mSt0DxB4728xJObwIrb6PB1uAOyhv0rOpBSRHi0vFfRF
 6F1cEf7HLMwxteHMAIWGsEyL/L8fLtkuH/kZv61EVrWuPDbE22Y3VQ+v+b0VVHzB8th4
 yIFg==
X-Gm-Message-State: AJIora+1p8c4/EK8o1+IVHyzzg6Mt7xSeJ/xpvWFQmEp2NuxbFYzIx+S
 qvetu+Vx/7mcLalpXNKnXhvLQ5R5r1M+gYDK0lH8FcZJCsIQw1V3+9uC4d8xkJLSHKSQv8qy/64
 Yh0McY5ZfB3JtmIM=
X-Received: by 2002:a05:600c:3ca7:b0:39e:e76a:7f0f with SMTP id
 bg39-20020a05600c3ca700b0039ee76a7f0fmr2317147wmb.132.1655457619294; 
 Fri, 17 Jun 2022 02:20:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQ1QEZP2CH0B4LfHMAB3YykvUkMo6OroNja0M7x6O0mVh6EgbvUzW/Gnt28Oi/xM9bR3bkqA==
X-Received: by 2002:a05:600c:3ca7:b0:39e:e76a:7f0f with SMTP id
 bg39-20020a05600c3ca700b0039ee76a7f0fmr2317122wmb.132.1655457618964; 
 Fri, 17 Jun 2022 02:20:18 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-75.web.vodafone.de.
 [109.42.114.75]) by smtp.gmail.com with ESMTPSA id
 j13-20020a5d452d000000b0021a3d94c7bdsm1936967wra.28.2022.06.17.02.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 02:20:18 -0700 (PDT)
Message-ID: <d3abdc93-bc88-7f30-c380-c1ea52ef45f9@redhat.com>
Date: Fri, 17 Jun 2022 11:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 02/10] tests/qemu-iotests: skip 108 when FUSE is not
 loaded
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220616142659.3184115-1-jsnow@redhat.com>
 <20220616142659.3184115-3-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220616142659.3184115-3-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/06/2022 16.26, John Snow wrote:
> In certain container environments we may not have FUSE at all, so skip
> the test in this circumstance too.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/108 | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
> index 9e923d6a59f..54e935acf28 100755
> --- a/tests/qemu-iotests/108
> +++ b/tests/qemu-iotests/108
> @@ -60,6 +60,11 @@ if sudo -n losetup &>/dev/null; then
>   else
>       loopdev=false
>   
> +    # Check for usable FUSE in the host environment:
> +    if test ! -c "/dev/fuse"; then
> +        _notrun 'No passwordless sudo nor usable /dev/fuse'
> +    fi
> +
>       # QSD --export fuse will either yield "Parameter 'id' is missing"
>       # or "Invalid parameter 'fuse'", depending on whether there is
>       # FUSE support or not.

Reviewed-by: Thomas Huth <thuth@redhat.com>


