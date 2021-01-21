Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719602FED5D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 15:50:16 +0100 (CET)
Received: from localhost ([::1]:51674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2bHr-0003lp-GH
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 09:50:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2bG8-0003EK-7Y
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 09:48:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2bG5-0005jg-VF
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 09:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611240504;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=H7/WT1CVnig/HU1QiXklKFQdGwhMD+JzSkHoVHfk7uA=;
 b=U93XIRF4x8XShcm2MTv3j28Of8TU0HEjIidGL2LFhhV1k0X9C2InsG7TSt4IkqzaEvXnmI
 RDBpD/SMAnv99b0ExmEfOj++XDZ7tQFCtIciP2v2yu/urTbyZaCEK+HQm9EQph4AEj5Hu8
 IZmwApU3OVyJ9j3w0LyeLgnnbaJozdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-IBnpd_XzOPmvc_0oxaqecg-1; Thu, 21 Jan 2021 09:48:19 -0500
X-MC-Unique: IBnpd_XzOPmvc_0oxaqecg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F294190D340;
 Thu, 21 Jan 2021 14:48:18 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDF75648A8;
 Thu, 21 Jan 2021 14:48:06 +0000 (UTC)
Date: Thu, 21 Jan 2021 14:48:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210121144803.GN3125227@redhat.com>
References: <20210121144429.58885-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121144429.58885-1-stefanha@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mszeredi@redhat.com, slp@redhat.com, qemu-devel@nongnu.org,
 P J P <ppandit@redhat.com>, virtio-fs@redhat.com, Alex Xu <alex@alxu.ca>,
 vgoyal@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 02:44:29PM +0000, Stefan Hajnoczi wrote:
> A well-behaved FUSE client does not attempt to open special files with
> FUSE_OPEN because they are handled on the client side (e.g. device nodes
> are handled by client-side device drivers).
> 
> The check to prevent virtiofsd from opening special files is missing in
> a few cases, most notably FUSE_OPEN. A malicious client can cause
> virtiofsd to open a device node, potentially allowing the guest to
> escape. This can be exploited by a modified guest device driver. It is
> not exploitable from guest userspace since the guest kernel will handle
> special files inside the guest instead of sending FUSE requests.
> 
> This patch adds the missing checks to virtiofsd. This is a short-term
> solution because it does not prevent a compromised virtiofsd process
> from opening device nodes on the host.
> 
> Reported-by: Alex Xu <alex@alxu.ca>
> Fixes: CVE-2020-35517
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> This issue was diagnosed on public IRC and is therefore already known
> and not embargoed.
> 
> A stronger fix, and the long-term solution, is for users to mount the
> shared directory and any sub-mounts with nodev, as well as nosuid and
> noexec. Unfortunately virtiofsd cannot do this automatically because
> bind mounts added by the user after virtiofsd has launched would not be
> detected. I suggest the following:
> 
> 1. Modify libvirt and Kata Containers to explicitly set these mount
>    options.
> 2. Then modify virtiofsd to check that the shared directory has the
>    necessary options at startup. Refuse to start if the options are
>    missing so that the user is aware of the security requirements.
> 
> As a bonus this also increases the likelihood that other host processes
> besides virtiofsd will be protected by nosuid/noexec/nodev so that a
> malicious guest cannot drop these files in place and then arrange for a
> host process to come across them.
> 
> Additionally, user namespaces have been discussed. They seem like a
> worthwhile addition as an unprivileged or privilege-separated mode
> although there are limitations with respect to security xattrs and the
> actual uid/gid stored on the host file system not corresponding to the
> guest uid/gid.
> ---
>  tools/virtiofsd/passthrough_ll.c | 84 +++++++++++++++++++++-----------
>  1 file changed, 56 insertions(+), 28 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 5fb36d9407..e08352d649 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -555,6 +555,29 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino)
>      return fd;
>  }
>  
> +/*
> + * Open a file descriptor for an inode. Returns -EBADF if the inode is not a
> + * regular file or a directory. Use this helper function instead of raw
> + * openat(2) to prevent security issues when a malicious client opens special
> + * files such as block device nodes.
> + */
> +static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
> +                         int open_flags)
> +{
> +    g_autofree char *fd_str = g_strdup_printf("%d", inode->fd);
> +    int fd;
> +
> +    if (!S_ISREG(inode->filetype) && !S_ISDIR(inode->filetype)) {
> +        return -EBADF;
> +    }
> +
> +    fd = openat(lo->proc_self_fd, fd_str, open_flags);

Whats the intended behaviour with symlinks ?  Do we need to
allow S_ISLNK, or are we assuming the symlink has already
been expanded to the target file by this point ? If the latter
adding a comment about this would be useful.

> +    if (fd < 0) {
> +        return -errno;
> +    }
> +    return fd;
> +}
> +

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


