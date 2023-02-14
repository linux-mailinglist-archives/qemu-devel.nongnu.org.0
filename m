Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7F4696A45
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:49:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyU9-0005vR-W5; Tue, 14 Feb 2023 11:48:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRyU2-0005rl-Mc; Tue, 14 Feb 2023 11:48:46 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRyU0-0000ys-Lr; Tue, 14 Feb 2023 11:48:46 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 8EEB45E824;
 Tue, 14 Feb 2023 19:48:26 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b433::1:3c] (unknown
 [2a02:6b8:b081:b433::1:3c])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 PmmRW10RhGk1-awtBrHa4; Tue, 14 Feb 2023 19:48:25 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676393306; bh=PXXlb8t1HIGCyiIgquijgYU59hfhHGS+rAG2TNXCD2w=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=EXrk6/euzK9XcEC4GySnAlBOXHjnEF9beV9hqa3f4Sj3m2nFUMJrM4TzN+RO17mZX
 XAEDtBRHrWTVbod69dMR8SNdpthIrYlTTvrnFAPmvdMu2D36oPjc34DJQFMdicb/Va
 wXoYA3Csk/PjHZlCnwKJm9FH2nsvUktCgto+iqY8=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <8a7d0bc4-e7be-8c9a-3490-116fc2f6475f@yandex-team.ru>
Date: Tue, 14 Feb 2023 19:48:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org
Cc: "Denis V. Lunev" <den@virtuozzo.com>, t.lamprecht@proxmox.com,
 jsnow@redhat.com, hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>
References: <20221207132719.131227-1-f.ebner@proxmox.com>
 <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
 <926be172-1d8a-e896-c051-3c37d048771b@virtuozzo.com>
 <c3982fa3-be00-9cb2-7d71-5f784ac80864@proxmox.com>
 <Y9uf1wlXQd4EIwxO@redhat.com>
 <746c2aaf-c909-784a-fc63-d0599d6dee9b@proxmox.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <746c2aaf-c909-784a-fc63-d0599d6dee9b@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 14.02.23 17:29, Fiona Ebner wrote:

[..]

> 
> [0]: Is there a good way to peek the iterator without doing something
> like the following (we do know the offset from last time in
> mirror_iteration(), so that is not an issue)?
>> offset_from_last_time = bdrv_dirty_iter_next(s->dbi);
>> ...other stuff...
>> peek = bdrv_dirty_iter_next(s->dbi);
>> /* Get back to the previous state. */
>> bdrv_set_dirty_iter(s->dbi, offset_from_last_time);
>> check = bdrv_dirty_iter_next(s->dbi);
>> assert(check == offset_from_before); // just to be sure
> 

I think, that this all should be refactored to use bdrv_dirty_bitmap_next_dirty_area() and keep the "current_offset" instead of "dbi" in MirrorBlockJob. This way further changes will be simpler.



-- 
Best regards,
Vladimir


