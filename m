Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99956656EF
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 10:08:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFX5T-0004Q2-4O; Wed, 11 Jan 2023 04:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFX5P-0004Pa-2a
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:07:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFX5M-0001us-8H
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673428071;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omwtEaJtZFb8DJIaLR8ACKkfwK5/R8zOG+fXBlhVVJE=;
 b=R+hZNv69RHYWpn05ZPcgOAg1Lgk5I8eqlCrRdOIAyuO7OEMpkpAAOMOh9E4YXcV/DOGyfj
 qtJk29iFg1aMFc/6VtGMN/a86xju9lVAFNRfzzFpVGGcqTPgXax9u6wWLFdbBQDK8FNrUB
 JvX7CEK/E0UPDtpHV9V0Wz+8X2OZjns=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-9uIhLgkcMGmp-behMZhqdA-1; Wed, 11 Jan 2023 04:07:50 -0500
X-MC-Unique: 9uIhLgkcMGmp-behMZhqdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 055B61C0A59F;
 Wed, 11 Jan 2023 09:07:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36AC4401530C;
 Wed, 11 Jan 2023 09:07:47 +0000 (UTC)
Date: Wed, 11 Jan 2023 09:07:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Peter Delevoryas <peter@pjd.dev>, crosa@redhat.com, bleal@redhat.com,
 philmd@linaro.org, wainersm@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 1/1] python/machine: Fix AF_UNIX path too long on macOS
Message-ID: <Y758YAboUihlFNMF@redhat.com>
References: <20230110080756.38271-1-peter@pjd.dev>
 <20230110080756.38271-2-peter@pjd.dev>
 <CAFn=p-astqzr2vW0f3p9_36OfpiYJ1HXZRTLQDEdO7_F4g95hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-astqzr2vW0f3p9_36OfpiYJ1HXZRTLQDEdO7_F4g95hQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 10, 2023 at 06:18:29PM -0500, John Snow wrote:
> On Tue, Jan 10, 2023 at 3:34 AM Peter Delevoryas <peter@pjd.dev> wrote:
> >
> > On macOS, private $TMPDIR's are the default. These $TMPDIR's are
> > generated from a user's unix UID and UUID [1], which can create a
> > relatively long path:
> >
> >     /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> >
> > QEMU's avocado tests create a temporary directory prefixed by
> > "avo_qemu_sock_", and create QMP sockets within _that_ as well.
> > The QMP socket is unnecessarily long, because a temporary directory
> > is created for every QEMUMachine object.
> >
> >     /avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock
> >
> > The path limit for unix sockets on macOS is 104: [2]
> >
> >     /*
> >      * [XSI] Definitions for UNIX IPC domain.
> >      */
> >     struct  sockaddr_un {
> >         unsigned char   sun_len;        /* sockaddr len including null */
> >         sa_family_t     sun_family;     /* [XSI] AF_UNIX */
> >         char            sun_path[104];  /* [XSI] path name (gag) */
> >     };
> >
> > This results in avocado tests failing on macOS because the QMP unix
> > socket can't be created, because the path is too long:
> >
> >     ERROR| Failed to establish connection: OSError: AF_UNIX path too long
> >
> > This change resolves by reducing the size of the socket directory prefix
> > and the suffix on the QMP and console socket names.
> >
> > The result is paths like this:
> >
> >     pdel@pdel-mbp:/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T
> >     $ tree qemu*
> >     qemu_df4evjeq
> >     qemu_jbxel3gy
> >     qemu_ml9s_gg7
> >     qemu_oc7h7f3u
> >     qemu_oqb1yf97
> >     ├── 10a004050.con
> >     └── 10a004050.qmp
> >
> > [1] https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-directory-in-weird-path
> > [2] /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/un.h
> >
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> 
> I'm tentatively staging this with a benefit-of-the-doubt [1] -- my
> tests are still running -- but I do have a question:
> 
> > ---
> >  python/qemu/machine/machine.py         | 6 +++---
> >  tests/avocado/avocado_qemu/__init__.py | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> > index 748a0d807c9d..d70977378305 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -157,7 +157,7 @@ def __init__(self,
> >          self._wrapper = wrapper
> >          self._qmp_timer = qmp_timer
> >
> > -        self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
> > +        self._name = name or f"{id(self):x}"
> 
> Why is it safe to not differentiate based on the process ID?
> 
> ... I suppose the thinking is: by default, in machine.py, this is a
> temp dir created by tempfile.mkdtemp which will be unique per-process.
> I suppose there's no protection against a caller supplying the same
> tempdir (or sockdir) to multiple instances, but I suppose in those
> cases we get to argue that "Well, don't do that, then."

Every process will have a separate tempdir, and if there are
multiple instances of this class, 'id(self)' will provide
uniqueness within the process.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


