Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881C53A8614
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:08:47 +0200 (CEST)
Received: from localhost ([::1]:52620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBcM-00020S-HD
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltBHR-0000yy-QJ
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:47:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltBHH-0002KF-LD
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:47:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623772017;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CvcdRtERfWALWDlCEpyA7BxZfNthZVlQ9NDFBgaJmdU=;
 b=TqQI+nhwqnejrT2lcytWonxloTWsRP8SswMSzHlhrnkklezMUZXQGXlq/hcQc0udlTJJqz
 cgkR5IozobJcTVZzNz8bFQK/ZMCI8YvE8jGTsfEck/GGaQciONHOS28XBoXazYLqPRLpx0
 S4flyzIXyh7GuzE/kyz/l7Ztz7b2C6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-AT5dx8khOSK3HFo91ihfdA-1; Tue, 15 Jun 2021 11:46:53 -0400
X-MC-Unique: AT5dx8khOSK3HFo91ihfdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1708805EFF
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 15:46:52 +0000 (UTC)
Received: from redhat.com (ovpn-115-226.ams2.redhat.com [10.36.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D8825D6D1;
 Tue, 15 Jun 2021 15:46:48 +0000 (UTC)
Date: Tue, 15 Jun 2021 16:46:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] docs: describe the security considerations
 with virtiofsd xattr mapping
Message-ID: <YMjLZUqZ5nhihJ1X@redhat.com>
References: <20210611120427.49736-1-berrange@redhat.com>
 <20210611154222.GA761698@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210611154222.GA761698@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 11:42:22AM -0400, Vivek Goyal wrote:
> On Fri, Jun 11, 2021 at 01:04:27PM +0100, Daniel P. Berrangé wrote:
> > Different guest xattr prefixes have distinct access control rules applied
> > by the guest. When remapping a guest xattr care must be taken that the
> > remapping does not allow the a guest user to bypass guest kernel access
> > control rules.
> > 
> > For example if 'trusted.*' which requires CAP_SYS_ADMIN is remapped
> > to 'user.virtiofs.trusted.*', an unprivileged guest user which can
> > write to 'user.*' can bypass the CAP_SYS_ADMIN control. Thus the
> > target of any remapping must be explicitly blocked from read/writes
> > by the guest, to prevent access control bypass.
> > 
> > The examples shown in the virtiofsd man page already do the right
> > thing and ensure safety, but the security implications of getting
> > this wrong were not made explicit. This could lead to host admins
> > and apps unwittingly creating insecure configurations.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  docs/tools/virtiofsd.rst | 55 ++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 50 insertions(+), 5 deletions(-)
> > 
> > diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> > index 00554c75bd..6370ab927c 100644
> > --- a/docs/tools/virtiofsd.rst
> > +++ b/docs/tools/virtiofsd.rst
> > @@ -127,8 +127,8 @@ Options
> >    timeout.  ``always`` sets a long cache lifetime at the expense of coherency.
> >    The default is ``auto``.
> >  
> > -xattr-mapping
> > --------------
> > +Extended attribute (xattr) mapping
> > +----------------------------------
> >  
> >  By default the name of xattr's used by the client are passed through to the server
> >  file system.  This can be a problem where either those xattr names are used
> > @@ -136,6 +136,9 @@ by something on the server (e.g. selinux client/server confusion) or if the
> >  virtiofsd is running in a container with restricted privileges where it cannot
> >  access some attributes.
> >  
> > +Mapping syntax
> > +~~~~~~~~~~~~~~
> > +
> >  A mapping of xattr names can be made using -o xattrmap=mapping where the ``mapping``
> >  string consists of a series of rules.
> >  
> > @@ -232,8 +235,48 @@ Note: When the 'security.capability' xattr is remapped, the daemon has to do
> >  extra work to remove it during many operations, which the host kernel normally
> >  does itself.
> >  
> > -xattr-mapping Examples
> > -----------------------
> > +Security considerations
> > +~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Operating systems typically partition the xattr namespace using
> > +well defined name prefixes. Each partition may have different
> > +access controls applied. For example, on Linux there are multiple
> > +partitions
> > +
> > + * ``system.*`` - access varies depending on attribute & filesystem
> > + * ``security.*`` - only processes with CAP_SYS_ADMIN
> > + * ``trusted.*`` - only processes with CAP_SYS_ADMIN
> > + * ``user.*`` - any process granted by file permissions / ownership
> > +
> > +While other OS such as FreeBSD have different name prefixes
> > +and access control rules.
> > +
> > +When remapping attributes on the host, it is important to
> > +ensure that the remapping does not allow a guest user to
> > +evade the guest access control rules.
> > +
> > +Consider if ``trusted.*`` from the guest was remapped to
> > +``user.virtiofs.trusted*`` in the host. An unprivileged
> > +user in a Linux guest has the ability to write to xattrs
> > +under ``user.*``. Thus the user can evade the access
> > +control restriction on ``trusted.*`` by instead writing
> > +to ``user.virtiofs.trusted.*``.
> > +
> > +As noted above, the partitions used and access controls
> > +applied, will vary across guest OS, so it is not wise to
> > +try to predict what the guest OS will use.
> > +
> > +The simplest way to avoid an insecure configuration is
> > +to remap all xattrs at once, to a given fixed prefix.
> 
> Remapping all xattrs seem to make sense. It probably will lead
> to less confusion. Nested guests add another level of redirection.
> 
> BTW, remapping xattr has limitation that it does not work on
> symlinks. So "user.*" can't be set on symlink. And that means
> selinux relabeling of symlinks fails with remapped xattrs.
> 
> Not sure how to address this limitation. Host kernel imposes
> this limit. (man xattr).

Oh fun, I had not noticed this limitation before :-(

Here are some ideas I had, none especially nice

 - Use 'trusted.*' namespace for remapping instead of 'user.'
 
   virtiofsd needs to have CAP_SYS_ADMIN though which is
   quite horrible if your goal is to confine its privileges
   in any meaningful way

 - Store a symlinks' xattr on the target of the symlink

   if the symlink has dev:inode  54:224, and points to
   a file 'foo', then on 'foo' create an xattr
   "user.virtiofs.link:54:224.<original xattrpath>"

   This gets quite horrendous when you have symlinks
   pointing to symlinks pointing to symlinks. Does
   not work too well if the 'st_dev' value is
   not stable across reboots either.

 - Don't use xattrs at all for remapping, instead use
   hidden files.

   eg for a file 'foo', if an xattr is set then create
   a file '.foo.xattr' in the same directory and store
   the xattrs in that file in some format. Need to hide
   this lookaside files from the guest of course.

> > +This is shown in example (1) below.
> > +
> > +If selectively mapping only a subset of xattr prefixes,
> > +then rules must be added to explicitly block direct
> > +access to the target of the remapping. This is shown
> > +in example (2) below.
> 
> Example (2) seems to block all the xattrs with prefix even
> if only one xattr has been remapped.
> 
> So if we remapped "trusted." to "user.virtiofs.trusted.", then
> client can't set any xattr starting with "user.virtiofs". I am
> wondering should it be limted to only blocking only
> "user.virtiofs.trusted.".

Or maybe illustrate with two mappings, so we can show how blocking
the parent xattr covers both

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


