Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FAD655361
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 18:56:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8mGe-00074l-4C; Fri, 23 Dec 2022 12:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p8mGc-00072m-3I
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 12:55:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p8mGa-0002ax-K0
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 12:55:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671818131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N9P2ig/Ta3D4rhz4TVKF36KNwA0GLjKVtX/hA6bLnz4=;
 b=JitgAwm5ogZ4VdTtPZ6S7y0JAg9R8QpgECYjAg6CXCjUHmCWjSYsFsyTnTbRlj5cmGQUVS
 i5jmwiRBtb5WWiJgRZ3tTym89D7uVIJDM9yjBblciWKfqSjMNhpyJKlnFn4ZB5jYDBjKaB
 jE4YKAMR/GIIhvBOFiDKR5VTLh1fAAo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-226-fEhim6OnMVOIuWpN8RKz1Q-1; Fri, 23 Dec 2022 12:55:30 -0500
X-MC-Unique: fEhim6OnMVOIuWpN8RKz1Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 r14-20020a05640251ce00b0047d67ab2019so4090607edd.12
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 09:55:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N9P2ig/Ta3D4rhz4TVKF36KNwA0GLjKVtX/hA6bLnz4=;
 b=Nmr/Yca6aTPbSnsvH4sht5wpyzYV39KsN1G6qz7/1YRoCv/GAbkdxkMHaD0yxeNiDn
 XNtntR/KXyewkzIU8V7yaShSFt6E73qJy5Jh+GS+xv7nXs6Mht4MBPJNBthEA2mzPwxV
 J4Cd1TeDcVDwOOxxoR7Qy+eJs0fp1hV6o0E+ioR4ADt8iOPCVzuSx4p4t4T9zklJiqXe
 Ent+5DJTCwalgEwBXqN/EzKrBsiIj1IvLtfXsbuNcohUzbTsc+Kp9YZgUlxfbIw0qBa3
 mlo8x8/PtPj/Nj3XdI5gBHgqDVsGpAU5uRkNfwgn5dayHgMonMSaROtABXWLViFpKTRI
 hFGQ==
X-Gm-Message-State: AFqh2krfwA/NOkxYwWsmVc0Gky9IgohGbPk6MQJmIx7tGnGzTgoj2j3y
 TznGG+ot2H10pfAorFZ7XXm5dTyRh16Wm3viWIxtWG52QV4qAWG/lieQdI+j0uxPLlOaaslLe/t
 xi9jYuPYitwRGOPc=
X-Received: by 2002:a17:907:c242:b0:7c1:9e6:d38e with SMTP id
 tj2-20020a170907c24200b007c109e6d38emr10124828ejc.67.1671818129176; 
 Fri, 23 Dec 2022 09:55:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtANgowRXIWsVDjuG0GH2fSgzyqI7AmriiI4Xv8RbnaW8SlbZStSiGweuUiCCeHtAGTZMX+yg==
X-Received: by 2002:a17:907:c242:b0:7c1:9e6:d38e with SMTP id
 tj2-20020a170907c24200b007c109e6d38emr10124817ejc.67.1671818128908; 
 Fri, 23 Dec 2022 09:55:28 -0800 (PST)
Received: from redhat.com ([2.55.175.215]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709063ca200b007bd1ef2cccasm1580794ejh.48.2022.12.23.09.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 09:55:28 -0800 (PST)
Date: Fri, 23 Dec 2022 12:55:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, qemu-devel@nongnu.org,
 xieyongji@bytedance.com
Subject: Re: [PATCH v4 00/12] Compiler warning fixes for libvhost-user,libvduse
Message-ID: <20221223125109-mutt-send-email-mst@kernel.org>
References: <cover.1671741278.git.marcel@holtmann.org>
 <c901ed54-7861-f2fa-9221-d6253ba471e1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c901ed54-7861-f2fa-9221-d6253ba471e1@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 23, 2022 at 04:21:33PM +0100, Paolo Bonzini wrote:
> On 12/22/22 21:36, Marcel Holtmann wrote:
> > The libvhost-user and libvduse libraries are also useful for external
> > usage outside of QEMU and thus it would be nice if their files could
> > be just copied and used. However due to different compiler settings, a
> > lot of manual fixups are needed. This is the first attempt at some
> > obvious fixes that can be done without any harm to the code and its
> > readability.
> > 
> > Marcel Holtmann (12):
> >    libvhost-user: Provide _GNU_SOURCE when compiling outside of QEMU
> >    libvhost-user: Replace typeof with __typeof__
> >    libvhost-user: Cast rc variable to avoid compiler warning
> >    libvhost-user: Use unsigned int i for some for-loop iterations
> >    libvhost-user: Declare uffdio_register early to make it C90 compliant
> >    libvhost-user: Change dev->postcopy_ufd assignment to make it C90 compliant
> >    libvduse: Provide _GNU_SOURCE when compiling outside of QEMU
> >    libvduse: Switch to unsigned int for inuse field in struct VduseVirtq
> >    libvduse: Fix assignment in vring_set_avail_event
> >    libvhost-user: Fix assignment in vring_set_avail_event
> >    libvhost-user: Add extra compiler warnings
> >    libvduse: Add extra compiler warnings
> > 
> >   subprojects/libvduse/libvduse.c           |  9 ++++--
> >   subprojects/libvduse/meson.build          |  8 ++++-
> >   subprojects/libvhost-user/libvhost-user.c | 36 +++++++++++++----------
> >   subprojects/libvhost-user/meson.build     |  8 ++++-
> >   4 files changed, 42 insertions(+), 19 deletions(-)
> > 
> 
> Looks good, but what happened to "libvhost-user: Switch to unsigned int for
> inuse field in struct VuVirtq"?
> 
> (I can pick it up from v3, no need to respin).
> 
> Paolo

I merged that one IIRC.
Paolo I wandered whether if you are going to be merging patches in these
areas you wanted to be added to MAINTAINERS.

-- 
MST


