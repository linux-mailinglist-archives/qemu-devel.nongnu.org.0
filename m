Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0216A3FD9CF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:43:59 +0200 (CEST)
Received: from localhost ([::1]:56370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPaw-0007LT-KM
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLPVB-0002FU-M5
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:38:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLPVA-0000ZU-4u
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630499878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QfPOf7HVgBO/Z0EOL/1SMvh/aBP58LJEdhJGv+oOkOs=;
 b=MnlQyvSeU22Swga8J6zyXUYCCJnp+cRgTjt6XI61j6KD6uLA43WUIvsLArP2Afb3ePhWIl
 /hyfY4NBu+DJ6k+X6X/S2P/Mc+ZMQEQUD4gjAwX0wbhzn+c+5dlulfABnKn4BB7a8YigTx
 TtiAvGE1baFqgnAZ3JOar7vOosNdZF4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-E0afQKpEPZy2ID6310iUGg-1; Wed, 01 Sep 2021 08:37:55 -0400
X-MC-Unique: E0afQKpEPZy2ID6310iUGg-1
Received: by mail-wm1-f69.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so2768970wmd.2
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 05:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QfPOf7HVgBO/Z0EOL/1SMvh/aBP58LJEdhJGv+oOkOs=;
 b=LeR2dzCMFR9AtcpM0gk9AbQsi+aYYr/cuE7Q8ECDHdVIr+CHUEHTVATPf6/01nMvL2
 cj/NfU5QG+UozO1jjtWYGQnpfpYL+/CClBrkm/8404a/viCE2b+zUlyoHUMetcUo+JIC
 I2v9detVMB3JPmi5eDVb7Y+nmscmJEyOMebhvP/mg8ptlQZe9SsHNy4jSZ9yflynbsT7
 6rKBGZAtGANJC/JnKO5CnLToiCB9DNKNRAz5qLBtQdF2Bp5aEcN7jDKfPs/BctXVIsxe
 35Wbsf0H/FfhSyx2mxXLC/G6Lz+JAmLTsekxxpgW6WFGd78ZtKAiw4GMjEhWP0U9QuF4
 1HQQ==
X-Gm-Message-State: AOAM533mXxuU49Ni3tuDCCAbnKoUD9GuRoa0tN/LMYlX8HtDVFfw6Wuc
 r/gEtVBJd477qq5sANXgcK0omkPHHPvFHZ7PZUPsoGIVqI0dC1FR+gGSMebmeUOv7UKJ5j1lB+J
 V5lWEDkKwH6ZmWX0=
X-Received: by 2002:a1c:3b8a:: with SMTP id i132mr9147939wma.145.1630499874043; 
 Wed, 01 Sep 2021 05:37:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9IV2md0bqAKY9c3PaGr029mPsUJ8cKkUQd1J+PpOMlchQV24FPMrklriREJZeydJvg9mYuA==
X-Received: by 2002:a1c:3b8a:: with SMTP id i132mr9147917wma.145.1630499873866; 
 Wed, 01 Sep 2021 05:37:53 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 k1sm21744936wrz.61.2021.09.01.05.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 05:37:53 -0700 (PDT)
Subject: Re: [PATCH v8 28/34] iotests: move 222 to tests/image-fleecing
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
 <20210824083856.17408-29-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <3dc6d789-1793-d80e-7318-2714de7e36ec@redhat.com>
Date: Wed, 1 Sep 2021 14:37:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824083856.17408-29-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, Max Reitz <mreitz@redhat.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.08.21 10:38, Vladimir Sementsov-Ogievskiy wrote:
> Give a good name to test file.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/{222 => tests/image-fleecing}         | 0
>   tests/qemu-iotests/{222.out => tests/image-fleecing.out} | 0
>   2 files changed, 0 insertions(+), 0 deletions(-)
>   rename tests/qemu-iotests/{222 => tests/image-fleecing} (100%)
>   rename tests/qemu-iotests/{222.out => tests/image-fleecing.out} (100%)
>
> diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/tests/image-fleecing
> similarity index 100%
> rename from tests/qemu-iotests/222
> rename to tests/qemu-iotests/tests/image-fleecing
> diff --git a/tests/qemu-iotests/222.out b/tests/qemu-iotests/tests/image-fleecing.out
> similarity index 100%
> rename from tests/qemu-iotests/222.out
> rename to tests/qemu-iotests/tests/image-fleecing.out

Good news: Including error-report.h helped with most of the CI errors.

“Bad” news: .gitlab-ci.d/buildtest.yml has a complete ./check command 
line including test numbers...  Not sure if that’s a great idea, but in 
any case, this means that build-tcg-disabled fails because that command 
line includes 222.  I think the fix should be simply to replace 222 by 
image-fleecing.  I hope that’s alright for you?

Hanna


