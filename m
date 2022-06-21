Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8895531BF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 14:13:16 +0200 (CEST)
Received: from localhost ([::1]:45068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ckt-0001ZY-9z
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 08:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3cjT-0000MP-D6; Tue, 21 Jun 2022 08:11:47 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:37560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3cjP-00068T-2p; Tue, 21 Jun 2022 08:11:45 -0400
Received: from vla5-d6ec41cad181.qloud-c.yandex.net
 (vla5-d6ec41cad181.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:348f:0:640:d6ec:41ca])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 025572E1FC3;
 Tue, 21 Jun 2022 15:11:30 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla5-d6ec41cad181.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 vSHBIDSfIB-BSJWopQK; Tue, 21 Jun 2022 15:11:29 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655813489; bh=l7irQzuOrEEXlXKRhAGwskRVUvWRtmyNibrCYaW+zXQ=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=QeOA5x3G1DE65/vvuwra0AgVusT7Xa5xcxInG6SnWt26ndbMvfs4P3osh24AucX4s
 1J5aM1ASzLq9LBYJWkSClYEBBLNDFwVhhk6uDfoqL9c3tuC0qu4YOW+IPcKkAW4tJo
 xOld0kite5pvakhN3uWq362wTNcHA8P2ops/fpvw=
Authentication-Results: vla5-d6ec41cad181.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:23::1:8] (unknown [2a02:6b8:b081:23::1:8])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id wcFdPLT9FJ-BSM8bObB; Tue, 21 Jun 2022 15:11:28 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <4ba08eac-3d5c-57f4-7182-afa43814774b@yandex-team.ru>
Date: Tue, 21 Jun 2022 15:11:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 29/45] block: introduce BDRV_O_NOPERM flag
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, Markus Armbruster <armbru@redhat.com>
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-30-vsementsov@openvz.org>
 <dab57682-a16e-9967-b0d8-b9af63f45691@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <dab57682-a16e-9967-b0d8-b9af63f45691@redhat.com>
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

On 6/13/22 12:54, Hanna Reitz wrote:
> On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
>> Now copy-before-write filter has weak permission model: when it has no
>> parents, it share write permission on source. Otherwise we just can't
>> blockdev-add it, when existing user of source has write permission.
>>
>> The situation is bad, it means that copy-before-write filter doesn't
>> guarantee that all write goes through it.
> 
> I don’t understand how this situation really is bad, because it sounds like anything else would just be a safeguard against users adding a CBW filter without making use of it.  Which I’d think is their own fault.
> 
> As far as I remember the actual problem is that we cannot do transactional graph modifications, where e.g. a CBW node is inserted and a bitmap is created in a single atomic transaction[1].  Which is a problem.  And now I just don’t quite understand how unsharing WRITE unconditionally would help with the actual problem.
> 
> [1] Then again, would then even be “atomic”?  For that transaction to work as intended, the node would need to be drained during the transaction (so that the bitmap stays in sync with the CBW state). It doesn’t look like that would be the case.

I think, we should already be in a drained section, when do the transaction.

In qmp_transaction we have bdrv_drain_all() call. It's enough if we don't yield during transaction actions (and mostly, we shouldn't) (is it enough, when we have iothreads?). Probably, it should be bdrv_drain_all_being() before all actions and bdrv_drain_all_end() after them.

> 
> So perhaps I’m just remembering incorrectly.

OK, the same answer: I should try to split these features, as they are separate:

1. transactional API

2. strict permissions for CBW

Seems that [2] is not necessary for [1]. If so, we can consider smaller picture (only [1]), and do [2] later (or not do, if it remains too complicated for the small profit).

> 
>> And a lot better is unshare
>> write always. But how to insert the filter in this case?
>>
>> The solution is to do blockdev-add and blockdev-replace in one
>> transaction, and more, update permissions only after both command.
>>
>> For now, let's create a possibility to not update permission on file
>> child of copy-before-write filter at time of open.
>>
>> New interfaces are:
>>
>> - bds_tree_init() with flags argument, so that caller may pass
>>    additional flags, for example the new BDRV_O_NOPERM.
>>
>> - bdrv_open_file_child_common() with boolean refresh_perms arguments.
>>    Drivers may use this function with refresh_perms = true, if they want
>>    to satisfy BDRV_O_NOPERM. No one such driver for now.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> 
> 


-- 
Best regards,
Vladimir

