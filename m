Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BF8453432
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:31:35 +0100 (CET)
Received: from localhost ([::1]:48388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmzUk-0002vL-TY
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:31:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mmzOP-00040z-Nl
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:25:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mmzON-0003xM-Ah
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:25:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637072698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kRoJS/C++qJOtwzFg9uWXHN/6FPWpV0Aeto2ry6Oa2w=;
 b=Hoo2ZMIsVNGbtoXABFppv+HJztvlC0o7Re2Jm9voS6Ati0nZFk28VbmcutuRduu2igXx7K
 4row0BDbbvueRlLVZMkbtuipe5T4FzaNDstyhhgHtPC3u0I7nhKehfr+Jfv70Y/w3C678E
 tMUF1FVPtUy59bPvWlADR45KrRH/iIc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-CvH1FyAqM2q0_qbE1Xsasw-1; Tue, 16 Nov 2021 09:24:57 -0500
X-MC-Unique: CvH1FyAqM2q0_qbE1Xsasw-1
Received: by mail-wm1-f71.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so1557457wmr.3
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 06:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kRoJS/C++qJOtwzFg9uWXHN/6FPWpV0Aeto2ry6Oa2w=;
 b=WPfZyrLo+cp9GbnltL9agr7Q3kEcDCa2trX2trOHZ8t+lPCeCBWYQRIlOoSRqangC+
 fdoitQT/wjxrugUB8ew8cHholbvD/tiS+QNW4a3V+U1dblH6gE3fycMk+ko9Yr0K6hla
 gL/VeRvpBr9FvQioj/jioW3KO8vh6KTiLZc/BbQeWUQK2fVXBkKgG8DUth5mK+pqhIyX
 gWN1ynaMCmVxaD1Oh9LDeXkh07UqtyQHbKeIRKM2jhdpdVlJsvpcaBh63nZzGxdO59Vw
 TfsNdnHTpiYFFInNqQIgKT3pVIFd0K1w2eiyR27ANcgWcmUIq5rwl/WhjocF282cXtn7
 3V2w==
X-Gm-Message-State: AOAM5306P1Z4rdpktavz1ejbjYTgyLEjkx69CWV+bV1le5vGCSx+KiwZ
 zVLDSDVg5ny4dtlo6yipc1Idof0rsW6FruglNIi6SG23okUmfRIHn9OdUEB2ddk4fubewPn2Xey
 WeibFHUutrACddCM=
X-Received: by 2002:a5d:674c:: with SMTP id l12mr9552516wrw.439.1637072696172; 
 Tue, 16 Nov 2021 06:24:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwazZt9vPHoCj57opQCA+6gxrpS0RdWNS9lg+5/vWLzN1OZtinhH9YRqfiad7iKyS875OpOUw==
X-Received: by 2002:a5d:674c:: with SMTP id l12mr9552488wrw.439.1637072695973; 
 Tue, 16 Nov 2021 06:24:55 -0800 (PST)
Received: from [192.168.149.186]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id a10sm2641790wmq.27.2021.11.16.06.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 06:24:55 -0800 (PST)
Message-ID: <6bfc8b3b-1c3a-e3b7-920e-0a0419b9a53a@redhat.com>
Date: Tue, 16 Nov 2021 15:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 04/25] include/sysemu/block-backend: split header into
 I/O and global state (GS) API
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-5-eesposit@redhat.com>
 <5a92135c-5d41-96e4-bcd1-68f0cbb0e0b4@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <5a92135c-5d41-96e4-bcd1-68f0cbb0e0b4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/11/2021 13:30, Hanna Reitz wrote:
> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>> Similarly to the previous patches, split block-backend.h
>> in block-backend-io.h and block-backend-global-state.h
>>
>> In addition, remove "block/block.h" include as it seems
>> it is not necessary anymore, together with "qemu/iov.h"
>>
>> block-backend-common.h contains the structures shared between
>> the two headers, and the functions that can't be categorized as
>> I/O or global state.
>>
>> Assertions are added in the next patch.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   block/block-backend.c                       |   9 +-
>>   include/sysemu/block-backend-common.h       |  74 ++++++
>>   include/sysemu/block-backend-global-state.h | 122 +++++++++
>>   include/sysemu/block-backend-io.h           | 139 ++++++++++
>>   include/sysemu/block-backend.h              | 269 +-------------------
>>   5 files changed, 344 insertions(+), 269 deletions(-)
>>   create mode 100644 include/sysemu/block-backend-common.h
>>   create mode 100644 include/sysemu/block-backend-global-state.h
>>   create mode 100644 include/sysemu/block-backend-io.h
> 
> [...]
> 
>> diff --git a/include/sysemu/block-backend.h 
>> b/include/sysemu/block-backend.h
>> index e5e1524f06..038be9fc40 100644
>> --- a/include/sysemu/block-backend.h
>> +++ b/include/sysemu/block-backend.h
>> @@ -13,272 +13,9 @@
>>   #ifndef BLOCK_BACKEND_H
>>   #define BLOCK_BACKEND_H
>> -#include "qemu/iov.h"
>> -#include "block/throttle-groups.h"
>> +#include "block-backend-global-state.h"
>> +#include "block-backend-io.h"
>> -/*
>> - * TODO Have to include block/block.h for a bunch of block layer
>> - * types.  Unfortunately, this pulls in the whole BlockDriverState
>> - * API, which we don't want used by many BlockBackend users.  Some of
>> - * the types belong here, and the rest should be split into a common
>> - * header and one for the BlockDriverState API.
>> - */
>> -#include "block/block.h"
> 
> This note and the include is gone.  Sounds like something positive, but 
> why is this possible?
> 

Basically block/throttle-groups.h includes block/block_int.h that 
internally includes block/block.h.

But I am not sure if you actually want to keep this comment as reminder 
for future work. Should I keep it?

Thank you,
Emanuele


