Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2A83B67CE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 19:39:32 +0200 (CEST)
Received: from localhost ([::1]:46496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxvEJ-0007xz-2y
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 13:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxvCU-0007Eb-K4
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:37:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxvCQ-0000f4-Lp
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624901852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0/r/mwvs/nAxgEdQdxcn3tZH1Wd0b/5A2DNxmyLy5Gg=;
 b=DNPGGjkULX/CNbf55pfWyPTELvu1LYIxqZcvsMfwBVVPtsj2+yqE9qx34NRsTvteG4Apl+
 lP8BMV460VyNgVcBE0A4xu/4g0tvTzhi6WALUxpBDfcHiyWgNwwwbnaLLIxjugtNh97Y22
 Z5+r4saOsbezJ2bWtxFWpQec81Eh18I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-mgiYVAbDNeK1bMKFHq5GxA-1; Mon, 28 Jun 2021 13:37:31 -0400
X-MC-Unique: mgiYVAbDNeK1bMKFHq5GxA-1
Received: by mail-wm1-f71.google.com with SMTP id
 u64-20020a1cdd430000b02901ed0109da5fso3329898wmg.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 10:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0/r/mwvs/nAxgEdQdxcn3tZH1Wd0b/5A2DNxmyLy5Gg=;
 b=FoiGvbNJAKsOWHnP+zNuE8BHKcUqT7UoZs5lp/WD/CLg/zDyC91E0pbMoSG9FL1zlu
 4XEiA64ujiid/0aqSAXMI5TiZdkGL4Umg2spmHkJcJrj1Gg3UxMwv+7ALBhoU2VOPbGp
 ysIYn9FzrU5P+lup/T98JZfKCOrrbUY88Q1kBPR6xVjLrAxyiSGAFpy7dGfvdd34eDdY
 wK46l3OXKI8uESPDrIm8h5L7yjih9q806wv31RG70++PR+N81f9Bz/prZCkEOgC+lPG1
 3moK9EWr4xAUnhLLpjv0RegmgB6zEGM9ONhnnczSwzVbvxT2xq2DpLIOQK1waNwF0Xxk
 xR7w==
X-Gm-Message-State: AOAM531htUXXML0YdL2T0eoGZhrko7cwF/a7uL3UIo4soOLEqA4QeCPs
 AUJYT8vYmVym8vcmW8yZTjwazRYzXt40u91IbKF2VfWCtfsyOmUF0TGb9b/HAEZAEW32kVMdnS+
 8cL+b24Q9mCuI6kA=
X-Received: by 2002:a5d:6992:: with SMTP id g18mr28255815wru.73.1624901850442; 
 Mon, 28 Jun 2021 10:37:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlMcpgqNznSbxiP6qyk9O+AQCSKTr2oZZG1gGjDw3Obo75K63EoLkSM6Ef2+zmiTXm2nChuA==
X-Received: by 2002:a5d:6992:: with SMTP id g18mr28255800wru.73.1624901850129; 
 Mon, 28 Jun 2021 10:37:30 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id m67sm147993wmm.17.2021.06.28.10.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 10:37:29 -0700 (PDT)
Date: Mon, 28 Jun 2021 18:37:27 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v7 6/7] virtiofsd: Switch creds, drop FSETID for
 system.posix_acl_access xattr
Message-ID: <YNoI17cKLmullAht@work-vm>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-7-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210622150852.1507204-7-vgoyal@redhat.com>
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
> When posix access acls are set on a file, it can lead to adjusting file
> permissions (mode) as well. If caller does not have CAP_FSETID and it
> also does not have membership of owner group, this will lead to clearing
> SGID bit in mode.
> 
> Current fuse code is written in such a way that it expects file server
> to take care of chaning file mode (permission), if there is a need.
> Right now, host kernel does not clear SGID bit because virtiofsd is
> running as root and has CAP_FSETID. For host kernel to clear SGID,
> virtiofsd need to switch to gid of caller in guest and also drop
> CAP_FSETID (if caller did not have it to begin with).
> 
> If SGID needs to be cleared, client will set the flag
> FUSE_SETXATTR_ACL_KILL_SGID in setxattr request. In that case server
> should kill sgid.
> 
> Currently just switch to uid/gid of the caller and drop CAP_FSETID
> and that should do it.
> 
> This should fix the xfstest generic/375 test case.
> 
> We don't have to switch uid for this to work. That could be one optimization
> that pass a parameter to lo_change_cred() to only switch gid and not uid.
> 
> Also this will not work whenever (if ever) we support idmapped mounts. In
> that case it is possible that uid/gid in request are 0/0 but still we
> need to clear SGID. So we will have to pick a non-root sgid and switch
> to that instead. That's an TODO item for future when idmapped mount
> support is introduced.
> 
> This patch only adds the capability to switch creds and drop FSETID
> when acl xattr is set. This does not take affect yet. It can take
> affect when next patch adds the capability to enable posix_acl.
> 
> Reported-by: Luis Henriques <lhenriques@suse.de>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/passthrough_ll.c | 75 ++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 0c9084ea15..113c725def 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -175,6 +175,7 @@ struct lo_data {
>      int user_killpriv_v2, killpriv_v2;
>      /* If set, virtiofsd is responsible for setting umask during creation */
>      bool change_umask;
> +    int posix_acl;
>  };
>  
>  static const struct fuse_opt lo_opts[] = {
> @@ -1185,6 +1186,51 @@ static void lo_restore_cred(struct lo_cred *old, bool restore_umask)
>          umask(old->umask);
>  }
>  
> +/*
> + * A helper to change cred and drop capability. Returns 0 on success and
> + * errno on error
> + */
> +static int lo_drop_cap_change_cred(fuse_req_t req, struct lo_cred *old,
> +                                   bool change_umask, const char *cap_name,
> +                                   bool *cap_dropped)
> +{
> +    int ret;
> +    bool __cap_dropped;
> +
> +    assert(cap_name);
> +
> +    ret = drop_effective_cap(cap_name, &__cap_dropped);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ret = lo_change_cred(req, old, change_umask);
> +    if (ret) {
> +        if (__cap_dropped) {
> +            if (gain_effective_cap(cap_name)) {
> +                fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_%s\n", cap_name);
> +            }
> +        }
> +    }
> +
> +    if (cap_dropped) {
> +        *cap_dropped = __cap_dropped;
> +    }
> +    return ret;
> +}
> +
> +static void lo_restore_cred_gain_cap(struct lo_cred *old, bool restore_umask,
> +                                     const char *cap_name)
> +{
> +    assert(cap_name);
> +
> +    lo_restore_cred(old, restore_umask);
> +
> +    if (gain_effective_cap(cap_name)) {
> +        fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_%s\n", cap_name);
> +    }
> +}
> +
>  static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
>                               const char *name, mode_t mode, dev_t rdev,
>                               const char *link)
> @@ -2976,6 +3022,9 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>      ssize_t ret;
>      int saverr;
>      int fd = -1;
> +    bool switched_creds = false;
> +    bool cap_fsetid_dropped = false;
> +    struct lo_cred old = {};
>  
>      mapped_name = NULL;
>      name = in_name;
> @@ -3006,6 +3055,26 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>               ", name=%s value=%s size=%zd)\n", ino, name, value, size);
>  
>      sprintf(procname, "%i", inode->fd);
> +    /*
> +     * If we are setting posix access acl and if SGID needs to be
> +     * cleared, then switch to caller's gid and drop CAP_FSETID
> +     * and that should make sure host kernel clears SGID.
> +     *
> +     * This probably will not work when we support idmapped mounts.
> +     * In that case we will need to find a non-root gid and switch
> +     * to it. (Instead of gid in request). Fix it when we support
> +     * idmapped mounts.
> +     */
> +    if (lo->posix_acl && !strcmp(name, "system.posix_acl_access")
> +        && (extra_flags & FUSE_SETXATTR_ACL_KILL_SGID)) {
> +        ret = lo_drop_cap_change_cred(req, &old, false, "FSETID",
> +                                      &cap_fsetid_dropped);
> +        if (ret) {
> +            saverr = ret;
> +            goto out;
> +        }
> +        switched_creds = true;
> +    }
>      if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
>          fd = openat(lo->proc_self_fd, procname, O_RDONLY);
>          if (fd < 0) {
> @@ -3021,6 +3090,12 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>          saverr = ret == -1 ? errno : 0;
>          FCHDIR_NOFAIL(lo->root.fd);
>      }
> +    if (switched_creds) {
> +        if (cap_fsetid_dropped)
> +            lo_restore_cred_gain_cap(&old, false, "FSETID");
> +        else
> +            lo_restore_cred(&old, false);
> +    }
>  
>  out:
>      if (fd >= 0) {
> -- 
> 2.25.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


