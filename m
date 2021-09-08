Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFBC4040C9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 23:58:54 +0200 (CEST)
Received: from localhost ([::1]:50840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO5al-0002Oq-J6
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 17:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mO5Zr-0001j8-9E
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 17:57:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mO5Zb-0006yY-NY
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 17:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631138257;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WC5cvpfWdh+e9j5IVXrFves3DbkvURF/iUIZleuJ3CQ=;
 b=KM5mDYe3z71muljNrz6+GpbBV0OosfC833sBSV+epexAjWmDqGXPx3EkGFvA8nUKfGuL6S
 xElgih2xTMlLwGll3Jo9Rp/S1xsz2wA1Ev5yDXFvuRs5DkZ2s0jGxEyrYw1f1XmH3OwFSR
 26RSN8F0Qyq9WTrAjz/0LpjQWPSvGb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-LOQX1o8nPY6sqBWoxbcr9w-1; Wed, 08 Sep 2021 17:57:23 -0400
X-MC-Unique: LOQX1o8nPY6sqBWoxbcr9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2ED88010F4;
 Wed,  8 Sep 2021 21:57:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BCF2188E4;
 Wed,  8 Sep 2021 21:57:08 +0000 (UTC)
Date: Wed, 8 Sep 2021 22:57:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YTkrHUMMV0xDmHCU@redhat.com>
References: <YS4nPfEBCy9IC3rd@redhat.com>
 <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
 <YTCPngNB+l70sl06@redhat.com>
 <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
 <YTCeNCEmr3NsQEPR@redhat.com>
 <CAJ6HWG6D61K49gyvfLo2c5=cZpkYh96ciZjO5V=wiPdG+wB5zQ@mail.gmail.com>
 <YTCnP9J/JINhg4h8@redhat.com> <YTdHpx263WNe7nuZ@work-vm>
 <CAJ6HWG6L1LOec6yMY1oxFjbjhAv4LK6beS5FmU=g_s4h2+7ouA@mail.gmail.com>
 <YTkmjdsY1ZkBnVdS@t490s>
MIME-Version: 1.0
In-Reply-To: <YTkmjdsY1ZkBnVdS@t490s>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.393, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 05:09:33PM -0400, Peter Xu wrote:
> On Wed, Sep 08, 2021 at 05:25:50PM -0300, Leonardo Bras Soares Passos wrote:
> > On Tue, Sep 7, 2021 at 8:06 AM Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > > > Possibly, yes. This really need David G's input since he understands
> > > > the code in way more detail than me.
> > >
> > > Hmm I'm not entirely sure why we have the sync after each iteration;
> > > the case I can think of is if we're doing async sending, we could have
> > > two versions of the same page in flight (one from each iteration) -
> > > you'd want those to get there in the right order.
> > >
> > > Dave
> > 
> > Well, that's the thing: as we don't copy the buffer in MSG_ZEROCOPY,  we will in
> > fact have the same page in flight twice, instead of two versions,
> > given the buffer is
> > sent as it is during transmission.
> 
> That's an interesting point, which looks even valid... :)
> 
> There can still be two versions depending on when the page is read and feed to
> the NICs as the page can be changing during the window, but as long as the
> latter sent page always lands later than the former page on dest node then it
> looks ok.

The really strange scenario is around TCP re-transmits. The kernel may
transmit page version 1, then we have version 2 written. The kerenl now
needs to retransmit a packet due to network loss. The re-transmission will
contain version 2 payload which differs from the originally lost packet's
payload.

IOW, the supposed "reliable" TCP stream is no longer reliable and actually
changes its data retrospectively because we've intentionally violated the
rules the kernel documented for use of MSG_ZEROCOPY.

We think we're probably ok with migration as we are going to rely on the
face that we eventually pause the guest to stop page changes during the
final switchover. None the less I really strongly dislike the idea of
not honouring the kernel API contract, despite the potential performance
benefits it brings.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


