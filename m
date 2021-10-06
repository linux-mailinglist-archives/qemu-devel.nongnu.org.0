Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65076424019
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 16:29:08 +0200 (CEST)
Received: from localhost ([::1]:39454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY7ut-0003ut-Cj
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 10:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mY7tu-00035M-Su
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mY7tt-0002UE-CY
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633530484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e3S9EZdtMgblR0tyH320CrMHHC/eMBnUneQK2qMY+NM=;
 b=clj1U+1vvV91FFLTeFuGpkZyolWyoqi1CmvrVZ5y+Ejn0wBnL6w6yuCfWoJZuXcngyj/Ox
 +vGX3KI46pWL3+xwbmCydFk77BKqRZ04ZkTUy9HQIDURuz2ZpL11sj/95awPEFJ49Tx9Lv
 JS0V0ZRW/qQ6pR5eviqxTgTXUC5CTyM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-qAUJhQzeNna5QyVur3xgmw-1; Wed, 06 Oct 2021 10:28:03 -0400
X-MC-Unique: qAUJhQzeNna5QyVur3xgmw-1
Received: by mail-wr1-f69.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso2194683wrr.15
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 07:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=e3S9EZdtMgblR0tyH320CrMHHC/eMBnUneQK2qMY+NM=;
 b=gonLJ1LgqZBCOMPWj8NaVNldUTN80poaWny+UXUEGqTYjuZrbfauV7CruUhi/f9Tsr
 EE7HfF/+b5wv0AiX655DRlkzwZTrWLOMCn/7zBMEYxgJpHGhqmAauv/y5HWW+oYT61Fw
 jLe71GW9lRvA+G1QtfY8xsAzqMOEfBrN9sfkpgPvSgrlfrosNGHxvFJ2qosG+yI0U7uJ
 vEAEWz7ifqcwzGh+R99ARwYI2Y3S/xBQLnnt/Fyykk/iyGWHPFsHOKqQliZorK96yhGg
 TglJbkPkorhdrBreYEVagimQ+7gdd3//2yIyj+dbC5jCT3TAePFqCzO96pKNBIEkcRPT
 q5Mw==
X-Gm-Message-State: AOAM530ZePuglDmZKRrlV04iyrObRpuL2eixhOmj7BLOI4OsOtwKDUAD
 35VefcSOTgOoSTspmRyBxDBXQjLJutWV4UezfbF9Yhc4Ea9lZzhckVCxKPNA8s11/TAEPkKhbGU
 k5hdhlC/J6mQpt8g=
X-Received: by 2002:adf:ebcd:: with SMTP id v13mr29721601wrn.400.1633530481972; 
 Wed, 06 Oct 2021 07:28:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxen2KsrHIhPItn6Ly6xWUVp+wzau9dH/qJkZChzwNeIxYDyAGkNGl7rcZJaPv2nEORj8vazA==
X-Received: by 2002:adf:ebcd:: with SMTP id v13mr29721570wrn.400.1633530481757; 
 Wed, 06 Oct 2021 07:28:01 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id c25sm2442946wml.37.2021.10.06.07.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 07:28:01 -0700 (PDT)
Date: Wed, 6 Oct 2021 15:27:59 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v0 0/2] virtio-blk and vhost-user-blk cross-device
 migration
Message-ID: <YV2yb0Nsx80dysWs@work-vm>
References: <20211005161008.iq5ao7t2sdqeo6kc@habkost.net>
 <20211005175503-mutt-send-email-mst@kernel.org>
 <YV1ZuizhQ5gO9nd6@work-vm>
 <20211006041419-mutt-send-email-mst@kernel.org>
 <YV1eQmM/+HXZy06C@work-vm>
 <20211006043314-mutt-send-email-mst@kernel.org>
 <YV1hyB4oeRDNbFjw@work-vm>
 <20211006081653-mutt-send-email-mst@kernel.org>
 <YV2kwdeC04HYry7h@work-vm>
 <20211006093707-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211006093707-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
> On Wed, Oct 06, 2021 at 02:29:37PM +0100, Dr. David Alan Gilbert wrote:
> > * Michael S. Tsirkin (mst@redhat.com) wrote:
> > > On Wed, Oct 06, 2021 at 09:43:52AM +0100, Dr. David Alan Gilbert wrote:
> > > > * Michael S. Tsirkin (mst@redhat.com) wrote:
> > > > > On Wed, Oct 06, 2021 at 09:28:50AM +0100, Dr. David Alan Gilbert wrote:
> > > > > > To me it feels the same as the distinction between vhost-kernel and qemu
> > > > > > backended virtio that we get in net and others - in principal it's just 
> > > > > > another implementation.
> > > > > 
> > > > > In net it's actually like this. Same -device, a different netdev.
> > > > > 
> > > > > > A tricky part is guaranteeing the set of visible virtio features between
> > > > > > implementations; we have that problem when we use vhost-kernel and run
> > > > > > on a newer/older kernel and gain virtio features; the same will be true
> > > > > > with vhost-user implementations.
> > > > > 
> > > > > That's not new but yes we need to work on this.
> > > > > 
> > > > > > But this would make the structure of a vhost-user implementation quite
> > > > > > different.
> > > > > > 
> > > > > > Dave
> > > > > 
> > > > > Right. That's why I'm reluctant to just add a new device type that
> > > > > has special compatibility requirements.
> > > > 
> > > > Hmm but there's already another layer of hack^Wabstraction in there isn't there -
> > > > there's already:
> > > >     virtio-blk-pci
> > > >     virtio-blk-device
> > > > 
> > > > created when the user specifies a virtio-blk device?
> > > > 
> > > > Dave
> > > 
> > > virtio-*-pci is there because it was felt these devices look
> > > differently from e.g. virtio-ccw so should have a different name.
> > > virtio-blk-device is an internal thingy, users and guests have no idea.
> > 
> > Right, so to do what we're asking here, should we keep the
> > virtio-blk-pci and instantiate virtio-blk-vhost-user instead of
> > virtio-blk-device?
> > 
> > Dave
> 
> I guess that's possible, but we need to pass a bunch of parameters.
> -drive is probably the right want to do that, right?

I'm not sure about -drive - isn't that very tied into the block layer?

Dave

> > > 
> > > > 
> > > > > > > 
> > > > > > > > > -- 
> > > > > > > > > MST
> > > > > > > > > 
> > > > > > > > -- 
> > > > > > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
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


