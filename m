Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8902169ADD5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 15:20:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT1bU-0001Cv-8j; Fri, 17 Feb 2023 09:20:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pT1bL-00012J-VE
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:20:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pT1bK-00067L-44
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676643634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gUoA8EkxjfD0Y3BGWsnNNOImZh/Rnv9eIdhJgkaU9HI=;
 b=Pje+RBmgjXL0of34Z6vb8IPnMM63LyhoSo/u4ZghNf2PUPVcTsVyn5ezm5uZKGGk30i7Z6
 46SymIu/loowq/z4PJT3S2TulytgD2iLR4u7E5l7qLgA3X8qBO6Z3i4GyeWSJyGCovmwBB
 Okp8oMePXeWKBFm3GSxGj3d47VQHaPQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-440-GmamQ-7_NAKabhKjSqVQKw-1; Fri, 17 Feb 2023 09:20:32 -0500
X-MC-Unique: GmamQ-7_NAKabhKjSqVQKw-1
Received: by mail-wm1-f69.google.com with SMTP id
 l36-20020a05600c1d2400b003dfe4bae099so704043wms.0
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 06:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gUoA8EkxjfD0Y3BGWsnNNOImZh/Rnv9eIdhJgkaU9HI=;
 b=a9dlf+BpKxPfnVHBsGkBFy1FB40gmMVPbpzDk3KL6XhGwgyKO7jFuTDJWiBTmliXEU
 5PvR4TbQsFP+cqJIdiHA2SEDehZLeps1O3dqoqd7WaWAyKJSU6DPkTex3pIQEr4Rw1eQ
 uBOZK5SKvRNjf4crecFLXQWcSVzVZ0Cd80tIYEQ0ThwBRVdX6HXFRwwygklAW2xyKY6L
 HUGWornYyWEN97ugYGD83k83wVS87ms9hU6DKlkxWVB48V72Jlh74Dy34Q58LLgPLbYt
 qUqrkL42LrlhjKeSwZhwUl+OjslBF7sKGl0Uksi6lJUT3CpDEOf69AJgfZL7eqrsstTV
 Z8gg==
X-Gm-Message-State: AO0yUKUw2ZdJ0wgzzstGlDyefi4yOxElvSMCajSFHY6TglOYEeFVcEgn
 fogM8EUM5NxDb17EvE7luQCH9+M7x3tR2HxL/bo9MP1964I3lu+84JJikiWTB2ZrI18pvR0zvNa
 pxRWD0FT0muQqVyY=
X-Received: by 2002:a05:600c:30d3:b0:3e2:91c:7cb7 with SMTP id
 h19-20020a05600c30d300b003e2091c7cb7mr5086784wmn.39.1676643631733; 
 Fri, 17 Feb 2023 06:20:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/qj6CBC/0f4uMRN6lwIXNoI4WRoz3gZWOqKWX2Q4I5pGazEXnRKVkItPEPTVpEhz8rj60uDg==
X-Received: by 2002:a05:600c:30d3:b0:3e2:91c:7cb7 with SMTP id
 h19-20020a05600c30d300b003e2091c7cb7mr5086771wmn.39.1676643631416; 
 Fri, 17 Feb 2023 06:20:31 -0800 (PST)
Received: from redhat.com ([2.52.5.34]) by smtp.gmail.com with ESMTPSA id
 az17-20020a05600c601100b003dd1bd0b915sm1969202wmb.22.2023.02.17.06.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 06:20:30 -0800 (PST)
Date: Fri, 17 Feb 2023 09:20:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v1 0/2] vhost: memslot handling improvements
Message-ID: <20230217091959-mutt-send-email-mst@kernel.org>
References: <20230216114752.198627-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216114752.198627-1-david@redhat.com>
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

On Thu, Feb 16, 2023 at 12:47:50PM +0100, David Hildenbrand wrote:
> Following up on my previous work to make virtio-mem consume multiple
> memslots dynamically [1] that requires precise accounting between used vs.
> reserved memslots, I realized that vhost makes this extra hard by
> filtering out some memory region sections (so they don't consume a
> memslot) in the vhost-user case, which messes up the whole memslot
> accounting.
> 
> This series fixes what I found to be broken and prepares for more work on
> [1]. Further, it cleanes up the merge checks that I consider unnecessary.
> 
> [1] https://lkml.kernel.org/r/20211027124531.57561-8-david@redhat.com
> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>


Igor worked on memslots a lot previously and he asked for
a bit of time to review this, so I'll wait a bit before
applying.

> David Hildenbrand (2):
>   vhost: Defer filtering memory sections until building the vhost memory
>     structure
>   vhost: Remove vhost_backend_can_merge() callback
> 
>  hw/virtio/vhost-user.c            | 14 -----
>  hw/virtio/vhost-vdpa.c            |  1 -
>  hw/virtio/vhost.c                 | 85 ++++++++++++++++++++-----------
>  include/hw/virtio/vhost-backend.h |  4 --
>  4 files changed, 56 insertions(+), 48 deletions(-)
> 
> -- 
> 2.39.1


