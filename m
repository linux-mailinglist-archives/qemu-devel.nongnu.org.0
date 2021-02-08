Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5D13143F9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:39:09 +0100 (CET)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9G7Y-0003U8-5a
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l9BPe-0001tA-Tb
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:37:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l9BPc-0003gr-EU
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612809446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XwjvisJu6nMd4SpxdX1waovkBYzEooG6ZjTyt4Us5Jk=;
 b=hPnGgE5J6nzUgUG+r8m2S0v0qUb/1Vzt1NokdO0h7cc05rGrPZMzfrRNAtEy/f5rswAqAQ
 AvWTOz7j9JCazCzBJguffbfC83SwGnUT6K9DQUGXZSmOfT3ZgKQUGfFQuSME4Tk9j6AxZY
 dzDtxCJuOtrlzOZW6BR/sKuEBUS7af4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-OxX2Zh7TNOWStq0YAopfug-1; Mon, 08 Feb 2021 13:37:24 -0500
X-MC-Unique: OxX2Zh7TNOWStq0YAopfug-1
Received: by mail-qv1-f70.google.com with SMTP id v13so11224602qvm.10
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XwjvisJu6nMd4SpxdX1waovkBYzEooG6ZjTyt4Us5Jk=;
 b=WFV18KHp/BFnAvTS30zmYlpckV0twns9TC/+Tx04eQ6gOb43aDtdj7uPfIe/ucmRhM
 /Txmf+wscFXxftlzbyWyBiRBhho9kgVzVRoHFzdeGga9YFTiAdwHBMkBbvdVg3DE5QXU
 L1ZkZgNasgFbjvXCG0Hpag6U44usZEC7evgx8+dAkFr668ue+j3khlrHLiLGxBc7Gzfo
 mmJfKNrUCxQMI69J5xmZpYW/0jICkhrEHhta+lHvoQNs0mn9BPWVxrFgvdu36XMRjJn6
 e/0yhgUuFfZXYV+Dxh7phfNar22khaonfQj9JaeXnug9VQ9+bAGb/bmyHe9aPaJyW09F
 bNcA==
X-Gm-Message-State: AOAM5314T6qqpHtI4fcgrk4pNeOR8BfMFKb6r0LjJUz0w4lWPS37kHnS
 l+4KgifhFE7ZqziF/7wt1M/Vbm+vOMM1fuHmialcYE6N6h7lNvXChWBERHcdhM2vaBhSeakRJ8o
 tpknQEDj2013BHuA=
X-Received: by 2002:ac8:7773:: with SMTP id h19mr16585560qtu.213.1612809443703; 
 Mon, 08 Feb 2021 10:37:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWZefHphBjxFWrtb71r+AV2Qfmx9XOMqMgyNuBRPchUDryzp6tY0ARyOcBLguwi83oGt1IUA==
X-Received: by 2002:ac8:7773:: with SMTP id h19mr16585540qtu.213.1612809443502; 
 Mon, 08 Feb 2021 10:37:23 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id r17sm14970427qta.78.2021.02.08.10.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:37:22 -0800 (PST)
Date: Mon, 8 Feb 2021 13:37:21 -0500
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
Message-ID: <20210208183721.GB68242@xz-x1>
References: <20210204191228.187550-1-peterx@redhat.com>
 <2382a93d-41c1-24fd-144f-87ee18171bc9@redhat.com>
 <213acf9a-d1c0-3a1d-4846-877d90fadc03@redhat.com>
 <20210205153107.GX6468@xz-x1>
 <a28ba439-758e-4b5b-86d9-5008b220b106@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a28ba439-758e-4b5b-86d9-5008b220b106@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Jean-Philippe Brucker <Jean-Philippe.Brucker@arm.com>,
 Auger Eric <eric.auger@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Eugenio Perez Martin <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 08, 2021 at 11:21:23AM +0800, Jason Wang wrote:

[...]

> > I'm not sure I remember it right, but we seem to have similar discussion
> > previously on "what if the user didn't specify ats=on" - I think at that time
> > the conclusion was that we ignore the failure since that's not a valid
> > configuration for qemu.
> 
> 
> Yes, but I think I was wrong at that time.

I can't say you're wrong - I actually still agree with you that at least
there's a priority of things we'd do, and this one is not extremely important
if that's not a major use case (say, if you will 100% always suggest an user to
use ats=on for a viommu enabled vhost).

> > 
> > The other issue I'm worried is (I think I mentioned it somewhere, but just to
> > double confirm): I'd like to make sure SMMU and virtio-iommu are the only IOMMU
> > platform that will use vhost.
> 
> 
> For upstream, it won't be easy :)

Sorry I definitely didn't make myself clear... :)

To be explicit, does ppc use vhost kernel too?  Since I know at least ppc has
its own translation unit and its iommu notifier in qemu, so I'm unsure whether
the same patch would break ppc too, because vhost could also ignore all UNMAP
sent by the ppc vIOMMU.

> 
> 
> >    Otherwise IIUC we need to fix those vIOMMUs too.
> 
> 
> Right, last time I check AMD IOMMU emulation, it simply trigger device IOTLB
> invalidation during IOTLB invalidation which looks wrong.

I did quickly grep IOMMU_NOTIFIER_UNMAP in amd_iommu.c and saw nothing. It
seems amd iommu is not ready for any kind of IOMMU notifiers yet.

Thanks,

-- 
Peter Xu


