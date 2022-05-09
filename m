Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFDD51F49C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 08:56:54 +0200 (CEST)
Received: from localhost ([::1]:36186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnxK9-00022G-9i
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 02:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nnxDy-0000f3-6Z; Mon, 09 May 2022 02:50:30 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:25182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nnxDv-0002s4-MI; Mon, 09 May 2022 02:50:29 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 2ABB843251;
 Mon,  9 May 2022 08:50:15 +0200 (CEST)
Message-ID: <5548ed22-2759-30ae-73cf-1b6c16f4c218@proxmox.com>
Date: Mon, 9 May 2022 08:49:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] block/gluster: correctly set max_pdiscard which is int64_t
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org, integration@gluster.org, qemu-stable@nongnu.org,
 vsementsov@virtuozzo.com, v.sementsov-og@mail.ru,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
References: <20220505083124.163404-1-f.ebner@proxmox.com>
 <20220506153906.gyh6rty6kr7hkixs@redhat.com>
From: Fabian Ebner <f.ebner@proxmox.com>
In-Reply-To: <20220506153906.gyh6rty6kr7hkixs@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Am 06.05.22 um 17:39 schrieb Eric Blake:
> On Thu, May 05, 2022 at 10:31:24AM +0200, Fabian Ebner wrote:
>> Previously, max_pdiscard would be zero in the following assertion:
>> qemu-system-x86_64: ../block/io.c:3166: bdrv_co_pdiscard: Assertion
>> `max_pdiscard >= bs->bl.request_alignment' failed.
>>
>> Fixes: 0c8022876f ("block: use int64_t instead of int in driver discard handlers")
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
>> ---
>>  block/gluster.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/block/gluster.c b/block/gluster.c
>> index 398976bc66..592e71b22a 100644
>> --- a/block/gluster.c
>> +++ b/block/gluster.c
>> @@ -891,7 +891,7 @@ out:
>>  static void qemu_gluster_refresh_limits(BlockDriverState *bs, Error **errp)
>>  {
>>      bs->bl.max_transfer = GLUSTER_MAX_TRANSFER;
>> -    bs->bl.max_pdiscard = SIZE_MAX;
>> +    bs->bl.max_pdiscard = INT64_MAX;
> 
> SIZE_MAX is unsigned, but can differ between 32- and 64-bit platforms.
> Blindly setting max_pdiscard to a signed 64-bit value seems wrong if
> glfs_discard_async() takes a size_t and you are on a 32-bit platform.
> 

Sorry, I did not consider this.

> Is the real issue that SIZE_MAX on a 64-bit platform is too large,

Yes, there it's too big for max_pdiscard which is int64_t.

> where we want min(SIZE_MAX,INT_MAX) as our real cap?
> 

Why not min(SIZE_MAX,INT64_MAX)? Since the constraint is to fit in both
size_t and int64_t. That would also preserve the current value on 32-bit
platforms.

>>  }
>>  
>>  static int qemu_gluster_reopen_prepare(BDRVReopenState *state,
>> @@ -1304,7 +1304,7 @@ static coroutine_fn int qemu_gluster_co_pdiscard(BlockDriverState *bs,
>>      GlusterAIOCB acb;
>>      BDRVGlusterState *s = bs->opaque;
>>  
>> -    assert(bytes <= SIZE_MAX); /* rely on max_pdiscard */
>> +    assert(bytes <= INT64_MAX); /* rely on max_pdiscard */
>>  
>>      acb.size = 0;
>>      acb.ret = 0;
>> -- 
>> 2.30.2
>>
>>
>>
> 


