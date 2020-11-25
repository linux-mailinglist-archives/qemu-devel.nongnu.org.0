Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550332C4290
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 16:02:25 +0100 (CET)
Received: from localhost ([::1]:53654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khwJM-0002Az-CJ
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 10:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khwIG-0001jt-Ri
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 10:01:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khwID-0001Am-6H
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 10:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606316472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AA6tzangRO7wIV4PRgt7mDTHhWmIdo5q5tKwdqjnDLM=;
 b=SlGP5ORd210D7MODgLqxVvgKS2Q5OpgyPQfho6BRxZMXVX3CODUFpmfjy++Tor9BQ3BKr+
 463OPvQNMuhT+lV1a8RhYOMccTD8mCfAURm9geOqOPJPfy5sgy4gfy8cn6/DF7ha07LGE7
 kND0lx6ExstczBxbIsrc05vlFrQIA9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-7OZZcjbbMHGER4ekCPxpMA-1; Wed, 25 Nov 2020 10:01:09 -0500
X-MC-Unique: 7OZZcjbbMHGER4ekCPxpMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4CF01012E93;
 Wed, 25 Nov 2020 15:01:08 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D64B5D6AC;
 Wed, 25 Nov 2020 15:01:08 +0000 (UTC)
Date: Wed, 25 Nov 2020 10:01:07 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 3/8] qnum: QNumValue type for QNum value literals
Message-ID: <20201125150107.GD2271382@habkost.net>
References: <20201119182158.GX1509407@habkost.net>
 <877dqg8ukz.fsf@dusky.pond.sub.org>
 <20201120182720.GF2271382@habkost.net>
 <877dqcwlxc.fsf@dusky.pond.sub.org>
 <20201123183357.GK2271382@habkost.net>
 <87ft4zp2at.fsf@dusky.pond.sub.org>
 <20201124144102.GL2271382@habkost.net>
 <877dqahjcq.fsf@dusky.pond.sub.org>
 <20201124152937.GQ2271382@habkost.net>
 <87y2iqaqhb.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87y2iqaqhb.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 25, 2020 at 07:40:48AM +0100, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Tue, Nov 24, 2020 at 04:20:37PM +0100, Markus Armbruster wrote:
> >> Eduardo Habkost <ehabkost@redhat.com> writes:
> >> 
> >> > On Tue, Nov 24, 2020 at 09:49:30AM +0100, Markus Armbruster wrote:
> >> >> Eduardo Habkost <ehabkost@redhat.com> writes:
> >> >> 
> >> >> > On Mon, Nov 23, 2020 at 08:51:27AM +0100, Markus Armbruster wrote:
> >> >> >> Eduardo Habkost <ehabkost@redhat.com> writes:
> >> >> >> 
> >> >> >> > On Fri, Nov 20, 2020 at 06:29:16AM +0100, Markus Armbruster wrote:
> >> >> >> [...]
> >> >> >> >> When the structure of a data type is to be kept away from its users, I
> >> >> >> >> prefer to keep it out of the public header, so the compiler enforces the
> >> >> >> >> encapsulation.
> >> >> >> >
> >> >> >> > I prefer that too, except that it is impossible when users of the
> >> >> >> > API need the compiler to know the struct size.
> >> >> >> 
> >> >> >> There are cases where the structure of a data type should be
> >> >> >> encapsulated, yet its size must be made known for performance (avoid
> >> >> >> dynamic memory allocation and pointer chasing).
> >> >> >> 
> >> >> >> Need for encapsulation correlates with complex algorithms and data
> >> >> >> structures.  The cost of dynamic allocation is often in the noise then.
> >> >> >
> >> >> > I don't know what we are talking about anymore.  None of this
> >> >> > applies to the QNum API, right?
> >> >> >
> >> >> > QNum/QNumValue are not complex data structures, and the reason we
> >> >> > need the compiler to know the size of QNumValue is not related to
> >> >> > performance at all.
> >> >> 
> >> >> We started with the question whether to make QNumValue's members
> >> >> private.  We digressed to the question when to make members private.
> >> >> So back to the original question.
> >> >> 
> >> >> > We might still want to discourage users of the QNum API from
> >> >> > accessing QNum.u/QNumValue.u directly.  Documenting the field as
> >> >> > private is a very easy way to do it.
> >> >> 
> >> >> It's a complete non-issue.  QNum has been around for years, and we
> >> >> haven't had any issues that could've been plausibly avoided by asking
> >> >> people to refrain from accessing its members.
> >> >> 
> >> >> If there was an actual need to keep the members private, I'd move the
> >> >> struct out of the header, so the compiler enforces privacy.
> >> >
> >> > Understood.  There's still a question I'd like to answer, to
> >> > decide how the API documentation should look like:
> >> >
> >> >   Is QNum.u/QNumValue.u required to be part of the API
> >> >   documentation?
> >> >
> >> > If accessing that field directly is not necessary for using the
> >> > API, I don't think it should appear in the documentation (because
> >> > it would be just noise).
> >> 
> >> The current patch's comment on QNumValue looks good to me.
> >> 
> >> Does this answer your question?
> >
> > The current patch (v3) doesn't address the question.  It doesn't
> > include documentation for the field, but doesn't hide it.
> > kernel-doc will print a warning on that case.
> 
> Do we care?

Yes.  Peter will reject pull requests if it generates kernel-doc
warnings.

> How many such warnings exist before the patch?

Zero.

> Does this series add just this one, or more?

The current series (v3) doesn't add any, because I dropped the
patch that added QObject and QNum documentation to docs/devel.  I
still want to resubmit that patch later, though.

> 
> Use your judgement, then be ready to explain it :)

OK!

-- 
Eduardo


