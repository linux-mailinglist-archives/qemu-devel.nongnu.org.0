Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF822426769
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 12:09:11 +0200 (CEST)
Received: from localhost ([::1]:58626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYmoQ-0001GB-4s
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 06:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mYmm2-00084a-Uh
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 06:06:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mYmly-00060x-Oc
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 06:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633687595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2t7tQEuibjRY7EG6c/9yPGFUvp1Z5Hh+lm2g7RUhPjM=;
 b=Jq5Y32+CdJgDN0nEgtQJtH73y+tUwVa/YiFE5LnKZYEc1PlH7cJ7MmThUDnwSwZSpewv1B
 bQNqK1xosT/R5pj5ayGRczqKzjg4BJ2S1yCdnTlQJ5OQQpF1mePeetUkPRU0aUxRR+Zq3f
 e6GJBjmA2Hi9p5apuVejiWUmECPuSGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-cP8TEcVIMbWomPXB4KKnXA-1; Fri, 08 Oct 2021 06:06:30 -0400
X-MC-Unique: cP8TEcVIMbWomPXB4KKnXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AA8610A8E01
 for <qemu-devel@nongnu.org>; Fri,  8 Oct 2021 10:06:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F7FD5D740;
 Fri,  8 Oct 2021 10:06:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D6203113865F; Fri,  8 Oct 2021 12:06:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: QAPI sync meeting
References: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
 <YVMeUbGdnsTpwSbD@redhat.com>
 <CAFn=p-ZG6SAVDz-cOtviekvMvibw+ukhYmSOqH7UTrcH-9fCNA@mail.gmail.com>
 <87ee97y3q5.fsf@dusky.pond.sub.org> <YV7Fh2DihM65rgnN@redhat.com>
 <3abc4e8e-5657-14bb-ba89-5b7669c01201@redhat.com>
Date: Fri, 08 Oct 2021 12:06:23 +0200
In-Reply-To: <3abc4e8e-5657-14bb-ba89-5b7669c01201@redhat.com> (Paolo
 Bonzini's message of "Thu, 7 Oct 2021 12:23:58 +0200")
Message-ID: <87bl3z96g0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr?= =?utf-8?Q?=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 07/10/21 12:01, Kevin Wolf wrote:
>>    * -chardev: I have patches that QAPIfy the option based on
>> aliases,
>>      getting rid of the old handwritten parser that is inconsistent with
>>      QMP in non-obvious ways and replacing it with translation to QMP
>>      (both using aliases and a little C code) that makes the differences
>>      obvious.
>>      First posted in November 2020, more details in the cover
>> letter:
>>      https://patchew.org/QEMU/20201112175905.404472-1-kwolf@redhat.com/
>>      Later versions (not yet posted as a series because I'm waiting
>> for
>>      aliases) also make -chardev accept JSON syntax, which is what
>>      libvirt really wants to use.
>
> I'm still not sure about this...  It's an awful lot of code if the
> aliases are only used by -chardev,

We might use them for replacing other ad hoc parsers.  We have a bunch,
but -chardev's one is perhaps the worst one.  Whether aliases could be
useful for replacing others is not yet clear.

I initially hoped that they could help us clean up QMP some, but further
(and sadly much later) thought led me to obstacles.

>                                    and I'd rather use
> -object/object-add for chardevs if that's at all possible.

How far are we from making -object the preferred machine-friendly
interface for creating character devices?


