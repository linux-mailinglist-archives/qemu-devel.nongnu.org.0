Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F0419AE8D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 17:08:15 +0200 (CEST)
Received: from localhost ([::1]:33406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJeyU-0006Xp-BP
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 11:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39520)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jJew7-0003ce-9d
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 11:05:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jJew5-0006iG-QR
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 11:05:46 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38620
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jJew5-0006hu-LQ
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 11:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585753544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BBsosd2Zvd02VxZcfRxJhGJvgKkzLaL+E7NaAVSQMw4=;
 b=A2sdyZftwu4zEBvgXRLyxwvlvrI9YGBvmzw8IIleJGxD9+0EK5CrqZCvoS5d7lzvmY1+md
 exrPJRrK4QOSjsG4dwcfK36BjWgzoW0ugl/JZoLxpD04pINYiUvCuEo8+BAhzGneeAqIz+
 eDlkmVJENLLFxXLhmVgn8sLN2xPineY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-pkbzW9eANYOyhsqcQS7-Jw-1; Wed, 01 Apr 2020 11:05:43 -0400
X-MC-Unique: pkbzW9eANYOyhsqcQS7-Jw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BCAB107ACC9;
 Wed,  1 Apr 2020 15:05:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-69.ams2.redhat.com
 [10.36.112.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE81C5D9CD;
 Wed,  1 Apr 2020 15:05:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 52E4611385E2; Wed,  1 Apr 2020 17:05:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: Questionable aspects of QEMU Error's design
References: <87o8sblgto.fsf@dusky.pond.sub.org>
 <e980477d-3951-2a2b-fa38-dee8e1895019@virtuozzo.com>
Date: Wed, 01 Apr 2020 17:05:40 +0200
In-Reply-To: <e980477d-3951-2a2b-fa38-dee8e1895019@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 1 Apr 2020 15:10:05 +0300")
Message-ID: <87h7y3fdq3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Side question:
>
> Can we somehow implement a possibility to reliably identify file and line=
 number
> where error is set by error message?
>
> It's where debug of error-bugs always starts: try to imagine which parts =
of the error
> message are "%s", and how to grep for it in the code, keeping in mind als=
o,
> that error massage may be split into several lines..
>
> Put file:line into each error? Seems too noisy for users.. A lot of error=
s are not
> bugs: use do something wrong and see the error, and understands what he i=
s doing
> wrong.. It's not usual practice to print file:line into each message for =
user.
>
>
> But what if we do some kind of mapping file:line <-> error code, so user =
will see
> something like:
>
>
>    Error 12345: Device drive-scsi0-0-0-0 is not found
>
> ....
>
> Hmm, maybe, just add one more argument to error_setg:
>
> error_setg(errp, 12345, "Device %s is not found", device_name);
>
> - it's enough grep-able.

error_setg() already records source file and line number in the Error
object, so that error_handle_fatal(&error_abort, err) can report them.

Making the programmer pick and pass an error ID at every call site is
onerous.  More so when the error ID should be globally unique.

With GLib's domain, code, the code needs only be unique within the
domain, but you still have to define globally unique domains.
Differently onerous.

We could have -msg,debug=3Don make error_report_err() report the Error
object's source file and line number.  Doesn't help for the many direct
uses of error_report().  To cover those, we'd have to turn
error_report() into a macro, similar to how error_setg() works.


