Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7081222B0B8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 15:45:50 +0200 (CEST)
Received: from localhost ([::1]:41880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jybXh-0006Ou-93
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 09:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jybVK-0003zq-7D
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 09:43:22 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31247
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jybVI-00089x-KY
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 09:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595511799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQE2jGQZFNpB5RjHgXb0mNGiQVVxurEP+76v/holUzI=;
 b=h6HGO1gTxa6BRoaVP5JwENT2IIw+EshPj+uorSGZKf/f2TtFEL7ppvuT7YXS5v/kgtFXkR
 xDSGjTxIHdOGxmmmBFF12i2Ge069v0ff2toSWMr1OFFXsumEZ2MnchdPuuxS4E61vgu5Pk
 vXYaBJi0uu59GeMYU1pXhC8trgW0Wgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-2jfRJxRLOxGfxboXl-xEuQ-1; Thu, 23 Jul 2020 09:42:08 -0400
X-MC-Unique: 2jfRJxRLOxGfxboXl-xEuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03C798017FB;
 Thu, 23 Jul 2020 13:42:07 +0000 (UTC)
Received: from [10.3.112.189] (ovpn-112-189.phx2.redhat.com [10.3.112.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D6FA71D38;
 Thu, 23 Jul 2020 13:42:03 +0000 (UTC)
Subject: Re: [PATCH 3/4] error: Remove NULL checks on error_propagate() calls
 (again)
To: Markus Armbruster <armbru@redhat.com>
References: <20200722084048.1726105-1-armbru@redhat.com>
 <20200722084048.1726105-4-armbru@redhat.com>
 <5def3655-aa29-aef1-6683-b97b2faaa289@redhat.com>
 <87pn8moanx.fsf@dusky.pond.sub.org> <87eep2fj1f.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <38ee54d6-5de2-8816-f6b2-1924dcd0ab71@redhat.com>
Date: Thu, 23 Jul 2020 08:42:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87eep2fj1f.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 02:33:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/20 8:38 AM, Markus Armbruster wrote:

>>>> +++ b/migration/colo.c
>>>> @@ -798,9 +798,7 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
>>>>          colo_send_message(mis->to_src_file,
>>>> COLO_MESSAGE_VMSTATE_LOADED,
>>>>                     &local_err);
>>>> -    if (local_err) {
>>>> -        error_propagate(errp, local_err);
>>>> -    }
>>>> +    error_propagate(errp, local_err);
>>>>    }
>>>
>>> As this is mechanical, it is fine. But there is now a further cleanup
>>> possible of passing errp directly to colo_send_message, and possibly
>>> dropping local_err altogether.
>>
>> True.
>>
>> The patch is small and simple enough for squashing in further manual
>> cleanups.  I'd like to first check whether a followup patch created with
>> the machinery I used for eliminating error_propagate() comes out better.
> 
> Vladimir's scripts/coccinelle/errp-guard.cocci will take care of it.

Good to know.  Then I'm fine deferring those cleanups to the mechanical 
patches down the road, rather than a manual effort now.

> 
> Eliminating error propagation altogether would be even better, but it's
> also more work: several void functions need to return bool instead.

Correct, but also doesn't change the fact that this patch is ready to go 
regardless of how much further cleanup we plan on doing.

> 
>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>
>> Thanks!

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


