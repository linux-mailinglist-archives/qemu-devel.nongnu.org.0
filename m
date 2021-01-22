Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B363007CA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 16:51:33 +0100 (CET)
Received: from localhost ([::1]:49966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2yii-000613-Bj
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 10:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l2ygl-0004ey-2B
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:49:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l2ygi-0000z2-4i
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611330567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UibT0pglJ14qJDM64dD1eS6SsR00QvhsVzeFlVGUKsM=;
 b=HAG5cAqhQZDdKiH3+a4uA8NeURawZbK0Q4Bzmnj7THXhLaLljMvnUtwbwOWATFxGZILJcH
 DeJTfzTmc1dAcYtsN7VO8ncV6kMZ34fNjR1KYS/9O91HHL+mFB+tZqyHD1EOC11MQOgwKG
 YxCe7cwzKUstrDpLdVP6Wloyr/G0iJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-E9dk36JwP2iAna8pnx3yvA-1; Fri, 22 Jan 2021 10:49:20 -0500
X-MC-Unique: E9dk36JwP2iAna8pnx3yvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CD1F107ACE4;
 Fri, 22 Jan 2021 15:49:19 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-195.rdu2.redhat.com [10.10.116.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4F2D5DA62;
 Fri, 22 Jan 2021 15:49:09 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 1DBEC22054F; Fri, 22 Jan 2021 10:49:09 -0500 (EST)
Date: Fri, 22 Jan 2021 10:49:09 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210122154909.GB120574@redhat.com>
References: <20210121144429.58885-1-stefanha@redhat.com>
 <20210121144803.GN3125227@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121144803.GN3125227@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: mszeredi@redhat.com, slp@redhat.com, qemu-devel@nongnu.org,
 P J P <ppandit@redhat.com>, virtio-fs@redhat.com, Alex Xu <alex@alxu.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 02:48:03PM +0000, Daniel P. Berrangé wrote:
> On Thu, Jan 21, 2021 at 02:44:29PM +0000, Stefan Hajnoczi wrote:
> > A well-behaved FUSE client does not attempt to open special files with
> > FUSE_OPEN because they are handled on the client side (e.g. device nodes
> > are handled by client-side device drivers).
> > 
> > The check to prevent virtiofsd from opening special files is missing in
> > a few cases, most notably FUSE_OPEN. A malicious client can cause
> > virtiofsd to open a device node, potentially allowing the guest to
> > escape. This can be exploited by a modified guest device driver. It is
> > not exploitable from guest userspace since the guest kernel will handle
> > special files inside the guest instead of sending FUSE requests.
> > 
> > This patch adds the missing checks to virtiofsd. This is a short-term
> > solution because it does not prevent a compromised virtiofsd process
> > from opening device nodes on the host.
> > 
> > Reported-by: Alex Xu <alex@alxu.ca>
> > Fixes: CVE-2020-35517
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > This issue was diagnosed on public IRC and is therefore already known
> > and not embargoed.
> > 
> > A stronger fix, and the long-term solution, is for users to mount the
> > shared directory and any sub-mounts with nodev, as well as nosuid and
> > noexec. Unfortunately virtiofsd cannot do this automatically because
> > bind mounts added by the user after virtiofsd has launched would not be
> > detected. I suggest the following:
> > 
> > 1. Modify libvirt and Kata Containers to explicitly set these mount
> >    options.
> > 2. Then modify virtiofsd to check that the shared directory has the
> >    necessary options at startup. Refuse to start if the options are
> >    missing so that the user is aware of the security requirements.
> > 
> > As a bonus this also increases the likelihood that other host processes
> > besides virtiofsd will be protected by nosuid/noexec/nodev so that a
> > malicious guest cannot drop these files in place and then arrange for a
> > host process to come across them.
> > 
> > Additionally, user namespaces have been discussed. They seem like a
> > worthwhile addition as an unprivileged or privilege-separated mode
> > although there are limitations with respect to security xattrs and the
> > actual uid/gid stored on the host file system not corresponding to the
> > guest uid/gid.
> > ---
> >  tools/virtiofsd/passthrough_ll.c | 84 +++++++++++++++++++++-----------
> >  1 file changed, 56 insertions(+), 28 deletions(-)
> > 
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index 5fb36d9407..e08352d649 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -555,6 +555,29 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino)
> >      return fd;
> >  }
> >  
> > +/*
> > + * Open a file descriptor for an inode. Returns -EBADF if the inode is not a
> > + * regular file or a directory. Use this helper function instead of raw
> > + * openat(2) to prevent security issues when a malicious client opens special
> > + * files such as block device nodes.
> > + */
> > +static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
> > +                         int open_flags)
> > +{
> > +    g_autofree char *fd_str = g_strdup_printf("%d", inode->fd);
> > +    int fd;
> > +
> > +    if (!S_ISREG(inode->filetype) && !S_ISDIR(inode->filetype)) {
> > +        return -EBADF;
> > +    }
> > +
> > +    fd = openat(lo->proc_self_fd, fd_str, open_flags);
> 
> Whats the intended behaviour with symlinks ?  Do we need to
> allow S_ISLNK, or are we assuming the symlink has already
> been expanded to the target file by this point ? If the latter
> adding a comment about this would be useful.

Given the current places lo_inode_open() is being used, I think it is
fine and we probably don't have to worry about symlink in these paths
as it has been resolved already by now.

In truncation path, we will expect that we are working with target
file (and not symlink fd). Same should be true for remote posix locks,
lo_open() and lo_fsync().

Other paths where we might be working with symlinks like listxattr,
getxattr, setxattr, already have mechanism to deal with symlink.

Thanks
Vivek



> 
> > +    if (fd < 0) {
> > +        return -errno;
> > +    }
> > +    return fd;
> > +}
> > +
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


