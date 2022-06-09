Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51672545062
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:15:32 +0200 (CEST)
Received: from localhost ([::1]:33436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJsg-0002cH-UT
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nzJaz-0000Se-Iu; Thu, 09 Jun 2022 10:57:13 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:43022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nzJav-0002kM-7l; Thu, 09 Jun 2022 10:57:11 -0400
Received: from myt6-79704c0e15e4.qloud-c.yandex.net
 (myt6-79704c0e15e4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:239b:0:640:7970:4c0e])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id CA0202E097B;
 Thu,  9 Jun 2022 17:56:58 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 02fLaveF6V-uwJ01vZp; Thu, 09 Jun 2022 17:56:58 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654786618; bh=1f9igqF3usL+iHcs5K5VdE09gylAdmEFLt23PTi0D+w=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=CW1kFw990ZnU9BolaypB0+pOL9yI76kzwg2jLRyqxTZiHYbwIKxyrbGSNz0Zxbh+X
 2GloBr+nE4CCOdX6G1J9kZOV5tB2p2bMOZLoniVhZhvoxu5YvA+QvZFoAWrkaZck7O
 JLoiJdKn/ZbSQeaUws9d1iY1xt7AheT8ILFXW0+M=
Authentication-Results: myt6-79704c0e15e4.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:219::1:1f] (unknown
 [2a02:6b8:b081:219::1:1f])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 IL7fYHmVJ0-uwNKm743; Thu, 09 Jun 2022 17:56:58 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <37cccb24-79f8-3bca-f289-c8d17e9176a1@yandex-team.ru>
Date: Thu, 9 Jun 2022 17:56:58 +0300
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
 <3cffc38f-e82f-0d34-21f1-6089ac9de21c@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <3cffc38f-e82f-0d34-21f1-6089ac9de21c@redhat.com>
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

On 6/8/22 14:49, Hanna Reitz wrote:
> On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
>> To be used in further commit.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> ---
>>   block.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 48 insertions(+)
> 
> Looking at bdrv_child_try_set_aio_context(), it looks like bdrv_can_set_aio_context() were supposed to be the .prepare action, and bdrv_set_aio_context_ignore() should be the .commit action.  Can we not use it that way?
> 
> 


The difference is that we want the whole action be done in .prepare stage, not only the check. It's generally better: when do several actions in a transaction, actions usually depend on result of previous actions.

And I think it's necessary for graph update. Graph relations are changed during other actions .prepare phases, so I can't imagine how to postpone aio-context update to .commit phase.


But I agree, that having both _can_ / _set_  and *tran APIs don't look good. May be we can refactor it.. But not in this series I think)

-- 
Best regards,
Vladimir

