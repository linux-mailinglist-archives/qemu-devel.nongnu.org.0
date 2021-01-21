Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9584B2FE3DA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 08:26:13 +0100 (CET)
Received: from localhost ([::1]:47606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2UM8-0006Px-Me
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 02:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2UJM-0005V6-SO
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 02:23:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2UJI-0004KJ-DA
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 02:23:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611213795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2pyfJmRilk6r9rm5lfCkAcrT5fNNZRRSyBTYqAnehU=;
 b=eUpQMLQn5mIhoATInvXBnMBrIOdVcSDz33jszJU4nOq7XJws3TgYLO5Y8W8/GMTt364jKZ
 ATmVmNOC0r2gPuXWKByUY2rg8p+hbVGTtwIEccX2CSEms0fapHDZULe4ijUkU1dED8W4xS
 QeuJ/9/Oa7wfgLPZ8nH4YnMvqt/d8J4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-q0KKZqOIPyajXO2uphiV0g-1; Thu, 21 Jan 2021 02:23:10 -0500
X-MC-Unique: q0KKZqOIPyajXO2uphiV0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CFB61800D41
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 07:23:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8382D5C8A7;
 Thu, 21 Jan 2021 07:23:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 18966113865F; Thu, 21 Jan 2021 08:23:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 05/17] qapi: pass QAPISchemaModule to visit_module
 instead of str
References: <20210119180242.1570753-1-jsnow@redhat.com>
 <20210119180242.1570753-6-jsnow@redhat.com>
 <87eeifu805.fsf@dusky.pond.sub.org>
 <3e43fe6d-b718-af82-598e-e277f9104cbc@redhat.com>
 <000bd3b7-1342-d26a-5cc9-3191efe0b0ec@redhat.com>
Date: Thu, 21 Jan 2021 08:23:05 +0100
In-Reply-To: <000bd3b7-1342-d26a-5cc9-3191efe0b0ec@redhat.com> (John Snow's
 message of "Wed, 20 Jan 2021 11:16:19 -0500")
Message-ID: <87ft2ulpnq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 1/20/21 11:02 AM, Eric Blake wrote:
>> On 1/20/21 6:07 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> Modify visit_module to pass the module itself instead of just its
>>>> name. This allows for future patches to centralize some
>>>> module-interrogation behavior within the QAPISchemaModule class itself,
>>>> cutting down on duplication between gen.py and schema.py.
>>>
>>> We've been tempted to make similar changes before (don't worry, I'm not
>>> building a case for "no" here).
>>>
>>> When I wrote the initial version of QAPISchemaVisitor (commit 3f7dc21be,
>>> 2015), I aimed for a loose coupling of backends and the internal
>>> representation.  Instead of
>>>
>>>      def visit_foo(self, foo):
>>>          pass
>>>
>>> where @foo is a QAPISchemaFooBar, I wrote
>>>
>>>      def visit_foo_bar(self, name, info, [curated attributes of @foo]):
>>>          pass
>>>
>>> In theory, this is nice: the information exposed to the backends is
>>> obvious, and the backends can't accidentally mutate @foo.
>>>
>>> In practice, it kind of failed right then and there:
>>>
>>>      def visit_object_type(self, name, info, base, members, variants):
>>>          pass
>>>
>>> We avoid passing the QAPISchemaObjectType (loose coupling, cool!), only
>>> to pass member information as List[QAPISchemaObjectTypeMember].
>>>
>>> Morever, passing "curated atttibutes" has led to visit_commands() taking
>>> a dozen arguments.  Meh.
>>>
>>> This had made Eric and me wonder whether we should write off the
>>> decoupling idea as misguided, and just pass the object instead of
>>> "curated attributes", always.  Thoughts?
>> I'm open to the idea of passing just the larger object instead of
>> the
>> curated list of relevant attributes.  It's a bit more coupling, but I
>> don't see any of our qapi code being reused outside its current scope
>> where the extra coupling will bite us.  But I'm not volunteering for the
>> refactoring work, because I'm not an expert on python typing hints.  If
>> consolidating parameters into the larger object makes for fewer
>> parameters and easier typing hints, I'm assuming the work can be done as
>> part of static typing; but if leaving things as they currently are is
>> manageable, that's also fine by me.
>> 
>
> Yeah, it can definitely be left as-is for now. I've already gone
> through all the effort of typing out all of the interfaces, so it's
> not really a huge ordeal to just leave it as-is.
>
> Passing the objects might be nicer for the future, though, as routing
> new information or features will involve less churn. (And the
> signatures will be a lot smaller.)
>
> I suppose it does open us up to callers mutating the schema in the
> visitors, but they could already do that for the reasons that Markus 
> points out. It's possible that the visitor dispatch could be modified
> to make deep copies of schema objects, but that adds overhead.
>
> I can just revert this change for now and leave the topic for another day.

Works for me.  Thanks!


