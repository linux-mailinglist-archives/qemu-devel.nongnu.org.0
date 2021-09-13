Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EEA408C19
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:09:53 +0200 (CEST)
Received: from localhost ([::1]:52442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlia-0000Lw-10
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPlIw-0006VG-DF
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:43:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPlIu-000388-88
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+O6SRLXbQRIRJCQFdnbXA238VZ2UgTFx9/9ADy04BQw=;
 b=YkgNQAETFo/b9veSs3Ul3kn9BJsp2Ib13u2yDyBtlYLtoFT1Nyar5qaeyKW2cWqsZ5LO6O
 NQXXMMB8BUrwRR2uqyRohEw1dnx8gxAFXPjhgNdyHvm0Ir3TUIlOOSRl5KoVOdmLvRhUl3
 3KelwM2EdJxwnj8yozBm1N9SPETXqu8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-vO5KcVnsNB6LJjlurSqPMw-1; Mon, 13 Sep 2021 08:43:17 -0400
X-MC-Unique: vO5KcVnsNB6LJjlurSqPMw-1
Received: by mail-wm1-f70.google.com with SMTP id
 y23-20020a05600c365700b003015b277f98so1262736wmq.2
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 05:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+O6SRLXbQRIRJCQFdnbXA238VZ2UgTFx9/9ADy04BQw=;
 b=oBDNF92PgtgjccUeqLAPFeCps9LsvaoSh6bBmfz+RAuGgpoUCZ4GWW6EEeL1WEbvAr
 fGZ6kPXhjixRqxNci9oeSw0PKHNvKLt61wqWe4J7w/cPzNl8R6hrSpPgjMr449pL9uIC
 tw+yZEF+/5SJW/SXtAigObhxS/Za0+v2vc6nLC2E0u5BIIBehi/3nkDABdLengjtJCXJ
 e6gKgowzRymaznAqYewAEfhd4l0W7R3kT5D45xuKjHQ+uaUKLtxDrnCwYq6E7uL4LldO
 7kg3Is78KEd6y90SAY7TIoxaWUVaAq477+UnVCGzNZ3stRNtAVn5OkE6cl6vO98luOC/
 Dleg==
X-Gm-Message-State: AOAM531YPLMQ5l/9RGDRqxhd++skXUk0xxZ/3Gx6Jxw0pjBvKp6oKfE4
 uKGq7cVwiGlpFbVNpHYUIKD6OM4OdjqYwv/r4e8XjzpQySZHgnvLt3nBPHEzwLREjIR2WrE2rUr
 nnGMhwHMceNBf2nA=
X-Received: by 2002:a7b:c441:: with SMTP id l1mr10472957wmi.69.1631536996262; 
 Mon, 13 Sep 2021 05:43:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLP+IxsqP619LreUWdIhVhGyF+iUYk5RNfxr7K70x8xtPuWWMgMKJM6MeiUiJ7k90eZbRieg==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr10472934wmi.69.1631536996030; 
 Mon, 13 Sep 2021 05:43:16 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id u16sm7554733wmc.41.2021.09.13.05.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 05:43:15 -0700 (PDT)
Subject: Re: [PATCH v2 17/17] iotests: declare lack of support for
 compresion_type in IMGOPTS
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
 <20210720113832.586428-18-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <dee9d649-f667-4029-7929-b7da9da89cfd@redhat.com>
Date: Mon, 13 Sep 2021 14:43:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720113832.586428-18-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.07.21 13:38, Vladimir Sementsov-Ogievskiy wrote:
> compression_type can't be used if we want to create image with
> compat=0.10. So, skip these tests, not many of them.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/031 | 5 +++--
>   tests/qemu-iotests/051 | 5 +++--
>   tests/qemu-iotests/061 | 6 +++++-
>   tests/qemu-iotests/112 | 3 ++-
>   tests/qemu-iotests/290 | 2 +-
>   5 files changed, 14 insertions(+), 7 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


