Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAF1552635
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 23:00:45 +0200 (CEST)
Received: from localhost ([::1]:43414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3OVn-00056N-EU
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 17:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3OSw-0004ET-0K; Mon, 20 Jun 2022 16:57:48 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:51932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3OSr-0004Lr-SN; Mon, 20 Jun 2022 16:57:44 -0400
Received: from sas1-3cba3404b018.qloud-c.yandex.net
 (sas1-3cba3404b018.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd26:0:640:3cba:3404])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id CB62F2E0A2D;
 Mon, 20 Jun 2022 23:57:28 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas1-3cba3404b018.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 vIsv7KE9SH-vSJqdNfE; Mon, 20 Jun 2022 23:57:28 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655758648; bh=HWhnc4C/x7UNBlcUep19WBN+h6GdQ0uo1dgrTDu+S5Y=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=gQH0cAA5w1nOsLRxL+umipl6Ps2uA4asdy9Hu1Ej2Pze3BVF+3rqACaZJ/FppLTQX
 jaKV6Eg67n1/n24sp+/ZXJU76OnQNLZzy1sfuZvMS9/wz7byiqp5pPguhKj7G0hF0W
 EeyE47jVAie8iYGL4z0rAQiyIxGc+8n3Oi5ByL+8=
Authentication-Results: sas1-3cba3404b018.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:a527::1:24] (unknown
 [2a02:6b8:b081:a527::1:24])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 BsAmaTgCLs-vRNGsW43; Mon, 20 Jun 2022 23:57:28 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <b9bfb45e-821e-a832-68a9-f7cf5bacda58@yandex-team.ru>
Date: Mon, 20 Jun 2022 23:57:27 +0300
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
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <80b132a2-bf15-4335-c8fa-048d2b7a83ec@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/13/22 10:46, Hanna Reitz wrote:
> On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
>> To be used in further commit.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> ---
>>   block.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>
>> diff --git a/block.c b/block.c
>> index be19964f89..1900cdf277 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -2907,6 +2907,54 @@ static void bdrv_child_free(BdrvChild *child)
>>       g_free(child);
>>   }
>> +typedef struct BdrvTrySetAioContextState {
>> +    BlockDriverState *bs;
>> +    AioContext *old_ctx;
>> +} BdrvTrySetAioContextState;
>> +
>> +static void bdrv_try_set_aio_context_abort(void *opaque)
>> +{
>> +    BdrvTrySetAioContextState *s = opaque;
>> +
>> +    if (bdrv_get_aio_context(s->bs) != s->old_ctx) {
>> +        bdrv_try_set_aio_context(s->bs, s->old_ctx, &error_abort);
> 
> As far as I understand, users of this transaction will need to do a bit of AioContext lock shuffling: To set the context, they need to hold old_ctx, but not new_ctx; but in case of abort, they need to release old_ctx and acquire new_ctx before the abort handlers are called.  (Due to the constraints on bdrv_set_aio_context_ignore().)
> 
> If that’s true, I think that should be documented somewhere.
> 

Hmm.. Actually, I think that bdrv_try_set_aio_context_abort() should do this shuffling by it self. The only hope to correctly rollback a transaction, is operation in assumption that on .abort() we are exactly on the same state as on .prepare(), regardless of other actions. And this means that old_ctx is acquired and new_ctx is not.


-- 
Best regards,
Vladimir

