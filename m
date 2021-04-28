Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1927836D19D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 07:24:44 +0200 (CEST)
Received: from localhost ([::1]:34282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbcgk-0001RM-Ic
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 01:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbcfn-00011v-TM
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 01:23:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbcfl-00046t-7p
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 01:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619587419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BIs9GXYewQCttJA0BMPiIBe8us4lFbzHYPCIsiQq5M8=;
 b=gYlAwBdPH19TSV1JxP0DH5ZAmWYYw02r9u3UlySH+v1CpuuSQS3lxJ5SpShzZ9Omz+gDTB
 n/rGRGLPLDKK5j3vDzgJe8SinmBRkwys0YKkMuY+zkzY0Dl/KiGPIWetNP2UWrBAFOWwTO
 XtUaB1bcYwwjGypniKaHxgWcUnt4CZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-aOXkLw76NOq-3H3ZGzzbwQ-1; Wed, 28 Apr 2021 01:23:35 -0400
X-MC-Unique: aOXkLw76NOq-3H3ZGzzbwQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DE3D10054F6;
 Wed, 28 Apr 2021 05:23:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E68D61037E9D;
 Wed, 28 Apr 2021 05:23:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6002A113525D; Wed, 28 Apr 2021 07:23:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH RFC C0/2] support allocation-map for
 block-dirty-bitmap-merge
References: <20210427111126.84307-1-vsementsov@virtuozzo.com>
 <0b7abd2d-f601-4224-1261-f939623d7687@redhat.com>
Date: Wed, 28 Apr 2021 07:23:32 +0200
In-Reply-To: <0b7abd2d-f601-4224-1261-f939623d7687@redhat.com> (John Snow's
 message of "Tue, 27 Apr 2021 14:24:56 -0400")
Message-ID: <87h7jrq8x7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 pkrempa@redhat.com, nshirokovskiy@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 4/27/21 7:11 AM, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>> It's a simpler alternative for
>> "[PATCH v4 0/5] block: add block-dirty-bitmap-populate job"
>>    <20200902181831.2570048-1-eblake@redhat.com>
>>    https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg00978.html
>>    https://patchew.org/QEMU/20200902181831.2570048-1-eblake@redhat.com/
>> Since we have "coroutine: true" feature for qmp commands, I think,
>> maybe we can merge allocation status to bitmap without bothering with
>> new block-job?
>> It's an RFC:
>> 1. Main question: is it OK as a simple blocking command, even in a
>> coroutine mode. It's a lot simpler, and it can be simply used in a
>> transaction with other bitmap commands.
>> 
>
> Hm, possibly... I did not follow the discussion of coroutine QMP
> commands closely to know what the qualifying criteria to use them are.
>
> (Any wisdom for me here, Markus?)

From Kevin's cover letter:

    Some QMP command handlers can block the main loop for a relatively
    long time, for example because they perform some I/O.  This is quite
    nasty.  Allowing such handlers to run in a coroutine where they can
    yield (and therefore release the BQL) while waiting for an event
    such as I/O completion solves the problem.

Running in a coroutine is not a replacement for jobs.  Monitor commands
continue to run one after the other, even with multiple monitors.  All
this does is letting monitor commands yield.

Running in a coroutine is opt-in, because we're scared of command code
misbehaving in coroutine context[*].  To opt-in, add

    'coroutine': true

to the command's QAPI schema.

Misbehaving command code should be rare.  The trouble is finding it.  If
we had a better handle on that, we could make running in a coroutine
opt-out.  Watch out for nested event loops.  Test thoroughly.

Questions?

[...]

[*] Discussed at some length in patch review:

    Message-ID: <874kwnvgad.fsf@dusky.pond.sub.org>
    https://lists.nongnu.org/archive/html/qemu-devel/2020-01/msg05015.html


