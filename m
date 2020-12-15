Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BAE2DB08E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:56:01 +0100 (CET)
Received: from localhost ([::1]:46024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCgC-0000G5-T8
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpCdM-00078j-Hu
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:53:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpCdG-0006Wt-Cm
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608047577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LNdyeaeJHOm3GXnte1EkQ/D78ZUMewFs5awT1DfMt9I=;
 b=hsNPD8FA4z243vBrvgRPo3dV/IlII4bsODq/xeOh+2kLSxOtIR70fsT0j948V3TJ2XJ0yY
 3z2wPCY3fpPKP+hcEMJDgMccQGZZipCUr3sg3+Y2jAtwTHUO3SqN92ibFlY0VHOrNc8lSy
 9aVYvZ+oLWBx1Ih6FDFr0JsJGNYMxfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-52vX_gx4O-Gs-4X9FWkVYw-1; Tue, 15 Dec 2020 10:52:55 -0500
X-MC-Unique: 52vX_gx4O-Gs-4X9FWkVYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40B5C1800D42;
 Tue, 15 Dec 2020 15:52:54 +0000 (UTC)
Received: from [10.10.116.117] (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B35119C44;
 Tue, 15 Dec 2020 15:52:53 +0000 (UTC)
Subject: Re: [PATCH v2 00/11] qapi: static typing conversion, pt2
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20201026194251.11075-1-jsnow@redhat.com>
 <ec85be81-7f73-a5ea-7bfc-d8f4b575585f@redhat.com>
 <CAJ+F1CKOF4OxtWE-ngAh25T8o4PA2VOPTRbbdbFgi4eUV7VzSA@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <ff15639a-7df2-9a49-39fe-988b2dfdaf3b@redhat.com>
Date: Tue, 15 Dec 2020 10:52:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKOF4OxtWE-ngAh25T8o4PA2VOPTRbbdbFgi4eUV7VzSA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/20 4:51 AM, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Nov 2, 2020 at 7:41 PM John Snow <jsnow@redhat.com 
> <mailto:jsnow@redhat.com>> wrote:
> 
>     On 10/26/20 3:42 PM, John Snow wrote:
>      > Hi, this series adds static type hints to the QAPI module.
>      > This is part two, and covers introspect.py.
>      >
>      > Part 2:
>     https://gitlab.com/jsnow/qemu/-/tree/python-qapi-cleanup-pt2
>     <https://gitlab.com/jsnow/qemu/-/tree/python-qapi-cleanup-pt2>
>      > Everything:
>     https://gitlab.com/jsnow/qemu/-/tree/python-qapi-cleanup-pt6
>     <https://gitlab.com/jsnow/qemu/-/tree/python-qapi-cleanup-pt6>
>      >
>      > - Requires Python 3.6+
>      > - Requires mypy 0.770 or newer (for type analysis only)
>      > - Requires pylint 2.6.0 or newer (for lint checking only)
>      >
>      > Type hints are added in patches that add *only* type hints and
>     change no
>      > other behavior. Any necessary changes to behavior to accommodate
>     typing
>      > are split out into their own tiny patches.
>      >
>      > Every commit should pass with:
>      >   - flake8 qapi/
>      >   - pylint --rcfile=qapi/pylintrc qapi/
>      >   - mypy --config-file=qapi/mypy.ini qapi/
>      >
>      > V2:
>      >   - Dropped all R-B from previous series; enough has changed.
>      >   - pt2 is now introspect.py, expr.py is pushed to pt3.
>      >   - Reworked again to have less confusing (?) type names
>      >   - Added an assertion to prevent future accidental breakage
>      >
> 
>     Ping!
> 
>     Patches 1-3: Can be skipped; just enables sphinx to check the docstring
>     syntax. Don't worry about these too much, they're just here for you to
>     test with.
> 
> 
> They are interesting, but the rebase version fails. And the error 
> produced is not exactly friendly:
> Exception occurred:
>    File "/usr/lib/python3.9/site-packages/sphinx/domains/c.py", line 
> 3751, in resolve_any_xref
>      return [('c:' + self.role_for_objtype(objtype), retnode)]
> TypeError: can only concatenate str (not "NoneType") to str
> 
> Could you rebase and split off in a separate series?
> 

Done, new versions of these patches will omit these.

>     Patch 4 adds some small changes, to support:
>     Patch 5 adds the type hints.
>     Patches 6-11 try to improve the readability of the types and the code.
> 
>     This was a challenging file to clean up, so I am sure there's lots of
>     easy, low-hanging fruit in the review/feedback for me to improve.
> 
> 
> Nothing obvious to me.
> 
> Python typing is fairly new to me, and I don't know the best practices. 
> I would just take what you did and improve later, if needed.
> 

Neither do I, but I'm learning as I go.

> A wish item before we proceed with more python code cleanups is 
> documentation and/or automated tests.
> 

OK. It's on my list to write a python style guide document, I can detail 
our typing strategies, documentation strategies, etc there.

> Could you add a new make check-python and perhaps document what the new 
> code-style expectations?
> 

Yes, I have one for python/qemu that I tried to get merged prior to 5.2 
but it didn't make it in time because there were some concerns over 
exactly how the test ran and where it provisioned its packages from.

> 
>      > John Snow (11):
>      >    [DO-NOT-MERGE] docs: replace single backtick (`) with
>     double-backtick
>      >      (``)
>      >    [DO-NOT-MERGE] docs/sphinx: change default role to "any"
>      >    [DO-NOT-MERGE] docs: enable sphinx-autodoc for scripts/qapi
>      >    qapi/introspect.py: add assertions and casts
>      >    qapi/introspect.py: add preliminary type hint annotations
>      >    qapi/introspect.py: add _gen_features helper
>      >    qapi/introspect.py: Unify return type of _make_tree()
>      >    qapi/introspect.py: replace 'extra' dict with 'comment' argument
>      >    qapi/introspect.py: create a typed 'Annotated' data strutcure
>      >    qapi/introspect.py: improve readability of _tree_to_qlit
>      >    qapi/introspect.py: Add docstring to _tree_to_qlit
>      >
>      >   docs/conf.py                           |   6 +-
>      >   docs/devel/build-system.rst            | 120 +++++------
>      >   docs/devel/index.rst                   |   1 +
>      >   docs/devel/migration.rst               |  59 +++---
>      >   docs/devel/python/index.rst            |   7 +
>      >   docs/devel/python/qapi.commands.rst    |   7 +
>      >   docs/devel/python/qapi.common.rst      |   7 +
>      >   docs/devel/python/qapi.error.rst       |   7 +
>      >   docs/devel/python/qapi.events.rst      |   7 +
>      >   docs/devel/python/qapi.expr.rst        |   7 +
>      >   docs/devel/python/qapi.gen.rst         |   7 +
>      >   docs/devel/python/qapi.introspect.rst  |   7 +
>      >   docs/devel/python/qapi.main.rst        |   7 +
>      >   docs/devel/python/qapi.parser.rst      |   8 +
>      >   docs/devel/python/qapi.rst             |  26 +++
>      >   docs/devel/python/qapi.schema.rst      |   7 +
>      >   docs/devel/python/qapi.source.rst      |   7 +
>      >   docs/devel/python/qapi.types.rst       |   7 +
>      >   docs/devel/python/qapi.visit.rst       |   7 +
>      >   docs/devel/tcg-plugins.rst             |  14 +-
>      >   docs/devel/testing.rst                 |   2 +-
>      >   docs/interop/live-block-operations.rst |   4 +-
>      >   docs/system/arm/cpu-features.rst       | 110 +++++-----
>      >   docs/system/arm/nuvoton.rst            |   2 +-
>      >   docs/system/s390x/protvirt.rst         |  10 +-
>      >   qapi/block-core.json                   |   4 +-
>      >   scripts/qapi/introspect.py             | 277
>     +++++++++++++++++--------
>      >   scripts/qapi/mypy.ini                  |   5 -
>      >   scripts/qapi/schema.py                 |   2 +-
>      >   29 files changed, 487 insertions(+), 254 deletions(-)
>      >   create mode 100644 docs/devel/python/index.rst
>      >   create mode 100644 docs/devel/python/qapi.commands.rst
>      >   create mode 100644 docs/devel/python/qapi.common.rst
>      >   create mode 100644 docs/devel/python/qapi.error.rst
>      >   create mode 100644 docs/devel/python/qapi.events.rst
>      >   create mode 100644 docs/devel/python/qapi.expr.rst
>      >   create mode 100644 docs/devel/python/qapi.gen.rst
>      >   create mode 100644 docs/devel/python/qapi.introspect.rst
>      >   create mode 100644 docs/devel/python/qapi.main.rst
>      >   create mode 100644 docs/devel/python/qapi.parser.rst
>      >   create mode 100644 docs/devel/python/qapi.rst
>      >   create mode 100644 docs/devel/python/qapi.schema.rst
>      >   create mode 100644 docs/devel/python/qapi.source.rst
>      >   create mode 100644 docs/devel/python/qapi.types.rst
>      >   create mode 100644 docs/devel/python/qapi.visit.rst
>      >
> 
> 
> 
> 
> -- 
> Marc-André Lureau


