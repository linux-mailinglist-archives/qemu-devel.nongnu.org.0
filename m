Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE95E3696D0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 18:22:58 +0200 (CEST)
Received: from localhost ([::1]:51354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZya2-00086S-2g
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 12:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lZyYy-0007b4-8d
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:21:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lZyYs-0002eV-CG
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619194905;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OgR6UzHYVdTRACXs8EMuGSBpjTS5NTlK9ikt/I+7LJ4=;
 b=P6C7MSb0oFEz8donzw0SQIHMI5HcvWWf1GjKcPJFD5JKB5brqjslReYk+3ytsTVL9xthnV
 6bVuT5bHproZRv9/QMDE+n8eXsl7RTV8y1pFWwGYH2q5XBBy007DMAJNEF49CVs7HWTRev
 GVPQZf0kKmIdzbp7x3g2Ltery0WuvWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-BoTudhrWMyaErNeGlv5r5g-1; Fri, 23 Apr 2021 12:21:43 -0400
X-MC-Unique: BoTudhrWMyaErNeGlv5r5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D8DE18B9ED7;
 Fri, 23 Apr 2021 16:21:42 +0000 (UTC)
Received: from redhat.com (ovpn-115-186.ams2.redhat.com [10.36.115.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C3C760BE5;
 Fri, 23 Apr 2021 16:21:41 +0000 (UTC)
Date: Fri, 23 Apr 2021 17:21:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefano Brivio <sbrivio@redhat.com>
Subject: Re: socket.c added support for unix domain socket datagram transport
Message-ID: <YIL0Ehmfgc1J9Ci9@redhat.com>
References: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
 <20210423172940.14f48b49@elisabeth>
MIME-Version: 1.0
In-Reply-To: <20210423172940.14f48b49@elisabeth>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Ralph Schmieder <ralph.schmieder@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 23, 2021 at 05:29:40PM +0200, Stefano Brivio wrote:
> Hi Ralph,
> 
> On Fri, 23 Apr 2021 08:56:48 +0200
> Ralph Schmieder <ralph.schmieder@gmail.com> wrote:
> 
> > Hey...  new to this list.  I was looking for a way to use Unix domain
> > sockets as a network transport between local VMs.
> > 
> > I'm part of a team where we run dozens if not hundreds of VMs on a
> > single compute instance which are highly interconnected.
> > 
> > In the current implementation, I use UDP sockets (e.g. something like 
> > 
> > -netdev
> > id=bla,type=socket,udp=localhost:1234,localaddr=localhost:5678) 
> > 
> > which works great.
> > 
> > The downside of this approach is that I need to keep track of all the
> > UDP ports in use and that there's a potential for clashes.  Clearly,
> > having Unix domain sockets where I could store the sockets in the
> > VM's directory would be much easier to manage.
> > 
> > However, even though there is some AF_UNIX support in net/socket.c,
> > it's
> > 
> > - not configurable
> > - it doesn't work
> 
> I hate to say this, but I've been working on something very similar
> just in the past days, with the notable difference that I'm using
> stream-oriented AF_UNIX sockets instead of datagram-oriented.
> 
> I have a similar use case, and after some experiments I picked a
> stream-oriented socket over datagram-oriented because:
> 
> - overhead appears to be the same
> 
> - message boundaries make little sense here -- you already have a
>   32-bit vnet header with the message size defining the message
>   boundaries
> 
> - datagram-oriented AF_UNIX sockets are actually reliable and there's
>   no packet reordering on Linux, but this is not "formally" guaranteed
> 
> - it's helpful for me to know when a qemu instance disconnects for any
>   reason

The current IP socket impl for the net socket backend uses SOCK_DGRAM,
so from a consistency POV it feels sensible todo the same for UNIX
sockets too.

None the less, your last point in particular about wanting to know
about disconnects feels valid, and if its useful to you for UNIX
sockets, then it ought to be useful for IP sockets too.

IOW, I wonder if  we should use DGRAM for UNIX sockets too by default
to match current behaviour, but then also add a CLI option that allows
choice of DGRAM vs STREAM, and wire that up for IP & UNIX sockets.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


