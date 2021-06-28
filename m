Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF9A3B6826
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 20:13:47 +0200 (CEST)
Received: from localhost ([::1]:47618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxvlS-0004Lj-Cz
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 14:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lxvkT-0003M4-QF
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:12:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lxvkQ-0007Uo-A5
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:12:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624903960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lWyJDqWjmx1sYAG9u4++6kMMMTetuRNWVfZBe6TjlD8=;
 b=P/dWJeYbyuUgZEKdGfa5346zHbc0AqaLJkmcyMgVzS80oEcKsOm17FJ8qik5tV7hNz42fV
 m3b3eBjWZFeiCLxTksCZC7lfJGRCLqNbozkG/84RRfFAc8cJiJ9POhJzUPtvH9ysDRtGm5
 6cpxERhnxtf4/YWa3KXrw33d4jBqGgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-ZQitZAOOPfqpKSNF59IbIg-1; Mon, 28 Jun 2021 14:12:35 -0400
X-MC-Unique: ZQitZAOOPfqpKSNF59IbIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08DAF100CA89;
 Mon, 28 Jun 2021 18:12:20 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-225.rdu2.redhat.com [10.10.115.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C53E6091B;
 Mon, 28 Jun 2021 18:12:19 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id B747022054F; Mon, 28 Jun 2021 14:12:18 -0400 (EDT)
Date: Mon, 28 Jun 2021 14:12:18 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v7 5/7] virtiofsd: Add capability to change/restore umask
Message-ID: <20210628181218.GF1803896@redhat.com>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-6-vgoyal@redhat.com>
 <YNn03dfqpGnTTIne@work-vm>
MIME-Version: 1.0
In-Reply-To: <YNn03dfqpGnTTIne@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: virtio-fs@redhat.com, miklos@szeredi.hu, qemu-devel@nongnu.org,
 lhenriques@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 05:12:13PM +0100, Dr. David Alan Gilbert wrote:
> * Vivek Goyal (vgoyal@redhat.com) wrote:
> > When parent directory has default acl and a file is created in that
> > directory, then umask is ignored and final file permissions are
> > determined using default acl instead. (man 2 umask).
> > 
> > Currently, fuse applies the umask and sends modified mode in create
> > request accordingly. fuse server can set FUSE_DONT_MASK and tell
> > fuse client to not apply umask and fuse server will take care of
> > it as needed.
> > 
> > With posix acls enabled, requirement will be that we want umask
> > to determine final file mode if parent directory does not have
> > default acl.
> > 
> > So if posix acls are enabled, opt in for FUSE_DONT_MASK. virtiofsd
> > will set umask of the thread doing file creation. And host kernel
> > should use that umask if parent directory does not have default
> > acls, otherwise umask does not take affect.
> > 
> > Miklos mentioned that we already call unshare(CLONE_FS) for
> > every thread. That means umask has now become property of per
> > thread and it should be ok to manipulate it in file creation path.
> > 
> > This patch only adds capability to change umask and restore it. It
> > does not enable it yet. Next few patches will add capability to enable it
> > based on if user enabled posix_acl or not.
> > 
> > This should fix fstest generic/099.
> > 
> > Reported-by: Luis Henriques <lhenriques@suse.de>
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  tools/virtiofsd/passthrough_ll.c | 22 ++++++++++++++++------
> >  1 file changed, 16 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index 9f5cd98fb5..0c9084ea15 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -122,6 +122,7 @@ struct lo_inode {
> >  struct lo_cred {
> >      uid_t euid;
> >      gid_t egid;
> > +    mode_t umask;
> >  };
> >  
> >  enum {
> > @@ -172,6 +173,8 @@ struct lo_data {
> >      /* An O_PATH file descriptor to /proc/self/fd/ */
> >      int proc_self_fd;
> >      int user_killpriv_v2, killpriv_v2;
> > +    /* If set, virtiofsd is responsible for setting umask during creation */
> > +    bool change_umask;
> >  };
> >  
> >  static const struct fuse_opt lo_opts[] = {
> > @@ -1134,7 +1137,8 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
> >   * ownership of caller.
> >   * TODO: What about selinux context?
> >   */
> > -static int lo_change_cred(fuse_req_t req, struct lo_cred *old)
> > +static int lo_change_cred(fuse_req_t req, struct lo_cred *old,
> > +                          bool change_umask)
> >  {
> >      int res;
> >  
> > @@ -1154,11 +1158,14 @@ static int lo_change_cred(fuse_req_t req, struct lo_cred *old)
> >          return errno_save;
> >      }
> >  
> > +    if (change_umask) {
> > +        old->umask = umask(req->ctx.umask);
> > +    }
> >      return 0;
> >  }
> >  
> >  /* Regain Privileges */
> > -static void lo_restore_cred(struct lo_cred *old)
> > +static void lo_restore_cred(struct lo_cred *old, bool restore_umask)
> >  {
> >      int res;
> >  
> > @@ -1173,6 +1180,9 @@ static void lo_restore_cred(struct lo_cred *old)
> >          fuse_log(FUSE_LOG_ERR, "setegid(%u): %m\n", old->egid);
> >          exit(1);
> >      }
> > +
> > +    if (restore_umask)
> > +        umask(old->umask);
> >  }
> >  
> >  static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
> > @@ -1202,7 +1212,7 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
> >          return;
> >      }
> >  
> > -    saverr = lo_change_cred(req, &old);
> > +    saverr = lo_change_cred(req, &old, lo->change_umask && !S_ISLNK(mode));
> 
> Can you explain what these ISLNK checks are for (insid mknod_symlink, so
> is that always true or irrelevant?)

I think I put this check in because if we are creating symlink then we
don't have to change umask as symlink will always get a some fix
mode (usually 777) and umask will not have an affect. So this is
just an optimization to avoid switching umask in some cases. I 
can't think of any other reason.

thanks
Vivek


