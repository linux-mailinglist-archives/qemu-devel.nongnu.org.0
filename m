Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D744CBC37
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 12:13:19 +0100 (CET)
Received: from localhost ([::1]:45484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPjOY-00029x-5B
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 06:13:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPjN6-0001Dx-BO
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:11:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPjN4-0000RV-NN
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646305903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/rn3fPT7V7OdEA1JxFYnqW4DK1MwO1Dujxb4IfRf5XA=;
 b=hwLczQxlWATAV8zJT7+zNvyUAwrszP/HCHndqfSZywzQq4ocAMX9qtKOT55gsRT8h9k1eL
 g9Cky/6ksF2xUZkMbX1jTEBKDpAtSQgQLP5DCMwP7zYIET8SKQfA26bYn81Tj48psjkvEh
 ria2EEr66JIUXcXbcfH+e1JOZQOTtak=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-6R3NQkPCPxGHTNHAVnZHfg-1; Thu, 03 Mar 2022 06:11:40 -0500
X-MC-Unique: 6R3NQkPCPxGHTNHAVnZHfg-1
Received: by mail-ej1-f70.google.com with SMTP id
 o22-20020a1709061d5600b006d1aa593787so2578623ejh.0
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 03:11:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=/rn3fPT7V7OdEA1JxFYnqW4DK1MwO1Dujxb4IfRf5XA=;
 b=IjamyYAwTt0P0v6Yq2AViorkuHX0xqCh+jx7EZwlTPyEovuUhTjS5EsIcGNETg3uxv
 Qul8hZeqEf+LFtiNr9FmgkVWx/i7cOIVa6KqWq41cCA56keOE/rRc3cmnsStWorIQ8Nw
 CCNvr0IR3Q5GIUglwAKEZbmt1RQKoD6gVxdSkssC91PpMkCJq+OmQCR+3df82MRazqIE
 2SlrrT/NmqQUx2n8f/7PsFqExkrQj1MYWTDoq7XX1TBfEpQBu0LlyxONDw3TKRq0F2KO
 kzdxZcw3HYoApQnsfxpNkUGObWlF5DVJu2Ry4GUCrYGXQ/1ahJwn9XIG5USAakgxLqT9
 18uQ==
X-Gm-Message-State: AOAM533QqgQiIUllMMGN97m6JTvXyOd2Ojd/at415bUYzwBgFhmvoZ5B
 rAbwvc8i/yHzrbCrtTbbB0e+6Ez9zryNyLbETLJaTNHFNOQ69j0iiYCzM/phJajHDM7o2Ew2kHS
 OkJgvG4w3JCZvTkI=
X-Received: by 2002:a17:906:1e94:b0:6b9:6fcc:53fd with SMTP id
 e20-20020a1709061e9400b006b96fcc53fdmr26029385ejj.450.1646305898398; 
 Thu, 03 Mar 2022 03:11:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMj2M8GdF965nEYyqCqaZrtiVVDQKwAMczqubSmZDldsChe1UNlQprpNARffk9hLG5vAjMIQ==
X-Received: by 2002:a17:906:1e94:b0:6b9:6fcc:53fd with SMTP id
 e20-20020a1709061e9400b006b96fcc53fdmr26029344ejj.450.1646305897967; 
 Thu, 03 Mar 2022 03:11:37 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 yy18-20020a170906dc1200b006d6e5c75029sm602638ejb.187.2022.03.03.03.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 03:11:37 -0800 (PST)
Message-ID: <53c0edcf-7250-36e3-788b-8db122752428@redhat.com>
Date: Thu, 3 Mar 2022 12:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 11/16] block: introduce snapshot-access block driver
From: Hanna Reitz <hreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
 <20220228113927.1852146-12-vsementsov@virtuozzo.com>
 <6ac72250-00c9-d998-fbe7-4c8d958476d7@redhat.com>
In-Reply-To: <6ac72250-00c9-d998-fbe7-4c8d958476d7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, nikita.lapshin@virtuozzo.com, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.03.22 12:05, Hanna Reitz wrote:
> On 28.02.22 12:39, Vladimir Sementsov-Ogievskiy wrote:
>> The new block driver simply utilizes snapshot-access API of underlying
>> block node.
>>
>> In further patches we want to use it like this:
>>
>> [guest]                   [NBD export]
>>     |                            |
>>     | root                       | root
>>     v                 file       v
>> [copy-before-write]<------[snapshot-access]
>>     |           |
>>     | file      | target
>>     v           v
>> [active-disk] [temp.img]
>>
>> This way, NBD client will be able to read snapshotted state of active
>> disk, when active disk is continued to be written by guest. This is
>> known as "fleecing", and currently uses another scheme based on qcow2
>> temporary image which backing file is active-disk. New scheme comes
>> with benefits - see next commit.
>>
>> The other possible application is exporting internal snapshots of
>> qcow2, like this:
>>
>> [guest]          [NBD export]
>>     |                  |
>>     | root             | root
>>     v       file       v
>> [qcow2]<---------[snapshot-access]
>>
>> For this, we'll need to implement snapshot-access API handlers in
>> qcow2 driver, and improve snapshot-access block driver (and API) to
>> make it possible to select snapshot by name. Another thing to improve
>> is size of snapshot. Now for simplicity we just use size of bs->file,
>> which is OK for backup, but for qcow2 snapshots export we'll need to
>> imporve snapshot-access API to get size of snapshot.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qapi/block-core.json    |   4 +-
>>   block/snapshot-access.c | 132 ++++++++++++++++++++++++++++++++++++++++
>>   MAINTAINERS             |   1 +
>>   block/meson.build       |   1 +
>>   4 files changed, 137 insertions(+), 1 deletion(-)
>>   create mode 100644 block/snapshot-access.c
>
> [...]
>
>> diff --git a/block/snapshot-access.c b/block/snapshot-access.c
>> new file mode 100644
>> index 0000000000..77b87c1946
>> --- /dev/null
>> +++ b/block/snapshot-access.c
>
> [...]
>
>> +static int snapshot_access_open(BlockDriverState *bs, QDict 
>> *options, int flags,
>> +                                Error **errp)
>> +{
>> +    bs->file = bdrv_open_child(NULL, options, "file", bs, 
>> &child_of_bds,
>> +                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
>> +                               false, errp);
>> +    if (!bs->file) {
>> +        return -EINVAL;
>> +    }
>> +
>> +    bs->total_sectors = bs->file->bs->total_sectors;
>
> (If I hadn’t commented on patch 16, I wouldn’t’ve here, but now I 
> might as well...)
>
> Instead of just a comment in the commit message (which noone will 
> really read later on), I prefer a TODO or FIXME comment directly here 
> in the code, or even better in the API added in the previous patch 
> (i.e. as part of the comment in the BlockDriver struct), that this 
> will not work for qcow2, i.e. that we will need to inquire the 
> snapshot size from the snapshot-providing node.
>
> It’s OK not to implement that now, but I don’t think having a note 
> just in the commit message will help us remember.

Considering softfreeze is next week, I’d propose I just add the 
following the patch 10, would that be OK for you?

(In case it is, I’ll hold off on applying patch 16 for now; it’s a test, 
so we can easily add it during freeze)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index c43315ae6e..5c8ad9ed78 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -385,6 +385,12 @@ struct BlockDriver {
       * in generic block-layer: no serializing, no alignment, no tracked
       * requests. So, block-driver that realizes these APIs is fully 
responsible
       * for synchronization between snapshot-access API and normal IO 
requests.
+     *
+     * TODO: To be able to support qcow2's internal snapshots, this API 
will
+     * need to be extended to:
+     * - be able to select a specific snapshot
+     * - receive the snapshot's actual length (which may differ from bs's
+     *   length)
       */
      int coroutine_fn (*bdrv_co_preadv_snapshot)(BlockDriverState *bs,
          int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t 
qiov_offset);


