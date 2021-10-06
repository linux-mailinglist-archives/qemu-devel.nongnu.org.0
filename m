Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44D8423F8C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:42:26 +0200 (CEST)
Received: from localhost ([::1]:55962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY7Bh-00007v-Sv
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY79G-0007bU-R2
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:39:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY79F-0008Hf-1j
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633527592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hfE4jXDG0AqL27Nmz24F+Oh1ZKawM+6vbYNpNvScchY=;
 b=MqlY58Hq2VGksy6qDwoPo5DDiZAp/drc58bLEgWojMfZVeGU6OXp5VDEKFB3VFk5V3UrLf
 lntohOhwyv0MMR41FAMjmcy6VJYkTqNX3xz9eU7drMcgnMNtFqKfbFFgBRDovulquE2//M
 BlrFh2r8Mz1eXlGuCp/guDMoJBK87IY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-BeLJAX2gOEig1H8MJbw6Bw-1; Wed, 06 Oct 2021 09:39:49 -0400
X-MC-Unique: BeLJAX2gOEig1H8MJbw6Bw-1
Received: by mail-wr1-f72.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so2093749wrh.0
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 06:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hfE4jXDG0AqL27Nmz24F+Oh1ZKawM+6vbYNpNvScchY=;
 b=KPTFvh8Gb4SYQwOs7QuGpa1U8ziitUhPFKRk3Upm3DiiNoA/DAG9nsjDP1n5YNqWWE
 nE6Ec/qTlNEwf3vZfNJ7f1ZhN1Mi3qUJql1vdxZ3HHkb37f0+rlPWsgqoX60De90Rr8o
 UkUCcCGKx3ophXdtkG2DOyUESdbl4oLmjq5z438Ncr4p0OGhKOYvDTX37hIiO+JcsMgi
 44Uy+cZzVch70xfIIoSRLlCIFTFJsmmwZPv8MTRIKoWp+yL/Hn7LWR9u3WJ2sNltX9xr
 2KHSP8D2J8MLh+vSm5QzqDwO04tnYT8UE7T/jc7SEiBNufR4zN+dUyaqgDh+pBXpwz07
 ev1w==
X-Gm-Message-State: AOAM533GpCGVwyZWKZHgIV/HPNq9vDds4SuDEEnWl/6G0pwCyniq0Xgp
 JXB/skBHz+Fqa1I9lOSif+szQwdVSFV7WeQuGLGcJd79W5y4SuCRcvxR6FybcrdimgW8KeaNWPH
 xvp0F4jTywQmmOkQ=
X-Received: by 2002:adf:df91:: with SMTP id z17mr17742016wrl.434.1633527587803; 
 Wed, 06 Oct 2021 06:39:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxutPG+KGY5sqEnt454oLZwwcLPRcsrXqrsn0SIHkevYgAVlXxCGXa2YQJBpqEmQGlIdhx10w==
X-Received: by 2002:adf:df91:: with SMTP id z17mr17741991wrl.434.1633527587611; 
 Wed, 06 Oct 2021 06:39:47 -0700 (PDT)
Received: from redhat.com ([2.55.143.13])
 by smtp.gmail.com with ESMTPSA id e15sm4587846wrr.38.2021.10.06.06.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 06:39:46 -0700 (PDT)
Date: Wed, 6 Oct 2021 09:39:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v0 0/2] virtio-blk and vhost-user-blk cross-device
 migration
Message-ID: <20211006093707-mutt-send-email-mst@kernel.org>
References: <YVxaodahFBOvANL0@work-vm>
 <20211005161008.iq5ao7t2sdqeo6kc@habkost.net>
 <20211005175503-mutt-send-email-mst@kernel.org>
 <YV1ZuizhQ5gO9nd6@work-vm>
 <20211006041419-mutt-send-email-mst@kernel.org>
 <YV1eQmM/+HXZy06C@work-vm>
 <20211006043314-mutt-send-email-mst@kernel.org>
 <YV1hyB4oeRDNbFjw@work-vm>
 <20211006081653-mutt-send-email-mst@kernel.org>
 <YV2kwdeC04HYry7h@work-vm>
MIME-Version: 1.0
In-Reply-To: <YV2kwdeC04HYry7h@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: kwolf@redhat.com, Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, raphael.norwitz@nutanix.com,
 Roman Kagan <rvkagan@yandex-team.ru>, yc-core@yandex-team.ru,
 pbonzini@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 06, 2021 at 02:29:37PM +0100, Dr. David Alan Gilbert wrote:
> * Michael S. Tsirkin (mst@redhat.com) wrote:
> > On Wed, Oct 06, 2021 at 09:43:52AM +0100, Dr. David Alan Gilbert wrote:
> > > * Michael S. Tsirkin (mst@redhat.com) wrote:
> > > > On Wed, Oct 06, 2021 at 09:28:50AM +0100, Dr. David Alan Gilbert wrote:
> > > > > To me it feels the same as the distinction between vhost-kernel and qemu
> > > > > backended virtio that we get in net and others - in principal it's just 
> > > > > another implementation.
> > > > 
> > > > In net it's actually like this. Same -device, a different netdev.
> > > > 
> > > > > A tricky part is guaranteeing the set of visible virtio features between
> > > > > implementations; we have that problem when we use vhost-kernel and run
> > > > > on a newer/older kernel and gain virtio features; the same will be true
> > > > > with vhost-user implementations.
> > > > 
> > > > That's not new but yes we need to work on this.
> > > > 
> > > > > But this would make the structure of a vhost-user implementation quite
> > > > > different.
> > > > > 
> > > > > Dave
> > > > 
> > > > Right. That's why I'm reluctant to just add a new device type that
> > > > has special compatibility requirements.
> > > 
> > > Hmm but there's already another layer of hack^Wabstraction in there isn't there -
> > > there's already:
> > >     virtio-blk-pci
> > >     virtio-blk-device
> > > 
> > > created when the user specifies a virtio-blk device?
> > > 
> > > Dave
> > 
> > virtio-*-pci is there because it was felt these devices look
> > differently from e.g. virtio-ccw so should have a different name.
> > virtio-blk-device is an internal thingy, users and guests have no idea.
> 
> Right, so to do what we're asking here, should we keep the
> virtio-blk-pci and instantiate virtio-blk-vhost-user instead of
> virtio-blk-device?
> 
> Dave

I guess that's possible, but we need to pass a bunch of parameters.
-drive is probably the right want to do that, right?

> > 
> > > 
> > > > > > 
> > > > > > > > -- 
> > > > > > > > MST
> > > > > > > > 
> > > > > > > -- 
> > > > > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > > > > 
> > > > > -- 
> > > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > > 
> > > -- 
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


