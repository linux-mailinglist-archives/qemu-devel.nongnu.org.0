Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A00D3E2F41
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 20:26:45 +0200 (CEST)
Received: from localhost ([::1]:51192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC4YN-0007os-N7
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 14:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mC4Xf-000781-HX
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 14:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mC4Xc-0005Wg-4t
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 14:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628274354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VXRQbtRhhOHmjQbRFcqxb2FeO6hXNsC7TBM56YQRw9A=;
 b=AYCHafc9RsSyv2S2BMRObHjdHTNuEfcL7CWb8Yt5FALsVV4n77PDPzLh+dnvaulPMY/Nne
 M3I3sCkRYTbJS+rI4DwcAT8VwLj4c1Y+jZ/iOthVNE83nBMb+DpNXbGO6mbPZfsNhTmRuF
 vp5g/3ZGQX7n/h5PYV2hafrhRpnwOoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-fRBCRF3DMIW42p2jo34Xxg-1; Fri, 06 Aug 2021 14:25:53 -0400
X-MC-Unique: fRBCRF3DMIW42p2jo34Xxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F0181B18BC0
 for <qemu-devel@nongnu.org>; Fri,  6 Aug 2021 18:25:52 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.18.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F4971B5C0;
 Fri,  6 Aug 2021 18:25:44 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 74968220261; Fri,  6 Aug 2021 14:25:44 -0400 (EDT)
Date: Fri, 6 Aug 2021 14:25:44 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v3 04/10] virtiofsd: Add lo_inode_fd() helper
Message-ID: <YQ1+qPISUq5AhBtT@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-5-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210730150134.216126-5-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On Fri, Jul 30, 2021 at 05:01:28PM +0200, Max Reitz wrote:

[..]
> @@ -1335,12 +1359,18 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
>          return;
>      }
>  
> +    res = lo_inode_fd(dir, &dir_fd);
> +    if (res < 0) {
> +        saverr = -res;
> +        goto out;
> +    }
> +
>      saverr = lo_change_cred(req, &old, lo->change_umask && !S_ISLNK(mode));
>      if (saverr) {
>          goto out;
>      }
>  
> -    res = mknod_wrapper(dir->fd, name, link, mode, rdev);
> +    res = mknod_wrapper(dir_fd.fd, name, link, mode, rdev);
>  
>      saverr = errno;
>  
> @@ -1388,6 +1418,8 @@ static void lo_symlink(fuse_req_t req, const char *link, fuse_ino_t parent,
>  static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
>                      const char *name)
>  {
> +    g_auto(TempFd) inode_fd = TEMP_FD_INIT;
> +    g_auto(TempFd) parent_fd = TEMP_FD_INIT;
>      int res;
>      struct lo_data *lo = lo_data(req);
>      struct lo_inode *parent_inode;
> @@ -1413,18 +1445,31 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
>          goto out_err;
>      }
>  
> +    res = lo_inode_fd(inode, &inode_fd);
> +    if (res < 0) {
> +        errno = -res;

In previous function, we saved error to "saverr" and jumped to "out"
label, instead of overwriting to errno.

I would think that it will be good to use a single pattern. Either
save error in saverr or overwrite errno. I personally prefer saving
error into "saverr".

> +        goto out_err;
> +    }
> +
> +    res = lo_inode_fd(parent_inode, &parent_fd);
> +    if (res < 0) {
> +        errno = -res;
> +        goto out_err;
> +    }
> +
>      memset(&e, 0, sizeof(struct fuse_entry_param));
>      e.attr_timeout = lo->timeout;
>      e.entry_timeout = lo->timeout;
>  
> -    sprintf(procname, "%i", inode->fd);
> -    res = linkat(lo->proc_self_fd, procname, parent_inode->fd, name,
> +    sprintf(procname, "%i", inode_fd.fd);
> +    res = linkat(lo->proc_self_fd, procname, parent_fd.fd, name,
>                   AT_SYMLINK_FOLLOW);
>      if (res == -1) {
>          goto out_err;
>      }
>  
> -    res = fstatat(inode->fd, "", &e.attr, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
> +    res = fstatat(inode_fd.fd, "", &e.attr,
> +                  AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
>      if (res == -1) {
>          goto out_err;
>      }
> @@ -1453,23 +1498,33 @@ out_err:
>  static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
>                                      const char *name)
>  {
> +    g_auto(TempFd) dir_fd = TEMP_FD_INIT;
>      int res;
>      uint64_t mnt_id;
>      struct stat attr;
>      struct lo_data *lo = lo_data(req);
>      struct lo_inode *dir = lo_inode(req, parent);
> +    struct lo_inode *inode = NULL;
>  
>      if (!dir) {
> -        return NULL;
> +        goto out;

Should we continue to just call "return NULL". dir is NULL. That means
lo_inode() failed. That means we never got the reference. So we don't
have to put the reference. If we do "goto out", it will call
lo_inode_put() which is not needed.

>      }
>  
> -    res = do_statx(lo, dir->fd, name, &attr, AT_SYMLINK_NOFOLLOW, &mnt_id);
> -    lo_inode_put(lo, &dir);
> +    res = lo_inode_fd(dir, &dir_fd);
> +    if (res < 0) {
> +        goto out;
> +    }
> +
> +    res = do_statx(lo, dir_fd.fd, name, &attr, AT_SYMLINK_NOFOLLOW, &mnt_id);
>      if (res == -1) {
> -        return NULL;
> +        goto out;
>      }
>  
> -    return lo_find(lo, &attr, mnt_id);
> +    inode = lo_find(lo, &attr, mnt_id);
> +
> +out:
> +    lo_inode_put(lo, &dir);
> +    return inode;
>  }


Thanks
Vivek


