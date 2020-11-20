Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26732BA2B0
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 07:54:23 +0100 (CET)
Received: from localhost ([::1]:46774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg0JK-0001xq-DT
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 01:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kg0Hh-0001VS-1V
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 01:52:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kg0He-0000i4-Aq
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 01:52:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605855156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xFny36Z4FRyTSHEocZG1C27ZN3hx9AgEo1X1dD+iD9A=;
 b=URQ5hxVBW44eCF7hohq8WVo/lPsxNjBb08EKa0uuFgVWVgcqPXF+JGhXNfQHZW4nwKR3Ep
 Mb/xPvwT5sBOyGCRGe2ACNnZO7icogQkFANfoJKRPkK0UVwOHw8LtTRNFHzDIGk3VW3OhM
 edAf4tSZYA5DnrdGETGiigooeLjELhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-Uo9BX8AjOGOheF_5i7tBhA-1; Fri, 20 Nov 2020 01:52:34 -0500
X-MC-Unique: Uo9BX8AjOGOheF_5i7tBhA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63D4D1842140
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 06:52:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3525D60854;
 Fri, 20 Nov 2020 06:52:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA18F11358BA; Fri, 20 Nov 2020 07:52:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 4/8] qnum: qnum_value_is_equal() function
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-5-ehabkost@redhat.com>
 <87ima1d4kj.fsf@dusky.pond.sub.org>
 <20201119182403.GY1509407@habkost.net>
Date: Fri, 20 Nov 2020 07:52:31 +0100
In-Reply-To: <20201119182403.GY1509407@habkost.net> (Eduardo Habkost's message
 of "Thu, 19 Nov 2020 13:24:03 -0500")
Message-ID: <871rgo8qq8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Daniel P. =?utf-8?Q?Berrang?= =?utf-8?Q?=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Nov 19, 2020 at 11:27:40AM +0100, Markus Armbruster wrote:
> [...]
>> > +bool qnum_is_equal(const QObject *x, const QObject *y)
>> > +{
>> > +    const QNum *qnum_x = qobject_to(QNum, x);
>> > +    const QNum *qnum_y = qobject_to(QNum, y);
>> 
>> Humor me: blank line between declarations and statements, please.
>
> I can do it.  But why do you prefer it that way?

Habit borne out of C lacking other visual cues to distinguish
declarations and statements.

Declaration or statement?  Tell me quick, don't analyze!

    mumble(*mutter)();

This "obviously" declares @mutter as pointer to function returning
mumble.

Except when @mumble isn't a typedef name, but a function taking one
argument and returning a function that takes no argument.  Then it
passes *mutter to mumble(), and calls its return value.

The whole point of coding style is to help readers along.  Two stylistic
conventions that can help here:

1. In a function call, no space between the expression denoting the
   called function and the (parenthesized) argument list.  Elsewhere,
   space.

   So, when the example above is indeed a declaration, write it as

        mumble (*mutter)();

   If it's function calls, write it as

        mumble(*mutter)();

2. Separate declarations from statements with a blank line.  Do not mix
   them.

[...]


