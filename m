Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA845051A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 11:05:09 +0200 (CEST)
Received: from localhost ([::1]:48916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfKuS-00065e-9w
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 05:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hfKrR-0003hq-4K
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 05:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hfKrJ-0000fK-MU
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 05:01:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51868)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hfKrJ-0007yQ-AH; Mon, 24 Jun 2019 05:01:53 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6B2EC5D619;
 Mon, 24 Jun 2019 09:01:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-169.ams2.redhat.com
 [10.36.117.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 328231001B04;
 Mon, 24 Jun 2019 09:01:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9ABD511386A3; Mon, 24 Jun 2019 10:57:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
References: <20190501053522.10967-1-sjitindarsingh@gmail.com>
 <1561078267.4771.6.camel@gmail.com>
Date: Mon, 24 Jun 2019 10:57:24 +0200
In-Reply-To: <1561078267.4771.6.camel@gmail.com> (Suraj Jitindar Singh's
 message of "Fri, 21 Jun 2019 10:51:07 +1000")
Message-ID: <87y31rtl6z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 24 Jun 2019 09:01:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/2] monitor: Add dump-stack command
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, dgilbert@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suraj Jitindar Singh <sjitindarsingh@gmail.com> writes:

> On Wed, 2019-05-01 at 15:35 +1000, Suraj Jitindar Singh wrote:
>> Add a monitor command "dump-stack" to be used to dump the stack for
>> the
>> current cpu.
>
> To summarise the discussion which occured on this patch,
>
> - It looks like it's ok to duplicate this functionality as it provides
> an easier method to achieve this in the field and also for development.

By "duplicate", do you mean "one copy in gdb, one copy in QEMU"?

The question "why can't we simply hot-add a gdb server and use gdb?" has
not been answered as far as I can tell.

If the answer is "we can, but we find duplicating the functionality in
QEMU more convenient", then the next question is "okay, but is the
convenience worth the additional code?".  For PPC, the additional code
is fairly small.  What about more ornery targets like x86_64?  This
hasn't been answered, either.

> - It's ok for this to remain as a separate command and to not place it
> as a subcommand under info.

I strongly prefer "info FOO" for "pure" information-retrieving
commands.  But I'm not the maintainer anymore.

> I'll rework based on the comments on 2/2 of the series and resend.

