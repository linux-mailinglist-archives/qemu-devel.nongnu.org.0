Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21006525C1A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 09:11:35 +0200 (CEST)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npPSY-0007Aa-5o
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 03:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1npPAm-00070p-GW; Fri, 13 May 2022 02:53:12 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:27692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1npPAj-00040J-5B; Fri, 13 May 2022 02:53:11 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 86995434BF;
 Fri, 13 May 2022 08:53:02 +0200 (CEST)
Message-ID: <b4f68898-abf3-8561-b641-0f0d8bb5ac02@proxmox.com>
Date: Fri, 13 May 2022 08:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] block/gluster: correctly set max_pdiscard
Content-Language: en-US
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org, integration@gluster.org, qemu-stable@nongnu.org,
 eblake@redhat.com, vsementsov@virtuozzo.com
References: <20220512103048.214100-1-f.ebner@proxmox.com>
 <20220512154413.vw7lnfxqttdidu4n@sgarzare-redhat>
 <20220512160534.lijy67jibfiyox54@sgarzare-redhat>
From: Fabian Ebner <f.ebner@proxmox.com>
In-Reply-To: <20220512160534.lijy67jibfiyox54@sgarzare-redhat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Am 12.05.22 um 18:05 schrieb Stefano Garzarella:
> On Thu, May 12, 2022 at 05:44:13PM +0200, Stefano Garzarella wrote:
>> On Thu, May 12, 2022 at 12:30:48PM +0200, Fabian Ebner wrote:
>>> On 64-bit platforms, SIZE_MAX is too large for max_pdiscard, which is
>>
>> The main problem is that SIZE_MAX for an int64_t is a negative value.
>>

Yes, I should've stated that directly.

>>> int64_t, and the following assertion would be triggered:
>>> qemu-system-x86_64: ../block/io.c:3166: bdrv_co_pdiscard: Assertion
>>> `max_pdiscard >= bs->bl.request_alignment' failed.
>>>
>>> Fixes: 0c8022876f ("block: use int64_t instead of int in driver
>>> discard handlers")
>>> Cc: qemu-stable@nongnu.org
>>> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
>>> ---
>>> block/gluster.c | 4 ++--
>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/block/gluster.c b/block/gluster.c
>>> index 398976bc66..f711bf0bd6 100644
>>> --- a/block/gluster.c
>>> +++ b/block/gluster.c
>>> @@ -891,7 +891,7 @@ out:
>>> static void qemu_gluster_refresh_limits(BlockDriverState *bs, Error
>>> **errp)
>>> {
>>>    bs->bl.max_transfer = GLUSTER_MAX_TRANSFER;
>>> -    bs->bl.max_pdiscard = SIZE_MAX;
>>> +    bs->bl.max_pdiscard = MIN(SIZE_MAX, INT64_MAX);
>>
>> What would be the problem if we use INT64_MAX?
> 
> Okay, I just saw Eric's answer to v1 and I think this is right.
> 

Sorry for not mentioning the changes from v1.

> Please explain it in the commit message and also the initial problem
> that is SIZE_MAX on a 64-bit platform is a negative number for int64_t,
> so the assert fails.
> 

I'll try and improve the commit message for v3.

> Thanks,
> Stefano
> 
>> (I guess the intention of the original patch was to set the maximum
>> value in drivers that do not have a specific maximum).
>>
>> Or we can set to 0, since in block/io.c we have this code:
>>
>>    max_pdiscard = QEMU_ALIGN_DOWN(MIN_NON_ZERO(bs->bl.max_pdiscard,
>> INT64_MAX),
>>                                   align);
>>    assert(max_pdiscard >= bs->bl.request_alignment);
>>
>> Where `max_pdiscard` is set to INT64_MAX (and aligned) if
>> bs->bl.max_pdiscard is 0.
>>
>>> }
>>>
>>> static int qemu_gluster_reopen_prepare(BDRVReopenState *state,
>>> @@ -1304,7 +1304,7 @@ static coroutine_fn int
>>> qemu_gluster_co_pdiscard(BlockDriverState *bs,
>>>    GlusterAIOCB acb;
>>>    BDRVGlusterState *s = bs->opaque;
>>>
>>> -    assert(bytes <= SIZE_MAX); /* rely on max_pdiscard */
>>> +    assert(bytes <= MIN(SIZE_MAX, INT64_MAX)); /* rely on
>>> max_pdiscard */
>>
>> Can we use bs->bl.max_pdiscard directly here?
>>

Now I'm thinking that the assert is actually for checking that the value
can be passed to glfs_discard_async(), which takes a size_t for the
argument in question. So maybe it's best to keep assert(bytes <=
SIZE_MAX) as is?

>> Thanks,
>> Stefano
> 
> 
> 


