Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7DF37AE27
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 20:12:55 +0200 (CEST)
Received: from localhost ([::1]:46410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgWsI-0003mk-EJ
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 14:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lgWqH-0002oU-1G
 for qemu-devel@nongnu.org; Tue, 11 May 2021 14:10:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lgWqC-0004mm-Bt
 for qemu-devel@nongnu.org; Tue, 11 May 2021 14:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620756643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lF3vY/KEGXJDiPsAYoUoqP6o5uOY/Bi5f80NngmISwU=;
 b=aXbxeI5Pa+Xn1eLJ1jB3ltV3tcR3tE59/DKsHjL6sDSRR3XSHdALt5pbWXvAiHAaInLOGh
 IFljvTY40w/wUuV+tkxPtkdQV3F4BBDtIIM5Z1on+LCa6+Bhf2fNtxuPXfFZnQU7eSS0Ak
 i8P1R8JptbUdZZNvSLbXt7nLZzjL+wA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-IUmJETy9P4ioz5wEBtz5Aw-1; Tue, 11 May 2021 14:10:37 -0400
X-MC-Unique: IUmJETy9P4ioz5wEBtz5Aw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF3F9FCA3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 18:10:36 +0000 (UTC)
Received: from localhost (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 581EC2CE01;
 Tue, 11 May 2021 18:10:24 +0000 (UTC)
Date: Tue, 11 May 2021 19:10:23 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog
Message-ID: <20210511181023.GS26415@redhat.com>
References: <20210310173004.420190-1-stefanha@redhat.com>
 <YFB17aYnCZlyp8b4@stefanha-x1.localdomain>
 <2e7bb28d-0b3c-ac69-7984-687d4ee487c7@redhat.com>
 <YJo+7m9mBB6AEX1y@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YJo+7m9mBB6AEX1y@stefanha-x1.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>, Juan Quintela <quintela@redhat.com>,
 kraxel@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 09:23:10AM +0100, Stefan Hajnoczi wrote:
> On Tue, Mar 16, 2021 at 08:35:14AM -0500, Eric Blake wrote:
> > On 3/16/21 4:10 AM, Stefan Hajnoczi wrote:
> > > On Wed, Mar 10, 2021 at 05:30:04PM +0000, Stefan Hajnoczi wrote:
> > >> socket_get_fd() fails with the error "socket_get_fd: too many
> > >> connections" if the given listen backlog value is not 1.
> > >>
> > >> Not all callers set the backlog to 1. For example, commit
> > >> 582d4210eb2f2ab5baac328fe4b479cd86da1647 ("qemu-nbd: Use SOMAXCONN for
> > >> socket listen() backlog") uses SOMAXCONN. This will always fail with in
> > >> socket_get_fd().
> > >>
> > >> This patch calls listen(2) on the fd to update the backlog value. The
> > >> socket may already be in the listen state. I have tested that this works
> > >> on Linux 5.10 and macOS Catalina.
> > >>
> > >> As a bonus this allows us to detect when the fd cannot listen. Now we'll
> > >> be able to catch unbound or connected fds in socket_listen().
> > >>
> > >> Drop the num argument from socket_get_fd() since this function is also
> > >> called by socket_connect() where a listen backlog value does not make
> > >> sense.
> > >>
> > >> Fixes: e5b6353cf25c99c3f08bf51e29933352f7140e8f ("socket: Add backlog parameter to socket_listen")
> > >> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> > >> Cc: Juan Quintela <quintela@redhat.com>
> > >> Cc: Eric Blake <eblake@redhat.com>
> > >> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > >> ---
> > >>  util/qemu-sockets.c | 29 ++++++++++++++++++++++-------
> > >>  1 file changed, 22 insertions(+), 7 deletions(-)
> > > 
> > > Dan and Gerd: Can this go via one of your trees?
> > > 
> > 
> > As it showed up as a regression in qemu-nbd, I can also consider queuing
> > it in my NBD tree.  However, I claim it counts as a bug fix, so it is
> > fine for -rc1 even if it misses soft freeze.
> > 
> > I'm fine whichever maintainer takes this, although I've now flagged it
> > to go through an NBD pull request if it doesn't land elsewhere sooner.
> 
> Ping? I didn't see this land in qemu.git.

I notice this patch also fixes:

https://gitlab.com/qemu-project/qemu/-/issues/218

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/


