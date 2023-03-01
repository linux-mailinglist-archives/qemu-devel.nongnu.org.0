Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A7F6A75A4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 21:56:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTUP-0001fP-1W; Wed, 01 Mar 2023 15:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXTU6-0001c6-By
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:55:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXTU4-0003OH-4R
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677704131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y7timaoi9acoZxxtjIO1US+JvCUTx6RMBIE6nyTnjcQ=;
 b=CxD6zY1Qiv8U9pgeNrEt0sMha4VlAiVLFD8F/HRqRDc7HQBtuMFG0seBIrwmqMZGBOljrB
 RPYH37zKEJqAqaiyM0Ns+5k3ot1cmEq+SdF1jkvKMsOJFbokzWW1RWz8azpqlvjj8pYP1Q
 bHaYVF1BLkRDjygh798MFmyBuDQLZfU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-385-YkF7CpEZPmGy1QxNPjrskg-1; Wed, 01 Mar 2023 15:55:30 -0500
X-MC-Unique: YkF7CpEZPmGy1QxNPjrskg-1
Received: by mail-wm1-f71.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so191118wmj.4
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 12:55:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677704129;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y7timaoi9acoZxxtjIO1US+JvCUTx6RMBIE6nyTnjcQ=;
 b=SPmDydDKSOKHVcPyoWX2Ngm1SC7yg3in3+gh7XOfT1I8WQtPjQaiWF4NM/GvB7+Xbe
 ZYzVt7EaEM9Mmi8+mSy34ig8iw3FS7N2MSk0PzLaK5UnW5YYFYnsUHarsU16aSTNMhlM
 UU2HUR9STHOUeNW+ybitHslaYIN/IGAoCixsEgYR/LNrqoU/1wBFQ9KEfvYaCXmwvKnf
 D/iUetb6mEYNPUNP9y62OnQtzyL0dkUsNFyR9ZvQTSo3Vv47Q5d387RdKsdRuBRpefks
 9TdkwLLtncRWw6UpthIi0oxTigrn7BoBspQqeVjPoYoyUVZhSpi0Zh0A+3dPdXLsVtm+
 ZUBg==
X-Gm-Message-State: AO0yUKX7Hiht1fxGiWVl+Vny1oCAdkdmzeEHBSUBf1DX/a2a5Ar9xCoc
 UIV8I6dwf9GVv+uqoKJtbk8Jw09+0WCM9i3lJBcr40uw44JTeMcAapEhfI+IKrqu8F3tmeBDn6/
 kfnrd+JZ+9aPbL38=
X-Received: by 2002:a05:600c:310e:b0:3eb:399d:ab1a with SMTP id
 g14-20020a05600c310e00b003eb399dab1amr6100856wmo.21.1677704128927; 
 Wed, 01 Mar 2023 12:55:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+4lE92f2xUJYmWd7H8zPFJnBw+nbRwg5aTqBSfhVpXx2qe0C4wy2K4x6brvw8Wy32V6HMYSg==
X-Received: by 2002:a05:600c:310e:b0:3eb:399d:ab1a with SMTP id
 g14-20020a05600c310e00b003eb399dab1amr6100838wmo.21.1677704128596; 
 Wed, 01 Mar 2023 12:55:28 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 t1-20020a05600c2f8100b003eb192787bfsm647328wmn.25.2023.03.01.12.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 12:55:28 -0800 (PST)
Date: Wed, 1 Mar 2023 15:55:23 -0500
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
Message-ID: <20230301155515-mutt-send-email-mst@kernel.org>
References: <20230205040737.3567731-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230205040737.3567731-1-alxndr@bu.edu>
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

On Sat, Feb 04, 2023 at 11:07:33PM -0500, Alexander Bulekov wrote:
> These patches aim to solve two types of DMA-reentrancy issues:
>   
> 1.) mmio -> dma -> mmio case
> To solve this, we track whether the device is engaged in io by
> checking/setting a reentrancy-guard within APIs used for MMIO access.
>   
> 2.) bh -> dma write -> mmio case
> This case is trickier, since we dont have a generic way to associate a
> bh with the underlying Device/DeviceState. Thus, this version allows a
> device to associate a reentrancy-guard with a bh, when creating it.
> (Instead of calling qemu_bh_new, you call qemu_bh_new_guarded)
>   
> I replaced most of the qemu_bh_new invocations with the guarded analog,
> except for the ones where the DeviceState was not trivially accessible.


Acked-by: Michael S. Tsirkin <mst@redhat.com>

> v5 -> v6:
>     - Only apply checkpatch checks to code in paths containing "/hw/"
>       (/hw/ and include/hw/)
>     - Fix a bug in a _guarded call added to hw/block/virtio-blk.c
> v4-> v5:
>     - Add corresponding checkpatch checks
>     - Save/restore reentrancy-flag when entering/exiting BHs
>     - Improve documentation
>     - Check object_dynamic_cast return value
>   
> v3 -> v4: Instead of changing all of the DMA APIs, instead add an
>     optional reentrancy guard to the BH API.
> 
> v2 -> v3: Bite the bullet and modify the DMA APIs, rather than
>     attempting to guess DeviceStates in BHs.
> 
> Alexander Bulekov (4):
>   memory: prevent dma-reentracy issues
>   async: Add an optional reentrancy guard to the BH API
>   checkpatch: add qemu_bh_new/aio_bh_new checks
>   hw: replace most qemu_bh_new calls with qemu_bh_new_guarded
> 
>  docs/devel/multiple-iothreads.txt |  7 +++++++
>  hw/9pfs/xen-9p-backend.c          |  4 +++-
>  hw/block/dataplane/virtio-blk.c   |  3 ++-
>  hw/block/dataplane/xen-block.c    |  5 +++--
>  hw/char/virtio-serial-bus.c       |  3 ++-
>  hw/display/qxl.c                  |  9 ++++++---
>  hw/display/virtio-gpu.c           |  6 ++++--
>  hw/ide/ahci.c                     |  3 ++-
>  hw/ide/core.c                     |  3 ++-
>  hw/misc/imx_rngc.c                |  6 ++++--
>  hw/misc/macio/mac_dbdma.c         |  2 +-
>  hw/net/virtio-net.c               |  3 ++-
>  hw/nvme/ctrl.c                    |  6 ++++--
>  hw/scsi/mptsas.c                  |  3 ++-
>  hw/scsi/scsi-bus.c                |  3 ++-
>  hw/scsi/vmw_pvscsi.c              |  3 ++-
>  hw/usb/dev-uas.c                  |  3 ++-
>  hw/usb/hcd-dwc2.c                 |  3 ++-
>  hw/usb/hcd-ehci.c                 |  3 ++-
>  hw/usb/hcd-uhci.c                 |  2 +-
>  hw/usb/host-libusb.c              |  6 ++++--
>  hw/usb/redirect.c                 |  6 ++++--
>  hw/usb/xen-usb.c                  |  3 ++-
>  hw/virtio/virtio-balloon.c        |  5 +++--
>  hw/virtio/virtio-crypto.c         |  3 ++-
>  include/block/aio.h               | 18 ++++++++++++++++--
>  include/hw/qdev-core.h            |  7 +++++++
>  include/qemu/main-loop.h          |  7 +++++--
>  scripts/checkpatch.pl             |  8 ++++++++
>  softmmu/memory.c                  | 17 +++++++++++++++++
>  softmmu/trace-events              |  1 +
>  tests/unit/ptimer-test-stubs.c    |  3 ++-
>  util/async.c                      | 18 +++++++++++++++++-
>  util/main-loop.c                  |  5 +++--
>  util/trace-events                 |  1 +
>  35 files changed, 147 insertions(+), 41 deletions(-)
> 
> -- 
> 2.39.0


