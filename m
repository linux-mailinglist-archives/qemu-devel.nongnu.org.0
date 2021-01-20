Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC372FD54C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:21:46 +0100 (CET)
Received: from localhost ([::1]:37088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2GEr-0001km-Ao
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l2G9n-0006hV-RE
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:16:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l2G9k-0002Up-7m
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:16:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611159387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=34smVqIpw+HJCbp9ql3wNTT0JdNjGsp1UqrQUwn3Lkk=;
 b=TSCwDrurTwfCcBLdyERJdK8gLhN5EoVoI9M5ljvvwvOGIx2rCcFyo3fEDyxVbjeKHaLqBG
 2QzPFOgVpRArzK7z2HsTZO976y36Ln/SE2/Ztx6dUnH+CI9vsxjIuXd/tDP93WdL+b9w16
 k2+ilcS4ks9qVopjMDlcVlkOrmnvtVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-tJPA6ew6MC29GmTR2FpwvA-1; Wed, 20 Jan 2021 11:16:25 -0500
X-MC-Unique: tJPA6ew6MC29GmTR2FpwvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B1D58066E6
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 16:16:24 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C47E5D6AD;
 Wed, 20 Jan 2021 16:16:20 +0000 (UTC)
Subject: Re: [PATCH v3 05/17] qapi: pass QAPISchemaModule to visit_module
 instead of str
To: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20210119180242.1570753-1-jsnow@redhat.com>
 <20210119180242.1570753-6-jsnow@redhat.com>
 <87eeifu805.fsf@dusky.pond.sub.org>
 <3e43fe6d-b718-af82-598e-e277f9104cbc@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <000bd3b7-1342-d26a-5cc9-3191efe0b0ec@redhat.com>
Date: Wed, 20 Jan 2021 11:16:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3e43fe6d-b718-af82-598e-e277f9104cbc@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 1/20/21 11:02 AM, Eric Blake wrote:
> On 1/20/21 6:07 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>>
>>> Modify visit_module to pass the module itself instead of just its
>>> name. This allows for future patches to centralize some
>>> module-interrogation behavior within the QAPISchemaModule class itself,
>>> cutting down on duplication between gen.py and schema.py.
>>
>> We've been tempted to make similar changes before (don't worry, I'm not
>> building a case for "no" here).
>>
>> When I wrote the initial version of QAPISchemaVisitor (commit 3f7dc21be,
>> 2015), I aimed for a loose coupling of backends and the internal
>> representation.  Instead of
>>
>>      def visit_foo(self, foo):
>>          pass
>>
>> where @foo is a QAPISchemaFooBar, I wrote
>>
>>      def visit_foo_bar(self, name, info, [curated attributes of @foo]):
>>          pass
>>
>> In theory, this is nice: the information exposed to the backends is
>> obvious, and the backends can't accidentally mutate @foo.
>>
>> In practice, it kind of failed right then and there:
>>
>>      def visit_object_type(self, name, info, base, members, variants):
>>          pass
>>
>> We avoid passing the QAPISchemaObjectType (loose coupling, cool!), only
>> to pass member information as List[QAPISchemaObjectTypeMember].
>>
>> Morever, passing "curated atttibutes" has led to visit_commands() taking
>> a dozen arguments.  Meh.
>>
>> This had made Eric and me wonder whether we should write off the
>> decoupling idea as misguided, and just pass the object instead of
>> "curated attributes", always.  Thoughts?
> 
> I'm open to the idea of passing just the larger object instead of the
> curated list of relevant attributes.  It's a bit more coupling, but I
> don't see any of our qapi code being reused outside its current scope
> where the extra coupling will bite us.  But I'm not volunteering for the
> refactoring work, because I'm not an expert on python typing hints.  If
> consolidating parameters into the larger object makes for fewer
> parameters and easier typing hints, I'm assuming the work can be done as
> part of static typing; but if leaving things as they currently are is
> manageable, that's also fine by me.
> 

Yeah, it can definitely be left as-is for now. I've already gone through 
all the effort of typing out all of the interfaces, so it's not really a 
huge ordeal to just leave it as-is.

Passing the objects might be nicer for the future, though, as routing 
new information or features will involve less churn. (And the signatures 
will be a lot smaller.)

I suppose it does open us up to callers mutating the schema in the 
visitors, but they could already do that for the reasons that Markus 
points out. It's possible that the visitor dispatch could be modified to 
make deep copies of schema objects, but that adds overhead.

I can just revert this change for now and leave the topic for another day.

--js


