Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBFB3F7C9A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 21:17:56 +0200 (CEST)
Received: from localhost ([::1]:39686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIyPL-0004SH-4H
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 15:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mIyOV-0003mo-FD
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 15:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mIyOS-00088D-Rm
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 15:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629919019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkObWBi9l8HL/AbeGFvRADINCLc5mjk9i3mtxOG9JTc=;
 b=YzXWQxks3FqePJAaHxaiAcmdBmj7bv96COYVRbyXdj95yiQYNAsI8HgQyPMxgrKt3BIoFW
 MJXKnAL8occZCwhuOkAKTep/TWFTVYpx8toc/t7J70t5Bx8MVgieQSyGjE6c88btxIgkZQ
 ujwSgl2wNfvLUSrg+WsOSZw+yNC8tpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-M63kDGihPPC9WdRJLqIGeA-1; Wed, 25 Aug 2021 15:16:55 -0400
X-MC-Unique: M63kDGihPPC9WdRJLqIGeA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BC9B107ACF5;
 Wed, 25 Aug 2021 19:16:54 +0000 (UTC)
Received: from redhat.com (ovpn-112-96.phx2.redhat.com [10.3.112.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9148E5F724;
 Wed, 25 Aug 2021 19:16:45 +0000 (UTC)
Date: Wed, 25 Aug 2021 14:16:43 -0500
From: Eric Blake <eblake@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 2/2] monitor: allow VNC related QMP and HMP commands to
 take a display ID
Message-ID: <20210825191643.lrgdf3t2l34vflzj@redhat.com>
References: <20210825093701.668122-1-s.reiter@proxmox.com>
 <20210825093701.668122-3-s.reiter@proxmox.com>
 <CAJ+F1CKf5icfpA4X_kHQQJGfiHj+dvct9OqEvtOQ2UD4WPCbtw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKf5icfpA4X_kHQQJGfiHj+dvct9OqEvtOQ2UD4WPCbtw@mail.gmail.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Reiter <s.reiter@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 25, 2021 at 02:59:06PM +0400, Marc-André Lureau wrote:
> > For HMP, this is a bit trickier, since at least 'set_password' already
> > has the 'connected' parameter following the mandatory 'password' one, so
> > we need to prefix the display ID with "id=" to allow correct parsing.
> >
> 
> It's not something done with other commands afaik, feels a bit awkward (the
> "connected = display"...).
> 
> Is it really necessary to add support for HMP?

What's more, we have explicitly documented that HMP is not stable.  We
don't need to bend over backwards to keep old HMP command lines
working if it is saner to just rearrange the command to our new
liking.  You could also supply the display via a flag argument
(set_password -d vnc2 password) instead of trying to place it in a
positional argument.

> > +++ b/hmp-commands.hx
> > @@ -1541,34 +1541,36 @@ ERST
> >
> >      {
> >          .name       = "set_password",
> > -        .args_type  = "protocol:s,password:s,connected:s?",
> > -        .params     = "protocol password action-if-connected",
> > +        .args_type  = "protocol:s,password:s,display:s?,connected:s?",
> > +        .params     = "protocol password [id=display]
> > [action-if-connected]",
> >          .help       = "set spice/vnc password",
> >          .cmd        = hmp_set_password,
> >      },
> >
> >  SRST
> > -``set_password [ vnc | spice ] password [ action-if-connected ]``
> > -  Change spice/vnc password.  Use zero to make the password stay valid
> > -  forever.  *action-if-connected* specifies what should happen in
> > +``set_password [ vnc | spice ] password [ id=display ] [
> > action-if-connected ]``
> > +  Change spice/vnc password.  *display* (must be prefixed with
> > +  'id=') can be used with 'vnc' to specify which display to set the
> > +  password on.  *action-if-connected* specifies what should happen in
> >    case a connection is established: *fail* makes the password change
> > -  fail.  *disconnect* changes the password and disconnects the
> > -  client.  *keep* changes the password and keeps the connection up.
> > -  *keep* is the default.
> > +  fail.  *disconnect* changes the password and disconnects the client.
> > +  *keep* changes the password and keeps the connection up.  *keep* is
> > +  the default.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


