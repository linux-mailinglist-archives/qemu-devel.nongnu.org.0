Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1F64B541B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:02:36 +0100 (CET)
Received: from localhost ([::1]:49026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcs7-0007LQ-I1
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:02:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nJc4C-0008Dr-V7
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:11:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nJc4B-0004sZ-61
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:11:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644847858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=51bgZRSb0TUWc6UkTP6ISX4nqbOpq31oUqGUK3QGTEg=;
 b=ip13dgPrSuR4T2JFLiFcBGSqdzVaJLUwhbxVeo1k+voU2uEHNtmqoXv2Bbgv/6UyUKE6gN
 Jg0IHOpvAnC+lemPwe5fr98R4CLRAEJdNFZkATgpA6Jk6agKbNklY+hfKGaZRZTMJImdWK
 0wjq6riMtGF5IMkvr4ljz/MKh/uh6Mk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-Ffzz6XWmNVuNBNeHE3R6aQ-1; Mon, 14 Feb 2022 09:10:57 -0500
X-MC-Unique: Ffzz6XWmNVuNBNeHE3R6aQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05CF7814245
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 14:10:56 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.32.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D1892A184;
 Mon, 14 Feb 2022 14:10:33 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id ACF37220CE9; Mon, 14 Feb 2022 09:10:32 -0500 (EST)
Date: Mon, 14 Feb 2022 09:10:32 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v6 10/10] virtiofsd: Add an option to enable/disable
 security label
Message-ID: <Ygpi2OTJxX8Xnqwz@redhat.com>
References: <20220208204813.682906-1-vgoyal@redhat.com>
 <20220208204813.682906-11-vgoyal@redhat.com>
 <YgpZ9m6p54h4LEZh@work-vm>
MIME-Version: 1.0
In-Reply-To: <YgpZ9m6p54h4LEZh@work-vm>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
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

On Mon, Feb 14, 2022 at 01:32:38PM +0000, Dr. David Alan Gilbert wrote:
> * Vivek Goyal (vgoyal@redhat.com) wrote:
> > Provide an option "-o security_label/no_security_label" to enable/disable
> > security label functionality. By default these are turned off.
> > 
> > If enabled, server will indicate to client that it is capable of handling
> > one security label during file creation. Typically this is expected to
> > be a SELinux label. File server will set this label on the file. It will
> > try to set it atomically wherever possible. But its not possible in
> > all the cases.
> > 
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> OK, but you have missed some of the docs typos I mentined in the last
> review; they can be cleared up any time.

Hi David,

I could not find any comments in V5 w.r.t doc typos. I am not sure which
email I have missed.

Anyway, will be nice if I can take care of these typos in a follow up
patch and these patches can be merged.

Thanks
Vivek
> 
> > ---
> >  docs/tools/virtiofsd.rst         | 32 ++++++++++++++++++++++++++++++++
> >  tools/virtiofsd/helper.c         |  1 +
> >  tools/virtiofsd/passthrough_ll.c | 15 +++++++++++++++
> >  3 files changed, 48 insertions(+)
> > 
> > diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> > index 07ac0be551..0c0560203c 100644
> > --- a/docs/tools/virtiofsd.rst
> > +++ b/docs/tools/virtiofsd.rst
> > @@ -104,6 +104,13 @@ Options
> >    * posix_acl|no_posix_acl -
> >      Enable/disable posix acl support.  Posix ACLs are disabled by default.
> >  
> > +  * security_label|no_security_label -
> > +    Enable/disable security label support. Security labels are disabled by
> > +    default. This will allow client to send a MAC label of file during
> > +    file creation. Typically this is expected to be SELinux security
> > +    label. Server will try to set that label on newly created file
> > +    atomically wherever possible.
> > +
> >  .. option:: --socket-path=PATH
> >  
> >    Listen on vhost-user UNIX domain socket at PATH.
> > @@ -348,6 +355,31 @@ client arguments or lists returned from the host.  This stops
> >  the client seeing any 'security.' attributes on the server and
> >  stops it setting any.
> >  
> > +SELinux support
> > +---------------
> > +One can enable support for SELinux by running virtiofsd with option
> > +"-o security_label". But this will try to save guest's security context
> > +in xattr security.selinux on host and it might fail if host's SELinux
> > +policy does not permit virtiofsd to do this operation.
> > +
> > +Hence, it is preferred to remap guest's "security.selinux" xattr to say
> > +"trusted.virtiofs.security.selinux" on host.
> > +
> > +"-o xattrmap=:map:security.selinux:trusted.virtiofs.:"
> > +
> > +This will make sure that guest and host's SELinux xattrs on same file
> > +remain separate and not interfere with each other. And will allow both
> > +host and guest to implement their own separate SELinux policies.
> > +
> > +Setting trusted xattr on host requires CAP_SYS_ADMIN. So one will need
> > +add this capability to daemon.
> > +
> > +"-o modcaps=+sys_admin"
> > +
> > +Giving CAP_SYS_ADMIN increases the risk on system. Now virtiofsd is more
> > +powerful and if gets compromised, it can do lot of damage to host system.
> > +So keep this trade-off in my mind while making a decision.
> > +
> >  Examples
> >  --------
> >  
> > diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> > index a8295d975a..e226fc590f 100644
> > --- a/tools/virtiofsd/helper.c
> > +++ b/tools/virtiofsd/helper.c
> > @@ -187,6 +187,7 @@ void fuse_cmdline_help(void)
> >             "                               default: no_allow_direct_io\n"
> >             "    -o announce_submounts      Announce sub-mount points to the guest\n"
> >             "    -o posix_acl/no_posix_acl  Enable/Disable posix_acl. (default: disabled)\n"
> > +           "    -o security_label/no_security_label  Enable/Disable security label. (default: disabled)\n"
> >             );
> >  }
> >  
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index d49128a58d..f3ec6aafe5 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -181,6 +181,7 @@ struct lo_data {
> >      int user_posix_acl, posix_acl;
> >      /* Keeps track if /proc/<pid>/attr/fscreate should be used or not */
> >      bool use_fscreate;
> > +    int user_security_label;
> >  };
> >  
> >  static const struct fuse_opt lo_opts[] = {
> > @@ -215,6 +216,8 @@ static const struct fuse_opt lo_opts[] = {
> >      { "no_killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 0 },
> >      { "posix_acl", offsetof(struct lo_data, user_posix_acl), 1 },
> >      { "no_posix_acl", offsetof(struct lo_data, user_posix_acl), 0 },
> > +    { "security_label", offsetof(struct lo_data, user_security_label), 1 },
> > +    { "no_security_label", offsetof(struct lo_data, user_security_label), 0 },
> >      FUSE_OPT_END
> >  };
> >  static bool use_syslog = false;
> > @@ -808,6 +811,17 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
> >          fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling posix_acl\n");
> >          conn->want &= ~FUSE_CAP_POSIX_ACL;
> >      }
> > +
> > +    if (lo->user_security_label == 1) {
> > +        if (!(conn->capable & FUSE_CAP_SECURITY_CTX)) {
> > +            fuse_log(FUSE_LOG_ERR, "lo_init: Can not enable security label."
> > +                     " kernel does not support FUSE_SECURITY_CTX capability.\n");
> > +        }
> > +        conn->want |= FUSE_CAP_SECURITY_CTX;
> > +    } else {
> > +        fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling security label\n");
> > +        conn->want &= ~FUSE_CAP_SECURITY_CTX;
> > +    }
> >  }
> >  
> >  static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
> > @@ -4279,6 +4293,7 @@ int main(int argc, char *argv[])
> >          .proc_self_task = -1,
> >          .user_killpriv_v2 = -1,
> >          .user_posix_acl = -1,
> > +        .user_security_label = -1,
> >      };
> >      struct lo_map_elem *root_elem;
> >      struct lo_map_elem *reserve_elem;
> > -- 
> > 2.34.1
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 


