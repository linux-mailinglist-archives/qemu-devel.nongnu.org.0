Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AAE2DCCBD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 07:53:15 +0100 (CET)
Received: from localhost ([::1]:41700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpnA1-0004VF-PX
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 01:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpn8i-00044x-Tv
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 01:51:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpn8e-0000sJ-Lp
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 01:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608187902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w6QQ4fuxz3rvY4sPEQHBdjUU+Nj8xOIDVNKHnBbuwFg=;
 b=c7CN4SKyIFJOr+UJw7OCe2J5TvkkkqIlga0JkCtFMISyviP0CT3351wn5YLnXP9psq10ai
 TOkT5FjzM9/Qu52bLPxRn6SK/sz9VoGhgFL3R0lo8I5q3M1Yet8J99emQ9pqu9U+a2mckG
 5F38B1hADL9TN5cLMMiRBD7mOQTdRZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-35jN8fn5PGWAOP8IS1soIQ-1; Thu, 17 Dec 2020 01:51:39 -0500
X-MC-Unique: 35jN8fn5PGWAOP8IS1soIQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93CE0180A092
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:51:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A8B237A0;
 Thu, 17 Dec 2020 06:51:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C418411329A5; Thu, 17 Dec 2020 07:51:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 05/11] qapi/introspect.py: add preliminary type hint
 annotations
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-6-jsnow@redhat.com>
 <874kltnqx8.fsf@dusky.pond.sub.org>
 <995012d8-9b13-726a-fa05-844ec8ff61f6@redhat.com>
 <87v9d2tci9.fsf@dusky.pond.sub.org>
 <20201216174907.GF3140057@habkost.net>
Date: Thu, 17 Dec 2020 07:51:36 +0100
In-Reply-To: <20201216174907.GF3140057@habkost.net> (Eduardo Habkost's message
 of "Wed, 16 Dec 2020 12:49:07 -0500")
Message-ID: <87bletlybr.fsf@dusky.pond.sub.org>
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Wed, Dec 16, 2020 at 08:51:10AM +0100, Markus Armbruster wrote:
> [...]
>> You guys clearly struggled with the tree data structure.  Documentation
>> would have helped[*].  Since you're going to replace it (PATCH 09),
>> adding it now makes little sense.
>> 
>> *My* struggle is with the type annotations.
>> 
>> The initial state is messy to type, in part due to mypy's surprising
>> inability to deal with recursive types, in part because the tree data
>> structure is messier than it could be.
>> 
>> Much of the series is cleanup that benefits the typing.  Makes sense.
>> 
>> What makes review hard for me: you add (fairly complicated) typing
>> first, then evolve it along with the cleanups.  I have to first grok the
>> complicated typing (a struggle), then for each cleanup grok the type
>> changes in addition to the code changes.
>> 
>> I believe adding the typing before the cleanups is a mistake.
>
> Possibly my fault, as I remember asking John to do that (in
> earlier versions of these patches, type annotations were added
> after cleanup).
>
>> 
>> I share the desire to have type annotations that help with understanding
>> the code.  I understand the desire to have them sooner rather than
>> later.  I just think they're a costly distraction at this stage for this
>> code.  Once you understand the data structure, the cleanups are fairly
>> straightforward.
>> 
>
> I expected the type annotations to be a simple and helpful tool
> for understanding the data structure before refactoring.  In the
> case of introspect.py, I was completely wrong about "simple", and
> I'm not entirely sure about "helpful".

Quite excusable.  We lack the mypy experience to predict such outcomes.

> I wasn't expecting them to be an obstacle for patch review,
> though.  If the type annotations look good at the end of the
> series, do we care about the intermediate state?  Bisectability
> isn't an issue because type annotations are ignored by the Python
> interpreter.

I don't worry about bisectability.  The issue is reviewability.

Here's the best case for me reviewing a single patch.  First, the commit
message convinces me this makes sense.  Then I read the patch mostly in
order.  It does what the commit message made me expect, I think I
understand how it does it, and it doesn't touch anything I know to be
subtle.

Here's the best case for me reviewing a patch series: every patch in
order is a best case review.

As soon as review deviates from this best case, I slow down.  A lot.  If
there is something I didn't expect, maybe I'm misunderstanding the
patch's purpose.  If I feel confused about how the patch achieves its
purpose, I better figure it out.  If something subtle is being touched,
I better recall its subtleties and carefully check the patch.  Slow and
exhausting work.

This way of review can be overly careful.  But even deciding "this isn't
important, let it go" is slow, unless I do it wholesale.  All we get
then is "looks good at a glance".  But that's maybe an Acked-by,
certainly not a Reviewed-by.

Me finding the patch where the type hints start to be "serious" is slow.
Me mentally separating changes to type hints from other changes in
patches before that point is slow.  Me examining the type hints at that
point (which need not be entirely visible in the patch) is slow.

If the annotations in the intermediate state don't have to be good, do
they have to be there?  If John can take them out, review will be easier
and faster.


