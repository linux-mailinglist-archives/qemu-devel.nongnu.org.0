Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B543EE688
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 08:21:10 +0200 (CEST)
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFsTD-0001dR-4l
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 02:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mFsS2-0000jH-42
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 02:19:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mFsRy-0002ew-TJ
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 02:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629181188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6FKoc4Tg/UIPwh0VDQG5UQviE3CFc0qd37aQl7Gez/c=;
 b=c6QdFmLIAZtQCcrBfDtyrQHrGIgAi9ndNn8WrckDcofJo3HfsehMR0ANTgP+rHCUAGKt8A
 VuumfaA0qS9st/8d1t/5rRJ5qReZdaSRE0oNDc+QRYQYZrbFJiQ+NMIShyouukEymi94mb
 mNctqp/F8R4o6R4HhrKXruLLSvXNKVo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-m5SK1FZ9PgqmczFySxZgyw-1; Tue, 17 Aug 2021 02:19:46 -0400
X-MC-Unique: m5SK1FZ9PgqmczFySxZgyw-1
Received: by mail-wm1-f71.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so4675653wmc.3
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 23:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6FKoc4Tg/UIPwh0VDQG5UQviE3CFc0qd37aQl7Gez/c=;
 b=qx6sTFD4rIV1N6O3UQj0Xs8hizr5XzbCAK13DHqScFbEfmSvSWZCSf4dsac/9heBg6
 tw1HRbgGQuccj5xiy/+x7UDzcoZXJ3TD7nHr/d7dqGLV2VDZw6L1GdDAslcToR/1qSHV
 iBE2GkwVfAMpXN1wnl23fDD3K9CAqtWbQFCzHdbOeWuKptURcybI1MtYMmA7GST5pxcQ
 zb62lwITK8SStT8ji/1w3QEd08Ozf/E21yEhoXHKYwHzbTTt0qs/A8OEsEV0azmfBD7W
 37Nu9vAxIL9XtakDUUfZjFzs9zuza3DmzeE5QyBSz+8NMqmZJm7vUUhdiacJ8I/NJES4
 NQrg==
X-Gm-Message-State: AOAM531lcH6Vmii2hb5Nc/gue6hVhehlcygPHfP1KLofFhYtCo8LMh2f
 xkxwSnXyGwaNoRJq9pJ5leq8R/EIpGvGma5ylCAQRtN8oq5v5/zOZrhr8DuksOI96dV6xWZi31s
 rn2466nnuY66GD+oKTh+VYi9Jc6VVn/Un58zkkY7xI8QLNGpSIeF9u8ecT3QetDYD
X-Received: by 2002:adf:9d86:: with SMTP id p6mr1959271wre.156.1629181185274; 
 Mon, 16 Aug 2021 23:19:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBi3jLsEjE3JedUgv8DBeL5wfbFkOahMShZgQPyHIgMmzI4OVrFjvYjupRp42z5E+pPsQyhA==
X-Received: by 2002:adf:9d86:: with SMTP id p6mr1959247wre.156.1629181184995; 
 Mon, 16 Aug 2021 23:19:44 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 v17sm1369833wro.45.2021.08.16.23.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 23:19:44 -0700 (PDT)
Subject: Re: [PATCH v3 2/6] block: block-status cache for data regions
To: Eric Blake <eblake@redhat.com>
References: <20210812084148.14458-1-hreitz@redhat.com>
 <20210812084148.14458-3-hreitz@redhat.com>
 <20210816213823.uocknsk4zgulrk3v@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <b7660c0a-99e4-1fe3-9f9f-061e55cef17b@redhat.com>
Date: Tue, 17 Aug 2021 08:19:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816213823.uocknsk4zgulrk3v@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.08.21 23:38, Eric Blake wrote:
> On Thu, Aug 12, 2021 at 10:41:44AM +0200, Hanna Reitz wrote:
>> As we have attempted before
>> (https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg06451.html,
>> "file-posix: Cache lseek result for data regions";
>> https://lists.nongnu.org/archive/html/qemu-block/2021-02/msg00934.html,
>> "file-posix: Cache next hole"), this patch seeks to reduce the number of
>> SEEK_DATA/HOLE operations the file-posix driver has to perform.  The
>> main difference is that this time it is implemented as part of the
>> general block layer code.
>>
>> We only use the cache for nodes without children (i.e. protocol nodes),
>> because that is where the problem is: Drivers that rely on block-status
>> implementations outside of qemu (e.g. SEEK_DATA/HOLE).
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/307
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>> +++ b/block.c
>> +/**
>> + * Check whether [offset, offset + bytes) overlaps with the cached
>> + * block-status data region.
>> + *
>> + * If so, and @pnum is not NULL, set *pnum to `bsc.data_end - offset`,
>> + * which is what bdrv_bsc_is_data()'s interface needs.
>> + * Otherwise, *pnum is not touched.
> Why duplicate this comment,...

I don’t think it can be duplicated, because this is a static function.  
It is very similar to bdrv_bsc_is_data()’s interface, I admit, but it 
isn’t exactly the same (besides the _locked suffix, the only difference 
is that bdrv_bsc_is_data() is for a single byte, while this function 
checks a range).

>> + */
>> +static bool bdrv_bsc_range_overlaps_locked(BlockDriverState *bs,
>> +                                           int64_t offset, int64_t bytes,
>> +                                           int64_t *pnum)
>> +{
>> +    BdrvBlockStatusCache *bsc = qatomic_rcu_read(&bs->block_status_cache);
>> +    bool overlaps;
>> +
>> +    overlaps =
>> +        qatomic_read(&bsc->valid) &&
>> +        ranges_overlap(offset, bytes, bsc->data_start,
>> +                       bsc->data_end - bsc->data_start);
>> +
>> +    if (overlaps && pnum) {
>> +        *pnum = bsc->data_end - offset;
>> +    }
>> +
>> +    return overlaps;
>> +}
>> +
>> +/**
>> + * See block_int.h for this function's documentation.
>> + */
>> +bool bdrv_bsc_is_data(BlockDriverState *bs, int64_t offset, int64_t *pnum)
>> +{
>> +    RCU_READ_LOCK_GUARD();
>> +
>> +    return bdrv_bsc_range_overlaps_locked(bs, offset, 1, pnum);
>> +}
>> +
>> +/**
>> + * See block_int.h for this function's documentation.
> ...but not these?

These are not static functions, and so I can point to the header where 
they’re declared.

(We have a wild mix of where functions are described in qemu, and it’s 
often in their C files.  I prefer having descriptions in the header, but 
because we have the precedent of explaining interfaces in C files, I 
thought I can’t get around adding at least pointers in the C file.)

> But that's minor.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!

Hanna


