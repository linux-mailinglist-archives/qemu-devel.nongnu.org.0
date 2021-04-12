Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A36635C93F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:53:41 +0200 (CEST)
Received: from localhost ([::1]:60970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxwa-0001N9-DX
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lVxuM-0008EV-Qt
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lVxuK-0000Cp-Un
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618239080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BUHDaIBJfGaEY6MCziThObH1ULoIIOsntI7ZHAqvmDs=;
 b=eCeosNzoDHyzAQCU7ZHbSsjVTDZuTM9yft3iephOTLVemXfTaHpAuiPiEBaYvygZQJOBNv
 z+BVg0dy7gaANnPNUnNj6yGq0MKKu/6rnLIeHSEpYv5Xp6gvuY/KqRoC+N/5TMvl3xPk5q
 wJOuxJOgJllGk2aEx2NvUcdGeK3CuAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-2qmCbR1UOo63-Ksoww1WEg-1; Mon, 12 Apr 2021 10:51:18 -0400
X-MC-Unique: 2qmCbR1UOo63-Ksoww1WEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6172100A24D
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 14:51:17 +0000 (UTC)
Received: from work-vm (ovpn-115-48.ams2.redhat.com [10.36.115.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CF6E5D6DC;
 Mon, 12 Apr 2021 14:51:12 +0000 (UTC)
Date: Mon, 12 Apr 2021 15:51:10 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH 0/5] mptcp support
Message-ID: <YHReXk6Hv7qF0Oqz@work-vm>
References: <20210408191159.133644-1-dgilbert@redhat.com>
 <YHAfpndcY5GRUYgN@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YHAfpndcY5GRUYgN@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: quintela@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, pabeni@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Thu, Apr 08, 2021 at 08:11:54PM +0100, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Hi,
> >   This RFC set adds support for multipath TCP (mptcp),
> > in particular on the migration path - but should be extensible
> > to other users.
> > 
> >   Multipath-tcp is a bit like bonding, but at L3; you can use
> > it to handle failure, but can also use it to split traffic across
> > multiple interfaces.
> > 
> >   Using a pair of 10Gb interfaces, I've managed to get 19Gbps
> > (with the only tuning being using huge pages and turning the MTU up).
> > 
> >   It needs a bleeding-edge Linux kernel (in some older ones you get
> > false accept messages for the subflows), and a C lib that has the
> > constants defined (as current glibc does).
> > 
> >   To use it you just need to append ,mptcp to an address;
> > 
> >   -incoming tcp:0:4444,mptcp
> >   migrate -d tcp:192.168.11.20:4444,mptcp
> 
> What happens if you only enable mptcp flag on one side of the
> stream (whether client or server), does it degrade to boring
> old single path TCP, or does it result in an error ?

I've just tested this and it matches what pabeni said; it seems to just
fall back.

> >   I had a quick go at trying NBD as well, but I think it needs
> > some work with the parsing of NBD addresses.
> 
> In theory this is applicable to anywhere that we use sockets.
> Anywhere that is configured with the QAPI  SocketAddress /
> SocketAddressLegacy type will get it for free AFAICT.

That was my hope.

> Anywhere that is configured via QemuOpts will need an enhancement.
> 
> IOW, I would think NBD already works if you configure NBD via
> QMP with nbd-server-start, or block-export-add.  qemu-nbd will
> need cli options added.
> 
> The block layer clients for NBD, Gluster, Sheepdog and SSH also
> all get it for free when configured va QMP, or -blockdev AFAICT

Have you got some examples via QMP?
I'd failed trying -drive if=virtio,file=nbd://192.168.11.20:3333,mptcp=on/zero

> Legacy blocklayer filename syntax would need extra parsing, or
> we can just not bother and say if you want new features, use
> blockdev.
> 
> 
> Overall this is impressively simple.

Yeh; lots of small unexpected tidyups that took a while to fix.

> It feels like it obsoletes the multifd migration code, at least
> if you assume Linux platform and new enough kernel ?
>
> Except TLS... We already bottleneck on TLS encryption with
> a single FD, since userspace encryption is limited to a
> single thread.

Even without TLS we already run out of CPU, probably on the receiving
thread at around 20Gbps; which is a bit meh, compared to multifd which
I have seen hit 80Gbps on a particularly well greased 100Gbps
connection.
Curiously my attempts with multifd+mptcp so far have it being slower
than with just mptcp on it's own, not hitting the 20Gbps - not sure why
yet.

> There is the KTLS feature which offloads TLS encryption/decryption
> to the kernel. This benefits even regular single FD performance,
> because the encrytion work can be done by the kernel in a separate
> thread from the userspace IO syscalls.
> 
> Any idea if KTLS is fully compatible with MPTCP ?  If so, then that
> would look like it makes it a full replacementfor multifd on Linux.

I've not tried kTLS at all yet; as pabeni says, not currently
compatible.
The otherones I'd like to try are zero-copy offload receive/transmit
(again I'm not sure those are compatible).

Dave

> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


