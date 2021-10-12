Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51993429D64
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 07:55:54 +0200 (CEST)
Received: from localhost ([::1]:53480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maAlV-0001bc-E2
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 01:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maAjs-0000vY-SF
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 01:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maAjq-0007kz-1k
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 01:54:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634018048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6umyIMdJqohtjNf7VOELtSPkHW4hamoAx5h2m95zzbc=;
 b=J6og/bn4WAfWU2PQuE4qERKwo9+91AsnjBxUuthQfqa9l5aHvsjEPVYi/T5Bg6q1jUOEog
 NToasbN5TypglCJddO9zp0/Cfx+OezA4qsRxcDM5Gb+AhggWLLjkO2awNisJRcho+KUQAy
 +2XKFpDcWBQH29zTLLPgzhftixj6YMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-5NsdqLHKND2C4yEdlFHitA-1; Tue, 12 Oct 2021 01:54:01 -0400
X-MC-Unique: 5NsdqLHKND2C4yEdlFHitA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2E511005E53
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 05:54:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DED6D60853;
 Tue, 12 Oct 2021 05:53:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 51FE6113865F; Tue, 12 Oct 2021 07:53:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
 <20211011193156.biedorxjetduaf7y@redhat.com>
 <CAJ6HWG5neqLVdO_o+uzykOj3S-N5T0XUHv1_7Qo37_pw0eP_ZQ@mail.gmail.com>
Date: Tue, 12 Oct 2021 07:53:41 +0200
In-Reply-To: <CAJ6HWG5neqLVdO_o+uzykOj3S-N5T0XUHv1_7Qo37_pw0eP_ZQ@mail.gmail.com>
 (Leonardo Bras Soares Passos's message of "Mon, 11 Oct 2021 16:56:22
 -0300")
Message-ID: <87sfx6g55m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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

> Hello Eric,
>
> On Mon, Oct 11, 2021 at 4:32 PM Eric Blake <eblake@redhat.com> wrote:
>>
>> On Sat, Oct 09, 2021 at 04:56:13AM -0300, Leonardo Bras wrote:
>> > Implement zerocopy on nocomp_send_write(), by making use of QIOChannel
>> > zerocopy interface.
>> >
>> > Change multifd_send_sync_main() so it can distinguish the last sync from
>> > the setup and per-iteration ones, so a flush_zerocopy() can be called
>> > at the last sync in order to make sure all RAM is sent before finishing
>> > the migration.
>> >
>> > Also make it return -1 if flush_zerocopy() fails, in order to cancel
>> > the migration process, and avoid resuming the guest in the target host
>> > without receiving all current RAM.
>> >
>> > This will work fine on RAM migration because the RAM pages are not usually freed,
>> > and there is no problem on changing the pages content between async_send() and
>> > the actual sending of the buffer, because this change will dirty the page and
>> > cause it to be re-sent on a next iteration anyway.
>> >
>> > Given a lot of locked memory may be needed in order to use multid migration
>> > with zerocopy enabled, make it optional by creating a new parameter
>> > multifd-zerocopy on qapi, so low-privileged users can still perform multifd
>> > migrations.
>> >
>> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>> > ---
>> >  qapi/migration.json   | 18 ++++++++++++++++++
>> >  migration/migration.h |  1 +
>> >  migration/multifd.h   |  2 +-
>> >  migration/migration.c | 20 ++++++++++++++++++++
>> >  migration/multifd.c   | 33 ++++++++++++++++++++++++++++-----
>> >  migration/ram.c       | 20 +++++++++++++-------
>> >  monitor/hmp-cmds.c    |  4 ++++
>> >  7 files changed, 85 insertions(+), 13 deletions(-)
>> >
>> > diff --git a/qapi/migration.json b/qapi/migration.json
>> > index 88f07baedd..c4890cbb54 100644
>> > --- a/qapi/migration.json
>> > +++ b/qapi/migration.json
>> > @@ -724,6 +724,11 @@
>> >  #                      will consume more CPU.
>> >  #                      Defaults to 1. (Since 5.0)
>> >  #
>> > +# @multifd-zerocopy: Controls behavior on sending memory pages on multifd migration.
>> > +#                    When true, enables a zerocopy mechanism for sending memory
>> > +#                    pages, if host does support it.
>>
>> s/does support/supports/ (several instances this patch)
>
> I will make sure to fix that in v5.
>
>>
>> > +#                    Defaults to false. (Since 6.2)
>> > +#
>> >  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
>> >  #                        aliases for the purpose of dirty bitmap migration.  Such
>> >  #                        aliases may for example be the corresponding names on the
>> > @@ -758,6 +763,7 @@
>> >             'xbzrle-cache-size', 'max-postcopy-bandwidth',
>> >             'max-cpu-throttle', 'multifd-compression',
>> >             'multifd-zlib-level' ,'multifd-zstd-level',
>> > +        'multifd-zerocopy',
>> >             'block-bitmap-mapping' ] }
>>
>> Should this feature be guarded with 'if':'CONFIG_LINUX', since that's
>> the only platform where you even compile the code (even then, it can
>> still fail if the kernel doesn't support it).
>
> I think it makes sense for the feature to always be available, even
> though it's not supported
> outside linux > v4.14.
>
> IMHO it makes more sense for the user to get an error when it starts
> migration, due to host
> not supporting zerocopy, than the error happening in the config step,
> which may cause the user
> to question if it was the right parameter.
>
> The config message error here could also be ignored, and users can
> think zerocopy is working, while it's not.
>
> For automated migrations, this feature should never be enabled  for
> non-linux / older linux hosts anyway.
>
> Is there a good argument I am missing for this feature being disabled
> on non-linux?

The general argument for having QAPI schema 'if' mirror the C
implementation's #if is introspection.  Let me explain why that matters.

Consider a management application that supports a range of QEMU
versions, say 5.0 to 6.2.  Say it wants to use an QMP command that is
new in QEMU 6.2.  The sane way to do that is to probe for the command
with query-qmp-schema.  Same for command arguments, and anything else
QMP.

If you doubt "sane", check out Part II of "QEMU interface introspection:
From hacks to solutions"[*].

The same technique works when a QMP command / argument / whatever is
compile-time conditional ('if' in the schema).  The code the management
application needs anyway to deal with older QEMU now also deals with
"compiled out".  Nice.

Of course, a command or argument present in QEMU can still fail, and the
management application still needs to handle failure.  Distinguishing
different failure modes can be bothersome and/or fragile.

By making the QAPI schema conditional mirror the C conditional, you
squash the failure mode "this version of QEMU supports it, but this
build of QEMU does not" into "this version of QEMU does not support
it".  Makes sense, doesn't it?

A minor additional advantage is less generated code.



[*] http://events17.linuxfoundation.org/sites/events/files/slides/armbru-qemu-introspection.pdf


