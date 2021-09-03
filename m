Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30590400306
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:14:52 +0200 (CEST)
Received: from localhost ([::1]:45790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBq7-0000LI-10
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMBet-0007Bu-N4
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:03:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMBep-0006Q2-A5
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630684990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nfl5cANcb13xzAB4QtzWnMS9ZhzuUogRQzvHhQGjLV0=;
 b=Cdts5owLvs9wKSSYsSrHyB6QlO16VK73vPBsz5JvVhdcav82nhLY+VbaJcw70Ol/oLFqQS
 0vS9MU83Js5hdoVR3qtpVjVv9638MYRjIOY3q4ls1uT7yf0uIDAXG8BvzPcwNdJMinzNdT
 uB9WMdwvFeySszprNti05AwE00H3gXY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-RPJAEw40M1mRE_ppEbW5rA-1; Fri, 03 Sep 2021 12:03:09 -0400
X-MC-Unique: RPJAEw40M1mRE_ppEbW5rA-1
Received: by mail-qv1-f71.google.com with SMTP id
 b8-20020a0562141148b02902f1474ce8b7so6098575qvt.20
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 09:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nfl5cANcb13xzAB4QtzWnMS9ZhzuUogRQzvHhQGjLV0=;
 b=WrljDqG+Sz1YIYI0wJzE1u2i5RWMyfPdYf9jTO7LNydZYZcgdg3ynj5egrULwfdFDm
 wnGg7/6dE/MjdGYx1XC3a2LPf2kp4Kj1aG6hrJC18ykN0tCxrUHw0Lc0XLF//q4ThOj5
 iHwSTuINiNiZurheJGyTjmHx8a1x+3la6Y0QlBOTxm0Pe/AhkGwIc6ZV35SGt2V2IcIF
 cIgl2pO+B05FWDq18kjlh/iHBZcLhfLuEFFSZUl4ByXDtT9ssMVzUs1gcZY5PVhqdHey
 XvBn63OAqvbT24HRoOGlZiCx5gJume96ieQwhYrTND9+s4U40H7L3wXzpuhfqIAj5tkn
 XMgQ==
X-Gm-Message-State: AOAM533ZDPM5AU1JcO7H3CdpPlqvSWGaYePfMb3NMZ3oSAydCKt2oxPq
 h3bG7HWu0oArAOz4qPAw9v3E1EnRtaExk14WTbeVJFXCzBt46dOE6ehbQaJ2iZITsENH5gf/rUX
 J3a6e4m0PIKCIbbA=
X-Received: by 2002:a0c:cb03:: with SMTP id o3mr4455911qvk.36.1630684989015;
 Fri, 03 Sep 2021 09:03:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTS1XPHK2w6+XjLrjRtqiYS7bKAawOirh1IO664j6ZfDNFJYPkG9VRUzajU62ApSa92vTNVg==
X-Received: by 2002:a0c:cb03:: with SMTP id o3mr4455891qvk.36.1630684988792;
 Fri, 03 Sep 2021 09:03:08 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id o7sm3254413qtw.87.2021.09.03.09.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:03:08 -0700 (PDT)
Date: Fri, 3 Sep 2021 12:03:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YTJHOnZNyYUkGV9O@t490s>
References: <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
 <YScPg0cYYGxxTz+b@xz-m1.local> <87y28oy6rm.fsf@dusky.pond.sub.org>
 <20210826133629.2ddd3b88@redhat.com> <YSean3PIkslbTHeU@t490s>
 <YS0rXQXwqKjhr4TA@t490s> <20210902102616.1b596104@redhat.com>
 <YTDVh9/MVAfCdkeu@t490s> <20210903150005.58afaf10@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903150005.58afaf10@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 03:00:05PM +0200, Igor Mammedov wrote:
> PS:
> Another, albeit machine depended approach to resolve IOMMU ordering problem
> can be adding to a specific machine  pre_plug hook, an IOMMU handling.
> Which is called during IOMMU realize time and check if existing buses
> without bypass enabled (iommu managed) have any children. And if they
> have devices attached, error out telling user to reorder '-device iommu'
> before affected devices/bus.
> It should cover mixed IOMMU+bypass case and doesn't require fixing
> vfio-pci address space initialization nor defining any priorities
> for PCI devices.

This sounds appealing among the approaches.

Does it need to be a pre_plug hook?  I thought we might just need a flag in the
pci device classes showing that it should be after vIOMMUs, then in vIOMMU
realize functions we walk pci bus to make sure no such device exist?

We could have a base vIOMMU class, then that could be in the realize() of the
common class.

> 
> (but I think it's more a hack compared earlier suggested
> address space initialization at reset time, and it would need to be
> done for every affected machine)

Agreed.

-- 
Peter Xu


