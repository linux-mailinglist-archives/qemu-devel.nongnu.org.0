Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE8D450806
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:16:00 +0100 (CET)
Received: from localhost ([::1]:54702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdiB-0004gT-Tz
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:15:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdfl-0001EJ-K5
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:13:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdfj-0001xY-DT
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:13:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636989206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iZHs4OqPW8teNdbYgaYv0F0SPWBNR2CAj1f+0klWULY=;
 b=gMFkGu3n0X47YD8XP1uTuQjDjnf3K0mQzSsmVvqj+U2A3HnknYPYTg8gG2hHxjuP4r6/xh
 qjU5QKoICd3qVUnvTG3ExYilru+nZMOEkiriKNAaSecPAie2D0B8Oa+KjnZlVPIt5Jzqo7
 uDn56pdxdXBwRWhHrS14XTUTH+T+XpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-LRjLg6kuNNmFQBT6yQgtIA-1; Mon, 15 Nov 2021 10:13:25 -0500
X-MC-Unique: LRjLg6kuNNmFQBT6yQgtIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D66D18D6A2E;
 Mon, 15 Nov 2021 15:13:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AA6819D9F;
 Mon, 15 Nov 2021 15:13:21 +0000 (UTC)
Date: Mon, 15 Nov 2021 16:13:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: does drive_get_next(IF_NONE) make sense?
Message-ID: <YZJ5ECLwOki4oblP@redhat.com>
References: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.gmail.com>
 <87r1bxzl5c.fsf@dusky.pond.sub.org>
 <e7ec3afc-6db9-822e-5a5e-dee7c4db8f34@redhat.com>
 <87pmr5cxbt.fsf@dusky.pond.sub.org>
 <CAFEAcA8sNjLsknea5Nt-tANEniFF2FYmjiV0xz=pr+vFwkX-gw@mail.gmail.com>
 <875ysunfwz.fsf@dusky.pond.sub.org> <YZJffhlo7I3sOqFs@redhat.com>
 <CAFEAcA_N6r81-0K6Y-qCdzyx67jzsSZnh-R8vYh2ZGZtAHpAAQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_N6r81-0K6Y-qCdzyx67jzsSZnh-R8vYh2ZGZtAHpAAQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.11.2021 um 14:31 hat Peter Maydell geschrieben:
> On Mon, 15 Nov 2021 at 13:24, Kevin Wolf <kwolf@redhat.com> wrote:
> > Same question as for Hao Wu's series: Wouldn't the proper solution be to
> > add a drive property to the machine type?
> >
> > If you can't use -blockdev, it's not done right.
> 
> Is there an example of "doing it right" for built-in-to-the-machine
> devices?
> 
> (My experience with the new-style options is that almost
> always they're designed for x86 where the device they're attached
> to is also created on the command line, and then handling of boards
> where the device is builtin is either an afterthought or forgotten.
> See also -netdev, where it took forever for built-in-ethernet to
> be usable.)

As long as we don't have a separate way to configure built-in devices
without creating them, for boards where the device is built in, the
properties for the device have to become machine properties.

I seem to remember that Markus implemented this for some boards.

Just doing without properties for these devices, either by just hard
coding things instead of providing options to the user, or by bypassing
the property system and accessing global state instead feels wrong.

Maybe once we have .instance_config (see my QOM/QAPI integration RFC),
forwarding these properties from -machine could actually become trivial,
just one call to set the properties for each built-in device. For now,
it's probably not as nice because each property needs to be forwarded
individually instead of just providing access to all properties of the
device.

Kevin


