Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D3E6C4D85
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:23:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezMD-0008N1-LW; Wed, 22 Mar 2023 10:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pezMA-0008I3-BJ
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:22:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pezM6-0007SQ-Ta
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679494941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dmAQIn6ggAaO/jzyD59WNmUwwj3f/LvmsB9nl9m06o8=;
 b=XL1IxahjkIrFQ0rVLTK33RF8w57H3Ppv+Fnj3jFo7KbpqncebJtSPe86BTOEDBLnJSv+Ke
 sdB5yT4czNQ1st9pWM/76QteV1isuxGCg1p14cKOqDODwo8kw32X+C4K/5sTasoTP8HIXO
 pHwWxpTrXHAUlIkxsXHiFZWptGGg404=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-O0j3XFcMMKOEuhAb4KdsHA-1; Wed, 22 Mar 2023 10:22:20 -0400
X-MC-Unique: O0j3XFcMMKOEuhAb4KdsHA-1
Received: by mail-qk1-f200.google.com with SMTP id
 pc36-20020a05620a842400b00742c715894bso8707269qkn.21
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 07:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679494940;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dmAQIn6ggAaO/jzyD59WNmUwwj3f/LvmsB9nl9m06o8=;
 b=GSHUD0pIqGPRMoMWFQDO6Ix7w9+2V9uW/I2ykWlkoyvDjI0i/PoTojRVZhFpEtmgaz
 AyFzmUTnAX6h1YzxRBKS+htsB9wMtWGPH8SetIOvETfLu8XLLLyGymQx3OEgm/3lN8X/
 tJi472P400FVudDC1s9iB9ulNOzEgs8zoEef/L4E5Y7Fh3f4f7a1xtgsbYF85NnQTe9V
 8Jp8W5aeNX0OjCW5QouedTQ+/FeEu39vum+tBIufwRtkDJRjcrtlK4LkAkfGyezzvM2m
 93rDJw2H2SvaoXOxvagdJZHS/0zQaOrOfzAPBb6/cXBkqjQRlfnNvwstOuFnEpeOURKe
 iQ9Q==
X-Gm-Message-State: AO0yUKVrp+Po9VtRHd6lypAFNYjTuk9tnRXNXh8bRl55PxTALf1zEujv
 8TZp7cs9nzqJcK2n5+/dVifcWZsYcHT4GeZLO6HJbT4oloGkFZaGn3V+99h/gAG//O2eVWs5221
 ID13RFXOC8jiEWnU=
X-Received: by 2002:a05:622a:190:b0:3dc:3a38:3bd2 with SMTP id
 s16-20020a05622a019000b003dc3a383bd2mr6292002qtw.12.1679494939882; 
 Wed, 22 Mar 2023 07:22:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set+UlwYiUC1Qten4n+KntJO7qpIvDMyft1VxAXmpIpRE+3+oaY3RHn6hAYdo92gadEATOIsPqg==
X-Received: by 2002:a05:622a:190:b0:3dc:3a38:3bd2 with SMTP id
 s16-20020a05622a019000b003dc3a383bd2mr6291960qtw.12.1679494939585; 
 Wed, 22 Mar 2023 07:22:19 -0700 (PDT)
Received: from sgarzare-redhat (host-82-57-51-170.retail.telecomitalia.it.
 [82.57.51.170]) by smtp.gmail.com with ESMTPSA id
 196-20020a370acd000000b0074690b42617sm4820361qkk.15.2023.03.22.07.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 07:22:19 -0700 (PDT)
Date: Wed, 22 Mar 2023 15:22:14 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, alvaro.karsz@solid-run.com,
 Laurent Vivier <lvivier@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 si-wei.liu@oracle.com, longpeng2@huawei.com,
 Cindy Lu <lulu@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Lei Yang <leiyang@redhat.com>
Subject: Re: [RFC PATCH for 8.1 1/6] vdpa: Remove status in reset tracing
Message-ID: <20230322142214.ib7vxerutdn4jqdp@sgarzare-redhat>
References: <20230317145542.347368-1-eperezma@redhat.com>
 <20230317145542.347368-2-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230317145542.347368-2-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
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

On Fri, Mar 17, 2023 at 03:55:37PM +0100, Eugenio Pérez wrote:
>It is always 0 and it is not useful to route call through file
>descriptor.

I didn't get the second part of the sentence (after "and"), anyway the
patch LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
> hw/virtio/vhost-vdpa.c | 2 +-
> hw/virtio/trace-events | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>index bc6bad23d5..bbabea18f3 100644
>--- a/hw/virtio/vhost-vdpa.c
>+++ b/hw/virtio/vhost-vdpa.c
>@@ -716,7 +716,7 @@ static int vhost_vdpa_reset_device(struct vhost_dev *dev)
>     uint8_t status = 0;
>
>     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>-    trace_vhost_vdpa_reset_device(dev, status);
>+    trace_vhost_vdpa_reset_device(dev);
>     v->suspended = false;
>     return ret;
> }
>diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
>index 8f8d05cf9b..6265231683 100644
>--- a/hw/virtio/trace-events
>+++ b/hw/virtio/trace-events
>@@ -44,7 +44,7 @@ vhost_vdpa_set_mem_table(void *dev, uint32_t nregions, uint32_t padding) "dev: %
> vhost_vdpa_dump_regions(void *dev, int i, uint64_t guest_phys_addr, uint64_t memory_size, uint64_t userspace_addr, uint64_t flags_padding) "dev: %p %d: guest_phys_addr: 0x%"PRIx64" memory_size: 0x%"PRIx64" userspace_addr: 0x%"PRIx64" flags_padding: 0x%"PRIx64
> vhost_vdpa_set_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
> vhost_vdpa_get_device_id(void *dev, uint32_t device_id) "dev: %p device_id %"PRIu32
>-vhost_vdpa_reset_device(void *dev, uint8_t status) "dev: %p status: 0x%"PRIx8
>+vhost_vdpa_reset_device(void *dev) "dev: %p"
> vhost_vdpa_get_vq_index(void *dev, int idx, int vq_idx) "dev: %p idx: %d vq idx: %d"
> vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
> vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
>-- 
>2.31.1
>


