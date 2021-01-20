Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2382FD48A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:53:51 +0100 (CET)
Received: from localhost ([::1]:45808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Fnq-0005U2-IA
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l2FmG-0004VH-Ti
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:52:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l2Fm5-000222-9d
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611157919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=505LsQDDzLFOW8nq0nOoC2nN2JW6I6Bye+5gwcF8nQA=;
 b=JjimdlIqQY+uf3L1RLn6iIQoHHyOFj2l2EozfbCyGiiGSGFml2azoj8dnq8YAkqGJZDi8S
 nORIyQFBm7rG1IJ3AX0cdFkIehH5hyA8KSxrWx2i+IT0v5KHlzmi2sdoB0vjjxVRNe4HjQ
 GR9ZbJ7ybQpy2/q9lgoP/vOq8B8BIuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-0AZT6ZI8Pwin1WTWY4Pflw-1; Wed, 20 Jan 2021 10:51:47 -0500
X-MC-Unique: 0AZT6ZI8Pwin1WTWY4Pflw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D7E2514C
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 15:51:46 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 997485D6AD;
 Wed, 20 Jan 2021 15:51:41 +0000 (UTC)
Subject: Re: [PATCH v3 05/17] qapi: pass QAPISchemaModule to visit_module
 instead of str
To: Markus Armbruster <armbru@redhat.com>
References: <20210119180242.1570753-1-jsnow@redhat.com>
 <20210119180242.1570753-6-jsnow@redhat.com>
 <87eeifu805.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <049e81a7-c7d7-65af-129d-4d0993aff559@redhat.com>
Date: Wed, 20 Jan 2021 10:51:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87eeifu805.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 7:07 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Modify visit_module to pass the module itself instead of just its
>> name. This allows for future patches to centralize some
>> module-interrogation behavior within the QAPISchemaModule class itself,
>> cutting down on duplication between gen.py and schema.py.
> 
> We've been tempted to make similar changes before (don't worry, I'm not
> building a case for "no" here).
> 

It's fine: you'll probably notice later I don't go the full distance and 
rely on both object and class methods anyway, so this isn't strictly 
needed right now.

(It was not possible to go the full distance without heavier, more 
invasive changes, so...)

> When I wrote the initial version of QAPISchemaVisitor (commit 3f7dc21be,
> 2015), I aimed for a loose coupling of backends and the internal
> representation.  Instead of
> 
>      def visit_foo(self, foo):
>          pass
> 
> where @foo is a QAPISchemaFooBar, I wrote
> 
>      def visit_foo_bar(self, name, info, [curated attributes of @foo]):
>          pass
> 
> In theory, this is nice: the information exposed to the backends is
> obvious, and the backends can't accidentally mutate @foo.
> 
> In practice, it kind of failed right then and there:
> 
>      def visit_object_type(self, name, info, base, members, variants):
>          pass
> 
> We avoid passing the QAPISchemaObjectType (loose coupling, cool!), only
> to pass member information as List[QAPISchemaObjectTypeMember].
> 
> Morever, passing "curated atttibutes" has led to visit_commands() taking
> a dozen arguments.  Meh.
> 
> This had made Eric and me wonder whether we should write off the
> decoupling idea as misguided, and just pass the object instead of
> "curated attributes", always.  Thoughts?
> 

I'm not sure. Just taking the object would avoid a lot of duplicated 
interface typing, and type hints would allow editors to know what fields 
are available.

>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   docs/sphinx/qapidoc.py         |  8 ++++----
>>   scripts/qapi/gen.py            | 16 ++++++++++------
>>   scripts/qapi/schema.py         |  4 ++--
>>   tests/qapi-schema/test-qapi.py |  4 ++--
>>   4 files changed, 18 insertions(+), 14 deletions(-)
>>
>> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
>> index e03abcbb959..f754f675d66 100644
>> --- a/docs/sphinx/qapidoc.py
>> +++ b/docs/sphinx/qapidoc.py
>> @@ -463,11 +463,11 @@ def __init__(self, env, qapidir):
>>           self._env = env
>>           self._qapidir = qapidir
>>   
>> -    def visit_module(self, name):
>> -        if name is not None:
>> -            qapifile = self._qapidir + '/' + name
>> +    def visit_module(self, module):
>> +        if module.name:
> 
> Replacing the "is not None" test by (implicit) "is thruthy" changes
> behavior for the empty string.  Intentional?
> 

Instinctively it was intentional, consciously it wasn't. I was worried 
about what "qapifile" would produce if the string happened to be empty.

> I've had the "pleasure" of debugging empty strings getting interpreted
> like None where they should be interpreted like any other string.
> 

assert module.name, then?

>> +            qapifile = self._qapidir + '/' + module.name
>>               self._env.note_dependency(os.path.abspath(qapifile))
>> -        super().visit_module(name)
>> +        super().visit_module(module)
>>   
>>   
> [...]
> 


