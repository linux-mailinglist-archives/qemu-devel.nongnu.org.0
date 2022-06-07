Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B15E54022A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 17:12:24 +0200 (CEST)
Received: from localhost ([::1]:40378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyasY-0006jU-Ng
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 11:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nyaq4-0005mF-J0; Tue, 07 Jun 2022 11:09:48 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:53376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nyaq0-0002kK-Gc; Tue, 07 Jun 2022 11:09:47 -0400
Received: from vla3-850de775f4df.qloud-c.yandex.net
 (vla3-850de775f4df.qloud-c.yandex.net
 [IPv6:2a02:6b8:c15:341d:0:640:850d:e775])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 722B92E12A3;
 Tue,  7 Jun 2022 18:09:29 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla3-850de775f4df.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 N4nqR4Bylm-9TKSxn28; Tue, 07 Jun 2022 18:09:29 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654614569; bh=ZB03jvDWsO/qGdHOhBWW2QgtuBuRdDHwyjuHIJkxA2o=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=guB2RLOtY9CRqhr0bmjMr1UTB1HN5t1Y81OFkIMNoMQCMgNb0M5rmb3QMB4JcrYH8
 T26jKiblVbrgAsssJnJqh51OVSpq6w4Y43i4K1hwI+q7iH/MCw8Ug8qlOs90oov0uX
 f1Z87MEpv+mCG0ZuKcHkLhdhBlgLjeV1WXstW2Kk=
Authentication-Results: vla3-850de775f4df.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b6b6::1:2c] (unknown
 [2a02:6b8:b081:b6b6::1:2c])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 FuFl9nFiUg-9SMqipTq; Tue, 07 Jun 2022 18:09:28 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <1742ad75-c5c2-5932-5c97-e524795da675@yandex-team.ru>
Date: Tue, 7 Jun 2022 18:09:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 09/45] Revert "block: Let replace_child_noperm free
 children"
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-10-vsementsov@openvz.org>
 <eed85de7-a6d1-b6c0-14d7-e1eb236517a2@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <eed85de7-a6d1-b6c0-14d7-e1eb236517a2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
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

On 6/7/22 17:03, Hanna Reitz wrote:
> On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
>> We are going to reimplement this behavior (clear bs->file / bs->backing
>> pointers automatically when child->bs is cleared) in a nicer way.
>>
>> This reverts commit b0a9f6fed3d80de610dcd04a7e66f9f30a04174f.
> 
> This doesn’t really explain why it’s fine to revert this commit here. As far as I understand, the bug that was fixed in that commit will resurface when it is reverted without the proposed reimplementation, so technically, we cannot revert before reimplementing.
> 
> As far as I can guess, it’d be unwieldy to do the reimplementation while these existing changes are in the way, and it’d be one bomb of a patch to squash these five patches (9 to 14) into one, and that’s why you’ve chosen to do it this way around.

Yes, that's the reason

> 
> But technically, we can’t willingly break something just to keep patches nicer.  We can make exceptions, but then there needs to be justification here in the commit message.

Agree, will add.

As far as I remember (and after re-reading commit message) b0a9f6fed3d80de610dc was not a direct fix of some concrete bug. It was a measure to prevent theoretic problems. And we don't have any test for it. So I think, breaking bisect at this point for some future test is not too bad.

> 
> (Or perhaps I’m wrong and it is fine at this point to revert the patch, but then I’d like to see the explanation for that, too, because I can’t see it myself.)
> 
> Hanna
> 
> 


-- 
Best regards,
Vladimir

