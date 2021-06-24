Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B063A3B2E03
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:39:09 +0200 (CEST)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNhM-00072o-D1
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwNHc-0004HZ-6J
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 07:12:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwNHZ-0005pa-LX
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 07:12:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624533147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLZNqvWjMw3E4EJJh+KpAkQB9Oja5X4SLIY7EEamsD0=;
 b=Ixb7FXVOfxLWXnaolQtDu3c7k3/QA9TcJn6F5ktvEF/dcID7fjjyDTsGlyOLNIP7Q5TkEU
 TwSOeGCXV4SFGIro4vPHtiE9Ly+6WXLupGYtf79dXP6afgNoAA6e0cfL7+WMqiImWhDITn
 4yduz7h9yXZm2tc2Q8HA/38LOhii5iU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-ASlKZP2cOES078vNHuYioQ-1; Thu, 24 Jun 2021 07:12:24 -0400
X-MC-Unique: ASlKZP2cOES078vNHuYioQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 j15-20020a05640211cfb0290394f9de5750so2573478edw.16
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 04:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OLZNqvWjMw3E4EJJh+KpAkQB9Oja5X4SLIY7EEamsD0=;
 b=iwaSqxfh1+FJHGEfh9uvKp15f6RqkgauiH6Gloy2o6LQmYFBlpJn9c+mzr1JHKMqYU
 jPIfEvlqkcmziYH2RqSyWYFf1tM+1KLCm4ZiW2IW2679PFK8dPCWZpd2XP9mDNSCi/8w
 NgbhNpeT63isgad/UzmzwWkgc1g7CKo5DLvO4UKt8+8A03Y6Z2KJl2ZlRI1Z1pekKCXf
 VhYw5RcEwijRNva5xrouqcf24bIA5j8lpC4xL2IUUZIRYpEQ+vDCYSt76oQiZdUKE5JL
 spbiVnS3/xYDY1vKYbTtuRqmOHEM6RiALwgNo79mu6H4BBSmpB+pE35W4kLFuno3tAOK
 p/+g==
X-Gm-Message-State: AOAM5323DIYKtkZOof1YjWoct5s6Dagw6JhJvPFGDTtiB1oRWAez5zyU
 y3hdCQhTsBcSwhsbdCczx52zDjxatOwLNQ8u3nmVD/OkUjgEryetVM7PrX6ZVqIFUZyx9+KCG4r
 8Z/aMpAei9sbxENs=
X-Received: by 2002:a17:906:3109:: with SMTP id
 9mr4604716ejx.339.1624533143209; 
 Thu, 24 Jun 2021 04:12:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwirZ5XPiE2wCPDkEQNZVvtfMmWsUxK1HQ2Lx2I0puzmILt1+/cL68SWTUqp0UYAipuNPbVTg==
X-Received: by 2002:a17:906:3109:: with SMTP id
 9mr4604689ejx.339.1624533142876; 
 Thu, 24 Jun 2021 04:12:22 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 g11sm1644183edt.85.2021.06.24.04.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 04:12:22 -0700 (PDT)
Subject: Re: [PATCH v2 3/6] block: Clarify that @bytes is no limit on *pnum
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210623150143.188184-1-mreitz@redhat.com>
 <20210623150143.188184-4-mreitz@redhat.com>
 <adfe02d6-4b40-86f1-fa6b-55cf00405036@virtuozzo.com>
 <3c4ae0ed-a7d7-b6c3-1785-f6e4a9efec7e@redhat.com>
 <e6ed8b1d-9853-bfa2-15c2-ab75f9e31daf@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <33d8cf20-39a6-240a-d0a7-22d574183ab0@redhat.com>
Date: Thu, 24 Jun 2021 13:12:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e6ed8b1d-9853-bfa2-15c2-ab75f9e31daf@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.06.21 12:25, Vladimir Sementsov-Ogievskiy wrote:
> 24.06.2021 13:16, Max Reitz wrote:
>> On 24.06.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
>>> 23.06.2021 18:01, Max Reitz wrote:
>>>> .bdrv_co_block_status() implementations are free to return a *pnum 
>>>> that
>>>> exceeds @bytes, because bdrv_co_block_status() in block/io.c will 
>>>> clamp
>>>> *pnum as necessary.
>>>>
>>>> On the other hand, if drivers' implementations return values for *pnum
>>>> that are as large as possible, our recently introduced block-status
>>>> cache will become more effective.
>>>>
>>>> So, make a note in block_int.h that @bytes is no upper limit for 
>>>> *pnum.
>>>>
>>>> Suggested-by: Eric Blake <eblake@redhat.com>
>>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>>> ---
>>>>   include/block/block_int.h | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/include/block/block_int.h b/include/block/block_int.h
>>>> index fcb599dd1c..f85b96ed99 100644
>>>> --- a/include/block/block_int.h
>>>> +++ b/include/block/block_int.h
>>>> @@ -347,6 +347,11 @@ struct BlockDriver {
>>>>        * clamped to bdrv_getlength() and aligned to request_alignment,
>>>>        * as well as non-NULL pnum, map, and file; in turn, the driver
>>>>        * must return an error or set pnum to an aligned non-zero 
>>>> value.
>>>> +     *
>>>> +     * Note that @bytes is just a hint on how big of a region the
>>>> +     * caller wants to inspect.  It is not a limit on *pnum.
>>>> +     * Implementations are free to return larger values of *pnum if
>>>> +     * doing so does not incur a performance penalty.
>>>
>>> Worth mention that the cache will benefit of it?
>>
>> Oh, right, absolutely.  Like so:
>>
>> "block/io.c's bdrv_co_block_status() will clamp *pnum before 
>> returning it to its caller, but it itself can still make use of the 
>> unclamped *pnum value.  Specifically, the block-status cache for 
>> protocol nodes will benefit from storing as large a region as possible."
>>
>
> Sounds good. Do you mean this as an addition or substitution? If the 
> latter, I'd keep "if doing so does not incur a performance penalty 

I meant it as an addition, just a new paragraph.

Max


