Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC245354C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:09:00 +0100 (CET)
Received: from localhost ([::1]:45144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn04x-0005Am-0z
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:08:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mn03P-0004Ib-VW
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:07:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mn03M-00017y-C5
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637075238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DC8jRmsELSJVevkJ7/ZcCWPDBSgYrXBmiXruAzFd5tI=;
 b=jRYVY5ua/Iq0EG1wQMIIP0bS2OLijd7YWJGxDdWM0nENZweqKIlTyJHn0f/hc8JnPveDDe
 dULNgWBlnZ0s3/fdzrUIp14NtHeHUXdlvXFIZ5nhREu2aNWaGkaSsER0Y5fO/bUDHQUbB0
 1Qs8ObZs8+xydfy14+o59sAL+I18YhA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-TlLC1LB6OsaMH0cWhZn0kA-1; Tue, 16 Nov 2021 10:07:17 -0500
X-MC-Unique: TlLC1LB6OsaMH0cWhZn0kA-1
Received: by mail-wr1-f69.google.com with SMTP id
 y4-20020adfd084000000b00186b16950f3so4569089wrh.14
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 07:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DC8jRmsELSJVevkJ7/ZcCWPDBSgYrXBmiXruAzFd5tI=;
 b=e1gfxVDFyluTcC6dHnRBTBNLj6HO3D4QWfPOPbNhNrFyGFpCZlvrtSjFfV3UVu/1r0
 FjMXxnEd/htNWZh3mNzdiOtNHDpxzU8MPv3X7UHxYuJCSblB3ELEc12RACp84n0bK921
 /CG5nUE8atGftCDFwhnP03i1vjlc5cBSzH1i100VU4dIFWbKYb9iCZlgLOTvIOoAkCsT
 tgsNk66hqwCjSemSJYK9Kuh7VjLQmxgOYee/Osz3PxKO8gaGsqFDD/UBseC1dEu+0rig
 jRnh2se6l0S2deNlzLF1oqiH+ZNCgBuRF9/43hyWR8P9sdwXbq2cSgGs7s3dg1BbDUEP
 hjZA==
X-Gm-Message-State: AOAM531peS8ARXs+LuEYlhkeNepbFB/eMzXA9r81G7g3xyrdiojh3SU2
 46h3259ZjDirCtq7JqSc8YNrIBIELnYWHTpmf4MBeSRz5R5amNWdaws8h4mXuv73OznG+LlEnz9
 UGtwoeGqAnaAlLrQ=
X-Received: by 2002:adf:f001:: with SMTP id j1mr9886070wro.351.1637075235979; 
 Tue, 16 Nov 2021 07:07:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxavEYan3rVTdywhr52NtP+6yz8lmnF2NC6Vxw6kxjZe+PNJXAp/c4CdqM3FyWxUbUBEY0tlg==
X-Received: by 2002:adf:f001:: with SMTP id j1mr9885993wro.351.1637075235510; 
 Tue, 16 Nov 2021 07:07:15 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id z14sm18390496wrp.70.2021.11.16.07.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 07:07:15 -0800 (PST)
Message-ID: <0c3fb2de-5140-383a-bafc-fb9d1e837517@redhat.com>
Date: Tue, 16 Nov 2021 16:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 04/25] include/sysemu/block-backend: split header into
 I/O and global state (GS) API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-5-eesposit@redhat.com>
 <5a92135c-5d41-96e4-bcd1-68f0cbb0e0b4@redhat.com>
 <6bfc8b3b-1c3a-e3b7-920e-0a0419b9a53a@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <6bfc8b3b-1c3a-e3b7-920e-0a0419b9a53a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

On 16.11.21 15:24, Emanuele Giuseppe Esposito wrote:
>
>
> On 12/11/2021 13:30, Hanna Reitz wrote:
>> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>>> Similarly to the previous patches, split block-backend.h
>>> in block-backend-io.h and block-backend-global-state.h
>>>
>>> In addition, remove "block/block.h" include as it seems
>>> it is not necessary anymore, together with "qemu/iov.h"
>>>
>>> block-backend-common.h contains the structures shared between
>>> the two headers, and the functions that can't be categorized as
>>> I/O or global state.
>>>
>>> Assertions are added in the next patch.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>   block/block-backend.c                       |   9 +-
>>>   include/sysemu/block-backend-common.h       |  74 ++++++
>>>   include/sysemu/block-backend-global-state.h | 122 +++++++++
>>>   include/sysemu/block-backend-io.h           | 139 ++++++++++
>>>   include/sysemu/block-backend.h              | 269 
>>> +-------------------
>>>   5 files changed, 344 insertions(+), 269 deletions(-)
>>>   create mode 100644 include/sysemu/block-backend-common.h
>>>   create mode 100644 include/sysemu/block-backend-global-state.h
>>>   create mode 100644 include/sysemu/block-backend-io.h
>>
>> [...]
>>
>>> diff --git a/include/sysemu/block-backend.h 
>>> b/include/sysemu/block-backend.h
>>> index e5e1524f06..038be9fc40 100644
>>> --- a/include/sysemu/block-backend.h
>>> +++ b/include/sysemu/block-backend.h
>>> @@ -13,272 +13,9 @@
>>>   #ifndef BLOCK_BACKEND_H
>>>   #define BLOCK_BACKEND_H
>>> -#include "qemu/iov.h"
>>> -#include "block/throttle-groups.h"
>>> +#include "block-backend-global-state.h"
>>> +#include "block-backend-io.h"
>>> -/*
>>> - * TODO Have to include block/block.h for a bunch of block layer
>>> - * types.  Unfortunately, this pulls in the whole BlockDriverState
>>> - * API, which we don't want used by many BlockBackend users. Some of
>>> - * the types belong here, and the rest should be split into a common
>>> - * header and one for the BlockDriverState API.
>>> - */
>>> -#include "block/block.h"
>>
>> This note and the include is gone.  Sounds like something positive, 
>> but why is this possible?
>>
>
> Basically block/throttle-groups.h includes block/block_int.h that 
> internally includes block/block.h.
>
> But I am not sure if you actually want to keep this comment as 
> reminder for future work. Should I keep it?

Good question.  I think I’d keep it and the block.h include; I mean, the 
throttle-groups.h include was there before already, so perhaps this was 
indeed only intended as a reminder.

The other reason to keep it is that ideal this is just a refactoring 
patch, so I wouldn’t touch anything that needn’t be touched.

Hanna


