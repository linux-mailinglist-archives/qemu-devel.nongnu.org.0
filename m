Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA55582AB7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 18:23:14 +0200 (CEST)
Received: from localhost ([::1]:60544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGjoX-0003Ls-A1
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 12:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGjfi-00046y-6k; Wed, 27 Jul 2022 12:14:07 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:48308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGjfc-0004JD-TL; Wed, 27 Jul 2022 12:14:03 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id DEA052E0D96;
 Wed, 27 Jul 2022 19:13:46 +0300 (MSK)
Received: from [10.211.19.155] (10.211.19.155-vpn.dhcp.yndx.net
 [10.211.19.155])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Rv6qHJklR7-DjPeZepf; Wed, 27 Jul 2022 19:13:46 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658938426; bh=KnEGxkcHoYqOGaNZchQJGzj2PC4QZSPRGH/BNkrvfw0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Yf2Qp80x6TwBL2xPcPP8a6fDqndWIaapxCRjIsv1Ru1SwPgMr0wvKx24ImaG+H3ka
 k2JCFbGdif1eZksAdo6s7uMWURhiVxXM0qmw56uIO6TxQbkh2CkWgakP+0D2hJ1cdW
 wo9pF/APma3hhKSwV4jLf7W6KG7XZxaPFksQeNGs=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <b3eb6174-5fd5-f7f9-512c-4cdb46e62502@yandex-team.ru>
Date: Wed, 27 Jul 2022 19:13:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 00/11] Refactor bdrv_try_set_aio_context using
 transactions
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220725122120.309236-1-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220725122120.309236-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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

On 7/25/22 15:21, Emanuele Giuseppe Esposito wrote:
> The aim of this series is to reorganize bdrv_try_set_aio_context
> and drop BDS ->set_aio_context and ->can_set_aio_ctx callbacks in
> favour of a new one, ->change_aio_ctx.
> 
> More informations in patch 3 (which is also RFC, due to the doubts
> I have with AioContext locks).
> 
> Patch 1 just add assertions in the code, 2 extends the transactions API to be able to add also transactions in the tail
> of the list.
> Patch 3 is the core of this series, and introduces the new callback.
> It is marked as RFC and the reason is explained in the commit message.
> Patches 4-5-6 implement ->change_aio_ctx in the various block, blockjob
> and block-backend BDSes.
> Patch 7 substitutes ->change_aio_ctx with the old callbacks, and
> patch 8 takes care of deleting the old callbacks and unused code.
> 
> This series is based on "job: replace AioContext lock with job_mutex",
> but just because it uses job_set_aio_context() introduced there.
> 
> Suggested-by: Paolo Bonzini<pbonzini@redhat.com>
> Based-on:<20220706201533.289775-1-eesposit@redhat.com>


What I dislike here is that you refactor aio-context-change to use transactions, but you use it "internally" for aio-context-change. aio-context-change doesn't become a native part of block-graph modifiction transaction system after the series.

For example, bdrv_attach_child_common(..., tran) still calls bdrv_try_change_aio_context() function which doesn't take @tran argument. And we have to call bdrv_try_change_aio_context() again in bdrv_attach_child_common_abort() with opposite arguments by hand. We create in _try_ separate Transaction object which is unrelated to the original block-graph-change transaction.

With good refactoring we should get rid of these _try_ functions, and have just bdrv_change_aio_context(..., tran) that can be natively used with external tran object, where other block-graph change actions participate. This way we'll not have to call reverse aio_context_change() in .abort, it will be done automatically.

Moreover, your  *aio_context_change* functions that do have tran parameter cannot be simply used in the block-graph change transaction, as you don't follow the common paradigm, that in .prepare we do all visible changes. That's why you have to still use _try_*() version that creates seaparate transaction object and completes it: after that the action is actually done and other graph-modifying actions can be done on top.

So, IMHO, we shouldn't go this way, as that adds transaction actions that actually can't be used in common block-graph-modifying transaction but only context of bdrv_try_change_aio_context() internal transaction.

I agree that aio-context change should finally be rewritten to take a native place in block-graph transactions, but that should be a complete solution, introducing native bdrv_change_aio_context(..., tran) transaction action that is directly used in the block-graph transaction, do visible effect in .prepare and don't create extra Transaction objects.

-- 
Best regards,
Vladimir

