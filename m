Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB3443246E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 19:10:00 +0200 (CEST)
Received: from localhost ([::1]:57798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcW99-0001Bg-TD
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 13:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mcW70-0007aj-Vm
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 13:07:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mcW6y-0005we-VO
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 13:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634576863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EWVNxmw3Lr98KeRsdPH9n1w6DOb6liSs02yzrVv/4Cg=;
 b=Us8ZXJ+I6u080Srsz3iO0DW1gE+ivTedbG0kf2RsvwPJGXd5hCBxvCrPLF5c5ZiDYrOVbB
 m72DyfBavsIo4PS8w/O5nFj1ZAQYqwrtFTZmtcM8vcnKPzlzdiHM1vEbXEnUNdlJq1J5PW
 aiyKMoJwIa3jvNN0/BewSx3RxaLS3SI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-ImwsIQlFPKuiRWEyMKbmkA-1; Mon, 18 Oct 2021 13:07:42 -0400
X-MC-Unique: ImwsIQlFPKuiRWEyMKbmkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3F835074C
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 17:07:41 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.33.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8033310016F4;
 Mon, 18 Oct 2021 17:07:33 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id EA0AD2256F7; Mon, 18 Oct 2021 13:07:32 -0400 (EDT)
Date: Mon, 18 Oct 2021 13:07:32 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v4 01/12] virtiofsd: Keep /proc/self/mountinfo open
Message-ID: <YW2p1NAv5wiOtzDs@redhat.com>
References: <20210916084045.31684-1-hreitz@redhat.com>
 <20210916084045.31684-2-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210916084045.31684-2-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 16, 2021 at 10:40:34AM +0200, Hanna Reitz wrote:
> File handles are specific to mounts, and so name_to_handle_at() returns
> the respective mount ID.  However, open_by_handle_at() is not content
> with an ID, it wants a file descriptor for some inode on the mount,
> which we have to open.
> 
> We want to use /proc/self/mountinfo to find the mounts' root directories
> so we can open them and pass the respective FDs to open_by_handle_at().
> (We need to use the root directory, because we want the inode belonging
> to every mount FD be deletable.  Before the root directory can be
> deleted, all entries within must have been closed, and so when it is
> deleted, there should not be any file handles left that need its FD as
> their mount FD.  Thus, we can then close that FD and the inode can be
> deleted.[1])
> 
> That is why we need to open /proc/self/mountinfo so that we can use it
> to translate mount IDs into root directory paths.  We have to open it
> after setup_mounts() was called, because if we try to open it before, it
> will appear as an empty file after setup_mounts().
> 
> [1] Note that in practice, you still cannot delete the mount root
> directory.  It is a mount point on the host, after all, and mount points
> cannot be deleted.  But by using the mount point as the mount FD, we
> will at least not hog any actually deletable inodes.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 40 ++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 38b2af8599..6511a6acb4 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -172,6 +172,8 @@ struct lo_data {
>  
>      /* An O_PATH file descriptor to /proc/self/fd/ */
>      int proc_self_fd;
> +    /* A read-only FILE pointer for /proc/self/mountinfo */
> +    FILE *mountinfo_fp;
>      int user_killpriv_v2, killpriv_v2;
>      /* If set, virtiofsd is responsible for setting umask during creation */
>      bool change_umask;
> @@ -3718,6 +3720,19 @@ static void setup_chroot(struct lo_data *lo)
>  static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
>                            bool enable_syslog)
>  {
> +    int proc_self, mountinfo_fd;
> +    int saverr;
> +
> +    /*
> +     * Open /proc/self before we pivot to the new root so we can still
> +     * open /proc/self/mountinfo afterwards
> +     */
> +    proc_self = open("/proc/self", O_PATH);
> +    if (proc_self < 0) {
> +        fuse_log(FUSE_LOG_WARNING, "Failed to open /proc/self: %m; "
> +                 "will not be able to use file handles\n");
> +    }
> +

Hi Hanna,

Should we open /proc/self and /proc/self/mountinfo only if user wants
to file handle. We have already parsed options by now so we know.

Also, if user asked for file handles, and we can't open /proc/self or
/proc/self/mountinfo successfully, I would think we should error out
and not continue (instead of just log it and continue).

That seems to be general theme. If user asked for a feature and if
we can't enable it, we error out and let user retry without that
particular feature.

>      if (lo->sandbox == SANDBOX_NAMESPACE) {
>          setup_namespaces(lo, se);
>          setup_mounts(lo->source);
> @@ -3725,6 +3740,31 @@ static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
>          setup_chroot(lo);
>      }
>  
> +    /*
> +     * Opening /proc/self/mountinfo before the umount2() call in
> +     * setup_mounts() leads to the file appearing empty.  That is why
> +     * we defer opening it until here.
> +     */
> +    lo->mountinfo_fp = NULL;
> +    if (proc_self >= 0) {
> +        mountinfo_fd = openat(proc_self, "mountinfo", O_RDONLY);
> +        if (mountinfo_fd < 0) {
> +            saverr = errno;
> +        } else if (mountinfo_fd >= 0) {
> +            lo->mountinfo_fp = fdopen(mountinfo_fd, "r");
> +            if (!lo->mountinfo_fp) {
> +                saverr = errno;
> +                close(mountinfo_fd);
> +            }
> +        }
> +        if (!lo->mountinfo_fp) {
> +            fuse_log(FUSE_LOG_WARNING, "Failed to open /proc/self/mountinfo: "
> +                     "%s; will not be able to use file handles\n",
> +                     strerror(saverr));
> +        }
> +        close(proc_self);
> +    }
> +

Above code couple probably be moved in a helper function. Makes it
easier to read setup_sandbox(). Same here, open mountinfo only if
user wants file handle support and error out if file handle support
can't be enabled.

Thanks
Vivek
>      setup_seccomp(enable_syslog);
>      setup_capabilities(g_strdup(lo->modcaps));
>  }
> -- 
> 2.31.1
> 


