Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63496173231
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 08:56:29 +0100 (CET)
Received: from localhost ([::1]:43234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7aVY-0008Rs-GB
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 02:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39399)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j7aUX-0007i5-8x
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 02:55:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j7aUW-0004tC-1x
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 02:55:24 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27090
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j7aUV-0004t3-Ut
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 02:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582876523;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdBYdVFL+4cAE1lJ483vJC20NNQK3FjspbLL23HDux8=;
 b=VMktbyxj9sqOzwnPXxG/zsBNU7GTFzNuSA1fJnk1ag/HrrVzMltsR1KXwhemoF2Kozbu+o
 2ekfBGN8YfT1at5MVv0nzsugP/GfIeRABmcwfp16+EG34m8GJevIuZs6Kodc9oWfYbqxd9
 hEivcgNYyzo4fgUjlE0O67F/+oQd4n8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-1J1QcKaxPLe1NzocAC0U8g-1; Fri, 28 Feb 2020 02:55:21 -0500
X-MC-Unique: 1J1QcKaxPLe1NzocAC0U8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56E1C18A5500;
 Fri, 28 Feb 2020 07:55:20 +0000 (UTC)
Received: from redhat.com (ovpn-116-72.ams2.redhat.com [10.36.116.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E098260C18;
 Fri, 28 Feb 2020 07:55:19 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Subject: Re: [PATCH v2 3/3] savevm: check RAM is pagesize aligned
In-Reply-To: <CAL1e-=h+SkEPy1VVvdNeo9T1mAT5-dA7orsj0TFtfDsTofwzFg@mail.gmail.com>
 (Aleksandar Markovic's message of "Thu, 27 Feb 2020 22:00:27 +0100")
References: <20200103074000.1006389-1-marcandre.lureau@redhat.com>
 <20200103074000.1006389-4-marcandre.lureau@redhat.com>
 <8736cqi07g.fsf@secure.laptop>
 <CAJ+F1CLgg6Yz=2V8_eCVtsJ1zPm=1-piz-Nw05KGXkSqWytLgA@mail.gmail.com>
 <87r1yfc1q1.fsf@secure.laptop>
 <CAL1e-=h+SkEPy1VVvdNeo9T1mAT5-dA7orsj0TFtfDsTofwzFg@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Fri, 28 Feb 2020 08:55:16 +0100
Message-ID: <87mu93b0yj.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Reply-To: quintela@redhat.com
Cc: QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Aleksandar Markovic <aleksandar.m.mail@gmail.com> wrote:
> On Thursday, February 27, 2020, Juan Quintela <quintela@redhat.com> wrote=
:
>
>  Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> wrote:
>  > Hi Juan
>  >
>  > On Wed, Jan 8, 2020 at 2:08 PM Juan Quintela <quintela@redhat.com> wro=
te:
>  >>
>  >> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:
>  >> n> Check the host pointer is correctly aligned, otherwise we may fail
>  >> > during migration in ram_block_discard_range().
>  >> >
>  >> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>  >>
>  >> Reviewed-by: Juan Quintela <quintela@redhat.com>
>  >>
>  >> queued
>  >>
>  >
>  > Did it get lost? thanks
>
>  I dropped it in the past, because it made "make check" for mips fail.
>  (I put it on my ToDo list to investigate and forgot about it)
>
> Thank you for caring for mips.

You are welcome.
But you need to thank "make check"
It didn't pass.

> Do you perhaps remember what was tgevtest and environment for the failing=
 test?

It was plain "make check" with everything under the sun compiled in.
Clearly it was other of the patches, or an interaction between them what
failed.
I don't remember the error, sorry.  I droped the patch to my ToDo list
of things to investigate (the patch was "obviously" correct) and forgot
about it.

Later, Juan.


