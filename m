Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6F8553158
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 13:49:54 +0200 (CEST)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3cOH-0003vk-Ks
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 07:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3cJ9-0000be-CB; Tue, 21 Jun 2022 07:44:35 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:60494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3cJ5-0001qe-6g; Tue, 21 Jun 2022 07:44:33 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 8048F2E1FA7;
 Tue, 21 Jun 2022 14:44:20 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 5KA8Zf4AV6-iKJupR8T; Tue, 21 Jun 2022 14:44:20 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655811860; bh=tMU84CYGCMFNKPMhoF/9/jTZ9UIe2mVIxyY3O3ULww4=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=F0zZKI95KD1fmDkSJeqUlMSjej/SKJ1Hj/kHRdtQKhwUBtTEnZ6R53zCsY3Oe7M/o
 r2/OgDvBWXooQT/K0QTlNmDIqA6qhaSkcx9mWpsnqRtiwqR3mKzIAszFmDSLLaa47s
 9qHnn6f3rEhmFLQmJ3y5IPX+6/7KNnmWgzzGT+Z0=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:23::1:8] (unknown [2a02:6b8:b081:23::1:8])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id vasW4jStEt-iJMekbYf; Tue, 21 Jun 2022 14:44:20 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <bdbb0662-1d29-06ce-1858-4fae33c9ea65@yandex-team.ru>
Date: Tue, 21 Jun 2022 14:44:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 21/45] block: add bdrv_try_set_aio_context_tran
 transaction action
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-22-vsementsov@openvz.org>
 <80b132a2-bf15-4335-c8fa-048d2b7a83ec@redhat.com>
 <b9bfb45e-821e-a832-68a9-f7cf5bacda58@yandex-team.ru>
 <690b7c71-7719-bffe-ea65-ae021cb49b47@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <690b7c71-7719-bffe-ea65-ae021cb49b47@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/21/22 14:04, Hanna Reitz wrote:
> On 20.06.22 22:57, Vladimir Sementsov-Ogievskiy wrote:
>> On 6/13/22 10:46, Hanna Reitz wrote:
>>> On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
>>>> To be used in further commit.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>>>> ---
>>>>   block.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 48 insertions(+)
>>>>
>>>> diff --git a/block.c b/block.c
>>>> index be19964f89..1900cdf277 100644
>>>> --- a/block.c
>>>> +++ b/block.c
>>>> @@ -2907,6 +2907,54 @@ static void bdrv_child_free(BdrvChild *child)
>>>>       g_free(child);
>>>>   }
>>>> +typedef struct BdrvTrySetAioContextState {
>>>> +    BlockDriverState *bs;
>>>> +    AioContext *old_ctx;
>>>> +} BdrvTrySetAioContextState;
>>>> +
>>>> +static void bdrv_try_set_aio_context_abort(void *opaque)
>>>> +{
>>>> +    BdrvTrySetAioContextState *s = opaque;
>>>> +
>>>> +    if (bdrv_get_aio_context(s->bs) != s->old_ctx) {
>>>> +        bdrv_try_set_aio_context(s->bs, s->old_ctx, &error_abort);
>>>
>>> As far as I understand, users of this transaction will need to do a bit of AioContext lock shuffling: To set the context, they need to hold old_ctx, but not new_ctx; but in case of abort, they need to release old_ctx and acquire new_ctx before the abort handlers are called.  (Due to the constraints on bdrv_set_aio_context_ignore().)
>>>
>>> If that’s true, I think that should be documented somewhere.
>>>
>>
>> Hmm.. Actually, I think that bdrv_try_set_aio_context_abort() should do this shuffling by it self. The only hope to correctly rollback a transaction, is operation in assumption that on .abort() we are exactly on the same state as on .prepare(), regardless of other actions. And this means that old_ctx is acquired and new_ctx is not.
> 
> But if old_ctx is acquired and new_ctx is not, you cannot invoke bdrv_try_set_aio_context(bs, old_ctx), because that requires the current context (bdrv_get_aio_context(bs)) to be held, but not old_ctx (the “new” context for this call).
> 

Yes and that means that .abort() should release old_ctx and acquire new_ctx before calling bdrv_try_set_aio_context(). And release new_ctx and acquire back old_ctx. Does it make sense?

-- 
Best regards,
Vladimir

