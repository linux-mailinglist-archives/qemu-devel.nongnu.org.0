Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF66F5ED4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 21:04:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puHm5-0005fX-Vx; Wed, 03 May 2023 15:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puHm1-0005f3-Mo; Wed, 03 May 2023 15:04:21 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puHlz-00056s-5U; Wed, 03 May 2023 15:04:21 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 09B6C5E8A1;
 Wed,  3 May 2023 22:04:09 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b43b::1:1a] (unknown
 [2a02:6b8:b081:b43b::1:1a])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 84UwCc0MoW20-X5gx46r5; Wed, 03 May 2023 22:04:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683140648; bh=TFfwCrCLBY1tRnuZ+DpUvwOUVwyc+D9yGsm2vdlfmeY=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=V3Z/me4IdxW4xShqQR3h27ti0r1GCBlJ2jS0M2rz0Ns7GFKdzFnOV1n82KQ+YrUml
 6h9Ei284WuVYZY45qVXHhVOeHqydYGlRMBXgG0APrd2L3I6sUawO/yz43eMV+dX4nK
 OS6OQHYLn5lNXMMQUHP0Ec9sXbnO8xL6ahkukgQ8=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <18c7c4d3-cd80-8a41-93e3-e14f6112802c@yandex-team.ru>
Date: Wed, 3 May 2023 22:04:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] migration: Fix block_bitmap_mapping migration
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-block@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20230503181036.14890-1-quintela@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230503181036.14890-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03.05.23 21:10, Juan Quintela wrote:
> It is valid that params->has_block_bitmap_mapping is true and
> params->block_bitmap_mapping is NULL.  So we can't use the trick of
> having a single function.
> 
> Move to two functions one for each value and the tests are fixed.
> 
> Fixes: b804b35b1c8a0edfd127ac20819c234be55ac7fc
>         migration: Create migrate_block_bitmap_mapping() function
> 
> Reported-by: Kevin Wolf<kwolf@redhat.com>
> Signed-off-by: Juan Quintela<quintela@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


