Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8FE3B6685
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:15:46 +0200 (CEST)
Received: from localhost ([::1]:58428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtvF-0002ej-7j
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxtry-0006yJ-HK
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:12:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxtrw-0003eV-Io
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:12:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624896740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CbmcQQ/qbd0/kjLziJJUBNvdO1ePb2BAF3ertjJEIvc=;
 b=Wt8m0OMkCVvRmxEoehXF9mcTQ4UFyrLV6/XRBSjtW7Dgy6G+hkDbjx5DEiiVMQ1GsKnWho
 ZKoBTN1JmLwrTOyxTKVLOYiA8S1MEBBvy7cgq/FZVoKl3N0/+WyKYjW1Od/Qu3axQh0Nhu
 0vERhDaQlwYvRLbAS+7rlOurZAEHn4k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-fEOyit_yOSeZTgQ_O8s9Tw-1; Mon, 28 Jun 2021 12:12:17 -0400
X-MC-Unique: fEOyit_yOSeZTgQ_O8s9Tw-1
Received: by mail-wr1-f69.google.com with SMTP id
 x8-20020a5d54c80000b029012583535285so1038150wrv.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CbmcQQ/qbd0/kjLziJJUBNvdO1ePb2BAF3ertjJEIvc=;
 b=FAWZVRMCpGxpyvUea2VSZfAIAAt4d+e5goTG7vvcia7N9Iw6Va/JV5LgjIPbu5rNao
 SPD0FOqGkqlgKdoxOxc2XMP1EcUW76hZ84peAbSIghRE1G95YbKWEi+Y7gBO5qNw8G0c
 MG4rjKADPIe4fPYxzqE2jtsnP71IB629fLRtl4EDrlo8qc7VuRGqdtwnXr+87c5dKVwz
 xA3UC80sukBSeDm9CLBNe6kdXl8rsgP14aj9LA0pzLAPq191wmD7LYmK1zFs79XxHR8P
 76ewLHfIwYvLKH415ELzwylkD/8+21r6+SGS2cZcNuKCr67mqmoQNFMCgi5uuFAxnTuL
 oIOg==
X-Gm-Message-State: AOAM530xx1Pc3XwOC/qwqr5I6ZdZ6oDKdroI8pVD6LvkI8LVCHn9ob9U
 yV1MbvqXEkBISD5K/aJ3WW+PyK2qDbNQqJBp/57CWkMsk1+tVOANhjuHfUKgrKlAwQBpiDy97MX
 Hcs6kbjrgCR7A/Qk=
X-Received: by 2002:a7b:c202:: with SMTP id x2mr27242347wmi.157.1624896736558; 
 Mon, 28 Jun 2021 09:12:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXdmFz9daEF7KBgz7G1XZPMQR4aKTwXLJk/KSHC/WFXTCt0ag+qM1Bh4Q4LA+I9qPm371sdA==
X-Received: by 2002:a7b:c202:: with SMTP id x2mr27242334wmi.157.1624896736424; 
 Mon, 28 Jun 2021 09:12:16 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id r2sm15429988wrv.39.2021.06.28.09.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 09:12:15 -0700 (PDT)
Date: Mon, 28 Jun 2021 17:12:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v7 5/7] virtiofsd: Add capability to change/restore umask
Message-ID: <YNn03dfqpGnTTIne@work-vm>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-6-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210622150852.1507204-6-vgoyal@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
> When parent directory has default acl and a file is created in that
> directory, then umask is ignored and final file permissions are
> determined using default acl instead. (man 2 umask).
> 
> Currently, fuse applies the umask and sends modified mode in create
> request accordingly. fuse server can set FUSE_DONT_MASK and tell
> fuse client to not apply umask and fuse server will take care of
> it as needed.
> 
> With posix acls enabled, requirement will be that we want umask
> to determine final file mode if parent directory does not have
> default acl.
> 
> So if posix acls are enabled, opt in for FUSE_DONT_MASK. virtiofsd
> will set umask of the thread doing file creation. And host kernel
> should use that umask if parent directory does not have default
> acls, otherwise umask does not take affect.
> 
> Miklos mentioned that we already call unshare(CLONE_FS) for
> every thread. That means umask has now become property of per
> thread and it should be ok to manipulate it in file creation path.
> 
> This patch only adds capability to change umask and restore it. It
> does not enable it yet. Next few patches will add capability to enable it
> based on if user enabled posix_acl or not.
> 
> This should fix fstest generic/099.
> 
> Reported-by: Luis Henriques <lhenriques@suse.de>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 9f5cd98fb5..0c9084ea15 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -122,6 +122,7 @@ struct lo_inode {
>  struct lo_cred {
>      uid_t euid;
>      gid_t egid;
> +    mode_t umask;
>  };
>  
>  enum {
> @@ -172,6 +173,8 @@ struct lo_data {
>      /* An O_PATH file descriptor to /proc/self/fd/ */
>      int proc_self_fd;
>      int user_killpriv_v2, killpriv_v2;
> +    /* If set, virtiofsd is responsible for setting umask during creation */
> +    bool change_umask;
>  };
>  
>  static const struct fuse_opt lo_opts[] = {
> @@ -1134,7 +1137,8 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
>   * ownership of caller.
>   * TODO: What about selinux context?
>   */
> -static int lo_change_cred(fuse_req_t req, struct lo_cred *old)
> +static int lo_change_cred(fuse_req_t req, struct lo_cred *old,
> +                          bool change_umask)
>  {
>      int res;
>  
> @@ -1154,11 +1158,14 @@ static int lo_change_cred(fuse_req_t req, struct lo_cred *old)
>          return errno_save;
>      }
>  
> +    if (change_umask) {
> +        old->umask = umask(req->ctx.umask);
> +    }
>      return 0;
>  }
>  
>  /* Regain Privileges */
> -static void lo_restore_cred(struct lo_cred *old)
> +static void lo_restore_cred(struct lo_cred *old, bool restore_umask)
>  {
>      int res;
>  
> @@ -1173,6 +1180,9 @@ static void lo_restore_cred(struct lo_cred *old)
>          fuse_log(FUSE_LOG_ERR, "setegid(%u): %m\n", old->egid);
>          exit(1);
>      }
> +
> +    if (restore_umask)
> +        umask(old->umask);
>  }
>  
>  static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
> @@ -1202,7 +1212,7 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
>          return;
>      }
>  
> -    saverr = lo_change_cred(req, &old);
> +    saverr = lo_change_cred(req, &old, lo->change_umask && !S_ISLNK(mode));

Can you explain what these ISLNK checks are for (insid mknod_symlink, so
is that always true or irrelevant?)

Dave

>      if (saverr) {
>          goto out;
>      }
> @@ -1211,7 +1221,7 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
>  
>      saverr = errno;
>  
> -    lo_restore_cred(&old);
> +    lo_restore_cred(&old, lo->change_umask && !S_ISLNK(mode));
>  
>      if (res == -1) {
>          goto out;
> @@ -1917,7 +1927,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
>          return;
>      }
>  
> -    err = lo_change_cred(req, &old);
> +    err = lo_change_cred(req, &old, lo->change_umask);
>      if (err) {
>          goto out;
>      }
> @@ -1928,7 +1938,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
>      fd = openat(parent_inode->fd, name, fi->flags | O_CREAT | O_EXCL, mode);
>      err = fd == -1 ? errno : 0;
>  
> -    lo_restore_cred(&old);
> +    lo_restore_cred(&old, lo->change_umask);
>  
>      /* Ignore the error if file exists and O_EXCL was not given */
>      if (err && (err != EEXIST || (fi->flags & O_EXCL))) {
> -- 
> 2.25.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


