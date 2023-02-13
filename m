Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20F06951DD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:28:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRfPj-0002IU-DP; Mon, 13 Feb 2023 15:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pRfPh-0002Hr-4L
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 15:27:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pRfPf-0001fk-7F
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 15:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676320017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WVlwPJiLhTOFeHJSBym7xmkx8cpWGRQPFIC6YkVQTXE=;
 b=LHZuRBaz2V+0mFy8j8nfIRgL9m7jtAzAZ2/LN1+NLF+JDQDoB1MaP84rjetFvnhdcFRBng
 m5tdex7dFHBLkq2y5FLm5a3Qjl3chQVlp+AuYsVHYC3e9wlbeN5B/jBEgAgMIacWbgxE2W
 wHa4ho8rzFgdOcCw9rO9OxwMkpYSvqU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-471-i88I1QBpN56to4RSYbKBSw-1; Mon, 13 Feb 2023 15:26:56 -0500
X-MC-Unique: i88I1QBpN56to4RSYbKBSw-1
Received: by mail-ej1-f71.google.com with SMTP id
 d14-20020a170906c20e00b00889f989d8deso8392221ejz.15
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 12:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WVlwPJiLhTOFeHJSBym7xmkx8cpWGRQPFIC6YkVQTXE=;
 b=q4ojhf8zbL9LgZ8tLatkRrupn0PB/sV+/BcmJ4sJeeUOCOev0y7/5FJACIj1v+4p4u
 bazE6eVVd6wjmxFD97nneQ0sDjEl76tSbRmwYdLRLRuOnWJdybEZd6hiHj+4UT7h5TEc
 LLl61AWjt8xz3CoMy0DDFD6fcqzO318wUFpCWPCDAWY5KMdh6J9WXK8B37rYqupT3afS
 ubWZeSn3eoO0bD6C92HLlR13Rjm5L5mDKhtSUoCXILR2BXuZ9Bb6KDCZcH091szFvsJ1
 egpgJb/2HEWin+8vWEzyUG6K2vOhf5mW44CMZqY3nSJ2llu9t5ZRKkuJtNSzOkWEu9nz
 GC5g==
X-Gm-Message-State: AO0yUKWT8cniZ9dKRZ2rDv0Hashz4HxEkqfDqQED0EwQxQtf+bJvei1i
 H/f3bU1u3k9JATOQvdIaJilH6pcTKVmVc96eLiLQN3HM5Mjs5o6gIBKO6OoC2hWGtP5+//xTi41
 trFro8hNglO6VWjY=
X-Received: by 2002:a17:906:1d56:b0:88f:87f0:c919 with SMTP id
 o22-20020a1709061d5600b0088f87f0c919mr171713ejh.64.1676320015532; 
 Mon, 13 Feb 2023 12:26:55 -0800 (PST)
X-Google-Smtp-Source: AK7set8Co65kPnGp9TyOC1vjmKhwg+vdIWCUNbUS6R4Z5sNpibSLNNujLzFaB0Q+zUOkOgT/BGWvdw==
X-Received: by 2002:a17:906:1d56:b0:88f:87f0:c919 with SMTP id
 o22-20020a1709061d5600b0088f87f0c919mr171686ejh.64.1676320015295; 
 Mon, 13 Feb 2023 12:26:55 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 c10-20020a170906694a00b00856ad9108e7sm7237048ejs.70.2023.02.13.12.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 12:26:54 -0800 (PST)
Date: Mon, 13 Feb 2023 15:26:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v6 0/4] memory: prevent dma-reentracy issues
Message-ID: <20230213152618-mutt-send-email-mst@kernel.org>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230213021141.mmzdpzj6ekmml3bx@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213021141.mmzdpzj6ekmml3bx@mozz.bu.edu>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Sun, Feb 12, 2023 at 09:11:41PM -0500, Alexander Bulekov wrote:
> ping
> 
> On 230204 2307, Alexander Bulekov wrote:
> > These patches aim to solve two types of DMA-reentrancy issues:
> >   
> > 1.) mmio -> dma -> mmio case
> > To solve this, we track whether the device is engaged in io by
> > checking/setting a reentrancy-guard within APIs used for MMIO access.
> >   
> > 2.) bh -> dma write -> mmio case
> > This case is trickier, since we dont have a generic way to associate a
> > bh with the underlying Device/DeviceState. Thus, this version allows a
> > device to associate a reentrancy-guard with a bh, when creating it.
> > (Instead of calling qemu_bh_new, you call qemu_bh_new_guarded)
> >   
> > I replaced most of the qemu_bh_new invocations with the guarded analog,
> > except for the ones where the DeviceState was not trivially accessible.
> > 
> > v5 -> v6:
> >     - Only apply checkpatch checks to code in paths containing "/hw/"
> >       (/hw/ and include/hw/)
> >     - Fix a bug in a _guarded call added to hw/block/virtio-blk.c
> > v4-> v5:
> >     - Add corresponding checkpatch checks
> >     - Save/restore reentrancy-flag when entering/exiting BHs
> >     - Improve documentation
> >     - Check object_dynamic_cast return value
> >   
> > v3 -> v4: Instead of changing all of the DMA APIs, instead add an
> >     optional reentrancy guard to the BH API.
> > 
> > v2 -> v3: Bite the bullet and modify the DMA APIs, rather than
> >     attempting to guess DeviceStates in BHs.

As long as we are adding the new APIs virtio things look ok to me.
Pls merge with rest of patches.

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> > Alexander Bulekov (4):
> >   memory: prevent dma-reentracy issues
> >   async: Add an optional reentrancy guard to the BH API
> >   checkpatch: add qemu_bh_new/aio_bh_new checks
> >   hw: replace most qemu_bh_new calls with qemu_bh_new_guarded
> > 
> >  docs/devel/multiple-iothreads.txt |  7 +++++++
> >  hw/9pfs/xen-9p-backend.c          |  4 +++-
> >  hw/block/dataplane/virtio-blk.c   |  3 ++-
> >  hw/block/dataplane/xen-block.c    |  5 +++--
> >  hw/char/virtio-serial-bus.c       |  3 ++-
> >  hw/display/qxl.c                  |  9 ++++++---
> >  hw/display/virtio-gpu.c           |  6 ++++--
> >  hw/ide/ahci.c                     |  3 ++-
> >  hw/ide/core.c                     |  3 ++-
> >  hw/misc/imx_rngc.c                |  6 ++++--
> >  hw/misc/macio/mac_dbdma.c         |  2 +-
> >  hw/net/virtio-net.c               |  3 ++-
> >  hw/nvme/ctrl.c                    |  6 ++++--
> >  hw/scsi/mptsas.c                  |  3 ++-
> >  hw/scsi/scsi-bus.c                |  3 ++-
> >  hw/scsi/vmw_pvscsi.c              |  3 ++-
> >  hw/usb/dev-uas.c                  |  3 ++-
> >  hw/usb/hcd-dwc2.c                 |  3 ++-
> >  hw/usb/hcd-ehci.c                 |  3 ++-
> >  hw/usb/hcd-uhci.c                 |  2 +-
> >  hw/usb/host-libusb.c              |  6 ++++--
> >  hw/usb/redirect.c                 |  6 ++++--
> >  hw/usb/xen-usb.c                  |  3 ++-
> >  hw/virtio/virtio-balloon.c        |  5 +++--
> >  hw/virtio/virtio-crypto.c         |  3 ++-
> >  include/block/aio.h               | 18 ++++++++++++++++--
> >  include/hw/qdev-core.h            |  7 +++++++
> >  include/qemu/main-loop.h          |  7 +++++--
> >  scripts/checkpatch.pl             |  8 ++++++++
> >  softmmu/memory.c                  | 17 +++++++++++++++++
> >  softmmu/trace-events              |  1 +
> >  tests/unit/ptimer-test-stubs.c    |  3 ++-
> >  util/async.c                      | 18 +++++++++++++++++-
> >  util/main-loop.c                  |  5 +++--
> >  util/trace-events                 |  1 +
> >  35 files changed, 147 insertions(+), 41 deletions(-)
> > 
> > -- 
> > 2.39.0
> > 


