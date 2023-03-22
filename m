Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E7E6C4D99
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezQL-0001T6-EK; Wed, 22 Mar 2023 10:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pezQJ-0001Sm-LB
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:26:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pezQI-0001G2-7M
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679495201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWVt0lpncl0adTZ2mKffz9+mKNBp6eli4014bvPi1JU=;
 b=SP6an24iY2+JTg0jLQHhoe9+SsmQvnEtriEJVnAA217KaXvutGMxEWwndonnAQYIPSIlcu
 dviYjB9HeRKHfSW6R+NB+vFqPJ0hFd7xc/r5k6FpDOROYghZ88cRTXFjdX28r2JqbtMJMd
 4lltum9c88oE7mSfu7oPnQsrMg3SQTs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-bBjHiihAOoSpLSc1Gfs8zg-1; Wed, 22 Mar 2023 10:26:40 -0400
X-MC-Unique: bBjHiihAOoSpLSc1Gfs8zg-1
Received: by mail-qk1-f200.google.com with SMTP id
 pc36-20020a05620a842400b00742c715894bso8713134qkn.21
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 07:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679495200;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nWVt0lpncl0adTZ2mKffz9+mKNBp6eli4014bvPi1JU=;
 b=Z33eYgFnaaB1iEXXoa0IMLQ9C9wAkMmR7Ek50KwPFz84eq1jmhL+f0CEoqmCgiiOoz
 cExZs3XkO5l2I/IG1RLFxq17OISQ/foP4scsAXh9maMFw35xRDdsiknXZjqI5G5Mq1/K
 qAgKwJkNTZ3JQcQtAGBks1p/9nDJ04wFMeisfy9mEfKQGsQlnxo1LHbFH0YSzSbJulKS
 G87i5baTdldE2pBnkHKUesrwdC8c1Hll/jBJd9PPv2SJwipO156LGYywKd9P/zKqLH9U
 HFOpfgUbEAWj2qDyiuuPliTUX+hhydGwQDUj/Ta30NinCJsp3ba+o0HmVYz9mCAaBnmf
 BmMA==
X-Gm-Message-State: AO0yUKUCa+zy6PyztIsvqcsTtzo43O5EB+r2EyLIkEYuwbMlz9xebyps
 DRcbKU6E3+y3kJUu73uFlrC/5ZqzKMTZDO6XYsW9qJLOr/UmfJS20hZkOY65VoVYVCajHt/XVPP
 RqcIv6ehzRXsoj8k=
X-Received: by 2002:a05:622a:1983:b0:3e0:3d65:19d2 with SMTP id
 u3-20020a05622a198300b003e03d6519d2mr6783787qtc.20.1679495199942; 
 Wed, 22 Mar 2023 07:26:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set9XELrgxHS7DrBVKaX6WFO/QF/1nIHjs9DULrNmL2hTIJf78ponXxUSq2XKnOcXHAS6d9tX7g==
X-Received: by 2002:a05:622a:1983:b0:3e0:3d65:19d2 with SMTP id
 u3-20020a05622a198300b003e03d6519d2mr6783737qtc.20.1679495199562; 
 Wed, 22 Mar 2023 07:26:39 -0700 (PDT)
Received: from sgarzare-redhat (host-82-57-51-170.retail.telecomitalia.it.
 [82.57.51.170]) by smtp.gmail.com with ESMTPSA id
 x22-20020ac84a16000000b003e1d8c193c1sm5339414qtq.48.2023.03.22.07.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 07:26:38 -0700 (PDT)
Date: Wed, 22 Mar 2023 15:26:34 +0100
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
Subject: Re: [RFC PATCH for 8.1 4/6] vdpa: return errno in
 vhost_vdpa_get_vring_group error
Message-ID: <20230322142634.imcnk7k6q5btze7v@sgarzare-redhat>
References: <20230317145542.347368-1-eperezma@redhat.com>
 <20230317145542.347368-5-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230317145542.347368-5-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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

On Fri, Mar 17, 2023 at 03:55:40PM +0100, Eugenio Pérez wrote:
>We need to tell in the caller, as some errors are expected in a normal
>workflow.  In particular, parent drivers in recent kernels with
>VHOST_BACKEND_F_IOTLB_ASID may not support vring groups.  In that case,
>-ENOTSUP is returned.

So, should we also avoid the error_report if we expect a failure?

Thanks,
Stefano

>
>This is the case of vp_vdpa in Linux 6.2.
>
>Next patches in this series will use that information to know if it must
>abort or not.
>
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
> net/vhost-vdpa.c | 9 +++++++++
> 1 file changed, 9 insertions(+)
>
>diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>index 99904a0da7..4397c0d4b3 100644
>--- a/net/vhost-vdpa.c
>+++ b/net/vhost-vdpa.c
>@@ -361,6 +361,14 @@ static NetClientInfo net_vhost_vdpa_info = {
>         .check_peer_type = vhost_vdpa_check_peer_type,
> };
>
>+/**
>+ * Get vring virtqueue group
>+ *
>+ * @device_fd  vdpa device fd
>+ * @vq_index   Virtqueue index
>+ *
>+ * Return -errno in case of error, or vq group if success.
>+ */
> static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index)
> {
>     struct vhost_vring_state state = {
>@@ -369,6 +377,7 @@ static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index)
>     int r = ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP, &state);
>
>     if (unlikely(r < 0)) {
>+        r = -errno;
>         error_report("Cannot get VQ %u group: %s", vq_index,
>                      g_strerror(errno));
>         return r;
>-- 
>2.31.1
>


