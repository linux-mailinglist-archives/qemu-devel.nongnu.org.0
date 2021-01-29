Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B230890B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:24:14 +0100 (CET)
Received: from localhost ([::1]:34032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Sov-0006tn-CP
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:24:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Smd-0005Dr-7R
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:21:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Smb-0007Li-Dj
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611922907;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=trspwgWqicUjObI+/ilPkerypKs4HtEjbjCXDHvd710=;
 b=ORh3A3GLZQ5qqvsYKze9gWaelOoSmf/9bOus7gUmkfmifh/IBxCfOevtPmcmd0mHEsQLWe
 YZfh88ZKkzvZ5AdTKUSM9CorYBOifbGaRGouyEZkrx6Q2eqM/p4RVFN+5n7l2mZtKANlL9
 mz8xlFbSbxMuoJZyvMZTbSJDG2EI/Jc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-fAfB1avmP1SoNzYSrSfEGA-1; Fri, 29 Jan 2021 07:21:46 -0500
X-MC-Unique: fAfB1avmP1SoNzYSrSfEGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 342518030B6;
 Fri, 29 Jan 2021 12:21:45 +0000 (UTC)
Received: from redhat.com (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 113D710016FE;
 Fri, 29 Jan 2021 12:21:39 +0000 (UTC)
Date: Fri, 29 Jan 2021 12:21:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: vnc clipboard support
Message-ID: <20210129122137.GA4008275@redhat.com>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
 <20210129112412.GH4001740@redhat.com>
 <CAJ+F1CLerj6GSN-XQftZf8m=_cCdcJb1Yn-yFGDNP_D18uN5FA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLerj6GSN-XQftZf8m=_cCdcJb1Yn-yFGDNP_D18uN5FA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 03:58:00PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Jan 29, 2021 at 3:24 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Fri, Jan 29, 2021 at 12:18:19AM +0400, Marc-André Lureau wrote:
> > can have QEMU open the vsock device internally, it feels a bit silly to
> > have one part of QEMU writing to a vsock device, and then another part
> > of QEMU reading back from the very same device. Especially because you
> > have now introduced the extra problem of having to allocate unique
> > vsock addresses for each instance and deal with possibility of external
> > apps maliciously trying to interact with your vsock backend.
> >
> > As above though, I think the way spice used virtio-serial was suboptimal
> > and it should have had one extra virtio-serial device per seat.
> 
> And per service? and libvirt to hotplug stuff? Sounds insane to me.
> And what about services that need to handle several connections in the
> guest. For example, the way spice-webdavd works is really a pain, it
> has to multiplex guest connections over virtio-serial... All of this
> would be so much simpler with a single vsock connection and some kind
> of bus.

I wasn't really suggesting it for something like spice-webdavd, just
the spice agent functionality, which is not really connection-oriented
stuff. ie its a simple RPC like service where there's only ever one
client and server endpoint.  spice-webdavd would clearly be better
based on vsock, since it is inherantly a multi-connection architecture.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


