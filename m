Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471EA5450AA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:23:30 +0200 (CEST)
Received: from localhost ([::1]:51170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzK0P-0006oa-BV
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nzJPr-0004fT-Ra; Thu, 09 Jun 2022 10:45:46 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:36930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nzJPf-000889-3Z; Thu, 09 Jun 2022 10:45:37 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 1D3D82E0B0A;
 Thu,  9 Jun 2022 17:44:49 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 6zXAv0hQoZ-ikKmoQvR; Thu, 09 Jun 2022 17:44:49 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654785889; bh=tbu8GCRet5qDBrn3kcwX9O3ZR9v1k/Dhcw+3NUsfd6M=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=M+zEb5mwhh304gR4yOV/MK3cO+uv1qecHByg2GI9njdb95uTX4ApIXB1sDIPJymCF
 vMRvoBb4gh1BsKsY9h+Dc7q+RBeToApxJbD07FilbuayLYPBDzuwpovaAMZ2qswSez
 nuMolxtAOy03IB4y1dk6Dp/TWYo6UBRrfsBRpJRE=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:219::1:1f] (unknown
 [2a02:6b8:b081:219::1:1f])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 IYZq9fKV4t-ijMGB5Qo; Thu, 09 Jun 2022 17:44:46 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <77b6d809-b9d9-44ae-7204-c16bc54e29cf@yandex-team.ru>
Date: Thu, 9 Jun 2022 17:44:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 14/45] block/snapshot: drop indirection around
 bdrv_snapshot_fallback_ptr
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-15-vsementsov@openvz.org>
 <4c9c40f0-07bb-5526-fe9d-1711742dd195@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <4c9c40f0-07bb-5526-fe9d-1711742dd195@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/7/22 18:58, Hanna Reitz wrote:
> On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
>> Now the indirection is not actually used, we can safely reduce it to
>> simple pointer.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> ---
>>   block/snapshot.c | 39 +++++++++++++++++----------------------
>>   1 file changed, 17 insertions(+), 22 deletions(-)
> 
> Looks good, just wondering whether we should drop some of the "_ptr" suffixes now.
> 
>> diff --git a/block/snapshot.c b/block/snapshot.c
>> index 02a880911f..4eb9258de6 100644
>> --- a/block/snapshot.c
>> +++ b/block/snapshot.c
>> @@ -151,34 +151,29 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
>>   }
>>   /**
>> - * Return a pointer to the child BDS pointer to which we can fall
>> + * Return a pointer to child of given BDS to which we can fall
>>    * back if the given BDS does not support snapshots.
>>    * Return NULL if there is no BDS to (safely) fall back to.
>> - *
>> - * We need to return an indirect pointer because bdrv_snapshot_goto()
>> - * has to modify the BdrvChild pointer.
>>    */
>> -static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
>> +static BdrvChild *bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
> 
> The _ptr part was meant to point out that it returns an indirect pointer; maybe we should name it bdrv_snapshot_fallback_child() now?
> 
>>   {
>> -    BdrvChild **fallback;
>> -    BdrvChild *child = bdrv_primary_child(bs);
>> +    BdrvChild *fallback = bdrv_primary_child(bs);
>> +    BdrvChild *child;
>>       /* We allow fallback only to primary child */
>> -    if (!child) {
>> +    if (!fallback) {
>>           return NULL;
>>       }
>> -    fallback = (child == bs->file ? &bs->file : &bs->backing);
>> -    assert(*fallback == child);
>>       /*
>>        * Check that there are no other children that would need to be
>>        * snapshotted.  If there are, it is not safe to fall back to
>> -     * *fallback.
>> +     * fallback.
>>        */
>>       QLIST_FOREACH(child, &bs->children, next) {
>>           if (child->role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
>>                              BDRV_CHILD_FILTERED) &&
>> -            child != *fallback)
>> +            child != fallback)
>>           {
>>               return NULL;
>>           }
>> @@ -189,8 +184,8 @@ static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
>>   static BlockDriverState *bdrv_snapshot_fallback(BlockDriverState *bs)
>>   {
>> -    BdrvChild **child_ptr = bdrv_snapshot_fallback_ptr(bs);
> 
> Just "child" is enough (and better) now, I think.
> 
>> -    return child_ptr ? (*child_ptr)->bs : NULL;
>> +    BdrvChild *child_ptr = bdrv_snapshot_fallback_ptr(bs);
>> +    return child_ptr ? child_ptr->bs : NULL;
>>   }
>>   int bdrv_can_snapshot(BlockDriverState *bs)
> 
> 

Agree to all comments, will do

-- 
Best regards,
Vladimir

