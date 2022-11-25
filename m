Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDDB638CDA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 16:01:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyaBH-00041Z-5h; Fri, 25 Nov 2022 09:59:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyaBE-000405-HI; Fri, 25 Nov 2022 09:59:52 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyaBB-0002ga-K1; Fri, 25 Nov 2022 09:59:52 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 3E2A45FD1F;
 Fri, 25 Nov 2022 17:59:38 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:16::1:7] (unknown [2a02:6b8:b081:16::1:7])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id axNXH00OWKo1-U44kOlEi; Fri, 25 Nov 2022 17:59:37 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1669388377; bh=LciZbZa4LBcG9+JkvXWVU8BGk63FnOryp5O85uufNhs=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=MC5HMBL5cdFXao4lNgMd712gmukzd67oadmGa/hHgGcmiMAjSdfc78AoORjh/jZFm
 bULZtXnaSHgeTozFa6YcMPoTg1QXDePf4MxOvObr7IgO3x4+uw8PBUStqTABEVyH9x
 JqRyYgQHMMxhBQArSx09E8HvKCKfv5UtG6sRW9/4=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <2f4a4c25-c215-bec9-5148-5b5892232345@yandex-team.ru>
Date: Fri, 25 Nov 2022 17:59:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 11/15] block: Call drain callbacks only once
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221118174110.55183-1-kwolf@redhat.com>
 <20221118174110.55183-12-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221118174110.55183-12-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/18/22 20:41, Kevin Wolf wrote:
> We only need to call both the BlockDriver's callback and the parent
> callbacks when going from undrained to drained or vice versa. A second
> drain section doesn't make a difference for the driver or the parent,
> they weren't supposed to send new requests before and after the second
> drain.
> 
> One thing that gets in the way is the 'ignore_bds_parents' parameter in
> bdrv_do_drained_begin_quiesce() and bdrv_do_drained_end(): It means that
> bdrv_drain_all_begin() increases bs->quiesce_counter, but does not
> quiesce the parent through BdrvChildClass callbacks. If an additional
> drain section is started now, bs->quiesce_counter will be non-zero, but
> we would still need to quiesce the parent through BdrvChildClass in
> order to keep things consistent (and unquiesce it on the matching
> bdrv_drained_end(), even though the counter would reach 0 yet as long as

would reach -> would NOT reach

if I understand correctly)

> the bdrv_drain_all() section is still active).
> 
> Instead of keeping track of this, let's just get rid of the parameter.
> It was introduced in commit 6cd5c9d7b2d as an optimisation so that
> during bdrv_drain_all(), we wouldn't recursively drain all parents up to
> the root for each node, resulting in quadratic complexity. As it happens,
> calling the callbacks only once solves the same problem, so as of this
> patch, we'll still have O(n) complexity and ignore_bds_parents is not
> needed any more.
> 
> This patch only ignores the 'ignore_bds_parents' parameter. It will be
> removed in a separate patch.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>




-- 
Best regards,
Vladimir


