Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAA157A279
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:54:28 +0200 (CEST)
Received: from localhost ([::1]:34300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDocF-0007TW-Ij
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDoae-0005ba-Nx
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:52:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDoab-0005J3-2x
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:52:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658242363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HJyn5T0DNKNCDi53iAwVZVSlTkW4+8pSx7rDGSrSyN8=;
 b=YFcTwst0Jn5lYcGMqMINojdKUeLQGsDLs70BpQ0Bb6cZRNEVN59fOdg5ufT6J0BhoVjssz
 nS8C78wprunyMYvRoT0gfKh+aUtRUdIx9SWwIxXDoqd3rANnQbIsTQd3ONNdisbokJ2sdv
 59ZEKujG731XlhnSVmunI088OQWDhUk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-2O24xdwQPA-vAqUpzcbYZg-1; Tue, 19 Jul 2022 10:52:40 -0400
X-MC-Unique: 2O24xdwQPA-vAqUpzcbYZg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1BAD8039A1;
 Tue, 19 Jul 2022 14:52:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E86E2166B26;
 Tue, 19 Jul 2022 14:52:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 506C421E690D; Tue, 19 Jul 2022 16:52:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Juan Quintela <quintela@redhat.com>,  qemu-devel@nongnu.org,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Michael Roth <michael.roth@amd.com>,
 John Snow <jsnow@redhat.com>, Victor Toso <victortoso@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Subject: Re: [PULL 03/15] multifd: Make no compression operations into its
 own structure
References: <20200228092420.103757-1-quintela@redhat.com>
 <20200228092420.103757-4-quintela@redhat.com>
 <CAFEAcA9SqOgVWQpR5Z=_wLbrxxGOCqtKn2_0owPmtu4nb96XCQ@mail.gmail.com>
Date: Tue, 19 Jul 2022 16:52:38 +0200
In-Reply-To: <CAFEAcA9SqOgVWQpR5Z=_wLbrxxGOCqtKn2_0owPmtu4nb96XCQ@mail.gmail.com>
 (Peter Maydell's message of "Tue, 12 Apr 2022 20:04:11 +0100")
Message-ID: <87tu7dupc9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This fell through the cracks.  My apologies.

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 28 Feb 2020 at 09:26, Juan Quintela <quintela@redhat.com> wrote:
>>
>> It will be used later.
>>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>
>
> Hi; Coverity thinks there might be a buffer overrun here.
> It's probably wrong,

It is; details below.

>                      but it's not completely obvious why
> it can't happen, so an assert somewhere would help...
> (This is CID 1487239.)
>
>> +MultiFDCompression migrate_multifd_compression(void)
>> +{
>> +    MigrationState *s;
>> +
>> +    s = migrate_get_current();
>> +
>> +    return s->parameters.multifd_compression;
>
> This function returns an enum of type MultiFDCompression,
> whose (autogenerated from QAPI) definition is:
>
> typedef enum MultiFDCompression {
>     MULTIFD_COMPRESSION_NONE,
>     MULTIFD_COMPRESSION_ZLIB,
> #if defined(CONFIG_ZSTD)
>     MULTIFD_COMPRESSION_ZSTD,
> #endif /* defined(CONFIG_ZSTD) */
>     MULTIFD_COMPRESSION__MAX,
> } MultiFDCompression;
>

Generated from

    { 'enum': 'MultiFDCompression',
      'data': [ 'none', 'zlib',
                { 'name': 'zstd', 'if': 'CONFIG_ZSTD' } ] }

>> @@ -604,6 +745,7 @@ int multifd_save_setup(Error **errp)
>>      multifd_send_state->pages = multifd_pages_init(page_count);
>>      qemu_sem_init(&multifd_send_state->channels_ready, 0);
>>      atomic_set(&multifd_send_state->exiting, 0);
>> +    multifd_send_state->ops = multifd_ops[migrate_multifd_compression()];
>
> Here we take the result of the function and use it as an
> array index into multifd_ops, whose definition is
>  static MultiFDMethods *multifd_ops[MULTIFD_COMPRESSION__MAX] = { ... }
>
> Coverity doesn't see any reason why the return value from
> migrate_multifd_compression() can't be MULTIFD_COMPRESSION__MAX,
> so it complains that if it is then we are going to index off the
> end of the array.

Yes.

migrate_multifd_compression() returns
current_migration->parameters.multifd_compression.

.multifd_compression is zero-initialized to MULTIFD_COMPRESSION_NONE,
and modified only by qmp_migrate_set_parameters().

qmp_migrate_set_parameters() can be called on behalf of QMP command
migrate-set-parameters, and on behalf of HMP command
migrate_set_parameter.  In either case, the value is the result of
parsing a string with qapi_enum_parse(), via visit_type_enum() and
visit_type_MultiFDCompression() with an input visitor (qobject for QMP,
string for HMP).  Never assigns the enum's __MAX.

> An assert in migrate_multifd_compression() that the value being
> returned is within the expected range would probably placate it.

Yes.

> Alternatively, if the qapi type codegen didn't put the __MAX
> value as a possible value of the enum type then Coverity
> and probably also the compiler wouldn't consider it to be
> a possible value of this kind of variable. But that might
> have other awkward side-effects.

Yes.  Coding the __MAX as a member of the enum is easy to write and easy
to understand, but gets in the way in places.

We could do something like

    typedef enum MultiFDCompression {
        MULTIFD_COMPRESSION_NONE,
        MULTIFD_COMPRESSION_ZLIB,
    #if defined(CONFIG_ZSTD)
        MULTIFD_COMPRESSION_ZSTD,
    #endif /* defined(CONFIG_ZSTD) */
    } MultiFDCompression;

    #define MULTIFD_COMPRESSION__MAX ???

where ??? is 3 if defined(CONFIG_ZSTD), else 2.  The more conditionals,
the more awkward this gets.

The alternative is holes in the enum, like this:

    typedef enum MultiFDCompression {
        MULTIFD_COMPRESSION_NONE = 0,
        MULTIFD_COMPRESSION_ZLIB = 1,
    #if defined(CONFIG_ZSTD)
        MULTIFD_COMPRESSION_ZSTD = 2,
    #endif /* defined(CONFIG_ZSTD) */
    } MultiFDCompression;

    #define MULTIFD_COMPRESSION__MAX 3

Also puts holes into the lookup tables.

We'd need to review code to make sure we're not breaking "no holes"
assumptions.

Changing the __MAX from enum member to macro could conceivably break
something, too.  

The quick fix is an assertion.


