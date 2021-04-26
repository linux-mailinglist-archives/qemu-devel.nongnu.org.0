Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671F836B309
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 14:25:45 +0200 (CEST)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb0J6-00029R-Dw
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 08:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lb0H1-0001Xa-84
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:23:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lb0Gv-0002B7-SP
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:23:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619439808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lmuXI6hBqJj9mHxtFKyVSNb5oIpAHBWaLDYL59Paw0o=;
 b=D5XdC0Fzkw0ZG/T1M5CLbn/+/NKmh1PrsURVKiaAXzec6I/LeRCS3PmOGPPhOLeY37cwXI
 G9xxzOMncvbpVeY3U8ar2V0YzBCxHYbbBBlsyVHsBp8P53Bepc9jFYe7gFDN0VkSXKIjBq
 +KOlFLcKCk8RWg7Ta2mLlEZ020m/gGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-6Xqz1dZPPAq_v7amQvC08w-1; Mon, 26 Apr 2021 08:23:27 -0400
X-MC-Unique: 6Xqz1dZPPAq_v7amQvC08w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 428C51008061;
 Mon, 26 Apr 2021 12:23:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03EF262464;
 Mon, 26 Apr 2021 12:23:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6D3FB113525D; Mon, 26 Apr 2021 14:23:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 03/11] block/block-gen.h: bind monitor
References: <20210423214033.474034-1-vsementsov@virtuozzo.com>
 <20210423214033.474034-4-vsementsov@virtuozzo.com>
 <87mttob6ic.fsf@dusky.pond.sub.org>
 <e5025132-fa28-a29e-7575-ab26bcf62e7c@virtuozzo.com>
Date: Mon, 26 Apr 2021 14:23:24 +0200
In-Reply-To: <e5025132-fa28-a29e-7575-ab26bcf62e7c@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 26 Apr 2021 12:12:03 +0300")
Message-ID: <87lf95b5fn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, crosa@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 24.04.2021 08:23, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>> 
>>> If we have current monitor, let's bind it to wrapper coroutine too.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   block/block-gen.h | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/block/block-gen.h b/block/block-gen.h
>>> index c1fd3f40de..61f055a8cc 100644
>>> --- a/block/block-gen.h
>>> +++ b/block/block-gen.h
>>> @@ -27,6 +27,7 @@
>>>   #define BLOCK_BLOCK_GEN_H
>>>   
>>>   #include "block/block_int.h"
>>> +#include "monitor/monitor.h"
>>>   
>>>   /* Base structure for argument packing structures */
>>>   typedef struct AioPollCo {
>>> @@ -38,11 +39,20 @@ typedef struct AioPollCo {
>>>   
>>>   static inline int aio_poll_co(AioPollCo *s)
>>>   {
>>> +    Monitor *mon = monitor_cur();
>> 
>> This gets the currently executing coroutine's monitor from the hash
>> table.
>> 
>>>       assert(!qemu_in_coroutine());
>>>   
>>> +    if (mon) {
>>> +        monitor_set_cur(s->co, mon);
>> 
>> This writes it back.  No-op, since the coroutine hasn't changed.  Why?
>
> No. s->co != qemu_corotuine_current(), so it's not a write back, but creating a new entry in the hash map. s->co is a new coroutine which we are going to start.

Ah, that's what I missed.  Thanks!

[...]


