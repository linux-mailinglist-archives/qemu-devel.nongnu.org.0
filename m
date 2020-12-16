Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264CF2DC1CB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 15:05:06 +0100 (CET)
Received: from localhost ([::1]:49172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXQK-0003VR-JC
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 09:05:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpXFg-0003I9-Sq
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:54:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpXFe-0000Lb-2E
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608126836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Reg8FWUM/qCQf44wJxrmj9XdPZ/2+KCZBHGt7xPUQmg=;
 b=E/hfVx3SBNYD4sWiBq9zQTehOSa0zD8pRfeQBRlh8CVLO8vqA2DgXNGFkc4yGSLKDkIaqb
 VtXJNYptZodcGRbpVRC12CIidkF2MphJ3m8/mEDmce3hjuaKH/YT/a1UHAcS2U1wksEkiY
 Zo36v/AG1ANyNc4jFyfwVGxUhEyaWEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-O6_yjR08Pm6zSIGl4aL2PA-1; Wed, 16 Dec 2020 08:53:54 -0500
X-MC-Unique: O6_yjR08Pm6zSIGl4aL2PA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85C34107ACE3;
 Wed, 16 Dec 2020 13:53:53 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68CD660C15;
 Wed, 16 Dec 2020 13:53:52 +0000 (UTC)
Date: Wed, 16 Dec 2020 14:53:50 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: David Edmondson <dme@dme.org>
Subject: Re: [PATCH] block: report errno when flock fcntl fails
Message-ID: <20201216135350.GE7548@merkur.fritz.box>
References: <20201215190127.1765595-1-david.edmondson@oracle.com>
 <20201216112940.GB7548@merkur.fritz.box>
 <cunwnxit1yn.fsf@zarquon.hh.sledj.net>
 <20201216115746.GC7548@merkur.fritz.box>
 <cuntusluch1.fsf@zarquon.hh.sledj.net>
MIME-Version: 1.0
In-Reply-To: <cuntusluch1.fsf@zarquon.hh.sledj.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.12.2020 um 14:06 hat David Edmondson geschrieben:
> On Wednesday, 2020-12-16 at 12:57:46 +01, Kevin Wolf wrote:
> 
> > Am 16.12.2020 um 12:38 hat David Edmondson geschrieben:
> >> On Wednesday, 2020-12-16 at 12:29:40 +01, Kevin Wolf wrote:
> >> 
> >> > Am 15.12.2020 um 20:01 hat David Edmondson geschrieben:
> >> >> When a call to fcntl(2) for the purpose of manipulating file locks
> >> >> fails, report the error returned by fcntl.
> >> >> 
> >> >> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> >> >
> >> > Is appending "Resource temporarily unavailable" in the common case (a
> >> > file locked by another process) actually an improvement for the message
> >> > or more confusing? It would be good to mention the motivation for the
> >> > change in the commit message.
> >> 
> >> Distinguishing between the common case and others is at least a start
> >> when trying to figure out why it failed. We have potentially useful
> >> information to assist in diagnosis, why throw it away?
> >
> > I agree in principle, just when I saw the result, it felt more confusing
> > than helpful. Maybe the best option would be to include the errno only
> > if it's different from EAGAIN? Then the qemu-iotests reference output
> > would probably stay unchanged, too.
> 
> This is a pretty low-level error report even today - unless you
> understand the implementation then it doesn't shout "the file is being
> shared".

Hm, certainly true for raw_apply_lock_bytes(), which shouldn't normally
fail, so I agree that we don't need to simplify messages there.

From raw_check_lock_bytes(), you get messages like 'Failed to get
"write" lock', which I think is fairly obvious? I'm not saying that it's
perfect and couldn't be improved, of course, but it doesn't feel
horrible.

> Given that, I don't see any value in eliding the EAGAIN message, as I
> have to know that the lack of the errno string means that it was EAGAIN,
> meaning that another process holds a lock.

When you debug an error, you'll look at the code anyway. And a normal
user won't know what EAGAIN or "Resource temporarily unavailable" means
even if it's displayed. Temporarily sounds more like it will go away by
itself, not that I have to shut down a different process first.

I wonder if anyone else has an opinion on this? If people think that
displaying it is preferable or it doesn't matter much, we can add it
despite my concerns.

Kevin


