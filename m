Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC2D30A713
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:02:38 +0100 (CET)
Received: from localhost ([::1]:60728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Xue-00078P-Nj
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1l6XsG-0005oq-H5
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:00:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1l6XsB-0006pW-Ds
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:00:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612180801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LzA0xjq0bAfcHY0r/ac+J/31vMhS5kGtOXU9fTw9SsM=;
 b=jIo8Z43xO8hu4wbXu6OHuFHTqUVrWINHo/aiPwTxKdVxvpS4N8Y1DdGc/GcBGb6OueEVln
 FnYJSYTp8ateZQAuL9440O6gQxTQbN97loOYaiwn/Ufy4/NZE4CPh+XCb4lz+c44RgIKQH
 FI8epxfO2ug3blyuhQMBDGUGsLLmfOY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-7-VkgDUXNfe0TI_wH_d8nA-1; Mon, 01 Feb 2021 06:59:59 -0500
X-MC-Unique: 7-VkgDUXNfe0TI_wH_d8nA-1
Received: by mail-wr1-f70.google.com with SMTP id b14so10269310wrw.12
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:59:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LzA0xjq0bAfcHY0r/ac+J/31vMhS5kGtOXU9fTw9SsM=;
 b=cb6HyWgRi4+XXror5BPv3So7W4taWFOjHcSN5DM0uTGGkPhVj6KqFNuQVBxJxyPFAi
 2mgN27tiKwOFoCE/GaRgq4q2AkybC0H+6TwYcMh3zrDSQIc0L01A5yILmhShdf9zTITR
 gFbRTAdTxZrvb4sa0TEQUebLbJl52PwEfVWSIqtcNPa93F5C0DZUnmG4oVHJ1G6NFwdV
 tiWUzrEX6DDUkQccdOhhS4/R4sDvWU4RhFucFffvwCMi2XrWoGA5kAGU7gTf4no3aDSa
 NEHBDdllcH4rG1aZYPOGkGQt+2JqdL8mGyScm1Yl136lQIu5yGoq4h1KOkJKGKo43Hym
 uF1A==
X-Gm-Message-State: AOAM531R6rYMRWRUEn0wAcg4pEPEDPz6RntS1+K+e7XUNKyQif3avfI2
 zvJQrbsDAcdWPIhUnFzY4MQz4s5vAjCg5Avi44HTYoXk/+Otyuxq8lP5JbnlSHz1vX08txAvUHQ
 FFT2f4aKdywTugxg=
X-Received: by 2002:a1c:7d53:: with SMTP id y80mr5564647wmc.187.1612180798267; 
 Mon, 01 Feb 2021 03:59:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBvBDT74QZd+m48bD2CJjQrXfhpucA9pzKtq5LNVOWz2TOJDASXHHdI6Z7gMCM0yrtG6dXeg==
X-Received: by 2002:a1c:7d53:: with SMTP id y80mr5564631wmc.187.1612180798057; 
 Mon, 01 Feb 2021 03:59:58 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id r12sm26746630wrp.13.2021.02.01.03.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:59:57 -0800 (PST)
Date: Mon, 1 Feb 2021 12:59:54 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [PATCH] vhost: Check for valid vdev in
 vhost_backend_handle_iotlb_msg
Message-ID: <20210201115954.6v6ga7ledlumeby4@steredhat>
References: <20210129090728.831208-1-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210129090728.831208-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Jason Wang <jasowang@redhat.com>, maxime.coquelin@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 10:07:28AM +0100, Eugenio Pérez wrote:
>Not checking this can lead to invalid dev->vdev member access in
>vhost_device_iotlb_miss if backend issue an iotlb message in a bad
>timing, either maliciously or by a bug.
>
>Reproduced rebooting a guest with testpmd in txonly forward mode.
> #0  0x0000559ffff94394 in vhost_device_iotlb_miss (
>     dev=dev@entry=0x55a0012f6680, iova=10245279744, write=1)
>     at ../hw/virtio/vhost.c:1013
> #1  0x0000559ffff9ac31 in vhost_backend_handle_iotlb_msg (
>     imsg=0x7ffddcfd32c0, dev=0x55a0012f6680)
>     at ../hw/virtio/vhost-backend.c:411
> #2  vhost_backend_handle_iotlb_msg (dev=dev@entry=0x55a0012f6680,
>     imsg=imsg@entry=0x7ffddcfd32c0)
>     at ../hw/virtio/vhost-backend.c:404
> #3  0x0000559fffeded7b in slave_read (opaque=0x55a0012f6680)
>     at ../hw/virtio/vhost-user.c:1464
> #4  0x000055a0000c541b in aio_dispatch_handler (
>     ctx=ctx@entry=0x55a0010a2120, node=0x55a0012d9e00)
>     at ../util/aio-posix.c:329
>
>Fixes: 6dcdd06e3b ("spec/vhost-user spec: Add IOMMU support")

I'm not sure but IIUC vhost_backend_handle_iotlb_msg() was introduced by 
commit 020e571b8b, so maybe is better this 'Fixes' line:

Fixes: 020e571b8b ("vhost: rework IOTLB messaging")

>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
> hw/virtio/vhost-backend.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
>index 222bbcc62d..31b33bde37 100644
>--- a/hw/virtio/vhost-backend.c
>+++ b/hw/virtio/vhost-backend.c
>@@ -406,6 +406,11 @@ int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
> {
>     int ret = 0;
>
>+    if (unlikely(!dev->vdev)) {
>+        error_report("Unexpected IOTLB message when virtio device is stopped");
>+        return -EINVAL;
>+    }
>+
>     switch (imsg->type) {
>     case VHOST_IOTLB_MISS:
>         ret = vhost_device_iotlb_miss(dev, imsg->iova,
>-- 
>2.27.0
>
>

The patch LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


