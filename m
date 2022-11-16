Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1612062C7C2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 19:37:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovNHQ-0003Wr-3Q; Wed, 16 Nov 2022 13:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ovNHO-0003VN-7K
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:36:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ovNHM-0005kZ-HW
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668623815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CYsnuKhEL4yu7eTlMb9cekb2VY00icYi2uD2cYF7+Fw=;
 b=G2CGDF36PJiZLotnkw5NvIvWksRZRPFEp2VVmICf7BcJqeYO4dQAErqnjpv+BopMz2Udjo
 YuQd4vgZFM72uMi+iElgP+zxEZ2ZVHmhY9VuDPjqI/cCDC7fxCwuvdb9u/5IFuOpPoKe2W
 Gf6ys/Hslt9rvWvWK5MvpV9nVOKH6JQ=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-278-3_UYWpUwOsibd3VEVOs3BA-1; Wed, 16 Nov 2022 13:36:54 -0500
X-MC-Unique: 3_UYWpUwOsibd3VEVOs3BA-1
Received: by mail-io1-f69.google.com with SMTP id
 bf14-20020a056602368e00b006ce86e80414so9116314iob.7
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 10:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CYsnuKhEL4yu7eTlMb9cekb2VY00icYi2uD2cYF7+Fw=;
 b=NR64Dva4yJnmv2Bnj+dUT0Vxkkh5OStHVum/8Z8LXuHi1FI81ffPWyJPvm6QYQ7vS9
 qF7IcL6Ze3SXQOBfDp/C51zcuhde/ZdpqEAvPAfEJbPeq5gzksSXJtwYAzc33rovzG00
 T9n5q36bR4JSpbo42ZLSOTn8/4ALNaeFRCauoeZW4+n8VU4afRW4g3vmPcftIGEhmXTH
 vH+6UQLpCMXPqR0dkYClMXjXaYobKScjkOmp0uyXCVofyWrt+kfHPVzS8QPT7elECz5d
 jMKGHYW3jlLDs1uVJcghP2q4qUGwI3m4waFIuLye1vtvyrtaFohDXQ/z0jrrgdm0XlIC
 HfVA==
X-Gm-Message-State: ANoB5pkl6+pO2hFKa1HC4wLtzqs4iA6Fi4iT675P2yKlpwVSnjji3jVl
 K3RR7BZcoeivirBN3CZeuJ5uKgOpfdYS6qWrnaH65JNuEnFbB90D1vzpXR/UsJibbzSpfNTox3C
 vRtq6Uv0FC8dIjS0=
X-Received: by 2002:a02:cb0d:0:b0:375:fd9e:b9d3 with SMTP id
 j13-20020a02cb0d000000b00375fd9eb9d3mr10507268jap.35.1668623813685; 
 Wed, 16 Nov 2022 10:36:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6gtQ/jztQMQZpltlESVsp9UrS2Jc20LLtlJnZO2B/KgCRV4XySsHf2HaRPQtI0HyECRudLhQ==
X-Received: by 2002:a02:cb0d:0:b0:375:fd9e:b9d3 with SMTP id
 j13-20020a02cb0d000000b00375fd9eb9d3mr10507241jap.35.1668623813413; 
 Wed, 16 Nov 2022 10:36:53 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 o15-20020a056602124f00b006bba42f7822sm6760239iou.52.2022.11.16.10.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 10:36:52 -0800 (PST)
Date: Wed, 16 Nov 2022 11:36:51 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Ilya Leoshkevich"
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan Quintela"
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, John Snow
 <jsnow@redhat.com>, <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>,
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen"
 <chen.zhang@intel.com>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Shay Drory
 <shayd@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 14/17] vfio/migration: Reset device if setting
 recover state fails
Message-ID: <20221116113651.0bdcfea1.alex.williamson@redhat.com>
In-Reply-To: <20221103161620.13120-15-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-15-avihaih@nvidia.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Thu, 3 Nov 2022 18:16:17 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> If vfio_migration_set_state() fails to set the device in the requested
> state it tries to put it in a recover state. If setting the device in
> the recover state fails as well, hw_error is triggered and the VM is
> aborted.
> 
> To improve user experience and avoid VM data loss, reset the device with
> VFIO_RESET_DEVICE instead of aborting the VM.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  hw/vfio/migration.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index f8c3228314..e8068b9147 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -92,8 +92,18 @@ static int vfio_migration_set_state(VFIODevice *vbasedev,
>  
>          mig_state->device_state = recover_state;
>          if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> -            hw_error("%s: Failed setting device in recover state, err: %s",
> -                     vbasedev->name, strerror(errno));
> +            error_report(
> +                "%s: Failed setting device in recover state, err: %s. Resetting device",
> +                         vbasedev->name, strerror(errno));
> +
> +            if (ioctl(vbasedev->fd, VFIO_DEVICE_RESET)) {
> +                hw_error("%s: Failed resetting device, err: %s", vbasedev->name,
> +                         strerror(errno));
> +            }
> +
> +            migration->device_state = VFIO_DEVICE_STATE_RUNNING;
> +
> +            return -1;
>          }
>  
>          migration->device_state = recover_state;

This addresses one of my comments on 12/ and should probably be rolled
in there.  Thanks,

Alex


