Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CB26ADD11
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:15:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVGm-0007WM-KB; Tue, 07 Mar 2023 06:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZVGk-0007Vy-PD
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:14:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZVGj-000397-2e
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:14:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678187648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dPCQsL71GI7kRDszly58K09RSQgJG0DXeu0IBHMcK18=;
 b=Coe91FGEkX7EtMqPmpvTk5uTtoZMbSRGjXkh64qW90omts9N8+Lj1jzSyS9PfyyjilodDY
 hoK1blepj6c8vLLSCcjk86TPacG00JTFUHhVjJqrrRw6bIvud4hBy5ucgMvkCFbs3+5DOg
 LVwBYGYGdqYAKBUSRUMSd8qD2OCkUOE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-gn-N4XgwM3StmogG5N-ujg-1; Tue, 07 Mar 2023 06:14:07 -0500
X-MC-Unique: gn-N4XgwM3StmogG5N-ujg-1
Received: by mail-ed1-f70.google.com with SMTP id
 r9-20020a05640251c900b004d4257341c2so12725245edd.19
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678187645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dPCQsL71GI7kRDszly58K09RSQgJG0DXeu0IBHMcK18=;
 b=IFMYhIPXLwdG0/GPh3fK3sWykoJmIhOprBlOUiLP8hhRqByAqfxX/fM/Fzk6L71RsE
 0tHsgZUF7jY1HunH4PzUo37tRH3gPTGsik9QD1FYdhY22q+spnBe+vjLFI5Xrl+2SEpS
 LlCV7uOs9QhsnuW32clDEGBiXUR6i+oRmLMxr5BG4rKTjgBnhSPTIJTHQ419NEiUgQqO
 ntx4bVrtQ2jGie+znzkBY6eF3CIYQ3a/g3TseSgLL4pmHERBQmxRRCpBfGAOJ0wJ7TqB
 DeV5+xC3UdUbYLXxd6Z/MWoeRyLO6/gxf9mN8OJI2kyhCg6XBaMaT/pxpd7Mo93v8yDm
 KEAw==
X-Gm-Message-State: AO0yUKWb1olF9zIGyNzNRvohGFh260Ga9Gjblt1L3kd+j/+uLqOT3chS
 TwnYuxzuUILmseOQiTb3FG/hXP/lFBv/yE2DFwPPSC9k48O3sFWKyVf42dQ297G5PM3PDdkc1Vu
 /Sl9flied+5ubNnThgMCW3+Y=
X-Received: by 2002:a17:906:2db1:b0:7c9:6e0e:1427 with SMTP id
 g17-20020a1709062db100b007c96e0e1427mr12420898eji.6.1678187645738; 
 Tue, 07 Mar 2023 03:14:05 -0800 (PST)
X-Google-Smtp-Source: AK7set/j2PgSIMobRTRrho0mWCa/Jo5xPxTwY1GNL0ZYwhzSm28mklhI54kShi49P73hawARD5e8gw==
X-Received: by 2002:a17:906:2db1:b0:7c9:6e0e:1427 with SMTP id
 g17-20020a1709062db100b007c96e0e1427mr12420885eji.6.1678187645464; 
 Tue, 07 Mar 2023 03:14:05 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 j23-20020a170906255700b008d9c518a318sm6027779ejb.142.2023.03.07.03.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:14:04 -0800 (PST)
Date: Tue, 7 Mar 2023 12:14:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org, Stefan
 Hajnoczi <stefanha@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [PATCH v1 0/2] vhost: memslot handling improvements
Message-ID: <20230307121404.20239e1f@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230217091959-mutt-send-email-mst@kernel.org>
References: <20230216114752.198627-1-david@redhat.com>
 <20230217091959-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Fri, 17 Feb 2023 09:20:27 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Feb 16, 2023 at 12:47:50PM +0100, David Hildenbrand wrote:
> > Following up on my previous work to make virtio-mem consume multiple
> > memslots dynamically [1] that requires precise accounting between used vs.
> > reserved memslots, I realized that vhost makes this extra hard by
> > filtering out some memory region sections (so they don't consume a
> > memslot) in the vhost-user case, which messes up the whole memslot
> > accounting.
> > 
> > This series fixes what I found to be broken and prepares for more work on
> > [1]. Further, it cleanes up the merge checks that I consider unnecessary.
> > 
> > [1] https://lkml.kernel.org/r/20211027124531.57561-8-david@redhat.com
> > 
> > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > Cc: Stefan Hajnoczi <stefanha@redhat.com>
> > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>  
> 
> 
> Igor worked on memslots a lot previously and he asked for
> a bit of time to review this, so I'll wait a bit before
> applying.

I've reviewed it as much as I could.
(That said, vhost mem map code was mostly rewritten by dgilbert,
since the last time I've touched it, so his review would be
more valuable in this case than mine)

> 
> > David Hildenbrand (2):
> >   vhost: Defer filtering memory sections until building the vhost memory
> >     structure
> >   vhost: Remove vhost_backend_can_merge() callback
> > 
> >  hw/virtio/vhost-user.c            | 14 -----
> >  hw/virtio/vhost-vdpa.c            |  1 -
> >  hw/virtio/vhost.c                 | 85 ++++++++++++++++++++-----------
> >  include/hw/virtio/vhost-backend.h |  4 --
> >  4 files changed, 56 insertions(+), 48 deletions(-)
> > 
> > -- 
> > 2.39.1  
> 
> 


