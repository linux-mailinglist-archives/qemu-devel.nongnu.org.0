Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B2029654A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 21:26:57 +0200 (CEST)
Received: from localhost ([::1]:34682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVgEh-0004Pu-AX
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 15:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kVgCl-0003qo-E6
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 15:24:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kVgCj-0002Qa-5T
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 15:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603394691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X02sQ53yY29cDw+KPzadQvpPpGPjsOsAcFocbkGpUBI=;
 b=jPXxg7qGGPNjh9zkXPZM7LxX49aYnAxYhXk52MEIKjAyooV+CBsipiV85LHOtkZXNURydw
 PAikWoGcZyPydMGZHQXqCkuUYGcF392M1x4+vrunt5RUJ/qdiphXRk5uMsOVmrdOJHrRwg
 m6QbNoombgmdl9Wt6+d+VbpSC6pBz+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-LeVLb0J1NBGLLGpZa71RmA-1; Thu, 22 Oct 2020 15:24:50 -0400
X-MC-Unique: LeVLb0J1NBGLLGpZa71RmA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D064C1009E22;
 Thu, 22 Oct 2020 19:24:48 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85A3B5D9CC;
 Thu, 22 Oct 2020 19:24:42 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 177F7222F9C; Thu, 22 Oct 2020 15:24:42 -0400 (EDT)
Date: Thu, 22 Oct 2020 15:24:42 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3] virtiofsd: add container-friendly -o sandbox=chroot
 option
Message-ID: <20201022192442.GE512900@redhat.com>
References: <20201008085534.16070-1-stefanha@redhat.com>
 <20201022191954.GK2951@work-vm>
MIME-Version: 1.0
In-Reply-To: <20201022191954.GK2951@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 08:33:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vromanso@redhat.com, Daniel Walsh <dwalsh@redhat.com>,
 qemu-devel@nongnu.org, rmohr@redhat.com, virtio-fs@redhat.com,
 Al Viro <viro@zeniv.linux.org.uk>, Stefan Hajnoczi <stefanha@redhat.com>,
 mpatel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 22, 2020 at 08:19:54PM +0100, Dr. David Alan Gilbert wrote:
> * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > virtiofsd cannot run in a container because CAP_SYS_ADMIN is required to
> > create namespaces.
> > 
> > Introduce a weaker sandbox mode that is sufficient in container
> > environments because the container runtime already sets up namespaces.
> > Use chroot to restrict path traversal to the shared directory.
> > 
> > virtiofsd loses the following:
> > 
> > 1. Mount namespace. The process chroots to the shared directory but
> >    leaves the mounts in place. Seccomp rejects mount(2)/umount(2)
> >    syscalls.
> > 
> > 2. Pid namespace. This should be fine because virtiofsd is the only
> >    process running in the container.
> > 
> > 3. Network namespace. This should be fine because seccomp already
> >    rejects the connect(2) syscall, but an additional layer of security
> >    is lost. Container runtime-specific network security policies can be
> >    used drop network traffic (except for the vhost-user UNIX domain
> >    socket).
> > 
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> I've just tripped over another case where this probably helps (but not
> yet tested...); pivot_root doesn't work if your current / isn't a
> mountpoint - so you can't currently run the existing virtiofsd inside
> a chroot.

Can we avoid that issue simply by doing a bind mount of directory
before chroot().

Vivek

> 
> (pivot_root is awful for telling you this - it has 6 different manpage
> listed reasons it might return EINVAL and leaves you to figure out how
> you offended it).
> 
> Dave
> 
> > ---
> > v3:
> >  * Rebased onto David Gilbert's latest migration & virtiofsd pull
> >    request
> > 
> >  tools/virtiofsd/helper.c         |  8 +++++
> >  tools/virtiofsd/passthrough_ll.c | 57 ++++++++++++++++++++++++++++++--
> >  docs/tools/virtiofsd.rst         | 32 ++++++++++++++----
> >  3 files changed, 88 insertions(+), 9 deletions(-)
> > 
> > diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> > index 85770d63f1..2e181a49b5 100644
> > --- a/tools/virtiofsd/helper.c
> > +++ b/tools/virtiofsd/helper.c
> > @@ -166,6 +166,14 @@ void fuse_cmdline_help(void)
> >             "                               enable/disable readirplus\n"
> >             "                               default: readdirplus except with "
> >             "cache=none\n"
> > +           "    -o sandbox=namespace|chroot\n"
> > +           "                               sandboxing mode:\n"
> > +           "                               - namespace: mount, pid, and net\n"
> > +           "                                 namespaces with pivot_root(2)\n"
> > +           "                                 into shared directory\n"
> > +           "                               - chroot: chroot(2) into shared\n"
> > +           "                                 directory (use in containers)\n"
> > +           "                               default: namespace\n"
> >             "    -o timeout=<number>        I/O timeout (seconds)\n"
> >             "                               default: depends on cache= option.\n"
> >             "    -o writeback|no_writeback  enable/disable writeback cache\n"
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index ff53df4451..5b9064278a 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -137,8 +137,14 @@ enum {
> >      CACHE_ALWAYS,
> >  };
> >  
> > +enum {
> > +    SANDBOX_NAMESPACE,
> > +    SANDBOX_CHROOT,
> > +};
> > +
> >  struct lo_data {
> >      pthread_mutex_t mutex;
> > +    int sandbox;
> >      int debug;
> >      int writeback;
> >      int flock;
> > @@ -163,6 +169,12 @@ struct lo_data {
> >  };
> >  
> >  static const struct fuse_opt lo_opts[] = {
> > +    { "sandbox=namespace",
> > +      offsetof(struct lo_data, sandbox),
> > +      SANDBOX_NAMESPACE },
> > +    { "sandbox=chroot",
> > +      offsetof(struct lo_data, sandbox),
> > +      SANDBOX_CHROOT },
> >      { "writeback", offsetof(struct lo_data, writeback), 1 },
> >      { "no_writeback", offsetof(struct lo_data, writeback), 0 },
> >      { "source=%s", offsetof(struct lo_data, source), 0 },
> > @@ -2660,6 +2672,41 @@ static void setup_capabilities(char *modcaps_in)
> >      pthread_mutex_unlock(&cap.mutex);
> >  }
> >  
> > +/*
> > + * Use chroot as a weaker sandbox for environments where the process is
> > + * launched without CAP_SYS_ADMIN.
> > + */
> > +static void setup_chroot(struct lo_data *lo)
> > +{
> > +    lo->proc_self_fd = open("/proc/self/fd", O_PATH);
> > +    if (lo->proc_self_fd == -1) {
> > +        fuse_log(FUSE_LOG_ERR, "open(\"/proc/self/fd\", O_PATH): %m\n");
> > +        exit(1);
> > +    }
> > +
> > +    /*
> > +     * Make the shared directory the file system root so that FUSE_OPEN
> > +     * (lo_open()) cannot escape the shared directory by opening a symlink.
> > +     *
> > +     * The chroot(2) syscall is later disabled by seccomp and the
> > +     * CAP_SYS_CHROOT capability is dropped so that tampering with the chroot
> > +     * is not possible.
> > +     *
> > +     * However, it's still possible to escape the chroot via lo->proc_self_fd
> > +     * but that requires first gaining control of the process.
> > +     */
> > +    if (chroot(lo->source) != 0) {
> > +        fuse_log(FUSE_LOG_ERR, "chroot(\"%s\"): %m\n", lo->source);
> > +        exit(1);
> > +    }
> > +
> > +    /* Move into the chroot */
> > +    if (chdir("/") != 0) {
> > +        fuse_log(FUSE_LOG_ERR, "chdir(\"/\"): %m\n");
> > +        exit(1);
> > +    }
> > +}
> > +
> >  /*
> >   * Lock down this process to prevent access to other processes or files outside
> >   * source directory.  This reduces the impact of arbitrary code execution bugs.
> > @@ -2667,8 +2714,13 @@ static void setup_capabilities(char *modcaps_in)
> >  static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
> >                            bool enable_syslog)
> >  {
> > -    setup_namespaces(lo, se);
> > -    setup_mounts(lo->source);
> > +    if (lo->sandbox == SANDBOX_NAMESPACE) {
> > +        setup_namespaces(lo, se);
> > +        setup_mounts(lo->source);
> > +    } else {
> > +        setup_chroot(lo);
> > +    }
> > +
> >      setup_seccomp(enable_syslog);
> >      setup_capabilities(g_strdup(lo->modcaps));
> >  }
> > @@ -2815,6 +2867,7 @@ int main(int argc, char *argv[])
> >      struct fuse_session *se;
> >      struct fuse_cmdline_opts opts;
> >      struct lo_data lo = {
> > +        .sandbox = SANDBOX_NAMESPACE,
> >          .debug = 0,
> >          .writeback = 0,
> >          .posix_lock = 0,
> > diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> > index 7ecee49834..65f8e76569 100644
> > --- a/docs/tools/virtiofsd.rst
> > +++ b/docs/tools/virtiofsd.rst
> > @@ -17,13 +17,24 @@ This program is designed to work with QEMU's ``--device vhost-user-fs-pci``
> >  but should work with any virtual machine monitor (VMM) that supports
> >  vhost-user.  See the Examples section below.
> >  
> > -This program must be run as the root user.  Upon startup the program will
> > -switch into a new file system namespace with the shared directory tree as its
> > -root.  This prevents "file system escapes" due to symlinks and other file
> > -system objects that might lead to files outside the shared directory.  The
> > -program also sandboxes itself using seccomp(2) to prevent ptrace(2) and other
> > -vectors that could allow an attacker to compromise the system after gaining
> > -control of the virtiofsd process.
> > +This program must be run as the root user.  The program drops privileges where
> > +possible during startup although it must be able to create and access files
> > +with any uid/gid:
> > +
> > +* The ability to invoke syscalls is limited using seccomp(2).
> > +* Linux capabilities(7) are dropped.
> > +
> > +In "namespace" sandbox mode the program switches into a new file system
> > +namespace and invokes pivot_root(2) to make the shared directory tree its root.
> > +A new pid and net namespace is also created to isolate the process.
> > +
> > +In "chroot" sandbox mode the program invokes chroot(2) to make the shared
> > +directory tree its root. This mode is intended for container environments where
> > +the container runtime has already set up the namespaces and the program does
> > +not have permission to create namespaces itself.
> > +
> > +Both sandbox modes prevent "file system escapes" due to symlinks and other file
> > +system objects that might lead to files outside the shared directory.
> >  
> >  Options
> >  -------
> > @@ -69,6 +80,13 @@ Options
> >    * readdirplus|no_readdirplus -
> >      Enable/disable readdirplus.  The default is ``readdirplus``.
> >  
> > +  * sandbox=namespace|chroot -
> > +    Sandbox mode:
> > +    - namespace: Create mount, pid, and net namespaces and pivot_root(2) into
> > +    the shared directory.
> > +    - chroot: chroot(2) into shared directory (use in containers).
> > +    The default is "namespace".
> > +
> >    * source=PATH -
> >      Share host directory tree located at PATH.  This option is required.
> >  
> > -- 
> > 2.26.2
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


