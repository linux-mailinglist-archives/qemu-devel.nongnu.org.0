Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C159423F62
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:34:41 +0200 (CEST)
Received: from localhost ([::1]:50566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY74C-0004Yh-Bo
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mY6zU-00086X-Dz
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:29:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mY6zQ-0002CR-EB
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633526982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5hfKRE511lJ83LCCcrzv6t2ESQGoSP2q+gmf/tgJReg=;
 b=YiBOhiNPzHWEKWbIrl5PRQeOvEf+grVCL0XhUnjuKNF7nHWCJ7VjeJ5RN6ozOXxxE+0lTE
 AfZ+yb4o3mzXJJB8bM0/A19qRkdeHSa+ViNS2WtU5vjP9EFYBc3mZDlc+8cNMmIAn6AVBC
 MMwKDtWK00cZdRXP1kvncN3YUU4OT2A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-acgUIj9INgGq2DxQeWge3Q-1; Wed, 06 Oct 2021 09:29:41 -0400
X-MC-Unique: acgUIj9INgGq2DxQeWge3Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 h11-20020adfa4cb000000b00160c791a550so1873319wrb.6
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 06:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5hfKRE511lJ83LCCcrzv6t2ESQGoSP2q+gmf/tgJReg=;
 b=CETdjElX4T1/ZyvGXf+mUBpa8O9qge85DarehfDDUXCfdppO6YpWowHY/plHEE4zeB
 8bp3yUFo4KRZqfHBY9dpCJpQ9xHrVOR0OVI4cBCAfvAGww+48x2mFaZPaWNURcyybEUY
 BAo6l01ZGKzuQjI2YeRKPzYevRU0sK6VQd/WTAIV3kh/PH5qXvmDUrbohvT1L5pBZFt0
 75Eq2itGgZdT2TL8NAYuhcZdt6TCrd+GjmgpLQyvbp2HMRQSgxWYNk9/ykIunkvKYS/V
 gP5xkPsVZ4e5CrzGh7PWr3VK1SYb4QA0YfGVkJJb8rXJpHUNIdbR/ufFsxGVJH9hnDKM
 omgQ==
X-Gm-Message-State: AOAM533u8N9V0MJFWu1BSWZ/xBKP7IO5o522W5xDtoWV6qpSVtLcrplV
 v2yn16BXF5rOiqHzkUBCqRonLhJvOGlPYfKmH+bN+TNZhEtWBRKuhrXV8yKEppZNt826c47t1/k
 WAtvWCtI3F9cROMY=
X-Received: by 2002:a7b:c441:: with SMTP id l1mr9673063wmi.69.1633526980647;
 Wed, 06 Oct 2021 06:29:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWipLxXL2fLrB4klMTjjZpySGjaTwH8zm69yMbD6dIuNUNNczH0+TV+UBH21S1sj0VhYEGyQ==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr9673030wmi.69.1633526980400;
 Wed, 06 Oct 2021 06:29:40 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id n68sm5289143wmn.13.2021.10.06.06.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 06:29:39 -0700 (PDT)
Date: Wed, 6 Oct 2021 14:29:37 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v0 0/2] virtio-blk and vhost-user-blk cross-device
 migration
Message-ID: <YV2kwdeC04HYry7h@work-vm>
References: <20211005024754-mutt-send-email-mst@kernel.org>
 <YVxaodahFBOvANL0@work-vm>
 <20211005161008.iq5ao7t2sdqeo6kc@habkost.net>
 <20211005175503-mutt-send-email-mst@kernel.org>
 <YV1ZuizhQ5gO9nd6@work-vm>
 <20211006041419-mutt-send-email-mst@kernel.org>
 <YV1eQmM/+HXZy06C@work-vm>
 <20211006043314-mutt-send-email-mst@kernel.org>
 <YV1hyB4oeRDNbFjw@work-vm>
 <20211006081653-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211006081653-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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

* Michael S. Tsirkin (mst@redhat.com) wrote:
> On Wed, Oct 06, 2021 at 09:43:52AM +0100, Dr. David Alan Gilbert wrote:
> > * Michael S. Tsirkin (mst@redhat.com) wrote:
> > > On Wed, Oct 06, 2021 at 09:28:50AM +0100, Dr. David Alan Gilbert wrote:
> > > > To me it feels the same as the distinction between vhost-kernel and qemu
> > > > backended virtio that we get in net and others - in principal it's just 
> > > > another implementation.
> > > 
> > > In net it's actually like this. Same -device, a different netdev.
> > > 
> > > > A tricky part is guaranteeing the set of visible virtio features between
> > > > implementations; we have that problem when we use vhost-kernel and run
> > > > on a newer/older kernel and gain virtio features; the same will be true
> > > > with vhost-user implementations.
> > > 
> > > That's not new but yes we need to work on this.
> > > 
> > > > But this would make the structure of a vhost-user implementation quite
> > > > different.
> > > > 
> > > > Dave
> > > 
> > > Right. That's why I'm reluctant to just add a new device type that
> > > has special compatibility requirements.
> > 
> > Hmm but there's already another layer of hack^Wabstraction in there isn't there -
> > there's already:
> >     virtio-blk-pci
> >     virtio-blk-device
> > 
> > created when the user specifies a virtio-blk device?
> > 
> > Dave
> 
> virtio-*-pci is there because it was felt these devices look
> differently from e.g. virtio-ccw so should have a different name.
> virtio-blk-device is an internal thingy, users and guests have no idea.

Right, so to do what we're asking here, should we keep the
virtio-blk-pci and instantiate virtio-blk-vhost-user instead of
virtio-blk-device?

Dave

> 
> > 
> > > > > 
> > > > > > > -- 
> > > > > > > MST
> > > > > > > 
> > > > > > -- 
> > > > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > > > 
> > > > -- 
> > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > 
> > -- 
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


