Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5F457DB30
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 09:24:47 +0200 (CEST)
Received: from localhost ([::1]:47132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEn1h-0007PZ-PJ
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 03:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEmxa-0004Qv-8q
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 03:20:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEmxV-0006fP-MY
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 03:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658474424;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oiTvm6hnxQzGQ5l4LmwtMVH7HOVH1pTvETNmC25udFY=;
 b=eWsnEMqnBsC/pcxz8MW6pplQ9RaR2Tzo/Z/PNYWJR9enl1UoHdaZdxwRiKyvcgzseQxw5c
 BPDFMev4WhR12L7Qog8/Yd/47JC2dzykeHWXCycCfTHzhP+Z+U/SkFzqXWYTh4AvUWXG+U
 y21COUbrSbi72k3rMYSJfX1XpbVYl/M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-r4s236RCNTCWyuacqPEPzg-1; Fri, 22 Jul 2022 03:20:17 -0400
X-MC-Unique: r4s236RCNTCWyuacqPEPzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 094F9811E81;
 Fri, 22 Jul 2022 07:20:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B60740E8B04;
 Fri, 22 Jul 2022 07:20:14 +0000 (UTC)
Date: Fri, 22 Jul 2022 08:20:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Delevoryas <peter@pjd.dev>
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, f4bug@amsat.org,
 wainersm@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/1] python/machine: Fix AF_UNIX path too long on macOS
Message-ID: <YtpPltJi/tl5mlBb@redhat.com>
References: <20220716173434.17183-1-peter@pjd.dev>
 <20220716173434.17183-2-peter@pjd.dev>
 <YtUgMTYSQjm9O+u4@redhat.com> <YtoPBYGmSNfeT1Ot@pdel-mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YtoPBYGmSNfeT1Ot@pdel-mbp>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 21, 2022 at 07:44:21PM -0700, Peter Delevoryas wrote:
> On Mon, Jul 18, 2022 at 09:56:17AM +0100, Daniel P. Berrangé wrote:
> > On Sat, Jul 16, 2022 at 10:34:34AM -0700, Peter Delevoryas wrote:
> > > On macOS, private $TMPDIR's are the default. These $TMPDIR's are
> > > generated from a user's unix UID and UUID [1], which can create a
> > > relatively long path:
> > > 
> > >     /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> > > 
> > > QEMU's avocado tests create a temporary directory prefixed by
> > > "avo_qemu_sock_", and create QMP sockets within _that_ as well.
> > > The QMP socket is unnecessarily long, because a temporary directory
> > > is created for every QEMUMachine object.
> > > 
> > >     /avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock
> > 
> > 
> > Looking at this again, I realize my suggestion for dealing with the
> > second part of the path was mistaken.
> > 
> > The "qemu-37331-10bacf110-monitor.sock" part is combining two
> > pieces.
> > 
> > First the result of
> > 
> >   f"qemu-{os.getpid()}-{id(self):02x}"
> > 
> > is
> > 
> >   qemu-37331-10bacf110
> > 
> > and the code later than appends '-monitor.sock'
> > 
> > So...
> > 
> > > 
> > > The path limit for unix sockets on macOS is 104: [2]
> > > 
> > >     /*
> > >      * [XSI] Definitions for UNIX IPC domain.
> > >      */
> > >     struct  sockaddr_un {
> > 
> > >         unsigned char   sun_len;        /* sockaddr len including null */
> > >         sa_family_t     sun_family;     /* [XSI] AF_UNIX */
> > >         char            sun_path[104];  /* [XSI] path name (gag) */
> > >     };
> > > 
> > > This results in avocado tests failing on macOS because the QMP unix
> > > socket can't be created, because the path is too long:
> > > 
> > >     ERROR| Failed to establish connection: OSError: AF_UNIX path too long
> > > 
> > > This change reduces the size of both paths, and removes the unique
> > > identification information from the socket name, since it seems to be
> > > unnecessary.
> > > 
> > > This commit produces paths like the following:
> > > 
> > >     pdel@pdel-mbp:/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T
> > >     $ tree qemu*
> > >     qemu_oc7h7f3u
> > >     ├── qmp-console.sock
> > >     └── qmp-monitor.sock
> > > 
> > > [1] https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-directory-in-weird-path
> > > [2] /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/un.h
> > > 
> > > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > > ---
> > >  python/qemu/machine/machine.py         | 2 +-
> > >  tests/avocado/avocado_qemu/__init__.py | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> > > index 37191f433b..b1823966b3 100644
> > > --- a/python/qemu/machine/machine.py
> > > +++ b/python/qemu/machine/machine.py
> > > @@ -157,7 +157,7 @@ def __init__(self,
> > >          self._wrapper = wrapper
> > >          self._qmp_timer = qmp_timer
> > >  
> > > -        self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
> > > +        self._name = name or "qmp"
> > 
> > ...my suggestion here was wrong.
> > 
> > We don't need the os.getpid() unoiqueness because the tmpdir already
> > ensures that is safe, but keeping 'id(self)' is a good idea, if the
> > test case creates multiple machines concurrently. Bearing in mind we
> > later append '-monitor.sock' we don't need 'qmp' in the self._name.
> > 
> > So on reflection I think I should have suggested using:
> > 
> >     self._name = name or f"{id(self):02x}"
> > 
> > And *in addition*, a few lines later change:
> > 
> >             self._monitor_address = os.path.join(
> >                 self.sock_dir, f"{self._name}-monitor.sock"
> >             )
> > 
> > To
> > 
> >             self._monitor_address = os.path.join(
> >                 self.sock_dir, f"{self._name}.qmp"
> >             )
> >
> 
> Finally getting back to this (sorry, been working on other stuff), and I noticed
> the console socket is just below this:
> 
>     self._console_address = os.path.join(
>         self.sock_dir, f"{self._name}-console.sock"
>     )
> 
> So I probably shouldn't do the "-monitor.sock" change right?

I'd suggest changing this one to   f"{self._name}.con" at the
same time.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


