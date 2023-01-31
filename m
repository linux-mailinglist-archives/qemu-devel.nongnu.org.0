Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5D3682B7D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:31:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMopp-0005fb-3M; Tue, 31 Jan 2023 06:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMopl-0005ez-MQ
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 06:29:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMopj-0005Er-81
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 06:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675164590;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OIwUkBAyxvYnei4DAZisblCmyYwjwL+RzqBes2xFjjA=;
 b=Qt2LNxPmvSmlgagwWsopZD7sx5gC6MFkPskJVECJPWnmyxZwwAD7dvMbkTLQMsGttnT6kS
 DkgSSzhxWSXE92nEaBcKwqNTSbh9UBuhkNNoOIXKSI+FmUj36ENeKdbLYz1bkqru7rhbPP
 14Rn4EHFaqzjQhmwT7c6h4FaOrf4erc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-Jf11AW3nNRGKdVKfFXi4Rg-1; Tue, 31 Jan 2023 06:29:47 -0500
X-MC-Unique: Jf11AW3nNRGKdVKfFXi4Rg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF7383C0F662;
 Tue, 31 Jan 2023 11:29:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C68812166B34;
 Tue, 31 Jan 2023 11:29:45 +0000 (UTC)
Date: Tue, 31 Jan 2023 11:29:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, rjones@redhat.com
Subject: Re: RFC: towards systemd socket activation in q-s-d
Message-ID: <Y9j7p1f95w6ophk4@redhat.com>
References: <20230127212233.k6rlqkmubhovjxs4@redhat.com>
 <Y9fa+Zm5VLNoDDo0@redhat.com> <Y9j4s2BsX3vxs8Ek@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9j4s2BsX3vxs8Ek@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 31, 2023 at 12:17:07PM +0100, Kevin Wolf wrote:
> Am 30.01.2023 um 15:58 hat Daniel P. Berrangé geschrieben:
> > > I'm at a point where I can take a shot at implementing this, but want
> > > some feedback on whether it is better to try to shoehorn a generic
> > > solution into the existing @fd member of the SocketAddressType union,
> > > or whether it would be better to add yet another union member
> > > @systemd-fd or some similar name to make it explicit when a command
> > > line parameter wants to refer to an fd being passed through systemd
> > > socket activation LISTEN_FDS and friends.
> > 
> > I don't think we should change SocketAddress at all, just use the
> > @fd member that already exists, by fixing its semantics to always
> > take an alphanumeric FD name and deprecate the use of pure numeric
> > FD numbers.
> 
> So you're suggesting that socket activation FDs automagically show up as
> named FDs in QEMU?

Yep.

> It's just a gut feeling, but it feels a bit like one of those convenient
> shortcuts that we later regretted. So far named FDs are those that the
> user explicitly created using QMP. Implicitly adding in additional ones
> from another source might be trying to treat two different things the
> same - you could even consider them being from two different namespaces.
> 
> This is why I would have considered a new SocketAddress variant the safe
> default.

I would say that both 'getfd' and 'LISTEN_FDS' are explicitly controlled
by the user who owns the QEMU process. The former case the user has to
talk QMP, the latter case the user has to configure systemd units (or
an compatible impl). In both cases the user gets a free choice overing
the names associated with the FDs, though systemd gives some default
naming if the user doesn't specify a choice themselves.

> > Currently the socket code has an annoying structural connection
> > to the monitor code, because the monitor is tracking the passed
> > in FDs.
> 
> Do we intend socket activation FDs do work with the same operations as
> named FDs created with 'getfd'? In particular, I suppose 'closefd' would
> still make sense, and referring to the FD should work in the same way,
> too. This might be an argument in favour of treating it as a named FD
> like you suggest, because then the only different thing about it is that
> it magically shows up with a name coming from systemd rather than QMP.

Yeah, closefd and anything else that consumes thue result of 'getfd'
ought to continue to work.

> > It would be nice to separate this by introducing some dedicated
> > APIs for handling named FDs. The monitor can feed named FDs into
> > this from getfd, and the CLI can feed named FDS into this from
> > activation.   The socket code can then use these named FD handling
> > APIs and thus isolate/detach itself from the monitor.
> 
> That structure would make sense to me, even without adding socket
> activation.
> 
> Do we have places where we would potentially use the file descriptor in
> other ways than referring to it in a SocketAddress(Legacy)? If we do,
> then covering socket activation at the file descriptor level is pretty
> much a requirement.

getfd works in combination with socket FDs and thus SocketAddress.

We also have the add-fd QMP command which passes in file/block/char
based FDs that populate the /dev/fdset/NN  namespace, and thus used
by qemu_open().  Socket activation wouldn't overlap with this, since
as its name suggests the passed FDs are only targetting stream based
FDs, aka sockets or named FIFOs.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


