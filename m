Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7300F453380
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:02:57 +0100 (CET)
Received: from localhost ([::1]:35512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmz32-0007Wd-Jg
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:02:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mmz0k-0005vi-Nw
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:00:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mmz0e-0007rM-FR
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:00:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637071226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRHHD5O2SW9cz8CtF3c+qab4Kddivb/gJSFgSpplRu4=;
 b=Cy/Z0Cy58KU0AkrE/Z+8oCiMvSUeaj5ezHkPxS9i7KfH+ehN1jMpMzgkmQH2d+rE+YFH4w
 H6GiBcQ4opoEtu6IBBC0Qv3vVurdQ0T3ivMCZdLe0OzkcmSefHWzIJIBzlrOAoI3xBYEFB
 gSuBrwwPMfqQV6VnOKvVV8syxaaPl3M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-gC4qHwIDO-a10iYBt78n8w-1; Tue, 16 Nov 2021 09:00:24 -0500
X-MC-Unique: gC4qHwIDO-a10iYBt78n8w-1
Received: by mail-wm1-f70.google.com with SMTP id
 l187-20020a1c25c4000000b0030da46b76daso1246181wml.9
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 06:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wRHHD5O2SW9cz8CtF3c+qab4Kddivb/gJSFgSpplRu4=;
 b=slzSTydaO0k8RgMWsQ+MaFXyohU3QjAyuSkb8dU3V+dtjiudXcuVPCTkpmlFB8x/+E
 651YhoPjLsc+yAfToffd8uSOeQgUni7bSIlnfTvqkWwhSQNfARZiuSKhuLw8uJdmNVxl
 3GvJXnTCGyxKgj/on2KdvcqkiwOKhC8pWVjcVzmtZMYCz22l1PlUUl+Ucw2RDw+oJqWN
 jk7pqYaY0Blb5a9C0Y2TIzUtVztkWdiKf03M25hHfmprmtHGhyPArCVf0aqHttw5daNg
 GmisHj97dL1izceSuXt/hMxehyf8ZL9u8RZ9WT9l/d42+RvNcPdjdBissXs5Pgn6qHNA
 /J5w==
X-Gm-Message-State: AOAM532Kc5km6QzwTWyCpN9ULD4MXpeuPoFSdIG9BVWxC/hhAt91Vu+C
 BZACrKExzTLlS+VtF/bs70jOMx040JNWRKhlKxQNAqiUsIEHnRBvi10Mt6UDyLU6o1vCgicUHud
 Ot2C++t5W0iFpMcM=
X-Received: by 2002:adf:e7cf:: with SMTP id e15mr9519658wrn.287.1637071223075; 
 Tue, 16 Nov 2021 06:00:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCSigFyBIYmcjlPsn9gnaLIb/jBT8ncyL52jtCM5Ql6V5IeeZ2yESyRbZOhL4BItrXkgK3Aw==
X-Received: by 2002:adf:e7cf:: with SMTP id e15mr9519586wrn.287.1637071222747; 
 Tue, 16 Nov 2021 06:00:22 -0800 (PST)
Received: from [192.168.149.186]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id f133sm2556473wmf.31.2021.11.16.06.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 06:00:22 -0800 (PST)
Message-ID: <23a1b722-79a2-7252-e657-9217cde7c3ab@redhat.com>
Date: Tue, 16 Nov 2021 15:00:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 02/25] include/block/block: split header into I/O and
 global state API
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-3-eesposit@redhat.com>
 <7b87d8bd-b742-8fbc-a127-a6b47b2b03d4@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <7b87d8bd-b742-8fbc-a127-a6b47b2b03d4@redhat.com>
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



On 12/11/2021 13:25, Hanna Reitz wrote:
> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>> block.h currently contains a mix of functions:
>> some of them run under the BQL and modify the block layer graph,
>> others are instead thread-safe and perform I/O in iothreads.
>> It is not easy to understand which function is part of which
>> group (I/O vs GS), and this patch aims to clarify it.
>>
>> The "GS" functions need the BQL, and often use
>> aio_context_acquire/release and/or drain to be sure they
>> can modify the graph safely.
>> The I/O function are instead thread safe, and can run in
>> any AioContext.
>>
>> By splitting the header in two files, block-io.h
>> and block-global-state.h we have a clearer view on what
>> needs what kind of protection. block-common.h
>> contains common structures shared by both headers.
>>
>> block.h is left there for legacy and to avoid changing
>> all includes in all c files that use the block APIs.
>>
>> Assertions are added in the next patch.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   block.c                            |   3 +
>>   block/meson.build                  |   7 +-
>>   include/block/block-common.h       | 389 +++++++++++++
>>   include/block/block-global-state.h | 286 ++++++++++
>>   include/block/block-io.h           | 306 ++++++++++
>>   include/block/block.h              | 878 +----------------------------
>>   6 files changed, 1012 insertions(+), 857 deletions(-)
>>   create mode 100644 include/block/block-common.h
>>   create mode 100644 include/block/block-global-state.h
>>   create mode 100644 include/block/block-io.h
> 
> [...]
> 
>> diff --git a/include/block/block-common.h b/include/block/block-common.h
>> new file mode 100644
>> index 0000000000..4f1fd8de21
>> --- /dev/null
>> +++ b/include/block/block-common.h
> 
> [...]
> 
>> +#define BLKDBG_EVENT(child, evt) \
>> +    do { \
>> +        if (child) { \
>> +            bdrv_debug_event(child->bs, evt); \
>> +        } \
>> +    } while (0)
> 
> This is defined twice, once here, and...

This is unnecessary, as bdrv_debug_event is in block-io.c
Will remove that.

> 
>> diff --git a/include/block/block-io.h b/include/block/block-io.h
>> new file mode 100644
>> index 0000000000..9af4609ccb
>> --- /dev/null
>> +++ b/include/block/block-io.h
> 
> [...]
> 
>> +#define BLKDBG_EVENT(child, evt) \
>> +    do { \
>> +        if (child) { \
>> +            bdrv_debug_event(child->bs, evt); \
>> +        } \
>> +    } while (0)
> 
> ...once here.
> 
> [...]
> 
>> +/**
>> + * bdrv_drained_begin:
>> + *
>> + * Begin a quiesced section for exclusive access to the BDS, by 
>> disabling
>> + * external request sources including NBD server and device model. 
>> Note that
>> + * this doesn't block timers or coroutines from submitting more 
>> requests, which
>> + * means block_job_pause is still necessary.
> 
> Where does this sentence come from?  I can’t see it in master or in the 
> lines removed from block.h:
> 
This is another mistake, I copied the old header. This sentence was 
removed by this patch (sent by me) and then merged in master:
https://patchew.org/QEMU/20210903113800.59970-1-eesposit@redhat.com/

Will fix this and double check all headers so that the comments are 
updated (but there shouldn't be any other mistakes).

Thank you,
Emanuele


