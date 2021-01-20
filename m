Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCCB2FCF47
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 13:10:44 +0100 (CET)
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2CJv-0000f7-Ke
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 07:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2CGx-0007h3-Gu
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:07:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2CGv-0001Dw-QY
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611144457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=diqyY55ic4H1XgECqfPQDI7Y6KLCzVaE20+I9/nqzUk=;
 b=ZhW5ckG+JcDAvep3VEdhJmAwvoE+Xbf5kigzvcwHVOfY/eybl3ZklTVlG9dfWD/rQwqnCz
 MQhFWap7RwCu3K4nC6YGrOHGa/Utqk2o7ACp2SJ53iF3Aivln0hCsCyngQ5e4AOO9dnVRU
 tLLDqJOgxAvnLHQavJDaRhFTiKFAiNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-xGofFR_2Mzq3eD-h2f80Lw-1; Wed, 20 Jan 2021 07:07:30 -0500
X-MC-Unique: xGofFR_2Mzq3eD-h2f80Lw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ACA7806662
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 12:07:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DC5519811;
 Wed, 20 Jan 2021 12:07:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D3648113865F; Wed, 20 Jan 2021 13:07:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 05/17] qapi: pass QAPISchemaModule to visit_module
 instead of str
References: <20210119180242.1570753-1-jsnow@redhat.com>
 <20210119180242.1570753-6-jsnow@redhat.com>
Date: Wed, 20 Jan 2021 13:07:22 +0100
In-Reply-To: <20210119180242.1570753-6-jsnow@redhat.com> (John Snow's message
 of "Tue, 19 Jan 2021 13:02:30 -0500")
Message-ID: <87eeifu805.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Modify visit_module to pass the module itself instead of just its
> name. This allows for future patches to centralize some
> module-interrogation behavior within the QAPISchemaModule class itself,
> cutting down on duplication between gen.py and schema.py.

We've been tempted to make similar changes before (don't worry, I'm not
building a case for "no" here).

When I wrote the initial version of QAPISchemaVisitor (commit 3f7dc21be,
2015), I aimed for a loose coupling of backends and the internal
representation.  Instead of

    def visit_foo(self, foo):
        pass

where @foo is a QAPISchemaFooBar, I wrote

    def visit_foo_bar(self, name, info, [curated attributes of @foo]):
        pass

In theory, this is nice: the information exposed to the backends is
obvious, and the backends can't accidentally mutate @foo.

In practice, it kind of failed right then and there:

    def visit_object_type(self, name, info, base, members, variants):
        pass

We avoid passing the QAPISchemaObjectType (loose coupling, cool!), only
to pass member information as List[QAPISchemaObjectTypeMember].

Morever, passing "curated atttibutes" has led to visit_commands() taking
a dozen arguments.  Meh.

This had made Eric and me wonder whether we should write off the
decoupling idea as misguided, and just pass the object instead of
"curated attributes", always.  Thoughts?

>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  docs/sphinx/qapidoc.py         |  8 ++++----
>  scripts/qapi/gen.py            | 16 ++++++++++------
>  scripts/qapi/schema.py         |  4 ++--
>  tests/qapi-schema/test-qapi.py |  4 ++--
>  4 files changed, 18 insertions(+), 14 deletions(-)
>
> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> index e03abcbb959..f754f675d66 100644
> --- a/docs/sphinx/qapidoc.py
> +++ b/docs/sphinx/qapidoc.py
> @@ -463,11 +463,11 @@ def __init__(self, env, qapidir):
>          self._env = env
>          self._qapidir = qapidir
>  
> -    def visit_module(self, name):
> -        if name is not None:
> -            qapifile = self._qapidir + '/' + name
> +    def visit_module(self, module):
> +        if module.name:

Replacing the "is not None" test by (implicit) "is thruthy" changes
behavior for the empty string.  Intentional?

I've had the "pleasure" of debugging empty strings getting interpreted
like None where they should be interpreted like any other string.

> +            qapifile = self._qapidir + '/' + module.name
>              self._env.note_dependency(os.path.abspath(qapifile))
> -        super().visit_module(name)
> +        super().visit_module(module)
>  
>  
[...]


