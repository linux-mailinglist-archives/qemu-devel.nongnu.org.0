Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2744EEE28
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:32:05 +0200 (CEST)
Received: from localhost ([::1]:37286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHNk-0002i9-IU
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:32:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naHEv-00083o-2h
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:22:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naHEr-0006yq-VS
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:22:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648819372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dp6wTNe+q493YeoslecqYNe/OvjP9ZJplAT9keJXq6E=;
 b=A/cSJIY0CZLIyauTRLOgl18ms9tiwKFic6Krv/Vw6eLtthuGlVRZchd5OjWqeAHo/iuZTO
 Rf/Tc8R6n/1PeY3huwDv9UgJBP7wG4BYh2ywxGtPZNjmSxyaMSBgmoeSc62sBhlYKeG+E7
 9VVP9ebwf0xatTdCDFvwyPUCBms2YSo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-_nm-xPuUMh-tQr0LIYbS8A-1; Fri, 01 Apr 2022 09:22:51 -0400
X-MC-Unique: _nm-xPuUMh-tQr0LIYbS8A-1
Received: by mail-ed1-f71.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso1506773edt.20
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Dp6wTNe+q493YeoslecqYNe/OvjP9ZJplAT9keJXq6E=;
 b=0F/2k8/oLiskA4fwPzilZo6RT29C7xnLUmM6j1YmFu2/RxDV5ew+pDGAWYFHbgKZ0l
 7apo7mboJGApnBhtv2mWm37QjTV3qoTKOELK+ZPQLkeKjrs7h690qkn0e7z7AV0Z8V6h
 R5lkt8ZPJMJAakoYJ2mTQ5iuHNCHd/SmBgyJA+HZVMWjkMev5snYlpeBQ/9vo811swY0
 dIbN3XBMtN9YkKqpaEnwyiGFGCUnbyKA7xzCiQX+NAmDhkjAtNPOjkS0Iwd7+0oz0z4N
 Zu8NogT/jLVhL3UCnLwFpeoMOvT5JVLHYOZNEI6cm0e/CNtqsDQjvea6B1muPTth7rH0
 vwAg==
X-Gm-Message-State: AOAM5320cihGorituJUD7ZdyIpejyJWNAjOxJERAyGuE7QkyLHlCu9bx
 gm26FlCYOzUuvVVybUR0RcWL1qRuE+SucffltErGChIS45ODxX8V2Twv1HmD2niTpAUWqOSrmcR
 siwoQ0ZyEunkGyfk=
X-Received: by 2002:a17:907:6d16:b0:6e4:dc4b:c75c with SMTP id
 sa22-20020a1709076d1600b006e4dc4bc75cmr1785219ejc.603.1648819370643; 
 Fri, 01 Apr 2022 06:22:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx60t6aMKTDigy2bDfSKLKNlaga8OMKnWtPAKS2axO/ZFpYqLK4JtDe3kWA4jB1hCoZaQeRgg==
X-Received: by 2002:a17:907:6d16:b0:6e4:dc4b:c75c with SMTP id
 sa22-20020a1709076d1600b006e4dc4bc75cmr1785192ejc.603.1648819370412; 
 Fri, 01 Apr 2022 06:22:50 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 r22-20020a17090638d600b006d584aaa9c9sm1034563ejd.133.2022.04.01.06.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 06:22:50 -0700 (PDT)
Message-ID: <331b24f6-4ff5-bee0-5f49-8b61709655e5@redhat.com>
Date: Fri, 1 Apr 2022 15:22:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 5/7] block/block-copy: block_copy(): add timeout_ns
 parameter
From: Hanna Reitz <hreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-6-vsementsov@openvz.org>
 <929f2a0d-e3d7-afad-b95b-d7f8b29fe077@redhat.com>
In-Reply-To: <929f2a0d-e3d7-afad-b95b-d7f8b29fe077@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@openvz.org,
 stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.22 15:16, Hanna Reitz wrote:
> On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
>> Add possibility to limit block_copy() call in time. To be used in the
>> next commit.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> ---
>>   block/block-copy.c         | 26 +++++++++++++++++++-------
>>   block/copy-before-write.c  |  2 +-
>>   include/block/block-copy.h |  2 +-
>>   3 files changed, 21 insertions(+), 9 deletions(-)
>>
>> diff --git a/block/block-copy.c b/block/block-copy.c
>> index ec46775ea5..b47cb188dd 100644
>> --- a/block/block-copy.c
>> +++ b/block/block-copy.c
>
> [...]
>
>> @@ -894,12 +902,16 @@ int coroutine_fn block_copy(BlockCopyState *s, 
>> int64_t start, int64_t bytes,
>>           .max_workers = BLOCK_COPY_MAX_WORKERS,
>>       };
>>   -    return block_copy_common(&call_state);
>> -}
>> +    ret = qemu_co_timeout(block_copy_async_co_entry, call_state, 
>> timeout_ns,
>> +                          g_free);
>
> A direct path for timeout_ns == 0 might still be nice to have.

Ah, never mind, just saw that qemu_co_timeout() itself has a direct path 
for this.  Hadn’t noticed that before.


