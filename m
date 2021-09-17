Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ACF40F595
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 12:07:45 +0200 (CEST)
Received: from localhost ([::1]:54048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRAmV-0008GC-MZ
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 06:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRAkV-0006QH-Gp
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 06:05:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRAkT-00029n-Lt
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 06:05:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631873136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHjm3EHdwmzMDCHMiQ8N9KSBwrdJcvHRG+0vUR3/0LQ=;
 b=flI1PfPN5+xgnoA43NcH889QXEdR0OuDQaSis7xdnqUPGk1PmHGt95AkOj3OEgyVsKfePh
 glPBTknFIDlR2c8oYgbZJ1ndO6LfjPs6s5HBjncNMh47Ve11jpGTYpK2W0RkOlmzip5CM4
 WQ4+9dRXucy8yfFRWrbxaWfpD1y5UrE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-ULXTRLGPPvmMoFgG18hxWQ-1; Fri, 17 Sep 2021 06:05:35 -0400
X-MC-Unique: ULXTRLGPPvmMoFgG18hxWQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 s13-20020a5d69cd000000b00159d49442cbso3526059wrw.13
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 03:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xHjm3EHdwmzMDCHMiQ8N9KSBwrdJcvHRG+0vUR3/0LQ=;
 b=R7zY4TJqskNE16pEwCmYB+eW/9SiyQ7CLg4N06XM76DoFRLcD8R8Po4XXgRp/yM5v3
 bsiBkQ+mNjFND5VKO3uZ/UEUu/65xrvQFn9JcGm03n6Rfv+BjZNUKo0p5n4kkhYs7RDi
 A3Mdp9srqk1jLcVkevkJf5DwCVdIzHnD8QhAIpncbQ4GcifQYCEuNh1+qt+us/0912vw
 lmQ5ZIvSi9enW9lcHv3aqsA7YcNxXz8EfsjyIZeKNN2eFBR1GYqvDpU4ds2HWzJlKBf4
 3GQR1fXdyCIZ6I9QSeuUaYg9Eq4A4kxhiIIAi56vjfwOJGHZplkz1lM5iW9EGMxXFmzj
 ObyA==
X-Gm-Message-State: AOAM5310dQuWVDt6sMXmBgP08qPmCXfZdi66mQb5219fdVxxYzTXzs1b
 DfUltDFzFeDtMoaqEUUAK/blXH7HNx6tSGUDssZzcEbKgcwQBwbYstuW1DcPjbasyXlFd8Y4OHW
 6r76dZZ/1FWlFoFY=
X-Received: by 2002:a05:600c:1910:: with SMTP id
 j16mr14403486wmq.11.1631873134631; 
 Fri, 17 Sep 2021 03:05:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj6sZWHpGaBlXDxzMX+qtekn8pmXF5cCZi63ZFNAlQ+kjh+px8+CRk/t0VjFlLyZCUVXAY0w==
X-Received: by 2002:a05:600c:1910:: with SMTP id
 j16mr14403461wmq.11.1631873134403; 
 Fri, 17 Sep 2021 03:05:34 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id v20sm10201530wmh.22.2021.09.17.03.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 03:05:34 -0700 (PDT)
Subject: Re: [PATCH v3 09/16] iotests/297: Separate environment setup from
 test execution
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-10-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <8ec33ced-2d8e-c169-cbc6-a9b0e804d417@redhat.com>
Date: Fri, 17 Sep 2021 12:05:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-10-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.09.21 06:09, John Snow wrote:
> Move environment setup into main(), leaving pure test execution behind
> in run_linters().
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/297 | 36 +++++++++++++++++++++---------------
>   1 file changed, 21 insertions(+), 15 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


