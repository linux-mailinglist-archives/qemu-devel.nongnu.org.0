Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245A22EF20B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 13:09:07 +0100 (CET)
Received: from localhost ([::1]:45592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxqZl-0002Kf-Tf
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 07:09:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kxqXl-0001XB-Uy
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:07:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kxqXk-0001pp-CT
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610107618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zMS1iUMZXWNYYjvPWk8s1Gt0yJ3DRg8qtz7cAAw/gHc=;
 b=EBrueCPfKfxp5kv9ArYNlSRVrdQ6T7kHgp4aLVa/c2c0/+oTgKzr81YeeTG81Gd8c+r4oa
 Smy1WCQw9C2snj006B2Zxy49K7swNzdZY1LOHrNo3pviN/o1PhiVrsNTZVW2tUICCXqshH
 znlrWcpCDtIyfXG1s4za9EycdnLxxWI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-FKFC61E2M8yGKV0wZVgDmw-1; Fri, 08 Jan 2021 07:06:56 -0500
X-MC-Unique: FKFC61E2M8yGKV0wZVgDmw-1
Received: by mail-wr1-f69.google.com with SMTP id i4so4069309wrm.21
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:06:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zMS1iUMZXWNYYjvPWk8s1Gt0yJ3DRg8qtz7cAAw/gHc=;
 b=bkI3+yEkCQovlWixbjIlzNrUKnaHxx9MC27GJTF3Ln5WjoYqzQQpv/R+DWbM5gZR07
 DE9PAkmyeQm4W0zgbTkDNj6wwtjGSbOE31+jlg56K+Mr3VRUcrmg2FcJYPzOstHAhQtm
 Xy8YIsIytQMgIDFz6hbzKuhyfyywuaC1BvipUjESXJtoa+slqQeOrvVJhiEWWCyK1DoT
 h3mxL51PAZHrMWmq/fQh7HBT02Yy62o6viSuo1V3m0Fsgm3puoq5sQ92QD/eo/I3sC6m
 0vdO8wqSEQ63Ly2KY0LCPybeBtALO12NsF990EYemP8cjytn9Uqa7g5dfa6h8JC9KkYX
 6IAQ==
X-Gm-Message-State: AOAM532F9+XOh4wSusqZxLVG8juBCKBtxoc/y//VPgNZBjBPIcEwi/6k
 R5EFGE+OHBZ2UHj6g3e0kOiaWDIJcnXIq7BmYOyUKHDzHwhO26/97BDiJbZ8WHhAgYYj0tI3ib0
 cPhzD4il0N8arWtg=
X-Received: by 2002:adf:9506:: with SMTP id 6mr3327071wrs.172.1610107614738;
 Fri, 08 Jan 2021 04:06:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzP7asF9cQyCQKuoE5lnELnTj/IToYQ4c7STQONENin+t8fyciMNdW+twfHIFm2ElbMJJgZDA==
X-Received: by 2002:adf:9506:: with SMTP id 6mr3327054wrs.172.1610107614580;
 Fri, 08 Jan 2021 04:06:54 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id j9sm12815090wrm.14.2021.01.08.04.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 04:06:53 -0800 (PST)
Date: Fri, 8 Jan 2021 13:06:51 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] virtio-mmio: fix guest kernel crash with SHM regions
Message-ID: <20210108120651.tznrrc4q7nrv23zy@steredhat>
References: <20201220163539.2255963-1-laurent@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <20201220163539.2255963-1-laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 20, 2020 at 05:35:39PM +0100, Laurent Vivier wrote:
>In the kernel, virtio_gpu_init() uses virtio_get_shm_region()
>since
>commit 6076a9711dc5 ("drm/virtio: implement blob resources: probe for host visible region")
>but vm_get_shm_region() unconditionally uses VIRTIO_MMIO_SHM_SEL to
>get the address and the length of the region.
>
>commit 38e895487afc ("virtio: Implement get_shm_region for MMIO transport"
>
>As this is not implemented in QEMU, address and length are 0 and passed
>as is to devm_request_mem_region() that triggers a crash:
>
>  [drm:virtio_gpu_init] *ERROR* Could not reserve host visible region
>  Unable to handle kernel NULL pointer dereference at virtual address (ptrval)
>
>According to the comments in the kernel, a non existent shared region
>has a length of (u64)-1.
>
>This is what we return now with this patch to disable the region.
>
>Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>---
> hw/virtio/virtio-mmio.c | 8 ++++++++
> 1 file changed, 8 insertions(+)
>
>diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
>index e1b5c3b81e37..610661d6a526 100644
>--- a/hw/virtio/virtio-mmio.c
>+++ b/hw/virtio/virtio-mmio.c
>@@ -191,6 +191,14 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr offset, unsigned size)
>             return 0;
>         }
>         return vdev->generation;
>+   case VIRTIO_MMIO_SHM_LEN_LOW:
>+   case VIRTIO_MMIO_SHM_LEN_HIGH:
>+        /*
>+         * VIRTIO_MMIO_SHM_SEL is unimplemented
>+         * according to the linux driver, if region length is -1
>+         * the shared memory doesn't exist
>+         */
>+        return -1;
>     case VIRTIO_MMIO_DEVICE_FEATURES_SEL:
>     case VIRTIO_MMIO_DRIVER_FEATURES:
>     case VIRTIO_MMIO_DRIVER_FEATURES_SEL:
>-- 
>2.29.2
>
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


