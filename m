Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CF0439EAA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 20:43:25 +0200 (CEST)
Received: from localhost ([::1]:55718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf4wN-0007D8-KW
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 14:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mf4uN-0006WI-3T
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 14:41:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mf4uH-0000IB-Qn
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 14:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635187270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KHNn/2OM3/H1YoUUYekneuXqxnO/6wS8jvYzgbEEXd0=;
 b=Oi0YpereCaULtiwRMEI0oTEQs8XxoXLhSp7cMnD4yrO+UJjXvJ1sXqcRcafMLYrsTJDWI1
 MW3lYNSWwoLKxuT3wklVQcPDyp2qrAJiFXZMVt648r0aVnLyESLZFKOQHmiZzRllDTYdgX
 i2WC0n/3O/h1eLNc75guldDgAbnavag=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-Q7HS_82AMT-QhhSNmCj7WQ-1; Mon, 25 Oct 2021 14:41:09 -0400
X-MC-Unique: Q7HS_82AMT-QhhSNmCj7WQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 s3-20020a1ca903000000b0032326edebe1so42399wme.2
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 11:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KHNn/2OM3/H1YoUUYekneuXqxnO/6wS8jvYzgbEEXd0=;
 b=hynv7X/ZinT8myJMIrWK29c1/OGUogi8S5z1t23/glaRt6P++K834CXZXnVVZJqMlh
 RZhAD8ntcXtRNdy9u+Cch3JeTXDgkwHHZ/0HOXSb76XtDEP6eukGB4+Os6XOAIBF270I
 hZcXnzsZB6uuaIZvUBfPQhHFu4masETpsTxncmIKp7Q0CB/QHI3q90kGiG6BYNddwn4h
 Z2zxiQ6P1mxrxd/oROFVRXW+3PhCczsI+UPOQbtXkOua+MFu2ks/Ju/Vdv5wxUcRDf9z
 k2cgWHfu6uJDHr1tvsKGaD+CE8wPLP/IFH7c3bgQxhtL3+e3vydX+U17HByCOJUn1naz
 5DHw==
X-Gm-Message-State: AOAM533pVs022eIat4XHgzROupm8EfiLFTsXhV3LTDJjnV5DuY8nqlDX
 A3J1R/WWMIzqcEUxWSeH3VHROLgagRqchvLogQkdn0uOoSmhKGFhONXX/LJSE9+5ZSc8waK3GGK
 ulhDA+4L/5je9C6M=
X-Received: by 2002:a05:600c:4109:: with SMTP id
 j9mr15400986wmi.120.1635187267820; 
 Mon, 25 Oct 2021 11:41:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPXMr+84TTlAj6IO0ftsFsX2u0QKKU2nqAqmDHHIZOgPlRQEANQrDYRK/ejWTMIt7MWW56eA==
X-Received: by 2002:a05:600c:4109:: with SMTP id
 j9mr15400963wmi.120.1635187267641; 
 Mon, 25 Oct 2021 11:41:07 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id l124sm21144432wml.8.2021.10.25.11.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 11:41:07 -0700 (PDT)
Date: Mon, 25 Oct 2021 19:41:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Error on bad socket group name
Message-ID: <YXb6Qb1eB755PNhf@work-vm>
References: <20211014122554.34599-1-dgilbert@redhat.com>
 <YW1uK9J9GzNUbC6S@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YW1uK9J9GzNUbC6S@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, xiagao@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> On Thu, Oct 14, 2021 at 01:25:54PM +0100, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Make the '--socket-group=' option fail if the group name is unknown:
> > 
> > ./tools/virtiofsd/virtiofsd .... --socket-group=zaphod
> > vhost socket: unable to find group 'zaphod'
> > 
> > Reported-by: Xiaoling Gao <xiagao@redhat.com>
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Hi Dave,
> 
> This looks good to me. Just a minor nit for code cleanup. It could
> be done in a separate patch or sometime later as well.
> 
> Reviewed-by: Vivek Goyal <vgoyal@redhat.com>

Thanks

> > ---
> >  tools/virtiofsd/fuse_virtio.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> > index 8f4fd165b9..39eebffb62 100644
> > --- a/tools/virtiofsd/fuse_virtio.c
> > +++ b/tools/virtiofsd/fuse_virtio.c
> > @@ -999,6 +999,13 @@ static int fv_create_listen_socket(struct fuse_session *se)
> >                           "vhost socket failed to set group to %s (%d): %m\n",
> >                           se->vu_socket_group, g->gr_gid);
> >              }
> > +        } else {
> > +            fuse_log(FUSE_LOG_ERR,
> > +                     "vhost socket: unable to find group '%s'\n",
> > +                     se->vu_socket_group);
> > +            close(listen_sock);
> > +            umask(old_umask);
> 		^^^
> > +            return -1;
> >          }
> >      }
> >      umask(old_umask);
> 
> This umask() call could be moved little early right after bind() call and
> that way we don't have to take care of calling umask(old_umask) in error
> path if group name could not be found.

One to fight another day.

> Vivek
> > -- 
> > 2.31.1
> > 
> > _______________________________________________
> > Virtio-fs mailing list
> > Virtio-fs@redhat.com
> > https://listman.redhat.com/mailman/listinfo/virtio-fs
> > 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


