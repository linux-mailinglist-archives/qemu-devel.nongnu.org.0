Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEBD2FD4DB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:06:05 +0100 (CET)
Received: from localhost ([::1]:39230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Fzg-0006dZ-F0
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:06:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Fwp-0004Sg-5Y
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:03:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Fwm-0005md-RD
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611158584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7iR1FW5/gOGfAjBJNG12avOdSwQeE6siFdz/NyONr1Q=;
 b=e2qOw9CEWnPwQ9DbX2lStttpbQGoi0PxVXhK4SoeAGvk7yReggQQdunfVuBNXLLSlpi27E
 C2HCnkqSn7bo9wySZZew74dBRbO7o+yEsCa5J3a6ggoVZcGO5MLHZ0/nMHYimDlrZjHNNT
 m4Y++kDewEI3HuoakBCPMk3WZduiLHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-JzRoQpBDNSmYvtWpqETCBQ-1; Wed, 20 Jan 2021 11:03:00 -0500
X-MC-Unique: JzRoQpBDNSmYvtWpqETCBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA5DC107ACE4
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 16:02:59 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0D151724C;
 Wed, 20 Jan 2021 16:02:56 +0000 (UTC)
Subject: Re: [PATCH v3 05/17] qapi: pass QAPISchemaModule to visit_module
 instead of str
To: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
References: <20210119180242.1570753-1-jsnow@redhat.com>
 <20210119180242.1570753-6-jsnow@redhat.com>
 <87eeifu805.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3e43fe6d-b718-af82-598e-e277f9104cbc@redhat.com>
Date: Wed, 20 Jan 2021 10:02:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87eeifu805.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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

On 1/20/21 6:07 AM, Markus Armbruster wrote:
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
> When I wrote the initial version of QAPISchemaVisitor (commit 3f7dc21be,
> 2015), I aimed for a loose coupling of backends and the internal
> representation.  Instead of
> 
>     def visit_foo(self, foo):
>         pass
> 
> where @foo is a QAPISchemaFooBar, I wrote
> 
>     def visit_foo_bar(self, name, info, [curated attributes of @foo]):
>         pass
> 
> In theory, this is nice: the information exposed to the backends is
> obvious, and the backends can't accidentally mutate @foo.
> 
> In practice, it kind of failed right then and there:
> 
>     def visit_object_type(self, name, info, base, members, variants):
>         pass
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

I'm open to the idea of passing just the larger object instead of the
curated list of relevant attributes.  It's a bit more coupling, but I
don't see any of our qapi code being reused outside its current scope
where the extra coupling will bite us.  But I'm not volunteering for the
refactoring work, because I'm not an expert on python typing hints.  If
consolidating parameters into the larger object makes for fewer
parameters and easier typing hints, I'm assuming the work can be done as
part of static typing; but if leaving things as they currently are is
manageable, that's also fine by me.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


