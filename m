Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D9169EDCC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 05:08:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUgQ3-0005uQ-C7; Tue, 21 Feb 2023 23:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pUgQ1-0005uD-1O
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 23:07:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pUgPy-0003ga-SI
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 23:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677038865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=23WaYJEuVEDnZZtD/Kv+hEaPZ1wtaeuDlWV+EiAlFYE=;
 b=W90V2f6e5SgayoVqPS3K1mQFyITkVWNLYncGgp2Sp0QoHU+YGODlm9ue+Yovr4zvuCQRDm
 by5yvtpRUujZrV7frmEJib12m0QluHz6iTwaiIM7hpVLGZWzxZcj74VKbEjSiy2SmAPulC
 dQBBCVe/5hlJkb9BpUmc/mAsPbbIOCQ=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-rgfy-5quNg-_RjIGblkaMw-1; Tue, 21 Feb 2023 23:07:36 -0500
X-MC-Unique: rgfy-5quNg-_RjIGblkaMw-1
Received: by mail-pj1-f70.google.com with SMTP id
 i6-20020a17090a974600b0023487c793d0so3257787pjw.7
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 20:07:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=23WaYJEuVEDnZZtD/Kv+hEaPZ1wtaeuDlWV+EiAlFYE=;
 b=xMSBh5b83HO6KXwgh31ruL8CznSLIvCNkrmRqvf96fSSf2HZxfIkAMl5yu8Wu2Gtvr
 4eWDHehgh5qGIcYH41XH7hOGkbcsI2NTuv9dqK+jFcsQtAkbJa4QjWx5reIrvsAAy9KB
 iwXaAmDyjcpnOYb4KafH9bC+vSx/sbUECBubYC6LWmIUMlC1i8Cw7f3ajOgp1ENnmhG9
 ao7YWEwD14z3NxHKe3CRkS+FToOZMXhcng9ZxtPyozMw3u1zvaM9LUqgo9X0cmgCgSW6
 F/dwKJi7yfpbx7zefdY0pXtgFcYzzWnQpSQVHePa0A7+9hbrPIfu+PV//C/x7XLg7q7i
 ySLw==
X-Gm-Message-State: AO0yUKUoaIo8ecTBqRl+SmUNhIGyydUMUlfaiKE4xSqDUTZRC6abdKEt
 W6Y1yC/BP+TsNMHs87M1yZY1z88g58get5nvXIAFuHYa6XGkM4m8sVWtr0e/EYJe6PujIlaPJzb
 1CQy7nBXuM73FS7Q=
X-Received: by 2002:a05:6a20:a10b:b0:bd:17a4:c339 with SMTP id
 q11-20020a056a20a10b00b000bd17a4c339mr6558892pzk.13.1677038855344; 
 Tue, 21 Feb 2023 20:07:35 -0800 (PST)
X-Google-Smtp-Source: AK7set952JHhGcQmblzrCG151oLNcAaBWjsK1jgb2/cKapb1E2eT4+uCH9XBPpKVAPS6NZRV1WV3Gw==
X-Received: by 2002:a05:6a20:a10b:b0:bd:17a4:c339 with SMTP id
 q11-20020a056a20a10b00b000bd17a4c339mr6558870pzk.13.1677038855037; 
 Tue, 21 Feb 2023 20:07:35 -0800 (PST)
Received: from [10.72.13.76] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a170902eec600b0017a032d7ae4sm1669577plb.104.2023.02.21.20.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 20:07:34 -0800 (PST)
Message-ID: <c5817a6d-097f-6cef-748f-1b1848d0192f@redhat.com>
Date: Wed, 22 Feb 2023 12:07:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 13/13] vdpa: return VHOST_F_LOG_ALL in vhost-vdpa
 devices
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-14-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230208094253.702672-14-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


在 2023/2/8 17:42, Eugenio Pérez 写道:
> vhost-vdpa devices can return this features now that blockers have been
> set in case some features are not met.
>
> Expose VHOST_F_LOG_ALL only in that case.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---


Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


>   hw/virtio/vhost-vdpa.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 13a86a2bb1..5fddc77c5c 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1319,10 +1319,9 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>   static int vhost_vdpa_get_features(struct vhost_dev *dev,
>                                        uint64_t *features)
>   {
> -    struct vhost_vdpa *v = dev->opaque;
>       int ret = vhost_vdpa_get_dev_features(dev, features);
>   
> -    if (ret == 0 && v->shadow_vqs_enabled) {
> +    if (ret == 0) {
>           /* Add SVQ logging capabilities */
>           *features |= BIT_ULL(VHOST_F_LOG_ALL);
>       }


