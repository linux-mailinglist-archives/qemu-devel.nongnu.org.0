Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A16581470
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 15:48:00 +0200 (CEST)
Received: from localhost ([::1]:34034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGKul-0002wr-8j
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 09:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGKsD-0001OW-0m
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 09:45:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGKs4-00071S-6c
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 09:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658843111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Dxbazytyv1JsG/VH4vBwBJj1GewtOpDzq/cvv4RyIE=;
 b=e8BWYlTYk+Sd+7gpJwdG6yv0EiyiUddwrASO+x1r4GNE1wIxg5NWIFLsuHD9vcISFt46xU
 ZJE089zA3CgIS5GmSflsb2xk/iyjCV3/snaur+7WmYstj/J5V6VUflBthD4wPbzNFG2hRE
 1J7WSeOd/z+HWH2OAgBBaoO/Qmol02I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-fz_ze0_uN_yGMaeEp5SEWQ-1; Tue, 26 Jul 2022 09:45:10 -0400
X-MC-Unique: fz_ze0_uN_yGMaeEp5SEWQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 a3-20020adfbc43000000b0021e46febb93so2111966wrh.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 06:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=7Dxbazytyv1JsG/VH4vBwBJj1GewtOpDzq/cvv4RyIE=;
 b=FmPs6FP9JmkuTHlgR9rp0vOO4OZTsRHb4IR4KHFB1f9Je0iy09iibAaqQTeV2K11sx
 1ad3dJeQPdnt++q43SkX/0Ig4e9WrzBsKclDKB48HTRajF/vV2xxd9m+d0P/Zr6asD5r
 c8wbBTp6sCdF4Fq62v0mYh3LoFT0jdMtxejD6b9yF7CpPavcfAZwA0SVpT9TcTRiuWdh
 FNW7dVOs8QKecLqSaXEJDBcDe86QLxMe+nrZYergi78fJpZZ0BGTihSCN2TmVkSIm0nT
 hsbiCLaKkYoKNL9eUUs+HjggUFJgvQkmxGmH8tSO2IPTe2SmCH0D27wMXmkpddvlXKaX
 G3jQ==
X-Gm-Message-State: AJIora+RXIsUAe+jcpDS6bFvnmTX9asYdywZZ2AMehdTmF0KM3kqao54
 DZW44JyYreUDKSwlwd/s46QHXuSaG57KntQ7UyVHflk0MblCvIdKIYD0xsfaQSL7jI5XHxzNHMk
 N27e9XPx1emFZJs4=
X-Received: by 2002:a05:600c:683:b0:3a2:fe34:3e1a with SMTP id
 a3-20020a05600c068300b003a2fe343e1amr12776831wmn.192.1658843108937; 
 Tue, 26 Jul 2022 06:45:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sc1DVMvG7FmS9plRwfpzuKsDmbS1htTRSlOycJ4bUP0e57i4ewR34fgwvTdUrua3RYxkJVuw==
X-Received: by 2002:a05:600c:683:b0:3a2:fe34:3e1a with SMTP id
 a3-20020a05600c068300b003a2fe343e1amr12776807wmn.192.1658843108658; 
 Tue, 26 Jul 2022 06:45:08 -0700 (PDT)
Received: from redhat.com ([2.55.43.166]) by smtp.gmail.com with ESMTPSA id
 w7-20020a1cf607000000b003a31f1edfa7sm22678615wmc.41.2022.07.26.06.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 06:45:08 -0700 (PDT)
Date: Tue, 26 Jul 2022 09:45:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-fs@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v15 00/10] vhost-vdpa: add support for configure interrupt
Message-ID: <20220726094357-mutt-send-email-mst@kernel.org>
References: <20220724064454.875882-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220724064454.875882-1-lulu@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!
So I don't think this will make it in 7.1.
I'll tag this to be merged afterwards, but just to make sure
please ping me right after the release.

Thanks!

On Sun, Jul 24, 2022 at 02:44:44PM +0800, Cindy Lu wrote:
> These patches introduced the support for configure interrupt 
> These codes are tested on x86_64 and aarch64 platforms.  
> the test scenario is based on vp-vdpa/vdpa_sim /virtio net device, with
> the irqfd and without irqfd.
> Tested in virtio-pci bus and virtio-mmio bus
> 
> Change in v2:
> Add support for virtio-mmio bus
> active the notifier while the backend support configure interrupt
> misc fixes from v1
> 
> Change in v3
> fix the coding style problems
> 
> Change in v4
> misc fixes from v3
> merge the set_config_notifier to set_guest_notifier
> when vdpa start, check the feature by VIRTIO_NET_F_STATUS
> 
> Change in v5
> misc fixes from v4
> split the code to introduce configure interrupt type and the callback function
> will init the configure interrupt in all virtio-pci and virtio-mmio bus, but will
> only active while using vhost-vdpa driver
> 
> Change in v6
> misc fixes from v5
> decouple vq from interrupt setting and misc process
> fix the bug in virtio_net_handle_rx
> 
> Change in v7
> misc fixes from v6
> decouple vq from interrupt setting and misc process
> decouple vq from vector use/release process
> decouple vq from set notifier fd handler process
> move config_notifier and masked_config_notifier to VirtIODevice
> fix the bug in virtio_net_handle_rx, add more information
> add VIRTIO_CONFIG_IRQ_IDX as the queue number for configure interrupt 
> 
> Change in v8
> misc fixes from v7
> decouple vq from interrupt setting and misc process
> decouple vq from vector use/release process
> decouple vq from set notifier fd handler process
> move the vhost configure interrupt to vhost_net
> 
> Change in v9
> misc fixes from v8
> address the comments from v8
> 
> Change in v10
> fix the hang issue in qtest
> address the comments from v9
> 
> Change in v11
> fix the crash in aarch64 plateform.
> fix the crash upstream reported
> 
> Change in v12
> fix the typo and the comments
> 
> changes in v13
> re-send the patches by git-publish
> 
> changes in v14
> rebased the code based on upstream
> 
> Cindy Lu (10):
>   virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX
>   virtio-pci: decouple notifier from interrupt process
>   virtio-pci: decouple the single vector from the interrupt process
>   vhost: introduce new VhostOps vhost_set_config_call
>   vhost-vdpa: add support for config interrupt
>   virtio: add support for configure interrupt
>   vhost: add support for configure interrupt
>   virtio-net: add support for configure interrupt
>   virtio-mmio: add support for configure interrupt
>   virtio-pci: add support for configure interrupt
> 
>  hw/display/vhost-user-gpu.c       |  15 ++
>  hw/net/vhost_net.c                |   9 +
>  hw/net/virtio-net.c               |  20 ++-
>  hw/virtio/trace-events            |   1 +
>  hw/virtio/vhost-user-fs.c         |  16 ++
>  hw/virtio/vhost-vdpa.c            |   8 +
>  hw/virtio/vhost-vsock-common.c    |  16 ++
>  hw/virtio/vhost.c                 |  78 +++++++-
>  hw/virtio/virtio-crypto.c         |  16 ++
>  hw/virtio/virtio-mmio.c           |  27 +++
>  hw/virtio/virtio-pci.c            | 283 +++++++++++++++++++++---------
>  hw/virtio/virtio.c                |  29 +++
>  include/hw/virtio/vhost-backend.h |   3 +
>  include/hw/virtio/vhost.h         |   4 +
>  include/hw/virtio/virtio-pci.h    |   4 +-
>  include/hw/virtio/virtio.h        |   7 +
>  include/net/vhost_net.h           |   2 +
>  17 files changed, 451 insertions(+), 87 deletions(-)
> 
> -- 
> 2.34.3
> 


