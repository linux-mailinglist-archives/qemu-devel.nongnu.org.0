Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8135943AF58
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 11:45:03 +0200 (CEST)
Received: from localhost ([::1]:53042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJ0w-00026Y-L2
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 05:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfIzk-0001Ii-In
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:43:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfIzi-0006xX-N1
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635241426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/gHJfaSdagVVxcmgBcTCu1a13bOTtxNQCiZy6vmwEjg=;
 b=Z8Nr6xmVkezfNaXqpW6FGQjcHpbE9p+YTMsoZgvpk9Ikly13hMwg9017gP94UacAM6f+kF
 dLCSUOuAFlLRmxQQO8D5kXnyViCSZAA4uiQ1BDID403owGWzOIBKYoZSpUm7hWysamwJOy
 Ye3yf6z7p2qbZ4VuGYof67t0VuNaUfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-9yP_SjkfNx6My3vdZpdvsw-1; Tue, 26 Oct 2021 05:43:42 -0400
X-MC-Unique: 9yP_SjkfNx6My3vdZpdvsw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEAA419067E1;
 Tue, 26 Oct 2021 09:43:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5683E5C1A1;
 Tue, 26 Oct 2021 09:43:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DE3B811380A7; Tue, 26 Oct 2021 11:43:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 7/9] qapi: Generalize enum member policy checking
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-8-armbru@redhat.com>
 <CAFn=p-aCMCzDoA_Q54j85Lz=TEnLEVn-h-YeHS0EtWdA12fRDw@mail.gmail.com>
Date: Tue, 26 Oct 2021 11:43:29 +0200
In-Reply-To: <CAFn=p-aCMCzDoA_Q54j85Lz=TEnLEVn-h-YeHS0EtWdA12fRDw@mail.gmail.com>
 (John Snow's message of "Mon, 25 Oct 2021 15:36:31 -0400")
Message-ID: <87ilxk3yv2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

> On Mon, Oct 25, 2021 at 1:26 AM Markus Armbruster <armbru@redhat.com> wrote:
>
>> The code to check enumeration value policy can see special feature
>> flag 'deprecated' in QEnumLookup member flags[value].  I want to make
>> feature flag 'unstable' visible there as well, so I can add policy for
>> it.
>>
>> Instead of extending flags[], replace it by @special_features (a
>> bitset of QapiSpecialFeature), because that's how special features get
>> passed around elsewhere.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  include/qapi/util.h    |  5 +----
>>  qapi/qapi-visit-core.c |  3 ++-
>>  scripts/qapi/types.py  | 22 ++++++++++++----------
>>  3 files changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/include/qapi/util.h b/include/qapi/util.h
>> index 7a8d5c7d72..0cc98db9f9 100644
>> --- a/include/qapi/util.h
>> +++ b/include/qapi/util.h
>> @@ -15,12 +15,9 @@ typedef enum {
>>      QAPI_DEPRECATED,
>>  } QapiSpecialFeature;
>>
>> -/* QEnumLookup flags */
>> -#define QAPI_ENUM_DEPRECATED 1
>> -
>>  typedef struct QEnumLookup {
>>      const char *const *array;
>> -    const unsigned char *const flags;
>> +    const unsigned char *const special_features;
>>      const int size;
>>  } QEnumLookup;
>>
>> diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
>> index b4a81f1757..5572d90efb 100644
>> --- a/qapi/qapi-visit-core.c
>> +++ b/qapi/qapi-visit-core.c
>> @@ -407,7 +407,8 @@ static bool input_type_enum(Visitor *v, const char
>> *name, int *obj,
>>          return false;
>>      }
>>
>> -    if (lookup->flags && (lookup->flags[value] & QAPI_ENUM_DEPRECATED)) {
>> +    if (lookup->special_features
>> +        && (lookup->special_features[value] & QAPI_DEPRECATED)) {
>>          switch (v->compat_policy.deprecated_input) {
>>          case COMPAT_POLICY_INPUT_ACCEPT:
>>              break;
>> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
>> index ab2441adc9..3013329c24 100644
>> --- a/scripts/qapi/types.py
>> +++ b/scripts/qapi/types.py
>> @@ -16,7 +16,7 @@
>>  from typing import List, Optional
>>
>>  from .common import c_enum_const, c_name, mcgen
>> -from .gen import QAPISchemaModularCVisitor, ifcontext
>> +from .gen import QAPISchemaModularCVisitor, gen_special_features,
>> ifcontext
>>  from .schema import (
>>      QAPISchema,
>>      QAPISchemaEnumMember,
>> @@ -39,7 +39,7 @@ def gen_enum_lookup(name: str,
>>                      members: List[QAPISchemaEnumMember],
>>                      prefix: Optional[str] = None) -> str:
>>      max_index = c_enum_const(name, '_MAX', prefix)
>> -    flags = ''
>> +    feats = ''
>>      ret = mcgen('''
>>
>>  const QEnumLookup %(c_name)s_lookup = {
>> @@ -54,19 +54,21 @@ def gen_enum_lookup(name: str,
>>  ''',
>>                       index=index, name=memb.name)
>>          ret += memb.ifcond.gen_endif()
>> -        if 'deprecated' in (f.name for f in memb.features):
>> -            flags += mcgen('''
>> -        [%(index)s] = QAPI_ENUM_DEPRECATED,
>> -''',
>> -                           index=index)
>>
>> -    if flags:
>> +        special_features = gen_special_features(memb.features)
>> +        if special_features != '0':
>>
>
> Though, I have to admit the common reoccurrence of this pattern suggests to
> me that gen_special_features really ought to be returning something false-y
> in these cases. Something about testing for the empty case with something
> that represents, but isn't empty, gives me a brief pause.
>
> Not willing to wage war over it.

I habitually start stupid, and when stupid confuses or annoys me later,
I smarten it up some.

Let's see how this instance of "stupid" ages, okay?

>> +            feats += mcgen('''
>> +        [%(index)s] = %(special_features)s,
>> +''',
>> +                           index=index, special_features=special_features)
>> +
>> +    if feats:
>>          ret += mcgen('''
>>      },
>> -    .flags = (const unsigned char[%(max_index)s]) {
>> +    .special_features = (const unsigned char[%(max_index)s]) {
>>  ''',
>>                       max_index=max_index)
>> -        ret += flags
>> +        ret += feats
>>
>>      ret += mcgen('''
>>      },
>> --
>> 2.31.1
>>
>>
> Python bits: Acked-by: John Snow <jsnow@redhat.com>

Thanks!


