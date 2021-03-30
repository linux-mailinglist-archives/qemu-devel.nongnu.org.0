Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9E134E48E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 11:36:54 +0200 (CEST)
Received: from localhost ([::1]:39340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRAnt-0005r8-DJ
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 05:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lhenriques@suse.de>)
 id 1lRAmr-0005A3-IY
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 05:35:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:33984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lhenriques@suse.de>)
 id 1lRAmp-000520-BO
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 05:35:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A8FFEB1DC;
 Tue, 30 Mar 2021 09:35:45 +0000 (UTC)
Received: from localhost (brahms [local])
 by brahms (OpenSMTPD) with ESMTPA id 2dee5515;
 Tue, 30 Mar 2021 09:37:06 +0000 (UTC)
Date: Tue, 30 Mar 2021 10:37:05 +0100
From: Luis Henriques <lhenriques@suse.de>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v5 5/5] virtiofsd: Switch creds, drop FSETID for
 system.posix_acl_access xattr
Message-ID: <YGLxQR5V4d+8mQiK@suse.de>
References: <20210325153852.572927-1-vgoyal@redhat.com>
 <20210325153852.572927-6-vgoyal@redhat.com>
 <YGHz3a9JCAV21Aun@suse.de> <20210329195151.GF676525@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210329195151.GF676525@redhat.com>
Received-SPF: pass client-ip=195.135.220.15; envelope-from=lhenriques@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, miklos@szeredi.hu, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 29, 2021 at 03:51:51PM -0400, Vivek Goyal wrote:
> On Mon, Mar 29, 2021 at 04:35:57PM +0100, Luis Henriques wrote:
> > On Thu, Mar 25, 2021 at 11:38:52AM -0400, Vivek Goyal wrote:
> > > When posix access acls are set on a file, it can lead to adjusting file
> > > permissions (mode) as well. If caller does not have CAP_FSETID and it
> > > also does not have membership of owner group, this will lead to clearing
> > > SGID bit in mode.
> > > 
> > > Current fuse code is written in such a way that it expects file server
> > > to take care of chaning file mode (permission), if there is a need.
> > > Right now, host kernel does not clear SGID bit because virtiofsd is
> > > running as root and has CAP_FSETID. For host kernel to clear SGID,
> > > virtiofsd need to switch to gid of caller in guest and also drop
> > > CAP_FSETID (if caller did not have it to begin with).
> > > 
> > > If SGID needs to be cleared, client will set the flag
> > > FUSE_SETXATTR_ACL_KILL_SGID in setxattr request. In that case server
> > > should kill sgid.
> > > 
> > > Currently just switch to uid/gid of the caller and drop CAP_FSETID
> > > and that should do it.
> > > 
> > > This should fix the xfstest generic/375 test case.
> > > 
> > > We don't have to switch uid for this to work. That could be one optimization
> > > that pass a parameter to lo_change_cred() to only switch gid and not uid.
> > > 
> > > Also this will not work whenever (if ever) we support idmapped mounts. In
> > > that case it is possible that uid/gid in request are 0/0 but still we
> > > need to clear SGID. So we will have to pick a non-root sgid and switch
> > > to that instead. That's an TODO item for future when idmapped mount
> > > support is introduced.
> > > 
> > > Reported-by: Luis Henriques <lhenriques@suse.de>
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > ---
> > >  include/standard-headers/linux/fuse.h |  7 +++++
> > >  tools/virtiofsd/passthrough_ll.c      | 42 +++++++++++++++++++++++++--
> > >  2 files changed, 47 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/include/standard-headers/linux/fuse.h b/include/standard-headers/linux/fuse.h
> > > index cc87ff27d0..4eb79399d4 100644
> > > --- a/include/standard-headers/linux/fuse.h
> > > +++ b/include/standard-headers/linux/fuse.h
> > > @@ -180,6 +180,7 @@
> > >   *  - add FUSE_HANDLE_KILLPRIV_V2, FUSE_WRITE_KILL_SUIDGID, FATTR_KILL_SUIDGID
> > >   *  - add FUSE_OPEN_KILL_SUIDGID
> > >   *  - add FUSE_SETXATTR_V2
> > > + *  - add FUSE_SETXATTR_ACL_KILL_SGID
> > >   */
> > >  
> > >  #ifndef _LINUX_FUSE_H
> > > @@ -450,6 +451,12 @@ struct fuse_file_lock {
> > >   */
> > >  #define FUSE_OPEN_KILL_SUIDGID	(1 << 0)
> > >  
> > > +/**
> > > + * setxattr flags
> > > + * FUSE_SETXATTR_ACL_KILL_SGID: Clear SGID when system.posix_acl_access is set
> > > + */
> > > +#define FUSE_SETXATTR_ACL_KILL_SGID    (1 << 0)
> > > +
> > >  enum fuse_opcode {
> > >  	FUSE_LOOKUP		= 1,
> > >  	FUSE_FORGET		= 2,  /* no reply */
> > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > > index 3f5c267604..8a48071d0b 100644
> > > --- a/tools/virtiofsd/passthrough_ll.c
> > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > @@ -175,7 +175,7 @@ struct lo_data {
> > >      int user_killpriv_v2, killpriv_v2;
> > >      /* If set, virtiofsd is responsible for setting umask during creation */
> > >      bool change_umask;
> > > -    int user_posix_acl;
> > > +    int user_posix_acl, posix_acl;
> > >  };
> > >  
> > >  static const struct fuse_opt lo_opts[] = {
> > > @@ -716,8 +716,10 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
> > >           * in fuse_lowlevel.c
> > >           */
> > >          fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling posix acl\n");
> > > -        conn->want |= FUSE_CAP_POSIX_ACL | FUSE_CAP_DONT_MASK;
> > > +        conn->want |= FUSE_CAP_POSIX_ACL | FUSE_CAP_DONT_MASK |
> > > +                      FUSE_CAP_SETXATTR_V2;
> > 
> > An annoying thing with this is that if we're using a kernel without
> > _V2 support the mount will still succeed.  But we'll see:
> > 
> > ls: cannot access '/mnt': Connection refused
> > 
> > and in the userspace:
> > 
> > fuse: error: filesystem requested capabilities 0x20000000 that are not supported by kernel, aborting.
> > 
> > Maybe it would be worth to automatically disable acl support if this
> > happens (with an error message) but still allow the filesystem to be
> > used.
> 
> If user specific "-o posix_acl" then it is better to fail explicitly
> if posix_acl can't be enabled. If user did not specify anything, then
> it makes sense to automatically disable posix acl  and continue.
> 
> > Or, which is probably better, to handle the EPROTO error in the
> > kernel during mount.
> 
> This will have been idea but in fuse, init process handling happens
> asynchronously. That is mount returns to user space while init
> command might complete at a later point of time. So can't return
> -EPROTO at mount time.

Oh, right.  I remember the first time I looked that I found it a bit odd
that fuse_send_init() didn't wait to return an error.  So, my suggestion
isn't feasible.

> So one of the problems seem to be that error message is not very
> clear. How about adding following so that user is clear that posix acl
> can't be enabled.

Thanks, I think this extra information is indeed useful.

Cheers,
--
Luís

> 
> Vivek
> 
> ---
>  tools/virtiofsd/passthrough_ll.c |   14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> Index: rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c
> ===================================================================
> --- rhvgoyal-qemu.orig/tools/virtiofsd/passthrough_ll.c	2021-03-29 14:59:28.483340964 -0400
> +++ rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c	2021-03-29 15:42:21.797482846 -0400
> @@ -712,10 +712,18 @@ static void lo_init(void *userdata, stru
>      if (lo->user_posix_acl == 1) {
>          /*
>           * User explicitly asked for this option. Enable it unconditionally.
> -         * If connection does not have this capability, it should fail
> -         * in fuse_lowlevel.c
> +         * If connection does not have this capability, give out message
> +         * now. fuse_lowlevel.c will error out.
>           */
> -        fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling posix acl\n");
> +        if (!(conn->capable & FUSE_CAP_POSIX_ACL) ||
> +            !(conn->capable & FUSE_CAP_DONT_MASK) ||
> +            !(conn->capable & FUSE_CAP_SETXATTR_V2)) {
> +            fuse_log(FUSE_LOG_ERR, "lo_init: Can not enable posix acl."
> +                     " kernel does not support FUSE_POSIX_ACL, FUSE_DONT_MASK"
> +                     " or FUSE_SETXATTR_V2 capability.\n");
> +        } else {
> +            fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling posix acl\n");
> +        }
>          conn->want |= FUSE_CAP_POSIX_ACL | FUSE_CAP_DONT_MASK |
>                        FUSE_CAP_SETXATTR_V2;
>          lo->change_umask = true;
> 
> 

