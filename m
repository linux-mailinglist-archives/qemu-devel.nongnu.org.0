Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFDB40234D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 08:17:12 +0200 (CEST)
Received: from localhost ([::1]:50924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNUPv-0004DO-M1
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 02:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNUNr-0002LQ-4H
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:15:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNUNn-0006WX-EJ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:15:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630995298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EAwV1E6T9D5eBJGPJZIWrPXexGBqvRgn/2pmc8vL/fg=;
 b=giwx55TfVi6YmImUEX3h0Xw5NLzG7J/QQ98plRghzmYqbOl5yP7lBFr57vaJGMxg59IBTp
 D8OebZ7/YHut8pT9rEEGFNd2PUDVRTGY8ZlGit5NeSmzjuZ/QOAPu3MqWnfyHzZm6/71Mh
 wlxNbFb/TgH8YqIkUTiENWp7kB/bK5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-yAY7k-YHNlmzDkViNfUT8g-1; Tue, 07 Sep 2021 02:14:56 -0400
X-MC-Unique: yAY7k-YHNlmzDkViNfUT8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F058A5184;
 Tue,  7 Sep 2021 06:14:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2728E5FC08;
 Tue,  7 Sep 2021 06:14:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9C2131138606; Tue,  7 Sep 2021 08:14:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 2/9] qapi: make blockdev-add a coroutine command
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
 <20210906190654.183421-3-vsementsov@virtuozzo.com>
 <87tuixa4gv.fsf@dusky.pond.sub.org>
 <7f9959e1-851d-b38a-c92c-ae42c340f29e@virtuozzo.com>
Date: Tue, 07 Sep 2021 08:14:52 +0200
In-Reply-To: <7f9959e1-851d-b38a-c92c-ae42c340f29e@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 7 Sep 2021 00:40:52 +0300")
Message-ID: <87v93c9ajn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 hreitz@redhat.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 06.09.2021 22:28, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>> 
>>> We are going to support nbd reconnect on open in a next commit. This
>>> means that we want to do several connection attempts during some time.
>>> And this should be done in a coroutine, otherwise we'll stuck.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   qapi/block-core.json | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>> index 06674c25c9..6e4042530a 100644
>>> --- a/qapi/block-core.json
>>> +++ b/qapi/block-core.json
>>> @@ -4219,7 +4219,8 @@
>>>   # <- { "return": {} }
>>>   #
>>>   ##
>>> -{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true }
>>> +{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true,
>>> +  'coroutine': true }
>>>   
>>>   ##
>>>   # @blockdev-reopen:
>> 
>> Why is this safe?
>> 
>> Prior discusson:
>> Message-ID: <87lfq0yp9v.fsf@dusky.pond.sub.org>
>> https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg04921.html
>> 
>
> Hmm.. I'm afraid, that I can't prove that it's safe. At least it will mean to audit .bdrv_open() of all block drivers.. And nothing prevents creating new incompatible drivers in future..

Breaking existing block drivers is more serious than adding new drivers
broken.

> On the other hand, looking at qmp_blockdev_add, bdrv_open() is the only thing of interest.
>
> And theoretically, bdrv_open() should work in coroutine context. We do call this function from coroutine_fn functions sometimes. So, maybe, if in some circumstances, bdrv_open() is not compatible with coroutine context, we can consider it as a bug? And fix it later, if it happen?

If it's already used in ways that require coroutine-compatibility, we'd
merely add another way for existing bugs to bite.  Kevin, is it?

In general, the less coroutine-incompatibility we have, the better.
From the thread I quoted:

    Kevin Wolf <kwolf@redhat.com> writes:

    > AM 22.01.2020 um 13:15 hat Markus Armbruster geschrieben:
    [...]
    >> Is coroutine-incompatible command handler code necessary or accidental?
    >> 
    >> By "necessary" I mean there are (and likely always will be) commands
    >> that need to do stuff that cannot or should not be done on coroutine
    >> context.
    >> 
    >> "Accidental" is the opposite: coroutine-incompatibility can be regarded
    >> as a fixable flaw.
    >
    > I expect it's mostly accidental, but maybe not all of it.

I'm inclinded to regard accidental coroutine-incompatibility as a bug.

As long as the command doesn't have the coroutine flag set, it's a
latent bug.

Setting the coroutine flag without auditing the code risks making such
latent bugs actual bugs.  A typical outcome is deadlock.

Whether we're willing to accept such risk is not for me to decide.

We weren't when we merged the coroutine work, at least not wholesale.
The risk is perhaps less scary for a single command.  On the other hand,
code audit is less daunting, too.

Kevin, what do you think?


