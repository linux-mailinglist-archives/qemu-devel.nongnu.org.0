Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A0A306699
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:44:27 +0100 (CET)
Received: from localhost ([::1]:47926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4sby-0002SM-La
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:44:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4saT-0001S5-31
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:42:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4saP-0002rU-MC
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611783767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Ji9oWL6eAHcGJogoBDZGTjDf1zooWvorWumD76Mfxs=;
 b=TzLXiG7AgnFj1cWBBnCFKNRCmKMkUlK56BecS0mRlI5A1pky691AA3m9CLDW4WO/meL50o
 72n/6134ImpWJeMTqyvnA3ZPF7G2FBnv+lhKjpiH742sP6hBvLK0pfFxPPd4bJUJIibT7U
 i8/r/FahcJzR+AzY9AzVpp0Va7sR8B8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-oY-PeziuP-aEImkwjqWL-Q-1; Wed, 27 Jan 2021 16:42:45 -0500
X-MC-Unique: oY-PeziuP-aEImkwjqWL-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 112D356C21
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 21:42:45 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E58E6F923;
 Wed, 27 Jan 2021 21:42:44 +0000 (UTC)
Date: Wed, 27 Jan 2021 22:42:42 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 3/6] qapi: Simplify full_name_nth() in
 qobject-input-visitor
Message-ID: <20210127214242.GG6090@merkur.fritz.box>
References: <20201112172850.401925-1-kwolf@redhat.com>
 <20201112172850.401925-4-kwolf@redhat.com>
 <87ft2mpjon.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87ft2mpjon.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.01.2021 um 14:56 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Instead of counting how many elements from the top of the stack we need
> > to ignore until we find the thing we're interested in, we can just
> > directly pass the StackObject pointer because all callers already know
> > it.
> >
> > We only need a different way now to tell if we want to know the name of
> > something contained in the given StackObject or of the StackObject
> > itself. Passing name = NULL is the obvious way to request the latter.
> >
> > This simplifies the interface and makes it easier to use in cases where
> > we have the StackObject, but don't know how many steps down the stack it
> > is.
> >
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  qapi/qobject-input-visitor.c | 38 ++++++++++++++++++------------------
> >  1 file changed, 19 insertions(+), 19 deletions(-)
> >
> > diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
> > index a00ac32682..1415561828 100644
> > --- a/qapi/qobject-input-visitor.c
> > +++ b/qapi/qobject-input-visitor.c
> > @@ -87,20 +87,16 @@ static QObjectInputVisitor *to_qiv(Visitor *v)
> >  }
> >  
> >  /*
> > - * Find the full name of something @qiv is currently visiting.
> > - * @qiv is visiting something named @name in the stack of containers
> > - * @qiv->stack.
> > - * If @n is zero, return its full name.
> > - * If @n is positive, return the full name of the @n-th container
> > - * counting from the top.  The stack of containers must have at least
> > - * @n elements.
> > - * The returned string is valid until the next full_name_nth(@v) or
> > - * destruction of @v.
> > + * Find the full name of something named @name in @so which @qiv is
> > + * currently visiting.  If @name is NULL, find the full name of @so
> > + * itself.
> > + *
> > + * The returned string is valid until the next full_name_so(@qiv) or
> > + * destruction of @qiv.
> 
> How can this distinguish between a list and its member?
> 
> Before the patch:
> 
> * list member: n = 0, name = NULL
> * list: n = 1, name = NULL

Oh. These two lines were more helpful than the whole function comment
before this patch (which doesn't talk about name = NULL at all).

> Afterwards?
> 
> Checking... yes, regression.  Test case:
> 
>     {"execute": "blockdev-add", "arguments": {"driver": "file", "node-name": "blk0", "filename": "tmp.img"}}
>     {"return": {}}
>     {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "node-name": "blk1", "image": "blk0", "take-child-perms": [0]}}
>     {"error": {"class": "GenericError", "desc": "Invalid parameter type for 'take-child-perms', expected: string"}}
> 
> The second command's reply changes from
> 
>     {"error": {"class": "GenericError", "desc": "Invalid parameter type for 'take-child-perms[0]', expected: string"}}
> 
> to
> 
>     {"error": {"class": "GenericError", "desc": "Invalid parameter type for 'take-child-perms', expected: string"}}
> 
> The idea of using @so instead of @n may be salvagable.

I can always add a bool parameter that tells (independently from @name)
whether we want the name of a member or of the container.

Though do we really need the name of the container anywhere? The n = 1
case exists in qobject_input_check_list(), but is this a case that can
fail? The pattern how lists are intended to be visited seems to be
calling visit_next_list() until it returns NULL.

The only place where this pattern isn't followed and visit_next_list()
is called outside such a loop, so that we can actually run into the
error in qobject_input_check_list(), is a test case specifically for
this error path.

So should we just declare not visiting all list elements a programming
error and assert instead of constructing an error message that users
will never see?

Kevin


