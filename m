Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96093B688D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 20:35:35 +0200 (CEST)
Received: from localhost ([::1]:37312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxw6Y-0001N8-Ie
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 14:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxw5N-0000NI-OP
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxw5L-0005Zz-Ad
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:34:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624905258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uqM6wm1ajQ97Cy1OVFOvDg0exusvw0ePBFc1wikbJnM=;
 b=CCBNw84KJXCfxiv7C60dzdITz8ryk3kfWVB1Do2lYgRjyevCpM1tQZuL79lX5ECK4cMtX2
 FJ4kjlTiLzQf9HDJWMnlTjGnF1j0upSMRwkGC6Jl4iT3/ozYoZIbiZCEcBnw+mgMA4XOrT
 1RzwJ3qeF19vYAMjDzIriX8AZGS9v88=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-o9ELz8lPNtOn_oX8cH3Isw-1; Mon, 28 Jun 2021 14:34:16 -0400
X-MC-Unique: o9ELz8lPNtOn_oX8cH3Isw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n129-20020a1cbd870000b02901ed2c72a2aeso360305wmf.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 11:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uqM6wm1ajQ97Cy1OVFOvDg0exusvw0ePBFc1wikbJnM=;
 b=RMlHeApO5NEyTWjumumw8KkDUDQWM4kVgNhHZLnwlg1ALXyajsSsxGybl8aif6sTba
 Yb1fiqUrCVsJ1e0ccl11C0bhkA9prhGoh1e8U83dXR9yg+16v4j/JqcovUtO/UNA7jQs
 99cmTszqWy6GEVJ/aEbi324qVRVOjTAU5NJSgD+fpjSkK07oRWputJ2+gHSuSNe9ndgn
 6kYieMbrjDAG1VP0UqeNIKRSww/I7vQlVX9tgMARFuYynSoUaGnnx2qFl0mZie8Gd7gI
 UlpPjyjPskDK+h/cweqKLfuKvHvvr5/RAu1VQuD37PGmFTnPvo91aE8bSSjpDL9pWa2L
 yxlw==
X-Gm-Message-State: AOAM532J10u+2VwXQoygD1XHLmVHZ2SEVtcgVoR9MdoyM2FcG5341Q+e
 15sHnfBihnVVGb9qsjasZQb+WeevQ6sHhAd+ogmeUF4g9sSPEvMAbKTEUIyP/nKpH3uWORIiZ0M
 EDYytxOGLPGk229k=
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr27186110wmh.183.1624905255660; 
 Mon, 28 Jun 2021 11:34:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvLD6FCGh99jjsjBD+/gyLrSUJbGrIMKnGOYKosWGuuoa3neMQ8paK2qGW2d6JUfJv0kVGRA==
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr27186090wmh.183.1624905255369; 
 Mon, 28 Jun 2021 11:34:15 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id u9sm13552281wmq.41.2021.06.28.11.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 11:34:14 -0700 (PDT)
Date: Mon, 28 Jun 2021 19:34:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v7 3/7] virtiofsd: Add support for extended setxattr
Message-ID: <YNoWJe6uKfth/SD/@work-vm>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-4-vgoyal@redhat.com>
 <YNnvbneBCm4GYRP9@work-vm> <20210628182800.GG1803896@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210628182800.GG1803896@redhat.com>
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
> On Mon, Jun 28, 2021 at 04:49:02PM +0100, Dr. David Alan Gilbert wrote:
> > * Vivek Goyal (vgoyal@redhat.com) wrote:
> > > Add the bits to enable support for setxattr_ext if fuse offers it. Do not
> > > enable it by default yet. Let passthrough_ll opt-in. Enabling it by deafult
> > > kind of automatically means that you are taking responsibility of clearing
> > > SGID if ACL is set.
> > > 
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > ---
> > >  tools/virtiofsd/fuse_common.h    |  5 +++++
> > >  tools/virtiofsd/fuse_lowlevel.c  | 11 ++++++++++-
> > >  tools/virtiofsd/fuse_lowlevel.h  |  3 ++-
> > >  tools/virtiofsd/passthrough_ll.c |  3 ++-
> > >  4 files changed, 19 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
> > > index 0c2665b977..8abac80098 100644
> > > --- a/tools/virtiofsd/fuse_common.h
> > > +++ b/tools/virtiofsd/fuse_common.h
> > > @@ -377,6 +377,11 @@ struct fuse_file_info {
> > >   */
> > >  #define FUSE_CAP_SETXATTR_EXT (1 << 29)
> > >  
> > > +/**
> > > + * Indicates that file server supports extended struct fuse_setxattr_in
> > > + */
> > > +#define FUSE_CAP_SETXATTR_EXT (1 << 29)
> > > +
> > 
> > You already added that in 1/7 - but other than that, 
> 
> Good catch. Do I need to repost patch/series due to this change or this
> is something you can take care of while applying patches.

I can fix it.

Dave

> Vivek
> 
> > 
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > >  /**
> > >   * Ioctl flags
> > >   *
> > > diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> > > index c2b6ff1686..d1e24c013f 100644
> > > --- a/tools/virtiofsd/fuse_lowlevel.c
> > > +++ b/tools/virtiofsd/fuse_lowlevel.c
> > > @@ -1439,7 +1439,9 @@ static void do_setxattr(fuse_req_t req, fuse_ino_t nodeid,
> > >      }
> > >  
> > >      if (req->se->op.setxattr) {
> > > -        req->se->op.setxattr(req, nodeid, name, value, arg->size, arg->flags);
> > > +        uint32_t setxattr_flags = setxattr_ext ? arg->setxattr_flags : 0;
> > > +        req->se->op.setxattr(req, nodeid, name, value, arg->size, arg->flags,
> > > +                             setxattr_flags);
> > >      } else {
> > >          fuse_reply_err(req, ENOSYS);
> > >      }
> > > @@ -1986,6 +1988,9 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
> > >      if (arg->flags & FUSE_HANDLE_KILLPRIV_V2) {
> > >          se->conn.capable |= FUSE_CAP_HANDLE_KILLPRIV_V2;
> > >      }
> > > +    if (arg->flags & FUSE_SETXATTR_EXT) {
> > > +        se->conn.capable |= FUSE_CAP_SETXATTR_EXT;
> > > +    }
> > >  #ifdef HAVE_SPLICE
> > >  #ifdef HAVE_VMSPLICE
> > >      se->conn.capable |= FUSE_CAP_SPLICE_WRITE | FUSE_CAP_SPLICE_MOVE;
> > > @@ -2121,6 +2126,10 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
> > >          outarg.flags |= FUSE_HANDLE_KILLPRIV_V2;
> > >      }
> > >  
> > > +    if (se->conn.want & FUSE_CAP_SETXATTR_EXT) {
> > > +        outarg.flags |= FUSE_SETXATTR_EXT;
> > > +    }
> > > +
> > >      fuse_log(FUSE_LOG_DEBUG, "   INIT: %u.%u\n", outarg.major, outarg.minor);
> > >      fuse_log(FUSE_LOG_DEBUG, "   flags=0x%08x\n", outarg.flags);
> > >      fuse_log(FUSE_LOG_DEBUG, "   max_readahead=0x%08x\n", outarg.max_readahead);
> > > diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
> > > index 3bf786b034..4b4e8c9724 100644
> > > --- a/tools/virtiofsd/fuse_lowlevel.h
> > > +++ b/tools/virtiofsd/fuse_lowlevel.h
> > > @@ -798,7 +798,8 @@ struct fuse_lowlevel_ops {
> > >       *   fuse_reply_err
> > >       */
> > >      void (*setxattr)(fuse_req_t req, fuse_ino_t ino, const char *name,
> > > -                     const char *value, size_t size, int flags);
> > > +                     const char *value, size_t size, int flags,
> > > +                     uint32_t setxattr_flags);
> > >  
> > >      /**
> > >       * Get an extended attribute
> > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > > index ec91b3c133..9f5cd98fb5 100644
> > > --- a/tools/virtiofsd/passthrough_ll.c
> > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > @@ -2955,7 +2955,8 @@ out:
> > >  }
> > >  
> > >  static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
> > > -                        const char *value, size_t size, int flags)
> > > +                        const char *value, size_t size, int flags,
> > > +                        uint32_t extra_flags)
> > >  {
> > >      char procname[64];
> > >      const char *name;
> > > -- 
> > > 2.25.4
> > > 
> > -- 
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


