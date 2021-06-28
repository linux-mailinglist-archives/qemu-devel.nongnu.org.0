Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4909E3B6896
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 20:38:01 +0200 (CEST)
Received: from localhost ([::1]:40292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxw8u-0003Zw-A6
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 14:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxw7S-0002kK-E1
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:36:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxw7Q-0007Je-3G
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624905387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EvpBRu5YgFSA9OyiotzObnkARgrqbZgV4vnC5NY5Kag=;
 b=UJR8oDDnVh34yL6FyGPzLLTGjXYS+gfCUrGpCjWPJxFnKffvocUysYe9y9/ej7qUAuC65t
 XoeSj60kXEQYM4jVnFBYZX6fsPLYyRdmdDCFBjmJ2ZqO8Qcrj/L75sc8Po97nLozdX/59b
 pdhtJiLViAndvbnqizaXw3oLyrBwts0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-mcP0F4jmM0-6YTMMuzkEXg-1; Mon, 28 Jun 2021 14:36:25 -0400
X-MC-Unique: mcP0F4jmM0-6YTMMuzkEXg-1
Received: by mail-wm1-f71.google.com with SMTP id
 v2-20020a7bcb420000b0290146b609814dso374528wmj.0
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 11:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EvpBRu5YgFSA9OyiotzObnkARgrqbZgV4vnC5NY5Kag=;
 b=qnVn7Y66n+EIX/+yppF3TGR2N9A6VviJGJmxcx9OgfxLaA1Mp/STdjl/8qyMQRMtNe
 QLvyma2tq4sTRN1NEjpP4zEARiutKvTyAaJgA62U39h09tpknmFaMEvAZ6XpSCAW86nr
 iubecoZrzh6//3KeAxo6weGTuzeChT5DVvl+gN/4HVuDU8Ylmg+5G152zB1y7hPiCFCg
 xQ3txtupLDPfgJ0kxjQ6X5FjYr4ST1iI0KDh1WUWPrh3gmW4VjXBRqq88TufMxPdAlii
 7Fntc2ZBraE1t0GM+QpTGjb4+ENYN4GkzyNERQCOJbq6Xuz7SNDveb36AsA5NUdcoyqr
 Nyng==
X-Gm-Message-State: AOAM532cM6dFogDYofJY9uL1hm0k4FX0h//o2C1L9EWW2cFo2e5VimSF
 THnHSuY2+rBRPzmz5mcpKoUdczhPM+ytmMikloKHHnJ8pByq87MZKoZTzCU2tW5lvcL2xrpNOwc
 3AJ226Is4KFzJo78=
X-Received: by 2002:a5d:4486:: with SMTP id j6mr28791836wrq.174.1624905384598; 
 Mon, 28 Jun 2021 11:36:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJCUP0oW9un2rYbeRiQ+FOCdOUU9Uzx2uY4oyhox1ZIXT1eUukF4CwS4FS8qj8/BgjwQ9r9Q==
X-Received: by 2002:a5d:4486:: with SMTP id j6mr28791821wrq.174.1624905384446; 
 Mon, 28 Jun 2021 11:36:24 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id n12sm7408363wrs.12.2021.06.28.11.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 11:36:20 -0700 (PDT)
Date: Mon, 28 Jun 2021 19:36:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v7 5/7] virtiofsd: Add capability to change/restore umask
Message-ID: <YNoWotomJg1S09pF@work-vm>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-6-vgoyal@redhat.com>
 <YNn03dfqpGnTTIne@work-vm> <20210628181218.GF1803896@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210628181218.GF1803896@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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

* Vivek Goyal (vgoyal@redhat.com) wrote:
> On Mon, Jun 28, 2021 at 05:12:13PM +0100, Dr. David Alan Gilbert wrote:
> > * Vivek Goyal (vgoyal@redhat.com) wrote:
> > > When parent directory has default acl and a file is created in that
> > > directory, then umask is ignored and final file permissions are
> > > determined using default acl instead. (man 2 umask).
> > > 
> > > Currently, fuse applies the umask and sends modified mode in create
> > > request accordingly. fuse server can set FUSE_DONT_MASK and tell
> > > fuse client to not apply umask and fuse server will take care of
> > > it as needed.
> > > 
> > > With posix acls enabled, requirement will be that we want umask
> > > to determine final file mode if parent directory does not have
> > > default acl.
> > > 
> > > So if posix acls are enabled, opt in for FUSE_DONT_MASK. virtiofsd
> > > will set umask of the thread doing file creation. And host kernel
> > > should use that umask if parent directory does not have default
> > > acls, otherwise umask does not take affect.
> > > 
> > > Miklos mentioned that we already call unshare(CLONE_FS) for
> > > every thread. That means umask has now become property of per
> > > thread and it should be ok to manipulate it in file creation path.
> > > 
> > > This patch only adds capability to change umask and restore it. It
> > > does not enable it yet. Next few patches will add capability to enable it
> > > based on if user enabled posix_acl or not.
> > > 
> > > This should fix fstest generic/099.
> > > 
> > > Reported-by: Luis Henriques <lhenriques@suse.de>
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >  tools/virtiofsd/passthrough_ll.c | 22 ++++++++++++++++------
> > >  1 file changed, 16 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > > index 9f5cd98fb5..0c9084ea15 100644
> > > --- a/tools/virtiofsd/passthrough_ll.c
> > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > @@ -122,6 +122,7 @@ struct lo_inode {
> > >  struct lo_cred {
> > >      uid_t euid;
> > >      gid_t egid;
> > > +    mode_t umask;
> > >  };
> > >  
> > >  enum {
> > > @@ -172,6 +173,8 @@ struct lo_data {
> > >      /* An O_PATH file descriptor to /proc/self/fd/ */
> > >      int proc_self_fd;
> > >      int user_killpriv_v2, killpriv_v2;
> > > +    /* If set, virtiofsd is responsible for setting umask during creation */
> > > +    bool change_umask;
> > >  };
> > >  
> > >  static const struct fuse_opt lo_opts[] = {
> > > @@ -1134,7 +1137,8 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
> > >   * ownership of caller.
> > >   * TODO: What about selinux context?
> > >   */
> > > -static int lo_change_cred(fuse_req_t req, struct lo_cred *old)
> > > +static int lo_change_cred(fuse_req_t req, struct lo_cred *old,
> > > +                          bool change_umask)
> > >  {
> > >      int res;
> > >  
> > > @@ -1154,11 +1158,14 @@ static int lo_change_cred(fuse_req_t req, struct lo_cred *old)
> > >          return errno_save;
> > >      }
> > >  
> > > +    if (change_umask) {
> > > +        old->umask = umask(req->ctx.umask);
> > > +    }
> > >      return 0;
> > >  }
> > >  
> > >  /* Regain Privileges */
> > > -static void lo_restore_cred(struct lo_cred *old)
> > > +static void lo_restore_cred(struct lo_cred *old, bool restore_umask)
> > >  {
> > >      int res;
> > >  
> > > @@ -1173,6 +1180,9 @@ static void lo_restore_cred(struct lo_cred *old)
> > >          fuse_log(FUSE_LOG_ERR, "setegid(%u): %m\n", old->egid);
> > >          exit(1);
> > >      }
> > > +
> > > +    if (restore_umask)
> > > +        umask(old->umask);
> > >  }
> > >  
> > >  static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
> > > @@ -1202,7 +1212,7 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
> > >          return;
> > >      }
> > >  
> > > -    saverr = lo_change_cred(req, &old);
> > > +    saverr = lo_change_cred(req, &old, lo->change_umask && !S_ISLNK(mode));
> > 
> > Can you explain what these ISLNK checks are for (insid mknod_symlink, so
> > is that always true or irrelevant?)
> 
> I think I put this check in because if we are creating symlink then we
> don't have to change umask as symlink will always get a some fix
> mode (usually 777) and umask will not have an affect. So this is
> just an optimization to avoid switching umask in some cases. I 
> can't think of any other reason.

But this is in 'lo_mknod_symlink' - so when do we call that except for
making symlinks?

Dave

> thanks
> Vivek
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


