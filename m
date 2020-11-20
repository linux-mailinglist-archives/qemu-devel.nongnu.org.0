Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E801F2BB25E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 19:23:52 +0100 (CET)
Received: from localhost ([::1]:59004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgB4a-0007VC-0s
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 13:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kgB3X-0006ns-Vn
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:22:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kgB3U-0005A4-Ks
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:22:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605896562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C79e+eqkinMgpSY+RprYGzcNjAmJd42Kb7uaoGJDWZY=;
 b=DqiEVLaISspJIZUEAtigXdiQ4HpPwZKb7ioNfDs4MKz9ZaU2QTv5jRnfAPogtAORJ5cFKs
 zXLzO4nO5x39V6sh0Pb1D8PMZUbfFpnRhZG8ywvy7/h8SSf/J8fjHqymiirYPU6nxUvdd2
 RWolzNfPFw1KdLcB+MEehYMicAjae+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-2ac8_c9KOGS7cYwVzLF30w-1; Fri, 20 Nov 2020 13:22:41 -0500
X-MC-Unique: 2ac8_c9KOGS7cYwVzLF30w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A5E9802B75
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 18:22:39 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47DB86085D;
 Fri, 20 Nov 2020 18:22:39 +0000 (UTC)
Date: Fri, 20 Nov 2020 13:22:38 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 4/8] qnum: qnum_value_is_equal() function
Message-ID: <20201120182238.GE2271382@habkost.net>
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-5-ehabkost@redhat.com>
 <87ima1d4kj.fsf@dusky.pond.sub.org>
 <20201119182403.GY1509407@habkost.net>
 <871rgo8qq8.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <871rgo8qq8.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 07:52:31AM +0100, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Thu, Nov 19, 2020 at 11:27:40AM +0100, Markus Armbruster wrote:
> > [...]
> >> > +bool qnum_is_equal(const QObject *x, const QObject *y)
> >> > +{
> >> > +    const QNum *qnum_x = qobject_to(QNum, x);
> >> > +    const QNum *qnum_y = qobject_to(QNum, y);
> >> 
> >> Humor me: blank line between declarations and statements, please.
> >
> > I can do it.  But why do you prefer it that way?
> 
> Habit borne out of C lacking other visual cues to distinguish
> declarations and statements.

Why is the distinction important, when many variable declarations
also include initializer expressions that can be as complex as
other statements?

(The qobject_to() calls above are an example).

> 
> Declaration or statement?  Tell me quick, don't analyze!
> 
>     mumble(*mutter)();
> 
> This "obviously" declares @mutter as pointer to function returning
> mumble.
> 
> Except when @mumble isn't a typedef name, but a function taking one
> argument and returning a function that takes no argument.  Then it
> passes *mutter to mumble(), and calls its return value.
> 
> The whole point of coding style is to help readers along.  Two stylistic
> conventions that can help here:
> 
> 1. In a function call, no space between the expression denoting the
>    called function and the (parenthesized) argument list.  Elsewhere,
>    space.
> 
>    So, when the example above is indeed a declaration, write it as
> 
>         mumble (*mutter)();
> 
>    If it's function calls, write it as
> 
>         mumble(*mutter)();

This makes lots of sense.  Starting with a word followed by space
is what makes declarations visually distinguishable.

> 
> 2. Separate declarations from statements with a blank line.  Do not mix
>    them.

I'm not sure about this one, and I'm actually glad it is not part
of CODING_STYLE.  :)

(I'll still follow your advice as maintainer of that piece of
code, of course)

-- 
Eduardo


