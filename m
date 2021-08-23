Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494483F538E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 01:13:22 +0200 (CEST)
Received: from localhost ([::1]:33058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIJ84-00025y-B5
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 19:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIJ6t-0000lR-S1
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 19:12:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIJ6e-0007h1-JX
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 19:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629760262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t7TLZGzLk6o+tahARI5VuTD5FSqSSdZsEcjOtvZ7HoY=;
 b=S8Ud+RCzHYJgC8EKch8GCZDd8HE0X8emUcvKEJB/v6cj+Xd71lBFECW6KyxInL+7j19fir
 GrEBD0hLNen0OsdoiqL1rb8vsKLNMTDcAOR/G3Vo+GwlpcxAFsZMVpw9QEl2SziTGYYWq2
 VhssBXar+fIlhYchpcDvrSpYvM6R3tk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-arofMzJSO9WLsRPmEXM2_Q-1; Mon, 23 Aug 2021 19:05:55 -0400
X-MC-Unique: arofMzJSO9WLsRPmEXM2_Q-1
Received: by mail-qt1-f197.google.com with SMTP id
 l24-20020ac84a98000000b00298c09593afso9437384qtq.22
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 16:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t7TLZGzLk6o+tahARI5VuTD5FSqSSdZsEcjOtvZ7HoY=;
 b=S/mUbxY7UA6Pk/0sZAVkquXZt1I5l8C0jIJCQzJQE4Q4Wn4PSwl9G3clemutij9xSU
 1rLnXLCTkvJNj/is/XNw0hvIDnlD9dscDm7opXGqypwJsOB0moOTVSl5f9xo6m/679Da
 mEMC/B9gY917fC+a5feWMUxPoYouGIJGX3RgCqE6gcHnh7RbcySwmL4K8jhzSWcPCN8b
 c29SlFK1gOF2QQ7S/PH7IxVNUDbOaCjaY96ax4Hh3KVjIjro26QdqPGDVhH4lAxjI//R
 43YgtxyuPoBhMaMhxvc5JE6d2MTJ8CC64+hpsww/CSAMTMARRAK1G8q6zs3oQ89jXYm7
 YnmQ==
X-Gm-Message-State: AOAM530xeOTJqQKKyqDorTsex53KU+C1CIjfYoTqVKAlsbIDeOtf7j5U
 zU9ZaGTClgmPpJ2iOR9NEldrCueL3OUgDi7Cv1WGW/rc2cKJZ1UK1vfwaiiI6cLX/VNr/C7L2pi
 B4/a4JkdoYnDsZI4=
X-Received: by 2002:a37:6317:: with SMTP id x23mr23632007qkb.432.1629759954922; 
 Mon, 23 Aug 2021 16:05:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmk5dGmqJmpLdMJq0b97yonfWnS4bXtymrtUUVQ+kugYEreUDeKwp0xrCG8oK4sN9LbsV71A==
X-Received: by 2002:a37:6317:: with SMTP id x23mr23631987qkb.432.1629759954659; 
 Mon, 23 Aug 2021 16:05:54 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id v128sm9779642qkh.27.2021.08.23.16.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 16:05:54 -0700 (PDT)
Date: Mon, 23 Aug 2021 19:05:52 -0400
From: Peter Xu <peterx@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YSQp0Nh6Gs5equAG@t490s>
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net>
 <YSP0m83roQytqvDr@t490s>
 <20210823210703.cikdkhvyeqqypaqa@habkost.net>
 <YSQTwth0elaz4T8W@t490s>
 <20210823215623.bagyo3oojdpk3byj@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210823215623.bagyo3oojdpk3byj@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 05:56:23PM -0400, Eduardo Habkost wrote:
> I don't have any other example, but I assume address assignment
> based on ordering is a common pattern in device code.
> 
> I would take a very close and careful look at the devices with
> non-default vmsd priority.  If you can prove that the 13 device
> types with non-default priority are all order-insensitive, a
> custom sort function as you describe might be safe.

Besides virtio-mem-pci, there'll also similar devfn issue with all
MIG_PRI_PCI_BUS, as they'll be allocated just like other pci devices.  Say,
below two cmdlines will generate different pci topology too:

  $ qemu-system-x86_64 -device pcie-root-port,chassis=0 \
                       -device pcie-root-port,chassis=1 \
                       -device virtio-net-pci

And:

  $ qemu-system-x86_64 -device pcie-root-port,chassis=0 \
                       -device virtio-net-pci
                       -device pcie-root-port,chassis=1 \

This cannot be solved by keeping priority==0 ordering.

After a second thought, I think I was initially wrong on seeing migration
priority and device realization the same problem.

For example, for live migration we have a requirement on PCI_BUS being migrated
earlier than MIG_PRI_IOMMU because there's bus number information required
because IOMMU relies on the bus number to find address spaces.  However that's
definitely not a requirement for device realizations, say, realizing vIOMMU
after pci buses are fine (bus assigned during bios).

I've probably messed up with the ideas (though they really look alike!).  Sorry
about that.

Since the only ordering constraint so far is IOMMU vs all the rest of devices,
I'll introduce a new priority mechanism and only make sure vIOMMUs are realized
earlier.  That'll also avoid other implications on pci devfn allocations.

Will rework a new version tomorrow.  Thanks a lot for all the comments,

-- 
Peter Xu


