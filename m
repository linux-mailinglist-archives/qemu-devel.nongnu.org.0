Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6FF43AE5F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 10:52:25 +0200 (CEST)
Received: from localhost ([::1]:57158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfIC1-0006tT-3l
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 04:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfI8O-0003Wm-6J
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:48:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfI8K-0004fx-JV
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635238116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Z4XImYDyDcvviYdBqdbtdKmDQDjBJjuagUUPZYvcKQ=;
 b=QHpmhBg6gUZtgocDUwRvVnj3H3atVdqhRbtTnPkVnZAZxe5eEk1SjG3Rkc3/LURYspPLmf
 L7FJIikXpWa3nLqy2KmgkEgRYlb5rHm/eWljlQJzDn6Mqr4rhdEDQsSBCyS7MoQyXs3OiF
 3qwUdJ3krxcFzL9y1+0iKgWbE043Iz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-_u_bsma4NpCyuAFX-Z7NTw-1; Tue, 26 Oct 2021 04:48:32 -0400
X-MC-Unique: _u_bsma4NpCyuAFX-Z7NTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C11FE1006AA6;
 Tue, 26 Oct 2021 08:48:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24AAD5DD68;
 Tue, 26 Oct 2021 08:48:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AC0E711380A7; Tue, 26 Oct 2021 10:48:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 4/9] qapi: Tools for sets of special feature flags in
 generated code
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-5-armbru@redhat.com>
 <CAFn=p-a41vWkiS_sCKjk_-DNt7=V741q0FntQXWZMAt3m76bBQ@mail.gmail.com>
Date: Tue, 26 Oct 2021 10:48:05 +0200
In-Reply-To: <CAFn=p-a41vWkiS_sCKjk_-DNt7=V741q0FntQXWZMAt3m76bBQ@mail.gmail.com>
 (John Snow's message of "Mon, 25 Oct 2021 15:21:43 -0400")
Message-ID: <87sfwo5fzu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Mon, Oct 25, 2021 at 1:25 AM Markus Armbruster <armbru@redhat.com> wrote:
>
>> New enum QapiSpecialFeature enumerates the special feature flags.
>>
>> New helper gen_special_features() returns code to represent a
>> collection of special feature flags as a bitset.
>>
>> The next few commits will put them to use.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  include/qapi/util.h    |  4 ++++
>>  scripts/qapi/gen.py    | 13 +++++++++++++
>>  scripts/qapi/schema.py |  3 +++
>>  3 files changed, 20 insertions(+)
>>
>> diff --git a/include/qapi/util.h b/include/qapi/util.h
>> index 257c600f99..7a8d5c7d72 100644
>> --- a/include/qapi/util.h
>> +++ b/include/qapi/util.h
>> @@ -11,6 +11,10 @@
>>  #ifndef QAPI_UTIL_H
>>  #define QAPI_UTIL_H
>>
>> +typedef enum {
>> +    QAPI_DEPRECATED,
>> +} QapiSpecialFeature;
>> +
>>  /* QEnumLookup flags */
>>  #define QAPI_ENUM_DEPRECATED 1
>>
>> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>> index 2ec1e7b3b6..9d07b88cf6 100644
>> --- a/scripts/qapi/gen.py
>> +++ b/scripts/qapi/gen.py
>> @@ -29,6 +29,7 @@
>>      mcgen,
>>  )
>>  from .schema import (
>> +    QAPISchemaFeature,
>>      QAPISchemaIfCond,
>>      QAPISchemaModule,
>>      QAPISchemaObjectType,
>> @@ -37,6 +38,18 @@
>>  from .source import QAPISourceInfo
>>
>>
>> +def gen_special_features(features: QAPISchemaFeature):
>> +    ret = ''
>> +    sep = ''
>> +
>> +    for feat in features:
>> +        if feat.is_special():
>> +            ret += ('%s1u << QAPI_%s' % (sep, feat.name.upper()))
>>
>
> Building the constant name here "feels" fragile, but I'll trust that the
> test suite and/or the compiler will catch us if we accidentally goof up
> this mapping. In the interest of simplicity, then, "sure, why not."

It relies on .is_special() remaining consistent with enum
QapiSpecialFeature.  The C compiler should catch any screwups.

>
>> +            sep = ' | '
>> +
>>
> +    return ret or '0'
>> +
>>
>
> Subjectively more pythonic:
>
> special_features = [f"1u << QAPI_{feat.name.upper()}" for feat in features
> if feat.is_special()]
> ret = ' | '.join(special_features)
> return ret or '0'
>
> A bit more dense, but more functional. Up to you, but I find join() easier
> to read and reason about for the presence of separators.

Sold!

>> +
>>  class QAPIGen:
>>      def __init__(self, fname: str):
>>          self.fname = fname
>> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>> index 6d5f46509a..55f82d7389 100644
>> --- a/scripts/qapi/schema.py
>> +++ b/scripts/qapi/schema.py
>> @@ -725,6 +725,9 @@ def connect_doc(self, doc):
>>  class QAPISchemaFeature(QAPISchemaMember):
>>      role = 'feature'
>>
>> +    def is_special(self):
>> +        return self.name in ('deprecated')
>> +
>>
>
> alrighty.
>
> (Briefly wondered: is it worth naming special features as a property of the
> class, but with only two names, it's probably fine enough to leave it
> embedded in the method logic. Only a style thing and doesn't have any
> actual impact that I can imagine, so ... nevermind.)

Let's keep it simple.

>>  class QAPISchemaObjectTypeMember(QAPISchemaMember):
>>      def __init__(self, name, info, typ, optional, ifcond=None,
>> features=None):
>> --
>> 2.31.1
>>
>>
> Well, either way:
>
> Reviewed-by: John Snow <jsnow@redhat.com>

Thanks!


