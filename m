Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906E06968AD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:59:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxhx-0002n7-PA; Tue, 14 Feb 2023 10:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRxhv-0002mX-D0; Tue, 14 Feb 2023 10:59:03 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRxht-0000Uj-Ef; Tue, 14 Feb 2023 10:59:03 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id DB60A611CC;
 Tue, 14 Feb 2023 18:58:50 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b433::1:3c] (unknown
 [2a02:6b8:b081:b433::1:3c])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 nwlgI10RkW21-lzHEWb7Y; Tue, 14 Feb 2023 18:58:50 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676390330; bh=ttxbAmI/AVLINQx3O8SAFKMzL3n27TKQD8fdVgNi42w=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ItxVzls5gM2kS7LXHP/u2hbUxoGW5xKiQVLbpt0X2gSNRCx2nW+99Wk/WmXaqhIxU
 /KwM8ENGWlE5S6TbWF31PuExgMc0aSXS2WwefK/dalafwTmh1sBi5IP1Mm6wn2T3Ty
 +3SUWlXP5I4xSNnpoo+pvt59ycyIMRGmEZWJbFag=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <12619db6-52f2-0fe3-bfbe-c31c83ecb2a8@yandex-team.ru>
Date: Tue, 14 Feb 2023 18:58:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, "Denis V. Lunev" <den@virtuozzo.com>
Cc: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org,
 t.lamprecht@proxmox.com, jsnow@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>
References: <20221207132719.131227-1-f.ebner@proxmox.com>
 <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
 <926be172-1d8a-e896-c051-3c37d048771b@virtuozzo.com>
 <c3982fa3-be00-9cb2-7d71-5f784ac80864@proxmox.com>
 <Y9uf1wlXQd4EIwxO@redhat.com>
 <40969191-9a16-0550-e999-bc44584d81fb@proxmox.com>
 <67fdadb1-672f-776a-2ce6-631cba19171c@virtuozzo.com>
 <Y9vVd8unUeZmsmmX@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <Y9vVd8unUeZmsmmX@redhat.com>
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

On 02.02.23 18:23, Kevin Wolf wrote:
> Am 02.02.2023 um 14:35 hat Denis V. Lunev geschrieben:
>> On 2/2/23 14:27, Fiona Ebner wrote:
>>> Am 02.02.23 um 12:34 schrieb Kevin Wolf:
>>>> Am 02.02.2023 um 11:19 hat Fiona Ebner geschrieben:
>>>>> Am 31.01.23 um 19:18 schrieb Denis V. Lunev:
>>>>>> Frankly speaking I would say that this switch could be considered
>>>>>> NOT QEMU job and we should just send a notification (event) for the
>>>>>> completion of the each iteration and management software should
>>>>>> take a decision to switch from async mode to the sync one.
>>>> My first thought was very similar. We should provide a building block
>>>> that just switches between the two modes and then the management tool
>>>> can decide what the right policy is.
>>>>
>>>> Adding a new event when the first iteration is done (I'm not sure if
>>>> there is much value in having it for later iterations) makes sense to
>>>> me if someone wants to use it. If we add it, let's not forget that
>>>> events can be lost and clients must be able to query the same
>>>> information, so we'd have to add it to query-jobs, too - which in turn
>>>> requires adding a job type specific struct to JobInfo first.
>>>>
>>> Well, Denis said 2 iterations might be better. But I'm fine with
>>> initially adding an event just for the first iteration, further ones can
>>> still be added later. Returning the number of completed iterations as
>>> part of the mirror-specific job info would anticipate that.
>>
>> May be it would be better to have an event on each iteration + make
>> available iteration count over block status query.
> 
> In the ready phase, each iteration can be very short. Basically if the
> guest writes to one block and then the mirror catches up, that's a whole
> iteration. So if the guest is doing I/O at a moderate rate so that the
> host can keep up with it, you might end up with one QMP event per I/O
> request.
> 

I think, after first iteration the only physical parameters are data_sent and remaining_dirty. Number of additional iterations doesn't matter - we just loop through dirty bits.

I'm not even sure that first iteration completion has physical meaning.. Probably, "the whole disk touched", so we can make more reasonable prediction about further speed and convergence..

-- 
Best regards,
Vladimir


