Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E6C4B533B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:25:17 +0100 (CET)
Received: from localhost ([::1]:43952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcI0-0008Dc-KB
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:25:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nJbTG-0001Zn-8V
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:32:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nJbTC-0005Jt-5E
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644845564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uqfNHbBW0J++PfyntL2NZPn43Vpqmyxtl0aUy0+iqwo=;
 b=c+fooEltqxZFg0dLF96PIyuwPXnoabFjQwRKFEv375wd+BAxznLc+2FXRke2V+CwLY2Foq
 SK154ZRe1DM6fbwcPso8jOW53j85b6QAMVCp36QX+Z4sIGRnTr59elbG22vn6ybK1Emnxe
 7erpNVltlWNaolG4Evr5gkkjIlDZ+Ok=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-vEpg_HK7M3mu1X86wXNMoQ-1; Mon, 14 Feb 2022 08:32:43 -0500
X-MC-Unique: vEpg_HK7M3mu1X86wXNMoQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v190-20020a1cacc7000000b0034657bb6a66so1609161wme.6
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 05:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uqfNHbBW0J++PfyntL2NZPn43Vpqmyxtl0aUy0+iqwo=;
 b=CB8nfMUlvWnO8sIli13LPWRWRz2Y8kO9XDQZQAyo1bOmHP33iMKEl5FzfaO3JIl3G6
 ynIFppUSyQ6MBsuCqpsu6pHPwvm8jd/BtRBxDEczHa572m09qE0xFq+GggPu47MsNoMd
 LA7ZJleIuDWqDfdHHozZlgpNtv9ggJEsbxDK6ScKozrOlemXDGV8ArthCrHtR+Q0FwS3
 UBI4NE7Z4IhPhmE57ohpb9LREC6gqI2bsOVWAmqILXTIxnMmA81ibMZks241MNq8Asha
 u6M5dC7UuPxalbbqPW2g6rTtvrhG5lasc9bHdwImSdfGnCjWUA+nJgiejwXDHWG6ZTnQ
 Xt9Q==
X-Gm-Message-State: AOAM5313+zJWgdgQ5+azE+YwOIkBrJkPgRbCXe5DFLouzSFLjq081aIm
 LgPhOdTNqsTej0kWxGg8YcOfB/523kps9RNRDgpaXF+DlFiNLxUuOtzkoewPNmtI2COcNJFN/4s
 tPK2mhiIhL1ORwPo=
X-Received: by 2002:adf:fc07:: with SMTP id i7mr11360680wrr.421.1644845562134; 
 Mon, 14 Feb 2022 05:32:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2Ymp3DqbYv30i/eepuE4YYhawqNgz09CynzhXLMBg+DL+AplVYkmWtFvjUD4HvT+7rvqZkg==
X-Received: by 2002:adf:fc07:: with SMTP id i7mr11360662wrr.421.1644845561834; 
 Mon, 14 Feb 2022 05:32:41 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id t11sm16642503wrs.66.2022.02.14.05.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 05:32:40 -0800 (PST)
Date: Mon, 14 Feb 2022 13:32:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v6 10/10] virtiofsd: Add an option to enable/disable
 security label
Message-ID: <YgpZ9m6p54h4LEZh@work-vm>
References: <20220208204813.682906-1-vgoyal@redhat.com>
 <20220208204813.682906-11-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220208204813.682906-11-vgoyal@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Provide an option "-o security_label/no_security_label" to enable/disable
> security label functionality. By default these are turned off.
> 
> If enabled, server will indicate to client that it is capable of handling
> one security label during file creation. Typically this is expected to
> be a SELinux label. File server will set this label on the file. It will
> try to set it atomically wherever possible. But its not possible in
> all the cases.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

OK, but you have missed some of the docs typos I mentined in the last
review; they can be cleared up any time.

> ---
>  docs/tools/virtiofsd.rst         | 32 ++++++++++++++++++++++++++++++++
>  tools/virtiofsd/helper.c         |  1 +
>  tools/virtiofsd/passthrough_ll.c | 15 +++++++++++++++
>  3 files changed, 48 insertions(+)
> 
> diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> index 07ac0be551..0c0560203c 100644
> --- a/docs/tools/virtiofsd.rst
> +++ b/docs/tools/virtiofsd.rst
> @@ -104,6 +104,13 @@ Options
>    * posix_acl|no_posix_acl -
>      Enable/disable posix acl support.  Posix ACLs are disabled by default.
>  
> +  * security_label|no_security_label -
> +    Enable/disable security label support. Security labels are disabled by
> +    default. This will allow client to send a MAC label of file during
> +    file creation. Typically this is expected to be SELinux security
> +    label. Server will try to set that label on newly created file
> +    atomically wherever possible.
> +
>  .. option:: --socket-path=PATH
>  
>    Listen on vhost-user UNIX domain socket at PATH.
> @@ -348,6 +355,31 @@ client arguments or lists returned from the host.  This stops
>  the client seeing any 'security.' attributes on the server and
>  stops it setting any.
>  
> +SELinux support
> +---------------
> +One can enable support for SELinux by running virtiofsd with option
> +"-o security_label". But this will try to save guest's security context
> +in xattr security.selinux on host and it might fail if host's SELinux
> +policy does not permit virtiofsd to do this operation.
> +
> +Hence, it is preferred to remap guest's "security.selinux" xattr to say
> +"trusted.virtiofs.security.selinux" on host.
> +
> +"-o xattrmap=:map:security.selinux:trusted.virtiofs.:"
> +
> +This will make sure that guest and host's SELinux xattrs on same file
> +remain separate and not interfere with each other. And will allow both
> +host and guest to implement their own separate SELinux policies.
> +
> +Setting trusted xattr on host requires CAP_SYS_ADMIN. So one will need
> +add this capability to daemon.
> +
> +"-o modcaps=+sys_admin"
> +
> +Giving CAP_SYS_ADMIN increases the risk on system. Now virtiofsd is more
> +powerful and if gets compromised, it can do lot of damage to host system.
> +So keep this trade-off in my mind while making a decision.
> +
>  Examples
>  --------
>  
> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> index a8295d975a..e226fc590f 100644
> --- a/tools/virtiofsd/helper.c
> +++ b/tools/virtiofsd/helper.c
> @@ -187,6 +187,7 @@ void fuse_cmdline_help(void)
>             "                               default: no_allow_direct_io\n"
>             "    -o announce_submounts      Announce sub-mount points to the guest\n"
>             "    -o posix_acl/no_posix_acl  Enable/Disable posix_acl. (default: disabled)\n"
> +           "    -o security_label/no_security_label  Enable/Disable security label. (default: disabled)\n"
>             );
>  }
>  
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index d49128a58d..f3ec6aafe5 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -181,6 +181,7 @@ struct lo_data {
>      int user_posix_acl, posix_acl;
>      /* Keeps track if /proc/<pid>/attr/fscreate should be used or not */
>      bool use_fscreate;
> +    int user_security_label;
>  };
>  
>  static const struct fuse_opt lo_opts[] = {
> @@ -215,6 +216,8 @@ static const struct fuse_opt lo_opts[] = {
>      { "no_killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 0 },
>      { "posix_acl", offsetof(struct lo_data, user_posix_acl), 1 },
>      { "no_posix_acl", offsetof(struct lo_data, user_posix_acl), 0 },
> +    { "security_label", offsetof(struct lo_data, user_security_label), 1 },
> +    { "no_security_label", offsetof(struct lo_data, user_security_label), 0 },
>      FUSE_OPT_END
>  };
>  static bool use_syslog = false;
> @@ -808,6 +811,17 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
>          fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling posix_acl\n");
>          conn->want &= ~FUSE_CAP_POSIX_ACL;
>      }
> +
> +    if (lo->user_security_label == 1) {
> +        if (!(conn->capable & FUSE_CAP_SECURITY_CTX)) {
> +            fuse_log(FUSE_LOG_ERR, "lo_init: Can not enable security label."
> +                     " kernel does not support FUSE_SECURITY_CTX capability.\n");
> +        }
> +        conn->want |= FUSE_CAP_SECURITY_CTX;
> +    } else {
> +        fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling security label\n");
> +        conn->want &= ~FUSE_CAP_SECURITY_CTX;
> +    }
>  }
>  
>  static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
> @@ -4279,6 +4293,7 @@ int main(int argc, char *argv[])
>          .proc_self_task = -1,
>          .user_killpriv_v2 = -1,
>          .user_posix_acl = -1,
> +        .user_security_label = -1,
>      };
>      struct lo_map_elem *root_elem;
>      struct lo_map_elem *reserve_elem;
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


