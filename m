Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CABF43DA66
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:32:30 +0200 (CEST)
Received: from localhost ([::1]:56678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfx5Z-0003iM-Ce
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfx46-0002yT-6B
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:30:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfx43-0000HV-G0
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635395453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DWgnKO8XQNdqYD5kfulurHIYAvwQFg9vtHlA84pPUsA=;
 b=PTOstugaO9zwf1I3v2XY4aeRfGCI7ReiQfIb2v/e3LC2khB9POlNiJY701UqAYDm4Stxx/
 5/8edTFUUw5KvzwLGQWcrJVD+C6vuLCUDcX6FbkFX7AeY8D9gKU0kELE7vEHe6T15NYAH+
 i7trB04lYn1sMwgFBIEo1RzhFN4nM0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-KF0_ZwNSMmamNjE2YNQEdA-1; Thu, 28 Oct 2021 00:30:50 -0400
X-MC-Unique: KF0_ZwNSMmamNjE2YNQEdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D81431006AA3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 04:30:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0C8360CA1;
 Thu, 28 Oct 2021 04:30:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 758C811380A7; Thu, 28 Oct 2021 06:30:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
 <20211011193156.biedorxjetduaf7y@redhat.com>
 <CAJ6HWG5neqLVdO_o+uzykOj3S-N5T0XUHv1_7Qo37_pw0eP_ZQ@mail.gmail.com>
 <87sfx6g55m.fsf@dusky.pond.sub.org>
 <CAJ6HWG6a5zDR49LQa3iRKLPVWo7toEOgJugsx3oV1c++pT4rhw@mail.gmail.com>
Date: Thu, 28 Oct 2021 06:30:33 +0200
In-Reply-To: <CAJ6HWG6a5zDR49LQa3iRKLPVWo7toEOgJugsx3oV1c++pT4rhw@mail.gmail.com>
 (Leonardo Bras Soares Passos's message of "Wed, 27 Oct 2021 22:56:51
 -0300")
Message-ID: <87sfwl3h5i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras Soares Passos <leobras@redhat.com> writes:

[...]

>> The general argument for having QAPI schema 'if' mirror the C
>> implementation's #if is introspection.  Let me explain why that matters.
>>
>> Consider a management application that supports a range of QEMU
>> versions, say 5.0 to 6.2.  Say it wants to use an QMP command that is
>> new in QEMU 6.2.  The sane way to do that is to probe for the command
>> with query-qmp-schema.  Same for command arguments, and anything else
>> QMP.
>>
>> If you doubt "sane", check out Part II of "QEMU interface introspection:
>> From hacks to solutions"[*].
>>
>> The same technique works when a QMP command / argument / whatever is
>> compile-time conditional ('if' in the schema).  The code the management
>> application needs anyway to deal with older QEMU now also deals with
>> "compiled out".  Nice.
>>
>> Of course, a command or argument present in QEMU can still fail, and the
>> management application still needs to handle failure.  Distinguishing
>> different failure modes can be bothersome and/or fragile.
>>
>> By making the QAPI schema conditional mirror the C conditional, you
>> squash the failure mode "this version of QEMU supports it, but this
>> build of QEMU does not" into "this version of QEMU does not support
>> it".  Makes sense, doesn't it?
>>
>> A minor additional advantage is less generated code.
>>
>>
>>
>> [*] http://events17.linuxfoundation.org/sites/events/files/slides/armbru-qemu-introspection.pdf
>>
>
> This was very informative, thanks!
> I now understand the rationale about this choice.
>
> TBH I am not very used to this syntax.
> I did a take a peek at some other json files, and ended adding this
> lines in code, which compiled just fine:
>
> for : enum MigrationParameter
> {'name': 'multifd-zerocopy', 'if' : 'CONFIG_LINUX'},
>
> for : struct MigrateSetParameters and struct MigrationParameters:
> '*multifd-zerocopy': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
>
> Is that enough? Is there any other necessary change?

Looks good to me.

The QAPI schema language is documented in docs/devel/qapi-code-gen.rst.

If you're curious, you can diff code generated into qapi/ before and
after adding the 'if'.

> Thanks for reviewing and for helping out with this!

My pleasure!


