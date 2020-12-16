Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976B62DBBDA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 08:10:14 +0100 (CET)
Received: from localhost ([::1]:59098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQwv-0007ju-6f
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 02:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpQvl-0007Jm-Oi
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 02:09:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpQvj-0001Aa-DO
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 02:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608102538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4L+7l/eZnb41JhYiQAiUuTtTHzZsTMXEYEJIBAQ56u0=;
 b=gmnrpSnQ9FVQEddShyz9WkRscXZHkW9skDXFRoPI+6iUc9JmSDkyGP2OXw3XU8wcNhvexQ
 M8s9BEEGPZN81vwGtgRhnrYKDfMsi+2AbPRHZ0xQzBUe8ItIVCjvUdSGEjkEpWvxOGYDF3
 spReaKw5hyEvf8teuJzevtzLctLGEFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-U8xU2udtNDWmMGxZ6MPC_w-1; Wed, 16 Dec 2020 02:08:56 -0500
X-MC-Unique: U8xU2udtNDWmMGxZ6MPC_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F676107ACE3
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:08:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C2E45D6D3;
 Wed, 16 Dec 2020 07:08:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DF39711329A5; Wed, 16 Dec 2020 08:08:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 09/11] qapi/introspect.py: create a typed 'Annotated'
 data strutcure
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-10-jsnow@redhat.com>
 <87y2j1zk35.fsf@dusky.pond.sub.org>
 <b27f7930-d86b-8357-84e4-7daef00023d7@redhat.com>
Date: Wed, 16 Dec 2020 08:08:53 +0100
In-Reply-To: <b27f7930-d86b-8357-84e4-7daef00023d7@redhat.com> (John Snow's
 message of "Mon, 7 Dec 2020 19:21:26 -0500")
Message-ID: <87bleuw7lm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 11/16/20 5:12 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> This replaces _make_tree with Annotated(). By creating it as a generic
>>> container, we can more accurately describe the exact nature of this
>>> particular value. i.e., each Annotated object is actually an
>>> Annotated<T>, describing its contained value.
>>>
>>> This adds stricter typing to Annotated nodes and extra annotated
>>> information.
>> 
>> Inhowfar?
>> 
>
> The Generic[T] trick lets us express the type of the annotated node 
> itself, which is more specific than Tuple[_something, ...etc...] and 
> this type can be preserved when we peel the annotations off.
>
> It's not super crucial, but like you say, the big benefit is the field 
> names and strict types for the special-purpose structure.

I'd lead with a brief description of the data structure you're
replacing, how we got there, and why it's ugly.  You can steal from my
review of PATCH 5.  Then explain its replacement, briefly.  And only
then talk about types.

By the time you get to types, I'm nodding along "yes, please", and will
be predisposed to accept your typing arguments at face value.

If you start with typing arguments, they have to negotiate the "yes,
please" bar all by themselves.  Harder, because Python typing stuff you
have to explain for dummies.

>>>               It also replaces a check of "isinstance tuple" with the
>>> much more explicit "isinstance Annotated" which is guaranteed not to
>>> break if a tuple is accidentally introduced into the type tree. (Perhaps
>>> as a result of a bad conversion from a list.)
>> 
>> Sure this is worth writing home about?  Such accidents seem quite
>> unlikely.
>> 
>
> We all have our phobias. I find "isinstance(x, 
> extremely_common_stdlib_type)" to be extremely fragile and likely to 
> frustrate.

You're applying programming-in-the-large reasoning to a
programming-in-the-small case.

Say you're writing a piece of code you expect to be used in contexts you
prudently refuse to predict.  The code deals with a bunch of basic
Python types.  Reserving another basic Python type for internal use may
well be unwise then, because it can make your code break confusingly
when this other type appears in input.  Which it shouldn't, but making
your reusable code harder to misuse, and misuses easier to diagnose are
laudable goals.

This is not such a piece of code.  All the users it will ever have are
in the same file of 200-something LOC.

Your commit message makes the case for your patch.  Sometimes, dropping
weak arguments strengthens a case.  I believe dropping the "It also
replaces" argument would strengthen your case.

> Maybe what's unlikely is anyone editing this code ever again. You've 
> mentioned wanting to look into changing how the schema information is 
> stored in QEMU before, so a lot of this might not matter for too much 
> longer, who knows.

Yes, I expect generating the SchemaInfoList directly would beat
generating QLitObject, then converting QLitObject -> QObject ->
SchemaInfoList.  Whether it's worth the effort is unclear.

>> For me, the commit's benefit is making the structure of the annotated
>> tree node more explicit (your first paragraph, I guess).  It's a bit of
>> a pattern in developing Python code: we start with a Tuple because it's
>> terse and easy, then things get more complex, terse becomes too terse,
>> and we're replacing the Tuple with a class.
>> 
>
> Yep.
>
>>> Signed-off-by: John Snow <jsnow@redhat.com>


