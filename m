Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C6364D51
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 23:52:25 +0200 (CEST)
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYboe-0006bf-5t
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 17:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lYbnV-00066t-69
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 17:51:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lYbnR-0007Rr-VK
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 17:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618869068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tF63w9j6pNXsVvk+tMsjjB6pJcZTeYHr/iyFpDrXNg4=;
 b=NFYY4PVgyPICXyZ4pt+Tu957vtUwhZRPBVziQ2dJLfAa4izrEP4zGQoJNv0iFLP5XlPZMg
 U0J0EfR1tJ1nAhGQxKHNZ5IJnIZcziJ/Al6gMpxuedg+WvIarv9lpiGo+W8hRK3o1VD4oG
 TjEr3FwB6QvZq9jzflwTLHyLt0gj1fk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-iggxHBvVNnW7FUGB13vp7Q-1; Mon, 19 Apr 2021 17:51:06 -0400
X-MC-Unique: iggxHBvVNnW7FUGB13vp7Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 d78-20020a1c1d510000b0290132794b7801so1550378wmd.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 14:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tF63w9j6pNXsVvk+tMsjjB6pJcZTeYHr/iyFpDrXNg4=;
 b=O31VrqN8YfFZztPHzRSZaDM2+efR8wdQ7mEwyuvPbu1FCCZnE9hOBcSq9O50z4nhta
 j6ls8NJv5GHgq+DCXzqMN9SbafjBxMPy4wNjjSIuuzHcm3POLioMrYeeIa69o9eFJ14n
 WqlgFhKO4dmaAXrcNW2++ytZvUHMQxAqrt9czGckijTnOVqH/8qj1D9qU/yKtutimgoO
 /2nfHTAt90FKWldPP6/UDc48oWd2H0s336AA0BvTo0PDSFs2bg7Q8bC59zYRiBKQQFBe
 wh5dxdAlyNktrtM+PssowvMCPe70b4v1XuZAG0c/UICE3NqzSdPzl1t9vIHig4kDO0Dh
 aLJQ==
X-Gm-Message-State: AOAM53336ZdaZdWJJ4/VCB8mQh8Nu0uPCng9Vp073eE1p8wZxFK4xthV
 PSo4edLzT0DJGVr+rC/19/CIgcZrXd73QasXvnn6yTVDtbNQ3L6hclHoMyyLhtb/XSu/shacqja
 /lXoPqoTMRT4o7BU=
X-Received: by 2002:adf:cd0a:: with SMTP id w10mr16829147wrm.195.1618869065314; 
 Mon, 19 Apr 2021 14:51:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL2Xm/jEs67PDftS32Vr4p4Io9Qw15v1l4IoGKryLA0qNCsiqFR/G1oRyUrJYxcDhBMk1jEA==
X-Received: by 2002:adf:cd0a:: with SMTP id w10mr16829130wrm.195.1618869065079; 
 Mon, 19 Apr 2021 14:51:05 -0700 (PDT)
Received: from redhat.com (bzq-79-178-133-9.red.bezeqint.net. [79.178.133.9])
 by smtp.gmail.com with ESMTPSA id
 a22sm23505629wrc.59.2021.04.19.14.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 14:51:04 -0700 (PDT)
Date: Mon, 19 Apr 2021 17:51:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [for-6.1 0/4] virtio: Improve boot time of virtio-scsi-pci and
 virtio-blk-pci
Message-ID: <20210419175032-mutt-send-email-mst@kernel.org>
References: <20210407143501.244343-1-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210407143501.244343-1-groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 07, 2021 at 04:34:57PM +0200, Greg Kurz wrote:
> Now that virtio-scsi-pci and virtio-blk-pci map 1 virtqueue per vCPU,
> a serious slow down may be observed on setups with a big enough number
> of vCPUs.
> 
> Exemple with a pseries guest on a bi-POWER9 socket system (128 HW threads):
> 
>               virtio-scsi      virtio-blk
> 
> 1		0m20.922s	0m21.346s
> 2		0m21.230s	0m20.350s
> 4		0m21.761s	0m20.997s
> 8		0m22.770s	0m20.051s
> 16		0m22.038s	0m19.994s
> 32		0m22.928s	0m20.803s
> 64		0m26.583s	0m22.953s
> 128		0m41.273s	0m32.333s
> 256		2m4.727s 	1m16.924s
> 384		6m5.563s 	3m26.186s
> 
> Both perf and gprof indicate that QEMU is hogging CPUs when setting up
> the ioeventfds:
> 
>  67.88%  swapper         [kernel.kallsyms]  [k] power_pmu_enable
>   9.47%  qemu-kvm        [kernel.kallsyms]  [k] smp_call_function_single
>   8.64%  qemu-kvm        [kernel.kallsyms]  [k] power_pmu_enable
> =>2.79%  qemu-kvm        qemu-kvm           [.] memory_region_ioeventfd_before
> =>2.12%  qemu-kvm        qemu-kvm           [.] address_space_update_ioeventfds
>   0.56%  kworker/8:0-mm  [kernel.kallsyms]  [k] smp_call_function_single
> 
> address_space_update_ioeventfds() is called when committing an MR
> transaction, i.e. for each ioeventfd with the current code base,
> and it internally loops on all ioventfds:
> 
> static void address_space_update_ioeventfds(AddressSpace *as)
> {
> [...]
>     FOR_EACH_FLAT_RANGE(fr, view) {
>         for (i = 0; i < fr->mr->ioeventfd_nb; ++i) {
> 
> This means that the setup of ioeventfds for these devices has
> quadratic time complexity.
> 
> This series simply changes the device models to extend the transaction
> to all virtqueueues, like already done in the past in the generic
> code with 710fccf80d78 ("virtio: improve virtio devices initialization
> time").
> 
> Only virtio-scsi and virtio-blk are covered here, but a similar change
> might also be beneficial to other device types such as host-scsi-pci,
> vhost-user-scsi-pci and vhost-user-blk-pci.
> 
>               virtio-scsi      virtio-blk
> 
> 1		0m21.271s	0m22.076s
> 2		0m20.912s	0m19.716s
> 4		0m20.508s	0m19.310s
> 8		0m21.374s	0m20.273s
> 16		0m21.559s	0m21.374s
> 32		0m22.532s	0m21.271s
> 64		0m26.550s	0m22.007s
> 128		0m29.115s	0m27.446s
> 256		0m44.752s	0m41.004s
> 384		1m2.884s	0m58.023s
> 
> This should fix https://bugzilla.redhat.com/show_bug.cgi?id=1927108
> which reported the issue for virtio-scsi-pci.
> 
> Changes since RFC:
> 
> As suggested by Stefan, splimplify the code by directly beginning and
> committing the memory transaction from the device model, without all
> the virtio specific proxying code and no changes needed in the memory
> subsystem.
> 
> Greg Kurz (4):
>   virtio-blk: Fix rollback path in virtio_blk_data_plane_start()
>   virtio-blk: Configure all host notifiers in a single MR transaction
>   virtio-scsi: Set host notifiers and callbacks separately
>   virtio-scsi: Configure all host notifiers in a single MR transaction
> 
>  hw/block/dataplane/virtio-blk.c | 36 +++++++++++++++++++--
>  hw/scsi/virtio-scsi-dataplane.c | 56 ++++++++++++++++++++++-----------
>  2 files changed, 72 insertions(+), 20 deletions(-)


Tagged for 6.1, thanks!

> -- 
> 2.26.3
> 


