Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4387838C62E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:04:31 +0200 (CEST)
Received: from localhost ([::1]:38516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk3tG-0008VJ-Bm
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk3rp-0007o5-SC
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk3rl-0005XK-DT
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621598576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4peoKRzzLkzhueCr1/iUFBKfqIGftesV6obWp/4WljI=;
 b=SDOcZMDdpZ/YZl33bb+hzwk0Nztpwf4EE8cNgG47tfunF3oJwpA8h84zrK7M2axyU9eVye
 yDwBiwv//zc1jA5bwUaLeUKDT4AnhRBFMrAJpCyRgXNU0vpfp0rUsyMj78NaYNuhe2UCNf
 QhR4NzvrhwFFPXOAOsF6Zj5hNOjiGpo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-xbmHfMcfOWq6W-860NJbMA-1; Fri, 21 May 2021 08:02:54 -0400
X-MC-Unique: xbmHfMcfOWq6W-860NJbMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 007061927803
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 12:02:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C34C56062C;
 Fri, 21 May 2021 12:02:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5FAB3113865F; Fri, 21 May 2021 14:02:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v4 8/9] qapi: make 'if' condition strings simple
 identifiers
References: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
 <20210517163040.2308926-9-marcandre.lureau@redhat.com>
Date: Fri, 21 May 2021 14:02:52 +0200
In-Reply-To: <20210517163040.2308926-9-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Mon, 17 May 2021 20:30:39 +0400")
Message-ID: <871ra05m6r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Change the 'if' condition strings to be C-agnostic and be simple
> identifiers.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Tested-by: John Snow <jsnow@redhat.com>
> ---

[...]

> diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
> index c1cb6f987d..edaaf7ec40 100644
> --- a/docs/devel/qapi-code-gen.txt
> +++ b/docs/devel/qapi-code-gen.txt
> @@ -791,7 +791,7 @@ will then be guarded by #if STRING for each STRING in=
 the COND list.
>  Example: a conditional struct
> =20
>   { 'struct': 'IfStruct', 'data': { 'foo': 'int' },
> -   'if': ['defined(CONFIG_FOO)', 'defined(HAVE_BAR)'] }
> +   'if': ['CONFIG_FOO', 'HAVE_BAR'] }
> =20
>  gets its generated code guarded like this:
> =20
> @@ -810,7 +810,7 @@ member 'bar'
> =20
>  { 'struct': 'IfStruct', 'data':
>    { 'foo': 'int',
> -    'bar': { 'type': 'int', 'if': 'defined(IFCOND)'} } }
> +    'bar': { 'type': 'int', 'if': 'IFCOND'} } }
> =20
>  A union's discriminator may not be conditional.
> =20
> @@ -822,7 +822,7 @@ value 'bar'
> =20
>  { 'enum': 'IfEnum', 'data':
>    [ 'foo',
> -    { 'name' : 'bar', 'if': 'defined(IFCOND)' } ] }
> +    { 'name' : 'bar', 'if': 'IFCOND' } ] }
> =20
>  Likewise, features can be conditional.  This requires the longhand
>  form of FEATURE.
> @@ -832,7 +832,7 @@ Example: a struct with conditional feature 'allow-neg=
ative-numbers'
>  { 'struct': 'TestType',
>    'data': { 'number': 'int' },
>    'features': [ { 'name': 'allow-negative-numbers',
> -                  'if': 'defined(IFCOND)' } ] }
> +                  'if': 'IFCOND' } ] }
> =20
>  Please note that you are responsible to ensure that the C code will
>  compile with an arbitrary combination of conditions, since the

At this point in your series, the documentation does not yet reflect the
code changes you've made.  You now add another change together with a
doc update.  Now the docs match *no* version of the code, past, present,
or future.  I find this confusing.  Swap the last two patches?

How do you feel about updating documentation before the code?

[...]


