Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9583C7387
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:49:26 +0200 (CEST)
Received: from localhost ([::1]:41056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Kev-0000Bg-Qu
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3KdM-0006rb-Vb
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:47:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3KdL-0001rh-95
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626191262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qgfJqsJzUYBJKyLF6NDQVYjvjs2kFwcd1FiCbIuPlw4=;
 b=a5zYFPz8uQWfJ2LJ5tolGZNSx0FO/OqDRLkHKsq80W3whg8zQt4BoyMaaJe3IKdgROC0v9
 uHwJ4dMkPyqZ0+1OkzpKgphole9E0a5nG2dSwme2pdepG9ZtBLWOJjgtm6xxW64pRPWDuO
 i5he8l+Ylk0QIp5b0vtSiePOVwX+Yj4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-DfEP9FTiPxyFvOssTNGx1Q-1; Tue, 13 Jul 2021 11:47:41 -0400
X-MC-Unique: DfEP9FTiPxyFvOssTNGx1Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 5-20020a0560001565b029013fe432d176so2566212wrz.23
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qgfJqsJzUYBJKyLF6NDQVYjvjs2kFwcd1FiCbIuPlw4=;
 b=kFaGhc9U+TFQCjR/mk2fwO2oy5AH9gJx//+LpfIQ1N5bu8emZdkDDBC9EEWojTq1Sg
 o0kgrPnUjaxnTaObFpJbXLaFMxLzuNjJG9c51opYrUMRcn/wv3MbMU+oHkZm28QZpClz
 qjL0b/1WsFtoJFwAPgaHIrSWfL4uxHQu54F81pYntwOvuxwQ/sGo5GDoI18Q0tUezc1C
 4tFIJVevV25yRGbcVHIFdS6Fl1zIZJX/YL3T+KaU0GztWpY+YU1V1BdJgyEvVJ1bAlId
 Ra2e/43nGioQ4bSji2Q2g+da7bPe6BV/m8zzNnjdiv/1GsWTx5tOTOkS/FLmbwdnNhHC
 hHwA==
X-Gm-Message-State: AOAM532CH5k7nX47wTPuGn/04GNu6OKz3jVPB+o/FDwTsAbbcGm3wOVx
 m1M5X9kAmn6OwmIhp+ztK6566vnY207+zUAgKtaqldQxTGDDJMhbRHHIvBbG9anrPiuWtWn6OhW
 MSvmTU0B9qhmzU0M=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr6457818wri.188.1626191260156; 
 Tue, 13 Jul 2021 08:47:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrb92/k/MlMUC/x5i9Mo4sJqSECpo0bDh5ykIijW1iVt+9XsrwIe2RJ1vo6Xf1mUWB4Dkrkw==
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr6457785wri.188.1626191259975; 
 Tue, 13 Jul 2021 08:47:39 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id u16sm21933817wrw.36.2021.07.13.08.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 08:47:37 -0700 (PDT)
Date: Tue, 13 Jul 2021 11:47:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V4 18/25] vhost: reset vhost devices upon cprsave
Message-ID: <20210713114651-mutt-send-email-mst@kernel.org>
References: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
 <1625589956-81651-19-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1625589956-81651-19-git-send-email-steven.sistare@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 06, 2021 at 09:45:49AM -0700, Steve Sistare wrote:
> A vhost device is implicitly preserved across re-exec because its fd is not
> closed, and the value of the fd is specified on the command line for the
> new qemu to find.  However, new qemu issues an VHOST_RESET_OWNER ioctl,
> which fails because the device already has an owner.  To fix, reset the
> owner prior to exec.
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>

Makes sense superficially.

Acked-by: Michael S. Tsirkin <mst@redhat.com>

I didn't really read the series deeply enough to just the rest of it.


> ---
>  hw/virtio/vhost.c         | 11 +++++++++++
>  include/hw/virtio/vhost.h |  1 +
>  migration/cpr.c           |  1 +
>  3 files changed, 13 insertions(+)
> 
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index e2163a0..8c0c9c3 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1820,6 +1820,17 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
>      hdev->vdev = NULL;
>  }
>  
> +void vhost_dev_reset_all(void)
> +{
> +    struct vhost_dev *dev;
> +
> +    QLIST_FOREACH(dev, &vhost_devices, entry) {
> +        if (dev->vhost_ops->vhost_reset_device(dev) < 0) {
> +            VHOST_OPS_DEBUG("vhost_reset_device failed");
> +        }
> +    }
> +}
> +
>  int vhost_net_set_backend(struct vhost_dev *hdev,
>                            struct vhost_vring_file *file)
>  {
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 4a8bc75..71704d4 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -106,6 +106,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
>  void vhost_dev_cleanup(struct vhost_dev *hdev);
>  int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
>  void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
> +void vhost_dev_reset_all(void);
>  int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>  void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>  
> diff --git a/migration/cpr.c b/migration/cpr.c
> index 578466c..6333988 100644
> --- a/migration/cpr.c
> +++ b/migration/cpr.c
> @@ -142,6 +142,7 @@ void cprexec(strList *args, Error **errp)
>          return;
>      }
>      walkenv(FD_PREFIX, preserve_fd, 0);
> +    vhost_dev_reset_all();
>      qemu_system_exec_request(args);
>  }
>  
> -- 
> 1.8.3.1


