Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356F4519E0B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:30:23 +0200 (CEST)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDD4-0004Jt-2E
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nmD89-0000sq-Ey
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:25:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nmD85-00017n-S9
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651663512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=86uG9quml9zT0y/w0pJ5woOCcnmxOYLBcIwth6aV4oU=;
 b=eXwyq6CKqOLreapZO60n9cweiQZVaLHLGo8P4eEGcQmS9HE+G3zG2Pt0TH6qSjVswobyc4
 cUg7Blt47IKzbeWuRfgfh894FL4TlGiOp03dNTEmnQHaG1dOpK/3uHSqOBdxr5zoG6UTJy
 AVN5id3a5vFJ3xU7JtyuDREg/QQRrfY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-LlZDMgW3M2m6ELgXgEfoyg-1; Wed, 04 May 2022 07:25:11 -0400
X-MC-Unique: LlZDMgW3M2m6ELgXgEfoyg-1
Received: by mail-ed1-f70.google.com with SMTP id
 ee56-20020a056402293800b00425b0f5b9c6so617304edb.9
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 04:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=86uG9quml9zT0y/w0pJ5woOCcnmxOYLBcIwth6aV4oU=;
 b=RSI5GkOHc5jjBMfreeUidtSp/f+AQJmZCBSSyfP0LZzCbujvCZcYks7lFr2ikQ2JwQ
 bEHeQ4YBqwV+0oLOFnEJF0OXObCIvbnQZKKjZebGGzQlMmtzjKVBFPm/EGYM+DmiArjF
 0Sj1XSwe+y6dxB6vDdMCijqrkGobfIeR3smmmYMS3wkq1l06Z7cvAiCs+oAOoVuYl24a
 VCVLZElyc0ECYS281rta5Wjre88MLfz89g7ZH9sQQmI1vExcSPRyhHQbrankBMqarAkM
 69AU4g2e4WDHUh4FbtKeJ6kyAU6IobmYNBxSRuOXcsxWYbG3ZyEfSd8i2yMn9kJXC0Aq
 fzgQ==
X-Gm-Message-State: AOAM5308f6AVx4ucc/grPEg4IUweBeWZV3G4Ki26XXIfArk9wsMw39dZ
 //ej9w9TYjR8lj0X5IRtdy70KlU3LWeLD7T7/pEbop3lkCCBwCFmFtYMTg7t5xSt2AoCHdXwY/T
 jPkseEj0MScIHuKM=
X-Received: by 2002:a17:906:4985:b0:6ef:b344:2a56 with SMTP id
 p5-20020a170906498500b006efb3442a56mr20201741eju.625.1651663510132; 
 Wed, 04 May 2022 04:25:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc0iDWK9ZVb4+rVr/gXArA/mNX7YLAe/P+laeK0kkqRlAkil256GTJJRDFfWlhXSs6T3nKpw==
X-Received: by 2002:a17:906:4985:b0:6ef:b344:2a56 with SMTP id
 p5-20020a170906498500b006efb3442a56mr20201711eju.625.1651663509703; 
 Wed, 04 May 2022 04:25:09 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 hf27-20020a1709072c5b00b006f3ef214e31sm5614485ejc.151.2022.05.04.04.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 04:25:09 -0700 (PDT)
Message-ID: <49b5b98d-2e12-a383-f445-6adfc54811c0@redhat.com>
Date: Wed, 4 May 2022 13:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/4] block: Add protocol-specific image info
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20220503145529.37070-1-hreitz@redhat.com>
 <20220503145529.37070-3-hreitz@redhat.com> <YnI7Bt3bVzUpBzVt@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YnI7Bt3bVzUpBzVt@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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

On 04.05.22 10:36, Kevin Wolf wrote:
> Am 03.05.2022 um 16:55 hat Hanna Reitz geschrieben:
>> The ImageInfo object currently only contains (optional) format-specific
>> image information.  However, perhaps the protocol node can provide some
>> additional information, so add a new field presenting it.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   qapi/block-core.json |  6 +++++-
>>   block/qapi.c         | 19 +++++++++++++++++++
>>   2 files changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index beeb91952a..e7d6c2e0cc 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -236,6 +236,9 @@
>>   # @format-specific: structure supplying additional format-specific
>>   #                   information (since 1.7)
>>   #
>> +# @protocol-specific: structure supplying additional protocol-specific
>> +#                     information (since 7.1)
>> +#
>>   # Since: 1.3
>>   #
>>   ##
>> @@ -246,7 +249,8 @@
>>              '*backing-filename': 'str', '*full-backing-filename': 'str',
>>              '*backing-filename-format': 'str', '*snapshots': ['SnapshotInfo'],
>>              '*backing-image': 'ImageInfo',
>> -           '*format-specific': 'ImageInfoSpecific' } }
>> +           '*format-specific': 'ImageInfoSpecific',
>> +           '*protocol-specific': 'ImageInfoSpecific' } }
> I'm not a fan of this one. It solves the problem for exactly one special
> case (even if admittedly a common one) and leaves everything else as it
> is. It is unclear what it produces in configurations that aren't the
> simple one format node on top of one protocol node layout.

I don’t disagree, but I do wonder how often this structure is used 
outside of `qemu-img info`, where filter nodes and more complex 
configurations are very rare.  I understand wanting to support complex 
block graph configurations everywhere, I’m just wondering whether there 
is actually much of a use for that here.

> I would rather interpret 'format-specific' as 'driver-specific' and make
> the ImageInfo for any child node accessible.

Again, I don’t disagree, but I have reservations about that.  I don’t 
think this is a trivial approach to take.

First, that will be kind of bad for VMDK files, which already have all 
of their extent children in their driver-specific info, so we’d 
duplicate that info.

Second, same for the backing child, generally.  Do we want to exclude 
specifically the backing child from that list of ImageInfos for all 
children, because we already have an entry for it in ImageInfo itself?  
That wouldn’t make much sense.  Deprecate backing-child?  Works for the 
future, weird in the meantime.

Third, the implementation would not be trivial. bdrv_query_image_info() 
specifically says to return "flat" image information, i.e. not to query 
the backing child information. Currently, its callers fill that blank 
some way or another, with `qemu-img info` creating a list of files (i.e. 
the backing chain) instead of using that backing-image field.  I 
actually have no idea how we should bring that together.  Should 
bdrv_query_image_info() also not collect that ImageInfo list of all 
children, and then collect_image_info_list() will put those into its 
list, too, making it recursive?  Then we have the problem of describing 
nodes in this graph, and as written below I wouldn’t be happy to use 
auto-generated node names for this.  Or should bdrv_query_image_info() 
collect all those children, and then collect_image_info_list() will just 
drop the backing child from them, so that it still gets a flat backing 
chain list, but the other children will be nested, allowing users to 
identify which nodes those are based on nesting?  (And nesting would 
require adding indentation support to bdrv_image_info_dump(), and 
bdrv_snapshot_dump().)

Fourth, precisely for the common case of not having filters or other 
more complex configurations, the additional info provided by the 
protocol node’s ImageInfo is limited.  Most of it just duplicates 
information from the format node, the really interesting bit is just the 
ImageInfoSpecific, so for `qemu-img info` it’ll mostly just clutter the 
output.  Many fields are also named on the assumption that this 
information is about a format node ("file format", "virtual size"), and 
so I personally find it confusing to see those things in the information 
about a protocol node when using `qemu-img info`.

> With rbd we already interpret it like a generic driver thing that is not
> just for formats that because it implements .bdrv_get_specific_info even
> though we didn't have a 'protocol-specific' yet.

On one hand, that’s the same thing I’m doing in this series.  On the 
other, I think the rbd implementation as a whole has not been well 
thought out, because it must have faced exactly the same problem that 
I’m trying to solve in this patch here, but obviously it hasn’t been 
addressed yet.

(Instead, it probably relied on users calling `qemu-img info -f rbd`, 
which is just cheating.  I mean, I could do that, too, and just drop 
anything but patch 4.)

> Making other nodes has precedence, too. 'backing-image' is even in the
> context of this hunk. VMDK exposes its extents the same way.

Both of which now make the solution to include the list of all 
children’s ImageInfos just more complicated, yes. O:)

(I know that me saying that simply means that these were probably bad 
solutions then, and that maybe we should’ve had a list of all children’s 
ImageInfos from the start.  Which means dancing around the issue even 
more won’t make it better, I know.  O:)  I’m just trying to say that 
simply adding this list isn’t an ideal solution now, under the current 
circumstances; but I’m not saying there is any ideal solution.)

> So maybe
> what we really want is a 'children' list with the ImageInfo of every
> child node. And then qemu-img could go through all children and print
> headings like "Driver specific information for file (#block123)".

I would very much rather drop auto-generated node names, and instead 
just print the child name and rely on indentation.  I have an example below.

> Then
> filters like blkdebug could add their information and it would be
> printed, too.

Is this really something that would ever be useful in practice?


I understand your concern (and share it to a degree), but I feel like 
allowing for this ImageInfo struct to represent and encompass a complex 
block graph comes at the detriment of readability and understandability 
of `qemu-img info` output for plain images.

For example, this is how I’d imagine the output for a raw image:

image: test.raw
file format: raw
virtual size: 10 GiB (10737418240 bytes)
disk size: 1 MiB
child 'file':
     image: test.raw
     file format: file
     virtual size: 10 GiB (10737418240 bytes)
     disk size: 1 MiB
     Driver specific information:
         extent size: 1048576

Personally, I like that less than what this series’s v1 produces.  I 
understand it represents the modular nature of the block graph, but 
that’s generally not something I want to see when I run `qemu-img info` 
on a plain image (which is 98 % of the use I have for `qemu-img info`).

>>   ##
>>   # @ImageCheck:
>> diff --git a/block/qapi.c b/block/qapi.c
>> index 51202b470a..293983cf82 100644
>> --- a/block/qapi.c
>> +++ b/block/qapi.c
>> @@ -262,6 +262,7 @@ void bdrv_query_image_info(BlockDriverState *bs,
>>       int64_t size;
>>       const char *backing_filename;
>>       BlockDriverInfo bdi;
>> +    BlockDriverState *protocol_bs;
>>       int ret;
>>       Error *err = NULL;
>>       ImageInfo *info;
>> @@ -303,6 +304,24 @@ void bdrv_query_image_info(BlockDriverState *bs,
>>       }
>>       info->has_format_specific = info->format_specific != NULL;
>>   
>> +    /* Try to look for an unambiguous protocol node */
>> +    protocol_bs = bs;
>> +    while (protocol_bs && !QLIST_EMPTY(&protocol_bs->children)) {
>> +        protocol_bs = bdrv_primary_bs(protocol_bs);
>> +    }
> If bs is already a leaf node, this duplicates the information, which
> looks weird:
>
>      $ build/qemu-img info -f file ~/tmp/test.raw
>      image: /home/kwolf/tmp/test.raw
>      file format: file
>      virtual size: 10 GiB (10737418240 bytes)
>      disk size: 7.63 GiB
>      Format specific information:
>          extent size: 1048576
>      Protocol specific information:
>          extent size: 1048576

I mean, that isn’t wrong, but also fixable if need be.

>> +    if (protocol_bs) {
>> +        /* Assert that this is a protocol node */
>> +        assert(QLIST_EMPTY(&protocol_bs->children));
>> +
>> +        info->protocol_specific = bdrv_get_specific_info(protocol_bs, &err);
>> +        if (err) {
>> +            error_propagate(errp, err);
>> +            qapi_free_ImageInfo(info);
>> +            goto out;
>> +        }
>> +        info->has_protocol_specific = info->protocol_specific != NULL;
>> +    }
>> +
>>       backing_filename = bs->backing_file;
>>       if (backing_filename[0] != '\0') {
>>           char *backing_filename2;
> Kevin
>


