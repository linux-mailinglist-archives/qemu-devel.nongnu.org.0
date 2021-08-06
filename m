Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B2A3E2C5A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:17:29 +0200 (CEST)
Received: from localhost ([::1]:40350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0fA-0007hL-NH
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mC0e8-0006I6-9L
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:16:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mC0e6-00043h-J9
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628259380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+fMNkUY49fhChuA+cs7tuoPwfMIKiRZB/Rb/YHgVWE4=;
 b=J3WIbfeYLtdfh3MHL7/yGomaM/6Ws0640QWuEfZjtPqAY9VsWhzcUiRQmIFD/fURA/2G1P
 Deywy1JEyJMb9WSJKOObANtnUfVIp362GV3HQCyvsMqwd205VLIKU6IDWJwA+dATfanABB
 UAc7iTQcTL8bPAi614i/qHNqli3rsk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-rHXpY4-6OSiZQRs8jHU1Tg-1; Fri, 06 Aug 2021 10:16:17 -0400
X-MC-Unique: rHXpY4-6OSiZQRs8jHU1Tg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A371802C98
 for <qemu-devel@nongnu.org>; Fri,  6 Aug 2021 14:16:16 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.18.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 416C719C44;
 Fri,  6 Aug 2021 14:16:08 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id A87AB220261; Fri,  6 Aug 2021 10:16:07 -0400 (EDT)
Date: Fri, 6 Aug 2021 10:16:07 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v3 01/10] virtiofsd: Limit setxattr()'s creds-dropped
 region
Message-ID: <YQ1EJxcBlUHA8uek@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-2-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210730150134.216126-2-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

On Fri, Jul 30, 2021 at 05:01:25PM +0200, Max Reitz wrote:
> We only need to drop/switch our credentials for the (f)setxattr() call
> alone, not for the openat() or fchdir() around it.
> 
> (Right now, this may not be that big of a problem, but with inodes being
> identified by file handles instead of an O_PATH fd, we will need
> open_by_handle_at() calls here, which is really fickle when it comes to
> credentials being dropped.)
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 34 +++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 38b2af8599..1f27eeabc5 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -3121,6 +3121,7 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>      bool switched_creds = false;
>      bool cap_fsetid_dropped = false;
>      struct lo_cred old = {};
> +    bool open_inode;
>  
>      if (block_xattr(lo, in_name)) {
>          fuse_reply_err(req, EOPNOTSUPP);
> @@ -3155,7 +3156,24 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>      fuse_log(FUSE_LOG_DEBUG, "lo_setxattr(ino=%" PRIu64
>               ", name=%s value=%s size=%zd)\n", ino, name, value, size);
>  
> +    /*
> +     * We can only open regular files or directories.  If the inode is
> +     * something else, we have to enter /proc/self/fd and use
> +     * setxattr() on the link's filename there.
> +     */
> +    open_inode = S_ISREG(inode->filetype) || S_ISDIR(inode->filetype);
>      sprintf(procname, "%i", inode->fd);
> +    if (open_inode) {
> +        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
> +        if (fd < 0) {
> +            saverr = errno;
> +            goto out;
> +        }
> +    } else {
> +        /* fchdir should not fail here */
> +        FCHDIR_NOFAIL(lo->proc_self_fd);
> +    }
> +
>      /*
>       * If we are setting posix access acl and if SGID needs to be
>       * cleared, then switch to caller's gid and drop CAP_FSETID
> @@ -3176,20 +3194,13 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>          }
>          switched_creds = true;
>      }
> -    if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
> -        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
> -        if (fd < 0) {
> -            saverr = errno;
> -            goto out;
> -        }
> +    if (open_inode) {
> +        assert(fd >= 0);
>          ret = fsetxattr(fd, name, value, size, flags);
>          saverr = ret == -1 ? errno : 0;
>      } else {
> -        /* fchdir should not fail here */
> -        FCHDIR_NOFAIL(lo->proc_self_fd);
>          ret = setxattr(procname, name, value, size, flags);
>          saverr = ret == -1 ? errno : 0;
> -        FCHDIR_NOFAIL(lo->root.fd);
>      }
>      if (switched_creds) {
>          if (cap_fsetid_dropped)
> @@ -3198,6 +3209,11 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>              lo_restore_cred(&old, false);
>      }
>  
> +    if (!open_inode) {
> +        /* Change CWD back, fchdir should not fail here */
> +        FCHDIR_NOFAIL(lo->root.fd);
> +    }
> +

This FCHDIR_NOFAIL() will also need to be called if lo_drop_cap_change_cred()
fails. 

        ret = lo_drop_cap_change_cred(req, &old, false, "FSETID",
                                      &cap_fsetid_dropped);
        if (ret) {
            saverr = ret;
            goto out;
        }

Vivek

>  out:
>      if (fd >= 0) {
>          close(fd);
> -- 
> 2.31.1
> 


