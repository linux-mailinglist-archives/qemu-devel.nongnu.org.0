Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007594352AD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 20:28:21 +0200 (CEST)
Received: from localhost ([::1]:51782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdGK3-0005v5-Kw
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 14:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mdGHH-0004Ez-2i
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 14:25:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mdGHC-0006zl-5B
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 14:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634754320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=do6S25reX0NV8eMxwqmTeOl+oBGIecG+0MftyCdxQ7U=;
 b=J1+DeNAjRBPJtCaxpNgZHC4apm5qcASB5IV5R5CwY0HopQdYH9CqXLjXmtmJBndpVDbmNz
 er7iwgFEdBtWT1ucG8ivuqFf8lbUpSyq7IOLMQiQkNPdpjtfX0JbNH90a4EQjg4fJBVlxA
 eqLG26JPVHOkwzidgv26DZ56bbO9naw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-KK8i5u-8Nj-Jzh_U0tAFgQ-1; Wed, 20 Oct 2021 14:25:18 -0400
X-MC-Unique: KK8i5u-8Nj-Jzh_U0tAFgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4EDD835B61
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 18:25:17 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.33.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68D8C5DD68;
 Wed, 20 Oct 2021 18:25:17 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id DADC32256FC; Wed, 20 Oct 2021 14:25:16 -0400 (EDT)
Date: Wed, 20 Oct 2021 14:25:16 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v4 01/12] virtiofsd: Keep /proc/self/mountinfo open
Message-ID: <YXBfDHfZlnaqE7rf@redhat.com>
References: <20210916084045.31684-1-hreitz@redhat.com>
 <20210916084045.31684-2-hreitz@redhat.com>
 <YW2p1NAv5wiOtzDs@redhat.com>
 <fdc893e8-2858-9930-5b41-2d489e066c34@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fdc893e8-2858-9930-5b41-2d489e066c34@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 20, 2021 at 11:04:31AM +0200, Hanna Reitz wrote:
> On 18.10.21 19:07, Vivek Goyal wrote:
> > On Thu, Sep 16, 2021 at 10:40:34AM +0200, Hanna Reitz wrote:
> > > File handles are specific to mounts, and so name_to_handle_at() returns
> > > the respective mount ID.  However, open_by_handle_at() is not content
> > > with an ID, it wants a file descriptor for some inode on the mount,
> > > which we have to open.
> > > 
> > > We want to use /proc/self/mountinfo to find the mounts' root directories
> > > so we can open them and pass the respective FDs to open_by_handle_at().
> > > (We need to use the root directory, because we want the inode belonging
> > > to every mount FD be deletable.  Before the root directory can be
> > > deleted, all entries within must have been closed, and so when it is
> > > deleted, there should not be any file handles left that need its FD as
> > > their mount FD.  Thus, we can then close that FD and the inode can be
> > > deleted.[1])
> > > 
> > > That is why we need to open /proc/self/mountinfo so that we can use it
> > > to translate mount IDs into root directory paths.  We have to open it
> > > after setup_mounts() was called, because if we try to open it before, it
> > > will appear as an empty file after setup_mounts().
> > > 
> > > [1] Note that in practice, you still cannot delete the mount root
> > > directory.  It is a mount point on the host, after all, and mount points
> > > cannot be deleted.  But by using the mount point as the mount FD, we
> > > will at least not hog any actually deletable inodes.
> > > 
> > > Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> > > ---
> > >   tools/virtiofsd/passthrough_ll.c | 40 ++++++++++++++++++++++++++++++++
> > >   1 file changed, 40 insertions(+)
> > > 
> > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > > index 38b2af8599..6511a6acb4 100644
> > > --- a/tools/virtiofsd/passthrough_ll.c
> > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > @@ -172,6 +172,8 @@ struct lo_data {
> > >       /* An O_PATH file descriptor to /proc/self/fd/ */
> > >       int proc_self_fd;
> > > +    /* A read-only FILE pointer for /proc/self/mountinfo */
> > > +    FILE *mountinfo_fp;
> > >       int user_killpriv_v2, killpriv_v2;
> > >       /* If set, virtiofsd is responsible for setting umask during creation */
> > >       bool change_umask;
> > > @@ -3718,6 +3720,19 @@ static void setup_chroot(struct lo_data *lo)
> > >   static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
> > >                             bool enable_syslog)
> > >   {
> > > +    int proc_self, mountinfo_fd;
> > > +    int saverr;
> > > +
> > > +    /*
> > > +     * Open /proc/self before we pivot to the new root so we can still
> > > +     * open /proc/self/mountinfo afterwards
> > > +     */
> > > +    proc_self = open("/proc/self", O_PATH);
> > > +    if (proc_self < 0) {
> > > +        fuse_log(FUSE_LOG_WARNING, "Failed to open /proc/self: %m; "
> > > +                 "will not be able to use file handles\n");
> > > +    }
> > > +
> > Hi Hanna,
> > 
> > Should we open /proc/self and /proc/self/mountinfo only if user wants
> > to file handle. We have already parsed options by now so we know.
> 
> I didn’t think it would matter given that it wouldn’t have an adverse
> effect.  If we can’t open them (and I can’t imagine a case where we’d be
> unable to open them), the only result is a warning.
> 
> > Also, if user asked for file handles, and we can't open /proc/self or
> > /proc/self/mountinfo successfully, I would think we should error out
> > and not continue (instead of just log it and continue).
> 
> Well, that would break the assumption I had above.  Not that that’s really
> relevant, I just want to mention it.
> 
> File handles are a best effort in any case.  If they don’t work, we always
> fall back.  So I don’t know whether we must error out.
> 
> OTOH if we know they can never work, then perhaps it would be more sensible
> to error out.

Yes. If they can't work because filesystem does not have capability or
we don't have CAP_DAC_READ_SEARCH or any other necessary component is
not there then we should fail.
> 
> FWIW I’ve ported the relevant v1..v4 changes to virtiofsd-rs, and there it
> errors out.  The error is unconditional, though, so even if you don’t
> request file handles, it’ll try to open mountinfo and exit on error.  I
> found that reasonable because I can’t imagine a case where opening
> /proc/self/fd would work, but /proc/self/mountinfo wouldn’t – and working
> around that would be a bit cumbersome (it would mean wrapping
> PassthroughFs.mount_fds in an Option<> and .unwrap()-ing it on every use,
> with a comment why that’s fine). Honestly, I’d prefer to wait until we get a
> bug report about a failure to open /proc/self/mountinfo.
> 
> > That seems to be general theme. If user asked for a feature and if
> > we can't enable it, we error out and let user retry without that
> > particular feature.
> > 
> > >       if (lo->sandbox == SANDBOX_NAMESPACE) {
> > >           setup_namespaces(lo, se);
> > >           setup_mounts(lo->source);
> > > @@ -3725,6 +3740,31 @@ static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
> > >           setup_chroot(lo);
> > >       }
> > > +    /*
> > > +     * Opening /proc/self/mountinfo before the umount2() call in
> > > +     * setup_mounts() leads to the file appearing empty.  That is why
> > > +     * we defer opening it until here.
> > > +     */
> > > +    lo->mountinfo_fp = NULL;
> > > +    if (proc_self >= 0) {
> > > +        mountinfo_fd = openat(proc_self, "mountinfo", O_RDONLY);
> > > +        if (mountinfo_fd < 0) {
> > > +            saverr = errno;
> > > +        } else if (mountinfo_fd >= 0) {
> > > +            lo->mountinfo_fp = fdopen(mountinfo_fd, "r");
> > > +            if (!lo->mountinfo_fp) {
> > > +                saverr = errno;
> > > +                close(mountinfo_fd);
> > > +            }
> > > +        }
> > > +        if (!lo->mountinfo_fp) {
> > > +            fuse_log(FUSE_LOG_WARNING, "Failed to open /proc/self/mountinfo: "
> > > +                     "%s; will not be able to use file handles\n",
> > > +                     strerror(saverr));
> > > +        }
> > > +        close(proc_self);
> > > +    }
> > > +
> > Above code couple probably be moved in a helper function. Makes it
> > easier to read setup_sandbox(). Same here, open mountinfo only if
> > user wants file handle support and error out if file handle support
> > can't be enabled.
> 
> Perhaps, but frankly I don’t see a need to keep setup_sandbox() readable. 
> AFAIU, we are planning to deprecate C virtiofsd anyway, so while it pains me
> to say something like this, we don’t need to keep it maintainable.
> 
> Now that I’ve opened an MR to bring the v1..v4 changes to virtiofsd-rs
> (https://gitlab.com/virtio-fs/virtiofsd-rs/-/merge_requests/41), I also
> don’t really see a justification for putting further development effort into
> bringing file handles to C virtiofsd.  Of course I’m still grateful for your
> review, and I’ll try to adapt it to virtiofsd-rs, but right now I don’t plan
> on sending a v5.

Fair enough. If file handle stuff is important for C version, I am hoping
somebody else can pick this work. Anyway I think its almost 90% ready, we
are just dealing with last 10% of issues.

Vivek


