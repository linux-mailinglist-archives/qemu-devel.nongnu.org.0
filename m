Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2F9921A2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 12:48:36 +0200 (CEST)
Received: from localhost ([::1]:47792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzfDH-0007V5-VM
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 06:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49882)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1hzfBu-0006cI-FM
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 06:47:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hzfBs-0005CZ-5q
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 06:47:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37510)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hzfBs-0005CE-0Q
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 06:47:08 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5453D19AD50C
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 10:47:07 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C126918944;
 Mon, 19 Aug 2019 10:47:06 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
In-Reply-To: <20190819095228.GC12960@redhat.com> ("Daniel P. =?utf-8?Q?Ber?=
 =?utf-8?Q?rang=C3=A9=22's?=
 message of "Mon, 19 Aug 2019 10:52:28 +0100")
References: <20190814020218.1868-1-quintela@redhat.com>
 <20190814020218.1868-7-quintela@redhat.com>
 <20190819095228.GC12960@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Mon, 19 Aug 2019 12:47:03 +0200
Message-ID: <87o90l300o.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Mon, 19 Aug 2019 10:47:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 6/6] RFH: We lost "connect" events
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Wed, Aug 14, 2019 at 04:02:18AM +0200, Juan Quintela wrote:
>> When we have lots of channels, sometimes multifd migration fails
>> with the following error:
>>=20
>> Any good ideas?
>
> In inet_listen_saddr() we call
>
>     if (!listen(slisten, 1)) {
>
> note the second parameter sets the socket backlog, which is the max
> number of pending socket connections we allow. My guess is that the
> target QEMU is not accepting incoming connections quickly enough and
> thus you hit the limit & the kernel starts dropping the incoming
> connections.
>
> As a quick test, just hack this code to pass a value of 100 and see
> if it makes your test reliable. If it does, then we'll need to figure
> out a nice way to handle backlog instead of hardcoding it at 1.

Nice.

With this change I can create 100 channels on a 4 core machine without
any trouble (5 tries so far).  Previously with 10 channels on the same
machine failed around 50% of the time, and 100 channels failed 100% of
the time.

How can we proceed from here?

Thanks, Juan.

