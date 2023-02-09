Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD436900B4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 08:09:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ13B-0006Md-Ob; Thu, 09 Feb 2023 02:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ138-0006MF-MG
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:08:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ136-0006oc-Is
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:08:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675926531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K+0RcfRuGd2gSKVVKZWtEPHz0ThN3+xbAs1+Wt/y/d4=;
 b=Cr3JE1q1BmBGzRGVYHzYYq8qNpnkRRCe/Z5Hj/Mdit0gjWOW+biqyX4Hjks8PWgveIrtQS
 9dDxgHvXUkHNHNSdUYETJgoLUQBocb3ZCEBkNN8ApnzDR7t1myuIVUk8YoVkoUN8eGrryZ
 tZgBbMoKgjgjdbwgInUJiRw8LXYzySE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-YtR4QFbSOiSmEHdMrRSHmw-1; Thu, 09 Feb 2023 02:08:47 -0500
X-MC-Unique: YtR4QFbSOiSmEHdMrRSHmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2864B830F52;
 Thu,  9 Feb 2023 07:08:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8DA2C16022;
 Thu,  9 Feb 2023 07:08:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C87CB21E6A1F; Thu,  9 Feb 2023 08:08:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v2 0/7] qapi: static typing conversion, pt5c
References: <20230208021306.870657-1-jsnow@redhat.com>
 <878rh8unih.fsf@pond.sub.org>
 <CAFn=p-bUyRuyWU3ROWL7B-2r9SY7ySVC-r0dAzctbu18DNC4Lg@mail.gmail.com>
Date: Thu, 09 Feb 2023 08:08:45 +0100
In-Reply-To: <CAFn=p-bUyRuyWU3ROWL7B-2r9SY7ySVC-r0dAzctbu18DNC4Lg@mail.gmail.com>
 (John Snow's message of "Wed, 8 Feb 2023 12:02:20 -0500")
Message-ID: <871qmzqps2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

John Snow <jsnow@redhat.com> writes:

> On Wed, Feb 8, 2023 at 11:31 AM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> John Snow <jsnow@redhat.com> writes:
>>
>> > This is part five (c), and focuses on sharing strict types between
>> > parser.py and expr.py.
>> >
>> > gitlab: https://gitlab.com/jsnow/qemu/-/commits/python-qapi-cleanup-pt5c
>> >
>> > Every commit should pass with:
>> >  - `isort -c qapi/`
>> >  - `flake8 qapi/`
>> >  - `pylint --rcfile=qapi/pylintrc qapi/`
>> >  - `mypy --config-file=qapi/mypy.ini qapi/`
>> >
>> > Some notes on this series:
>> >
>> > Patches 2 and 3 are almost entirely superseded by patch 5, but I wasn't
>> > as confident that Markus would like patch 5, so these patches aren't
>> > squashed quite as tightly as they could be -- I recommend peeking ahead
>> > at the cover letters before reviewing the actual patch diffs.
>>
>> Yes, you're taking a somewhat roundabout path there.
>
> The result of trying 10 different things and seeing what was feasible
> through trial and error, and rather less the product of an intentional
> design. In the name of just getting the ball rolling again, I sent it
> out instead of hemming and hawing over perfection. Publish early,
> Publish often! ... is what people doing the publishing say. Apologies
> to the reviewer.

The series was easy enough to review, in good part thanks to your cover
letter.

>> I think I like PATCH 5 well enough.  Do you have a tighter squash in
>> mind?
>
> Not directly. I could essentially just squash them, but that becomes a
> pretty big patch.

Worth a try.

>> > By the end of this series, the only JSON-y types we have left are:
>> >
>> > (A) QAPIExpression,
>> > (B) JSONValue,
>> > (C) _ExprValue.
>> >
>> > The argument I'm making here is that QAPIExpression and JSONValue are
>> > distinct enough to warrant having both types (for now, at least); and
>> > that _ExprValue is specialized enough to also warrant its inclusion.
>> >
>> > (Brutal honesty: my attempts at unifying this even further had even more
>> > hacks and unsatisfying conclusions, and fully unifying these types
>> > should probably wait until we're allowed to rely on some fairly modern
>> > Python versions.)
>>
>> Feels okay to me.
>
> Sorry, best I could do with reasonable effort. I will try to improve
> the situation when we bump the Python version!

Pretty low priority as far as I'm concerned.

mypy is (surprisingly, inexplicably, inexcusably, take your pick) bad at
recursive types.  We've sunk quite a bit of effort into getting the most
out of it around these fundamentally recursive data structures anyway.
I'd like to remind you that my gut feeling was "alright, let's just not
type them then."  You persuaded me to go this far.  No regrets.

The three types you mentioned are indeed distinct.

_ExprValue is the obvious stupid abstract syntax tree for the QAPI
schema language, with str and bool leaves (QAPI doesn't support
floating-point numbers), OrderedDict and list inner nodes.  It is used
for parser output.

Note that the type definition says Dict[str, object].  It's really
OrderedDict.  Plain dict should do for us since 3.6 made it ordered.

QAPIExpression augments _ExprValue, adding a QAPISourceInfo (identifying
the expression's source) and a QAPIDoc (the expressions documentation).
It is used to represent QAPI top-level expressions.  Two observations.

One, having source information only at the top-level is lazy, and leads
to sub-optimal error messages.  I'm not asking for improvement there; we
have bigger fish to fry.

Two, the fact that it wraps around _ExprValue is less than obvious.  The
type doesn't mention _ExprValue.  QAPISchemaParser._add_expr(), the
function we use turn an _ExprValue into a QAPIExpression doesn't mention
it either.  Both work on Mapping[str, object] instead.  Also not a
request for improvement.

JSONValue is an annotated JSON abstract syntax tree.  It's related to
the other two only insofar as JSON is related to the QAPI language.
Unifying plain syntax trees for these separate languages feels like a
dubious proposition to me.  Unifying *annotated* syntax trees feels
worse.


