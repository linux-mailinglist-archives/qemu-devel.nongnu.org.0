Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B65E43AEE0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 11:17:40 +0200 (CEST)
Received: from localhost ([::1]:54038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfIaQ-00083F-RY
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 05:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfIYx-0007E9-HI
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:16:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfIYs-0007gb-I7
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635239761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LzSMtGa2x5+i2tNVZ4I7gSJYZh31tjlJvuG0XJnY1Dg=;
 b=aP8baESiKMyz83XFAdNA8Wbbtbts7zNpY2jYLFeyqk3/1GsIH9oFxPUXejPJU6bLEsYE7z
 H+XBmrDgzTMgCIAuvwueTPXtS3BOpVugZS7VCSp84RaxSAaQh1Ne57g/TEZbtPQFJZhot/
 gkOZ09BJAuUSkPczAThKmTAlkEZtWPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-t_oxbZZYNFuQ5TtuNXT0pw-1; Tue, 26 Oct 2021 05:15:57 -0400
X-MC-Unique: t_oxbZZYNFuQ5TtuNXT0pw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFE4C1927800;
 Tue, 26 Oct 2021 09:15:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8680B1037F53;
 Tue, 26 Oct 2021 09:14:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 142F411380A7; Tue, 26 Oct 2021 11:14:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 5/9] qapi: Generalize struct member policy checking
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-6-armbru@redhat.com>
 <CAFn=p-a9w7Qn8kVK4AADKgj-c7ewhDRhvAHKKN-omwjiSstjSw@mail.gmail.com>
Date: Tue, 26 Oct 2021 11:14:49 +0200
In-Reply-To: <CAFn=p-a9w7Qn8kVK4AADKgj-c7ewhDRhvAHKKN-omwjiSstjSw@mail.gmail.com>
 (John Snow's message of "Mon, 25 Oct 2021 15:28:15 -0400")
Message-ID: <87mtmw5era.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
>> The generated visitor functions call visit_deprecated_accept() and
>> visit_deprecated() when visiting a struct member with special feature
>> flag 'deprecated'.  This makes the feature flag visible to the actual
>> visitors.  I want to make feature flag 'unstable' visible there as
>> well, so I can add policy for it.
>>
>> To let me make it visible, replace these functions by
>> visit_policy_reject() and visit_policy_skip(), which take the member's
>> special features as an argument.  Note that the new functions have the
>> opposite sense, i.e. the return value flips.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>

[...]

>> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
>> index 9d9196a143..e13bbe4292 100644
>> --- a/scripts/qapi/visit.py
>> +++ b/scripts/qapi/visit.py
>> @@ -21,7 +21,7 @@
>>      indent,
>>      mcgen,
>>  )
>> -from .gen import QAPISchemaModularCVisitor, ifcontext
>> +from .gen import QAPISchemaModularCVisitor, gen_special_features, ifcontext
>>  from .schema import (
>>      QAPISchema,
>>      QAPISchemaEnumMember,
>> @@ -76,7 +76,6 @@ def gen_visit_object_members(name: str,
>>                       c_type=base.c_name())
>>
>>      for memb in members:
>> -        deprecated = 'deprecated' in [f.name for f in memb.features]
>>          ret += memb.ifcond.gen_if()
>>          if memb.optional:
>>              ret += mcgen('''
>> @@ -84,14 +83,15 @@ def gen_visit_object_members(name: str,
>>  ''',
>>                           name=memb.name, c_name=c_name(memb.name))
>>              indent.increase()
>> -        if deprecated:
>> +        special_features = gen_special_features(memb.features)
>> +        if special_features != '0':
>>
>
> Would it be possible for gen_special_features to return something false-y
> instead of '0'? Do we actually *use* the '0' return anywhere other than to
> test it to see if we should include additional code?
>
> If you actually use the '0' anywhere: Go ahead and treat this as an ack. If
> you don't, can we clean this up?

gen_special_features() returns a string holding C code for a special
features bitset.  The empty bitset is 0.

The "natural" use is interpolating this value into C code.  Two
instances are visible below.

The use right here is for testing "have we got special features", so we
can skip generating code that is of no use when we don't have any.  It's
admittedly slightly unclean.

> (Sorry, I find the mcgen stuff hard to read in patch form and I am trying
> to give you a quick review instead of NO review.)

Any kind of review is appreciated :)

> --js
>
>
>>              ret += mcgen('''
>> -    if (!visit_deprecated_accept(v, "%(name)s", errp)) {
>> +    if (visit_policy_reject(v, "%(name)s", %(special_features)s, errp)) {
>>          return false;
>>      }
>> -    if (visit_deprecated(v, "%(name)s")) {
>> +    if (!visit_policy_skip(v, "%(name)s", %(special_features)s)) {
>>  ''',
>> -                         name=memb.name)
>> +                         name=memb.name, special_features=special_features)

These are the "natural" uses I mentioned.

If gen_special_features() returned something other than '0', we'd have
to replace it by '0' here.

>>              indent.increase()
>>          ret += mcgen('''
>>      if (!visit_type_%(c_type)s(v, "%(name)s", &obj->%(c_name)s, errp)) {
>> @@ -100,7 +100,7 @@ def gen_visit_object_members(name: str,
>>  ''',
>>                       c_type=memb.type.c_name(), name=memb.name,
>>                       c_name=c_name(memb.name))
>> -        if deprecated:
>> +        if special_features != '0':
>>              indent.decrease()
>>              ret += mcgen('''
>>      }
>> --
>> 2.31.1
>>
>>


