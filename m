Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B202D40ACB9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 13:49:22 +0200 (CEST)
Received: from localhost ([::1]:35560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ6wD-0001Bu-AT
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 07:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ6tO-00082P-Kp
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:46:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ6tJ-0002wb-BI
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:46:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631619978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0oFN2p3SOYU12Y3KzOA9FeWOAb8UPimwy+LAnyqCNGU=;
 b=OxSXVcEdE95zOD/NCTT+XpC0hmuI5cLVdBfCmRaoQNnXobkWR4J7VPiEI437NEQtAhPeYe
 hQuAYRiGRwBCcCsZp4zCRG9FFE5BtB5T55VyQh2cdEB+mrI+VP3imSOpskZdXIUCq1mijX
 iCL83/HBZYIZse+11lS2ibSbUqaX7mM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-c9M3zfJ2PfKaW9RXkYypNA-1; Tue, 14 Sep 2021 07:46:17 -0400
X-MC-Unique: c9M3zfJ2PfKaW9RXkYypNA-1
Received: by mail-wr1-f70.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so2908777wru.15
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 04:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0oFN2p3SOYU12Y3KzOA9FeWOAb8UPimwy+LAnyqCNGU=;
 b=vxFekoy/kGWUBsmr5ZSM/wGjYRZbK6J20b87mafQOuKjkbbUpA9Rgho/AXdMB4EBY2
 W5n/YKa3wl0UzDnCxvN+zZhcij1lzDNIpm9Mt6vVeohJRZiP/ICeU1w7/l4+/JPmuco7
 KG6+CdqL5+CnKZZft40F2nSNicidc781poj+W9iCk5LJ8sW4mOfZz2fss4roaT+/LU2k
 LNVUUKlHBfil2KTfS6IwMmQIrZZbDyBbhBJwYrFXITupw7qjpx1+pTC7iVfRJ3Z5RRyt
 BbBAM4SWYGy/SiRTWGfN2Di4Qe40wTTdlf8+ztS/ptn5zYrCA9vJjsuDBHTgSwK3ZjF3
 YjWw==
X-Gm-Message-State: AOAM530kWizychcpLd0GNcXhPFP1WdSPnturfi4EzQNlyI44U74Anqse
 Jxpkz6HdyY0eWWXAiwDtHuC90C7vPfKuWVgiQOAJwfxExiguQqbq8uvGBL9pGT0ASWONtGDuxhF
 6rYOa8lkDkSGfgek=
X-Received: by 2002:adf:9f0d:: with SMTP id l13mr18594758wrf.328.1631619976393; 
 Tue, 14 Sep 2021 04:46:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyexmN9W9GE9Qnn4R9nJBHt6cEr0PFVQ9bGa1V5ZdqFCTuFJCOnaUJgMBI9uiZyWxCZHbEnMA==
X-Received: by 2002:adf:9f0d:: with SMTP id l13mr18594732wrf.328.1631619976187; 
 Tue, 14 Sep 2021 04:46:16 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id u23sm889852wmc.24.2021.09.14.04.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 04:46:15 -0700 (PDT)
Subject: Re: [PATCH v3 06/10] qcow2-refcount: check_refcounts_l2(): check
 l2_bitmap
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
 <20210524142031.142109-7-vsementsov@virtuozzo.com>
 <704ed8a0-387a-d2e7-827f-39957f67b892@redhat.com>
 <f3bbb14f-bafe-b299-334f-70bc626a9454@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <e7a56e2f-a556-a8f2-b888-8c66b506b16e@redhat.com>
Date: Tue, 14 Sep 2021 13:46:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f3bbb14f-bafe-b299-334f-70bc626a9454@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
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
Cc: kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, ktkhai@virtuozzo.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.09.21 13:22, Vladimir Sementsov-Ogievskiy wrote:
> 14.09.2021 11:54, Hanna Reitz wrote:
>> On 24.05.21 16:20, Vladimir Sementsov-Ogievskiy wrote:
>>> Check subcluster bitmap of the l2 entry for different types of
>>> clusters:
>>>
>>>   - for compressed it must be zero
>>>   - for allocated check consistency of two parts of the bitmap
>>>   - for unallocated all subclusters should be unallocated
>>>     (or zero-plain)
>>>
>>> For unallocated clusters we can safely fix the entry by making it
>>> zero-plain.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>> Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
>>> ---
>>>   block/qcow2-refcount.c | 30 +++++++++++++++++++++++++++++-
>>>   1 file changed, 29 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
>>> index f48c5e1b5d..062ec48a15 100644
>>> --- a/block/qcow2-refcount.c
>>> +++ b/block/qcow2-refcount.c
>>> @@ -1681,6 +1681,7 @@ static int check_refcounts_l2(BlockDriverState 
>>> *bs, BdrvCheckResult *res,
>>>           uint64_t coffset;
>>>           int csize;
>>>           l2_entry = get_l2_entry(s, l2_table, i);
>>> +        uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);
>>
>> This is a declaration after a statement.  (Easily fixable by moving 
>> the l2_entry declaration here, though.  Or by putting the l2_bitmap 
>> declaration where l2_entry is declared.)
>
> The latter seems nicer.
>
>>
>> [...]
>>
>>> @@ -1800,6 +1815,19 @@ static int 
>>> check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>>>           case QCOW2_CLUSTER_ZERO_PLAIN:
>>>           case QCOW2_CLUSTER_UNALLOCATED:
>>> +            if (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC) {
>>> +                res->corruptions++;
>>> +                fprintf(stderr, "%s: Unallocated "
>>> +                        "cluster has non-zero subcluster allocation 
>>> map\n",
>>> +                        fix & BDRV_FIX_ERRORS ? "Repairing" : 
>>> "ERROR");
>>> +                if (fix & BDRV_FIX_ERRORS) {
>>> +                    ret = fix_l2_entry_by_zero(bs, res, l2_offset, 
>>> l2_table, i,
>>> +                                               active, 
>>> &metadata_overlap);
>>
>> I believe this is indeed the correct repair method for 
>> QCOW2_CLUSTER_ZERO_PLAIN, but I’m not so sure for 
>> QCOW2_CLUSTER_UNALLOCATED.  As far as I can tell, 
>> qcow2_get_subcluster_type() will return QCOW2_SUBCLUSTER_INVALID for 
>> this case, and so trying to read from this clusters will produce I/O 
>> errors.  But still, shouldn’t we rather make such a cluster 
>> unallocated rather than zero then?
>>
>> And as for QCOW2_CLUSTER_ZERO_PLAIN, I believe 
>> qcow2_get_cluster_type() will never return it when subclusters are 
>> enabled.  So this repair path will never happen with a cluster type 
>> of ZERO_PLAIN, but only for UNALLOCATED.
>>
>
>
> Agree about ZERO_PLAIN, that it's impossible here.
>
> But for UNALLOCATED, I'm not sure. If we make all wrongly "allocated" 
> subclusters to be unallocted, underlying backing layer will become 
> available. Could it be considered as security violation?

I don’t think so, because the image has to be corrupted first, which I 
hope guests cannot trigger.

> On the other hand, when user have to fix format corruptions, nothing 
> is guaranteed and the aim is to make data available as far as it's 
> possible. So, may be making wrong subclusters "unallocated" is correct 
> thing..

We could also consider refusing to repair this case for images that have 
backing files.

In any case, I don’t think we should force ourselves to make some 
cluster zero just because there’s no better choice.  For example, we 
also don’t make unallocated data clusters zero, because it would just be 
wrong.

(Though technically there is no right or wrong here, because we just 
refuse to read from such clusters.  Doing anything to the cluster would 
kind of be an improvement, whether it is making it zero or making it 
really unallocated...  If there was any important data here, it’s lost 
anyway.)

Perhaps we should have a truly destructive repair mode where all 
unreadable data is made 0.  But OTOH, if users have an image that’s so 
broken, then it’s probably not wrong to tell them it’s unrepairable and 
they need to convert it to a fresh image (with --salvage).

Hanna


