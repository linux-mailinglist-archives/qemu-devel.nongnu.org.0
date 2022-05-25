Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14927533EEF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 16:16:50 +0200 (CEST)
Received: from localhost ([::1]:37008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntrod-0007zI-Gt
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 10:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ntrj8-00050O-KV
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:11:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ntrj4-0008MG-6M
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653487861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oi3TzchLfFwyNny1KDLiYwpkiPORSk4Ogibx0pwucwk=;
 b=C5W6LRkrlvzU2nn3owaG3C7yz6t4FGBP4z1jRyN1nJpSWCSxib35Qugpw91d51iwhhfUCx
 jB/QI6S/Evv/sEWLkOERh3s85gDpGEMCj0RGpwT4xnUZl3BiUoTwiAm+PQOvDPxWqpz0qj
 qF7ynCAuMuxYG7kiqsvqZSRquOAFmcw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-FawCSAKkPQ6WgGXe7E0xxA-1; Wed, 25 May 2022 10:10:58 -0400
X-MC-Unique: FawCSAKkPQ6WgGXe7E0xxA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A034280159B
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 14:10:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 708972166B26;
 Wed, 25 May 2022 14:10:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3647A21E6906; Wed, 25 May 2022 16:10:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>,  Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>,  John Snow <jsnow@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <87lev9mw7j.fsf@pond.sub.org> <YnpbuzKo681VwDkn@redhat.com>
 <87r150dugw.fsf@pond.sub.org>
 <20220518085548.gri7ojvp5ezrstsj@tapioca>
 <87mtffm3ak.fsf@pond.sub.org>
 <CABJz62Oi4Yq3n8Mf4uikycD_BZrDhCj8zG1pFVNhv+N2-Q8naw@mail.gmail.com>
Date: Wed, 25 May 2022 16:10:57 +0200
In-Reply-To: <CABJz62Oi4Yq3n8Mf4uikycD_BZrDhCj8zG1pFVNhv+N2-Q8naw@mail.gmail.com>
 (Andrea Bolognani's message of "Wed, 25 May 2022 08:49:19 -0500")
Message-ID: <87r14hg0su.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Andrea Bolognani <abologna@redhat.com> writes:

> On Wed, May 18, 2022 at 02:30:11PM +0200, Markus Armbruster wrote:
>> Victor Toso <victortoso@redhat.com> writes:
>> > IMHO, at this moment, qapi-go is targeting communicating with
>> > QEMU and handling multiple QEMU versions seems reasonable to me.
>>
>> It's targeting communicating in *QMP*.  QMP is designed to support
>> communicating with a range of QEMU versions.  Full compatibility is
>> promised for a narrow range.  Outside that range, graceful degradation.
>>
>> *If* you want to widen the full compatibility range, do it in *QMP*.  Or
>> do it on top of QEMU, e.g. in libvirt.
>>
>> > Perhaps libvirt can use qapi-go in the future or other generated
>> > interface. That would be cool.
>>
>> "Would be cool" and a dollar buys you a cup of bad coffee.
>>
>> Is it a good use of our limited resources?
>>
>> How much will it delay delivery of Go bindings compared to less
>> ambitious version?
>
> Yeah, this thread has basically branched to cover three topics:
>
>   1. what an MVP Go interface for QMP should look like;
>   2. how to make sure said interface uses pretty names;
>   3. how to make it work across multiple QEMU versions.
>
> All of these are important in the long run, but as far as I'm
> concerned only 1. is an actual blocker to making progress.
>
> If we get to the point where we can generate a reasonably complete
> and well-typed Go interface that can be used to communicate with a
> single version of QEMU, we should just plaster EXPERIMENTAL all over
> it and get it merged.
>
> Basically get the MVP done and then iterate over it in-tree rather
> than trying to get everything perfect from the start.
>
> Sounds reasonable?

Yes, with an undogmatic interpretation of "minimally viable".  Doing
more should be okay when it doesn't complicate things outside the
Go-generating backend.

Exploring how to generate Go bindings that make good use of static
typing will be interesting enough.  Aiming for wide compatibility in
addition risks delay and/or failure.  Exploding heads, too.


