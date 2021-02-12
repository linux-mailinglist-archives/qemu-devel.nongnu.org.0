Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5D9319BCA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 10:26:02 +0100 (CET)
Received: from localhost ([::1]:49844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAUi8-0000zB-W6
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 04:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lAUfr-0008JR-UQ
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 04:23:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lAUfl-0005An-Ch
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 04:23:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613121811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WKLnTXa8Cd4Et2PO0BZqRLAvmYDYLHllrmlPGuReWkA=;
 b=iBF2RMvQu6PPHoqxVdXKzUvN8A+L+YULAh3RGNPvFz9kqMJMljmxVuYenWe8DrhMFRtFjz
 +u9iLc419bcfNX2cexGGNQVyaMVnKoCL9WLvi6ZGML8i/TbtOtl7OBLiwdWi1E2xWtxwAb
 Gx5H7u8rWo7u//XA1HbWKxwWJ+U3xZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-DDDoSp6mP6-fGC26gQi-5A-1; Fri, 12 Feb 2021 04:23:30 -0500
X-MC-Unique: DDDoSp6mP6-fGC26gQi-5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF333107ACE4;
 Fri, 12 Feb 2021 09:23:28 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-227.ams2.redhat.com
 [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C89917D93C;
 Fri, 12 Feb 2021 09:23:27 +0000 (UTC)
Subject: Re: [PATCH 1/2] block/mirror: Fix mirror_top's permissions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210211172242.146671-1-mreitz@redhat.com>
 <20210211172242.146671-2-mreitz@redhat.com>
 <182ee6e2-865b-5d83-a7d9-c95e2a5f44df@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <10b1af76-a335-012a-1750-855b7a8e2992@redhat.com>
Date: Fri, 12 Feb 2021 10:23:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <182ee6e2-865b-5d83-a7d9-c95e2a5f44df@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.02.21 10:04, Vladimir Sementsov-Ogievskiy wrote:
> 11.02.2021 20:22, Max Reitz wrote:
>> mirror_top currently shares all permissions, and takes only the WRITE
>> permission (if some parent has taken that permission, too).
>>
>> That is wrong, though; mirror_top is a filter, so it should take
>> permissions like any other filter does.  For example, if the parent
>> needs CONSISTENT_READ, we need to take that, too, and if it cannot share
>> the WRITE permission, we cannot share it either.
>>
>> The exception is when mirror_top is used for active commit, where we
>> cannot take CONSISTENT_READ (because it is deliberately unshared above
>> the base node) and where we must share WRITE (so that it is shared for
>> all images in the backing chain, so the mirror job can take it for the
>> target BB).
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   block/mirror.c | 32 +++++++++++++++++++++++++-------
>>   1 file changed, 25 insertions(+), 7 deletions(-)
>>
>> diff --git a/block/mirror.c b/block/mirror.c
>> index 8e1ad6eceb..1edfc3cc14 100644
>> --- a/block/mirror.c
>> +++ b/block/mirror.c
>> @@ -89,6 +89,7 @@ typedef struct MirrorBlockJob {
>>   typedef struct MirrorBDSOpaque {
>>       MirrorBlockJob *job;
>>       bool stop;
>> +    bool is_commit;
>>   } MirrorBDSOpaque;
>>   struct MirrorOp {
>> @@ -1513,13 +1514,27 @@ static void 
>> bdrv_mirror_top_child_perm(BlockDriverState *bs, BdrvChild *c,
>>           return;
>>       }
>> -    /* Must be able to forward guest writes to the real image */
>> -    *nperm = 0;
>> -    if (perm & BLK_PERM_WRITE) {
>> -        *nperm |= BLK_PERM_WRITE;
>> -    }
>> +    bdrv_default_perms(bs, c, role, reopen_queue,
>> +                       perm, shared, nperm, nshared);
>> -    *nshared = BLK_PERM_ALL;
>> +    if (s->is_commit) {
>> +        /*
>> +         * For commit jobs, we cannot take CONSISTENT_READ, because
>> +         * that permission is unshared for everything above the base
>> +         * node (except for filters on the base node).
>> +         * We also have to force-share the WRITE permission, or
>> +         * otherwise we would block ourselves at the base node (if
>> +         * writes are blocked for a node, they are also blocked for
>> +         * its backing file).
>> +         * (We could also share RESIZE, because it may be needed for
>> +         * the target if its size is less than the top node's; but
>> +         * bdrv_default_perms_for_cow() automatically shares RESIZE
>> +         * for backing nodes if WRITE is shared, so there is no need
>> +         * to do it here.)
>> +         */
>> +        *nperm &= ~BLK_PERM_CONSISTENT_READ;
> 
> this works only because we don't assert READ permission on generic read 
> path in block/io.c, like we do for WRITE..
> but this is better than pre-patch anyway..

Yes, because you can read regardless of CONSISTENT_READ, the question is 
just whether you’ll receive consistent data.  The caller needs to decide 
whether that’s the case.

Taking that permission kind of is deferring the question whether the 
data will be consistent to the block layer.

In case of commit, we unshare CONSISTENT_READ above the base, because 
the data between base and top will not be consistent.  Starting from 
top, we know it is, so we do not need to take the permission, because we 
do not need that guarantee from the block layer; the commit job can give 
that guarantee itself.

(I suppose we could add some ALLOW_INCONSISTENT flag to read requests, 
and the permission is checked when that flag is not present, but I don’t 
think we really need to.)

(Technically we have the problem that there could be something else 
between top and base that unshares CONSISTENT_READ, and we’ll never 
know, but addressing that would be complicated and it’s only a 
hypothetical problem, AFAIA.)

> How block-jobs and filters works - definitely goes beyond our 
> permissions architecture..

FWIW, AFAIR, the first job filter node was commit_top, whose purpose was 
precisely to allow unsharing CONSISTENT_READ on the base and then 
offering it again on the top.

>> +        *nshared |= BLK_PERM_WRITE;
>> +    }
>>   }
>>   /* Dummy node that provides consistent read to its users without 
>> requiring it
>> @@ -1583,6 +1598,8 @@ static BlockJob *mirror_start_job(
>>           return NULL;
>>       }
>> +    target_is_backing = bdrv_chain_contains(bs, target);
> 
> may be initialized together with definition..

Could be, but would that be better? :)

>> +
>>       /* In the case of active commit, add dummy driver to provide 
>> consistent
>>        * reads on the top, while disabling it in the intermediate 
>> nodes, and make
>>        * the backing chain writable. */
>> @@ -1605,6 +1622,8 @@ static BlockJob *mirror_start_job(
>>       bs_opaque = g_new0(MirrorBDSOpaque, 1);
>>       mirror_top_bs->opaque = bs_opaque;
>> +    bs_opaque->is_commit = target_is_backing;
>> +
>>       /* bdrv_append takes ownership of the mirror_top_bs reference, 
>> need to keep
>>        * it alive until block_job_create() succeeds even if bs has no 
>> parent. */
>>       bdrv_ref(mirror_top_bs);
>> @@ -1646,7 +1665,6 @@ static BlockJob *mirror_start_job(
>>       target_perms = BLK_PERM_WRITE;
>>       target_shared_perms = BLK_PERM_WRITE_UNCHANGED;
>> -    target_is_backing = bdrv_chain_contains(bs, target);
>>       if (target_is_backing) {
>>           int64_t bs_size, target_size;
>>           bs_size = bdrv_getlength(bs);
>>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks!

Max


