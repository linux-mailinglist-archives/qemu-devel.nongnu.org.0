Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BFF36CB12
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 20:26:46 +0200 (CEST)
Received: from localhost ([::1]:52106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbSQ1-0003Bm-8z
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 14:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbSOT-0002aN-GH
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbSOR-0005w5-0i
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619547905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9pm1CT1xr2EU3yE+TbzQgIPCqkL0JvmpZzNTG5z8rY=;
 b=Xj7nApXMO17cZ/+2jYDFG3MapntcIAdWkviPsxKF5clXppHEWbMKZxvPf+KNCGLZRYUmGm
 W/9c79nPNgAdAhRgLa9JCeqgEyYKSjOUIOh+FudE29j1VbHvdy3oki+7e2EGQBtOabQOSv
 E46D7Z8dfEr06JLpp4zyWBo0sSwv9fI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-wseAFuLJPx6X-FGMtsM2xQ-1; Tue, 27 Apr 2021 14:25:02 -0400
X-MC-Unique: wseAFuLJPx6X-FGMtsM2xQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04EB7804035;
 Tue, 27 Apr 2021 18:25:01 +0000 (UTC)
Received: from [10.10.112.236] (ovpn-112-236.rdu2.redhat.com [10.10.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A63FA6064B;
 Tue, 27 Apr 2021 18:24:56 +0000 (UTC)
Subject: Re: [PATCH RFC C0/2] support allocation-map for
 block-dirty-bitmap-merge
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210427111126.84307-1-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <0b7abd2d-f601-4224-1261-f939623d7687@redhat.com>
Date: Tue, 27 Apr 2021 14:24:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210427111126.84307-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, pkrempa@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, nshirokovskiy@virtuozzo.com,
 den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 7:11 AM, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> It's a simpler alternative for
> "[PATCH v4 0/5] block: add block-dirty-bitmap-populate job"
>    <20200902181831.2570048-1-eblake@redhat.com>
>    https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg00978.html
>    https://patchew.org/QEMU/20200902181831.2570048-1-eblake@redhat.com/
> 
> Since we have "coroutine: true" feature for qmp commands, I think,
> maybe we can merge allocation status to bitmap without bothering with
> new block-job?
> 
> It's an RFC:
> 
> 1. Main question: is it OK as a simple blocking command, even in a
> coroutine mode. It's a lot simpler, and it can be simply used in a
> transaction with other bitmap commands.
> 

Hm, possibly... I did not follow the discussion of coroutine QMP 
commands closely to know what the qualifying criteria to use them are.

(Any wisdom for me here, Markus?)

> 2. Transaction support is not here now. Will add in future version, if
> general approach is OK.
> 

That should be alright, I think. It means that the operation needs to 
succeed before the transaction returns success, though.

Depending on what else is in the transaction, do we run the risk of a 
deadlock if we need to wait for a coroutine to finish?

> 3. I just do bdrv_co_enter() / bdrv_co_leave() like it is done in the
> only coroutine qmp command - block_resize(). I'm not sure how much is it
> correct.
> 

See above concern!

> 4. I don't do any "drain". I think it's not needed, as intended usage
> is to merge block-status to _active_ bitmap. So all concurrent
> operations will just increase dirtyness of the bitmap and it is OK.
> 

That sounds fine for individual usage, but I can't convince myself it's 
safe for transactions.

> 5. Probably we still need to create some BdrvChild to avoid node resize
> during the loop of block-status querying.
> 

I'm less sure that it's OK to cause temporary graph changes during the 
course of a blocking QMP function... but maybe that's OK?

Peter Krempa is the expert to consult on that one.

> 6. Test is mostly copied from parallels-read-bitmap, I'll refactor it in
> next version to avoid copy-paste.
> 
> 7. Probably patch 01 is better be split into 2-3 patches.
> 
> Vladimir Sementsov-Ogievskiy (2):
>    qapi: block-dirty-bitmap-merge: support allocation maps
>    iotests: add allocation-map-to-bitmap
> 
>   qapi/block-core.json                          | 31 ++++++++-
>   include/block/block_int.h                     |  4 ++
>   block/dirty-bitmap.c                          | 42 ++++++++++++
>   block/monitor/bitmap-qmp-cmds.c               | 55 +++++++++++++---
>   .../tests/allocation-map-to-bitmap            | 64 +++++++++++++++++++
>   .../tests/allocation-map-to-bitmap.out        |  9 +++
>   6 files changed, 195 insertions(+), 10 deletions(-)
>   create mode 100755 tests/qemu-iotests/tests/allocation-map-to-bitmap
>   create mode 100644 tests/qemu-iotests/tests/allocation-map-to-bitmap.out
> 


