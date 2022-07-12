Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8689657149D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:31:22 +0200 (CEST)
Received: from localhost ([::1]:32850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBBIf-00020d-Bi
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBB4N-0003tt-0w
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBB4J-0003aw-9j
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657613789;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v8Q59z7lXwELwSLW6IuQkvjbMPEslUx5yk3lEg/ZkcI=;
 b=fkUapW7O+9OSl+O1KqBYoRp8/AxQ25teJCtvVrSQYUtxGvF7XQpoH/5TMQ+xq9BfoGNLU7
 8ZMe9V+ryXNeWNfjTpN0ZUsyXnSe2AJUmkOSkP8sB1ZFGi0rJb4Kr7h+MGKKgoL+vhJwkQ
 u5P9ODYtCRN2Kiqc+wAJth+poLgaQkE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-Bpb8I1s9P4ybardB11nzCA-1; Tue, 12 Jul 2022 04:16:22 -0400
X-MC-Unique: Bpb8I1s9P4ybardB11nzCA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 886E58001EA;
 Tue, 12 Jul 2022 08:16:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74B544050068;
 Tue, 12 Jul 2022 08:16:21 +0000 (UTC)
Date: Tue, 12 Jul 2022 09:16:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: peter@pjd.dev, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH RESEND] python/machine: Fix AF_UNIX path too long on macOS
Message-ID: <Ys0t09qZCJtUYyBZ@redhat.com>
References: <20220705214659.73369-1-peter@pjd.dev>
 <YsVBhmvAm2ANDUEt@redhat.com> <YsW8eO5eeRKfpxJp@r37>
 <YsYuYAJE2Hx64aIY@pdel-mbp.dhcp.thefacebook.com>
 <YscqCErtNGOG9GVx@pdel-mbp.dhcp.thefacebook.com>
 <CAFn=p-bhhu+G-p=w_K2OSOe0WkDHbBaO0ZS53F+jTDuo074VFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-bhhu+G-p=w_K2OSOe0WkDHbBaO0ZS53F+jTDuo074VFw@mail.gmail.com>
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

On Mon, Jul 11, 2022 at 04:56:28PM -0400, John Snow wrote:
> On Thu, Jul 7, 2022 at 2:46 PM Peter Delevoryas <peter@pjd.dev> wrote:
> >
> > On Wed, Jul 06, 2022 at 05:52:48PM -0700, Peter Delevoryas wrote:
> > > On Wed, Jul 06, 2022 at 09:46:48AM -0700, Peter Delevoryas wrote:
> > > > On Wed, Jul 06, 2022 at 09:02:14AM +0100, Daniel P. Berrangé wrote:
> > > > > On Tue, Jul 05, 2022 at 02:46:59PM -0700, Peter Delevoryas wrote:
> > > > > > I noticed that I can't run any avocado tests on macOS because the QMP
> > > > > > unix socket path is too long:
> > > > >
> > > > >
> > > > > > I think the path limit for unix sockets on macOS might be 104 [1]
> > > > >
> > > > > All platforms have a very limited path limit, so it isn't really
> > > > > a macOS specific problem, rather....
> > > > >
> > > > > >
> > > > > > /*
> > > > > >  * [XSI] Definitions for UNIX IPC domain.
> > > > > >  */
> > > > > > struct  sockaddr_un {
> > > > > >     unsigned char   sun_len;        /* sockaddr len including null */
> > > > > >     sa_family_t     sun_family;     /* [XSI] AF_UNIX */
> > > > > >     char            sun_path[104];  /* [XSI] path name (gag) */
> > > > > > };
> > > > > >
> > > > > > The path we're using is exactly 105 characters:
> > > > > >
> > > > > > $ python
> > > > > > Python 2.7.10 (default, Jan 19 2016, 22:24:01)
> > > > > > [GCC 4.2.1 Compatible Apple LLVM 7.0.2 (clang-700.1.81)] on darwin
> > > > > > Type "help", "copyright", "credits" or "license" for more information.
> > > > > > >>> len('/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock')
> > > > >
> > > > > It is a problem related to where the test suite is creating the
> > > > > paths.
> > > > >
> > > > > /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w_dgc/
> > > > >
> > > > > is way too deep a directory location.
> > > >
> > > > That's a good point.
> > > >
> > > > >
> > > > > It seems we just create this location using 'tempfile.TemporyDirectory'
> > > > > to get a standard tmp dir.
> > > > >
> > > > > Do you know why python is choosing
> > > > >
> > > > >   /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> > > > >
> > > > > as the temp dir ? Is that a standard location on macOS or is it
> > > > > from some env variable you have set ?
> > > >
> > > > Hmmm yeah it is odd, I'm not really sure why it's created there or if
> > > > standard glibc tmpfile creation goes there too, I'll go experiment and
> > > > report back. And yeah, maybe I'll double check any environment variables or
> > > > other things.
> > > >
> > > > The macOS system I use happens to be a Facebook work laptop, which could
> > > > also be related now that I think about it.
> > >
> > > Hmmm yeah looks like this is because my TMPDIR is weird.
> > >
> > > $ echo $TMPDIR
> > > /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> > >
> > > I didn't think to check this cause I wasn't familiar with TMPDIR. 🤷
> > >
> > > Thanks for responding, I'll just use TMPDIR=/tmp for now. It's probably
> > > something wrong with the Facebook development environment.
> > >
> > > Peter
> >
> > Update: Actually, this might not be a Facebook-work-laptop specific
> > thing.  I asked my non-engineer friend to print out $TMPDIR on his
> > macbook and he got the same thing.
> >
> > https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-directory-in-weird-path
> >
> > I guess this person suggests it's just to separate the permissions for
> > each user's /tmp directory, for better isolation.
> >
> > I'll resubmit this patch with the suggestions you had, because perhaps
> > this is actually affecting other macOS users too.
> >
> > >
> > > >
> > > > >
> > > > > > diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> > > > > > index 37191f433b..93451774e3 100644
> > > > > > --- a/python/qemu/machine/machine.py
> > > > > > +++ b/python/qemu/machine/machine.py
> > > > > > @@ -157,7 +157,7 @@ def __init__(self,
> > > > > >          self._wrapper = wrapper
> > > > > >          self._qmp_timer = qmp_timer
> > > > > >
> > > > > > -        self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
> > > > > > +        self._name = name or f"{os.getpid()}{id(self):02x}"
> > > > >
> > > > > I don't think this is the right fix really, because IMHO the problem
> > > > > is the hugely long path, rather than the final socket name.
> > > >
> > > > True, yeah let me try to investigate the directory placement.
> > > >
> > > > >
> > > > > That said, there is redundancy in the path - avocado is passing in
> > > > > a dierctory created using 'tempfile.TemporyDirectory' so there is no
> > > > > reason why we need to add more entropy via the POD and the 'id(self)'
> > > > > hex string.
> > > >
> > > > Oh good point, I hadn't thought about that.
> > > >
> > > > >
> > > > > IMHO avocado should pass in the 'name' parameter explicitly, using a
> > > > > plain name and thus get a shorter string.
> > > >
> > > > I see, yeah that makes sense. Maybe I can include a couple patches for this,
> > > > one fixing the directory location, and one refactoring the temporary file
> > > > name template (If I'm understanding your suggestion correctly).
> > > >
> > > > Thanks for the review! I really appreciate it.
> > > > Peter
> 
> I agree with Dan: I believe the correct solution here is for Avocado
> to provide its own less redundant name; but the default name that
> machine.py provides is not *that* long and provides adequate
> protection against collisions with multiple instances of the VM
> utility within a single python process. If Avocado is creating its own
> directories that guard against that redundancy, Avocado should provide
> a shortened name for the VM.
> 
> Note that the QEMUMachine process also provides a sock_dir parameter
> that was introduced for precisely this reason; it should be possible
> to instruct the avocado tests to use a shorter path for sock_dir.
> 
> I'm not clear on what the best "just works" solution will be when
> certain operating environments choose a tmp dir that's quite long to
> begin with; maybe we need a different default sockfile naming strategy
> that avoids the instance collision problem in machine.py, too. Ideas?

Ultimately there's no solution that is guaranteed to work. If $HOME
or $TMPDIR point to paths that are >= 108 chars long, we're doomed
no matter what. To maximise the liklihood of working though, we need
to be minimal in paths we append. 

Right now, Peter's TMPDIR is

/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T

Onto which QEMU appends

  /avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock

IOW, QEMU is more than 1/2 of the problem here.

QEMU could cut down the size of the temporary directory using a more
concise pattern, changing

  tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")

To

  tempfile.TemporaryDirectory(prefix="qemu_")


And then use a fixed socket name 'qmp.sock', giving us:

  /qemu_uh3w_dgc/qmp.sock

to append to TMPDIR

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


