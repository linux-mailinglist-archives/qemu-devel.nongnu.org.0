Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CB940449B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 06:49:23 +0200 (CEST)
Received: from localhost ([::1]:49702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOC02-0000Dr-NR
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 00:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOBzF-00080n-1y
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 00:48:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOBzB-0000sw-Rc
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 00:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631162907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SkBBn2XTMZ1fZJn0W9M0tshxpbn/3w7FS/u/iXHyDOg=;
 b=fVvbEgOrTTYc3RwStzoveoV4YPCo75s5sKuSRllUOy+EXOOmoRGIbZjo1vX6sMzBR3GXwy
 yFGxQ3TgkaNA9B4Fsska8xLtD7NM3oQhVveM5u6yBK3nZuVWZUIsi06XE7HQb8wHRd2FML
 xN/AZ/dFUFcr4lsB8CCop0HdPBU3Rms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-W3JFwvQONk-oRozhw_yDXg-1; Thu, 09 Sep 2021 00:48:24 -0400
X-MC-Unique: W3JFwvQONk-oRozhw_yDXg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E655801A92;
 Thu,  9 Sep 2021 04:48:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 162685C1D0;
 Thu,  9 Sep 2021 04:48:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A08521138606; Thu,  9 Sep 2021 06:48:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/5] Stop adding HMP-only commands, allow QMP for all
References: <20210908103711.683940-1-berrange@redhat.com>
 <875yvbrtnq.fsf@dusky.pond.sub.org> <YTjVuEg+wlKPHkAi@redhat.com>
Date: Thu, 09 Sep 2021 06:48:21 +0200
In-Reply-To: <YTjVuEg+wlKPHkAi@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 8 Sep 2021 16:24:40 +0100")
Message-ID: <87lf46pd62.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Sep 08, 2021 at 05:09:13PM +0200, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > We are still adding HMP commands without any QMP counterparts. This is
>> > done because there are a reasonable number of scenarios where the cost
>> > of designing a QAPI data type for the command is not justified.
>> >
>> > This has the downside, however, that we will never be able to fully
>> > isolate the monitor code from the remainder of QEMU internals. It is
>> > desirable to be able to get to a point where subsystems in QEMU are
>> > exclusively implemented using QAPI types and never need to have any
>> > knowledge of the monitor APIs.
>> >
>> > The way to get there is to stop adding commands to HMP only. All
>> > commands must be implemented using QMP, and any HMP implementation
>> > be a shim around the QMP implementation.
>> >
>> > We don't want to compromise our supportability of QMP long term though=
.
>> >
>> > This series proposes that we relax our requirements around fine graine=
d
>> > QAPI data design,
>>=20
>> Specifics?  QMP command returns a string, HMP wrapper prints that
>> string?
>
> yes, a command returning a single opaque printf formatted string would
> be the common case.  At a more general POV though, the JSON doc received
> by the client should be usable "as received", immediately after JSON
> de-serialization without needing any further custom parsing on top.
>
> ie if a value needs to be parsed by the client, then it must be split
> into multiple distinct values in the QAPI data type design to remove
> the need for parsing by the client.=20

Yes, that's QMP doctrine.

> If a command's design violates that, then it must remain under the
> "x-" prefix.  "info registers" is a example because we're printf
> formatting each register value into a opaque string. Any client
> needing a specific register value would have to scanf parse this
> string. The justification for not representing each register as
> a distinct QAPI field is that we don't think machines genuinely
> need to parse this, as its just adhoc human operator debug info.
> So we take the easy option and just printf to a string and put
> it under "x-" prefix

Got it.

Limitations:

1. If we convert a long-running HMP command to this technique, we print
   its output only after it completed its work.  We also end up with a
   long-running QMP command, which is bad, because it stops the main
   loop and makes the QMP monitor unresponsive (except for OOB commands,
   if the client is careful).  The former can be mitigated with
   'coroutine': true.  The latter can't.

2. We can't prompt for input.

   The only current use I can see is HMP "change vnc passwd" prompting
   for a password.  Except you currently have to say "change vnc passwd
   wtf" to get it to prompt (suspect logic error in commit cfb5387a1de).


[...]


