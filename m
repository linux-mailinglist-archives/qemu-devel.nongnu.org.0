Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC93340404B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 22:48:07 +0200 (CEST)
Received: from localhost ([::1]:34192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO4UJ-0002bz-0V
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 16:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mO4SE-0001DU-C3
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:45:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mO4SC-0000bv-OQ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631133956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sdy/ct/oQTiCaRjwGY9g71XATxH8HkaoxpCa2DMTUQ=;
 b=Vu0kRq2FJFU/nGvsLV1L6SmCflkRsP0lWzEJpgc6bcGSrIPkypHq/xF9bQ/nz3KTyBsTjL
 prGvW4MItjq/XQ52cI1PO8OuLhuxe8Dsnk1Nvuk+LsIQ8jGjdQnVUuNv+J6XJiMtO+GYMl
 SUikzSP3OENJ8n5PIIv9PwhMmJQMu1o=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-0JSzSb1qMxW3-MyVJ-wvPw-1; Wed, 08 Sep 2021 16:45:55 -0400
X-MC-Unique: 0JSzSb1qMxW3-MyVJ-wvPw-1
Received: by mail-ot1-f69.google.com with SMTP id
 x38-20020a05683040a600b0051e1c81337bso2176506ott.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 13:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=5sdy/ct/oQTiCaRjwGY9g71XATxH8HkaoxpCa2DMTUQ=;
 b=g0Q6gLma0FGmablATWkN3GfjRCJJ/YwZhHNM/XQUHJ5d1omWUNtqdugOZXgAX0PSVn
 RftQfNcl5qqfnTU/ltLTDVlLlVXIZmOi++9rWK0owqHu931OdqH2ErTNSpi3MQlFwm7F
 pb0tgI1rkB/XJw2U7dJ8SeDGrd2T3dOTalXUL/fr3cI+H+O+5P3jcO78uBh6gF4EAQGu
 egNTNMItNq5Ii9to956ykedYWJuEBdlVQX1OWNDU7IyoU9iiyFkKeUMYHF/0DCZHR6V0
 s0FOZUidunE42preVB8DzyBzGXp44x4mdRQ1MkTFVxDp6k4Uq+QmVMxX2VsbHfG0jdJE
 8WCA==
X-Gm-Message-State: AOAM531CVO/ma7qnucFQlSdBOspSxF73sWPRBF8YaIQMA0L2VczAq1A+
 ZO03ivK0UrDK6QMDwqKmvXh7H5Y+QqGF21j0J/91/pLOx1rsVBFFUDglJkJtzUi0khSRcBUcMv6
 9SHXSE9bk9ebwnLQ=
X-Received: by 2002:a4a:d814:: with SMTP id f20mr163881oov.51.1631133954312;
 Wed, 08 Sep 2021 13:45:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2dlOY5ebtg8bNvgg+3JMUUI0gibk3BhgZhG02FwxbG2FTPISvPZg5yXR8TpWAm2GXS7By8w==
X-Received: by 2002:a4a:d814:: with SMTP id f20mr163867oov.51.1631133954120;
 Wed, 08 Sep 2021 13:45:54 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id a1sm45950otr.33.2021.09.08.13.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 13:45:53 -0700 (PDT)
Date: Wed, 8 Sep 2021 14:45:52 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH 2/2] vfio/common: Add trace point when a MMIO RAM
 section less than PAGE_SIZE
Message-ID: <20210908144552.1f7f072e.alex.williamson@redhat.com>
In-Reply-To: <20210903093611.1159-3-jiangkunkun@huawei.com>
References: <20210903093611.1159-1-jiangkunkun@huawei.com>
 <20210903093611.1159-3-jiangkunkun@huawei.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 tangnianyao@huawei.com, ganqixin@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Sep 2021 17:36:11 +0800
Kunkun Jiang <jiangkunkun@huawei.com> wrote:

> The MSI-X structures of some devices and other non-MSI-X structures
> are in the same BAR. They may share one host page, especially in the
> case of large page granularity, suck as 64K.

s/suck/such/

> For example, MSIX-Table size of 82599 NIC is 0x30 and the offset in
> Bar 3(size 64KB) is 0x0. If host page size is 64KB.
> vfio_listenerregion_add() will be called to map the remaining range

s/vfio_listenerregion_add/vfio_listener_region_add/

> (0x30-0xffff). And it will return early at
> 'int128_ge((int128_make64(iova), llend))' and hasn't any message.
> Let's add a trace point to informed users like 5c08600547c did.

Please use the following syntax for referencing previous commits
(12-char sha1 is standard):

  commit 5c08600547c0 ("vfio: Use a trace point when a RAM section
  cannot be DMA mapped")

Thanks,
Alex

> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  hw/vfio/common.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 8728d4d5c2..2fc6213c0f 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -892,6 +892,13 @@ static void vfio_listener_region_add(MemoryListener *listener,
>      llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
>  
>      if (int128_ge(int128_make64(iova), llend)) {
> +        if (memory_region_is_ram_device(section->mr)) {
> +            trace_vfio_listener_region_add_no_dma_map(
> +                memory_region_name(section->mr),
> +                section->offset_within_address_space,
> +                int128_getlo(section->size),
> +                qemu_real_host_page_size);
> +        }
>          return;
>      }
>      end = int128_get64(int128_sub(llend, int128_one()));


