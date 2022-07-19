Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C55F579519
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:17:21 +0200 (CEST)
Received: from localhost ([::1]:35066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDiPw-00065l-9c
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oDiHV-0001S3-9J
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oDiHR-0004NY-Da
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:08:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658218111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DP8Uo9F2iQi1LY8NPxRZe9gmDs0ftcZeEB7GlF+hOBQ=;
 b=MXqunWbR5uWEiPGHFxGfawj7Ti8+Uf6ctdtQ5g8klaG2u4zo/DnT+VL2LMa3ulmJ0rUWDA
 vJMMRJhbDbftOgaXRToToW8TsWfL0RugMe5grzYqIbKjnHlMSZNWG9MuBG/Bxo8Wp0mp9i
 W8PMIjwvyw2K37rb7YEZExcb/iOkB0o=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-PlvZDqbAORKoN9ufztzqcg-1; Tue, 19 Jul 2022 04:08:30 -0400
X-MC-Unique: PlvZDqbAORKoN9ufztzqcg-1
Received: by mail-ej1-f70.google.com with SMTP id
 hs16-20020a1709073e9000b0072b73a28465so2780176ejc.17
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 01:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=DP8Uo9F2iQi1LY8NPxRZe9gmDs0ftcZeEB7GlF+hOBQ=;
 b=ZZ6R9Smvl4tUSGIfbCrCY/5deeWDledke5SZ5g5dqgQkTV2ncNdPOpswHnRK555ay9
 tzdIatT9v3h//5AzVp7Hum3zG0VD8AtqtCJtrJxI5N+9bv6JSp4dyOvTgfb/Q8NMg/zR
 mwfSNi2UEOPwaV/w5vNnvsPa/oCzr7E23CbCVJldGdRn78rDglAkqQxpYMIklspWZTu5
 tKnQ9QNFn/pMMq5skzxlJ4vHdA/pPsow2zDqkZ+dXrWMQvW0C1KY3oUdF+gbnnXN1Tax
 Oh9ebav6SbEGkmzxOphXYnSAe+95xKMPNrLerj9t/8rbdftdCYwnbP2rJSP84VINBui9
 WHJQ==
X-Gm-Message-State: AJIora+BhaStUDONec/Ottsd/17/Ye30NOtCogZ7h02FwMgZNEiZ8SqR
 328McwMyYuJnv4OhXUSJERBP/tf3OfqdwT1vaNhaCNkwGWfjFPWLYLqECrBARcgQ39lhbfaXq1C
 qc7s2kgQ6lT2fb7xDma3RYwJGZk4hUc8=
X-Received: by 2002:a17:906:9b0a:b0:72e:e524:180a with SMTP id
 eo10-20020a1709069b0a00b0072ee524180amr21848475ejc.131.1658218108942; 
 Tue, 19 Jul 2022 01:08:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tta8SVpbmjjdi3XsAQkevAQhzyAY6CyRlycR6OmaqoJkxUYK6ypO2w30TSQT9bz9CupQFG3rjn1p4tecnzhbY=
X-Received: by 2002:a17:906:9b0a:b0:72e:e524:180a with SMTP id
 eo10-20020a1709069b0a00b0072ee524180amr21848456ejc.131.1658218108685; Tue, 19
 Jul 2022 01:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220711155243.866530-1-lulu@redhat.com>
In-Reply-To: <20220711155243.866530-1-lulu@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Tue, 19 Jul 2022 16:07:50 +0800
Message-ID: <CACLfguVqiYwwCLn3o781TWUHvKGUXLF1TbZOcUWB76FgNYBDdA@mail.gmail.com>
Subject: Re: [PATCH v11 00/10] vhost-vdpa: add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, David Gilbert <dgilbert@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Michael,
Would you help review these patches, I wonder if this is ok to merge?
please let me know if there is anything I need to do.

Thanks
Cindy



On Mon, Jul 11, 2022 at 11:53 PM Cindy Lu <lulu@redhat.com> wrote:
>
> These patches introduced the support for configure interrupt
>
> These codes are tested on x86_64 and aarch64 platforms.
> the test scenario is based on vp-vdpa/vdpa_sim /virtio net device, with
> the irqfd and without irqfd.
>
> Tested in virtio-pci bus and virtio-mmio bus
>
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
> Cindy Lu (10):
>   virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
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
>  hw/display/vhost-user-gpu.c       |   6 +
>  hw/net/vhost_net.c                |   9 +
>  hw/net/virtio-net.c               |  10 +-
>  hw/virtio/trace-events            |   1 +
>  hw/virtio/vhost-user-fs.c         |   6 +
>  hw/virtio/vhost-vdpa.c            |   8 +
>  hw/virtio/vhost-vsock-common.c    |   6 +
>  hw/virtio/vhost.c                 |  78 +++++++-
>  hw/virtio/virtio-crypto.c         |   6 +
>  hw/virtio/virtio-mmio.c           |  27 +++
>  hw/virtio/virtio-pci.c            | 283 +++++++++++++++++++++---------
>  hw/virtio/virtio-pci.h            |   4 +-
>  hw/virtio/virtio.c                |  29 +++
>  include/hw/virtio/vhost-backend.h |   3 +
>  include/hw/virtio/vhost.h         |   4 +
>  include/hw/virtio/virtio.h        |   7 +
>  include/net/vhost_net.h           |   2 +
>  17 files changed, 402 insertions(+), 87 deletions(-)
>
> --
> 2.34.3
>


