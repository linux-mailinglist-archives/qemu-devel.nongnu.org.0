Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F316580A3E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 06:15:27 +0200 (CEST)
Received: from localhost ([::1]:43254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGByg-00046X-GZ
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 00:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGBxP-0002kt-TD
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:14:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGBxO-000500-6g
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658808845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6KD7snZxXRKbxxJFq7L0A1fCsNdZxicViiCEcS7Yb6Y=;
 b=BvKP+m7qymoUBTAEuRt+RUasWACZlkO3F4oJMY7e2QuwTrCXg1sDJ4sYM3TCbGHA98czJb
 S1UQ3+De0N1I1pAv2PreA6gUAstzysOguxN9KH0tjHdNwZ53YR1EMmbYo7l7t1Zk2kot3Z
 z3hmLl0FTsMvi3T18IL2i1cH/ziPVEg=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-bw-z9G7rO7KJwOz2KBto-w-1; Tue, 26 Jul 2022 00:14:02 -0400
X-MC-Unique: bw-z9G7rO7KJwOz2KBto-w-1
Received: by mail-pf1-f198.google.com with SMTP id
 bt6-20020a056a00438600b0052b41c191a4so4365252pfb.19
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 21:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6KD7snZxXRKbxxJFq7L0A1fCsNdZxicViiCEcS7Yb6Y=;
 b=T7tQaCerhwPm/b2QJ3jYw0F0ewWsnxHB138ndNF1hYvVvq/WL7z7XrwKc8JFSoh4nJ
 SQyUV9PZ5JWA7iaQWQF71di8SnDyIdj0dD0yb5cPTUnnoU3WnEnfc+UuThc5DE3v7FtJ
 jAcDLQmqAEUncd8sL1k75yoHLoIJxuyTmXglWReaF4n/hFuaZKzEy9mR3xNOTcS11No8
 GUor4ja5dh8lsTIuNXQZaX8GFEWto0DUsoAnGwwIDKXg3XyR1kpA0bTjIyNo3tgbioUO
 Wdf6Yn++C77h8GwWbzFe4pBJMZx5nJQ1gRQ/k98zqF5U2uF1BZTERBXqm7KI6GmK5qj4
 MDCA==
X-Gm-Message-State: AJIora88zCBP28jZ/fEConunSNU1ESriH0MaOVCz88v7RJXTVLRpJF6n
 8xypGhiY7ydeWiZ9jxYkb4YoT8bpSADkJkjGsG0qd7WQSbaby/V5Gaiynux7F0QOhEeFZsOiCRJ
 ZEwmW6Hy80pEb39s=
X-Received: by 2002:a17:90b:180c:b0:1f2:ec85:6d50 with SMTP id
 lw12-20020a17090b180c00b001f2ec856d50mr2032819pjb.78.1658808841253; 
 Mon, 25 Jul 2022 21:14:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5XSc8JcxLBr5Ypg8jmZXpRYK97uSjJos+ac9hoFyPZijf9MquToBnrH6kqSA0Ug/megIFPA==
X-Received: by 2002:a17:90b:180c:b0:1f2:ec85:6d50 with SMTP id
 lw12-20020a17090b180c00b001f2ec856d50mr2032797pjb.78.1658808840922; 
 Mon, 25 Jul 2022 21:14:00 -0700 (PDT)
Received: from [10.72.12.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 r22-20020a170902be1600b0016c28a68ad0sm9972264pls.253.2022.07.25.21.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 21:14:00 -0700 (PDT)
Message-ID: <2606a57f-53ef-8cc4-d51a-76c43f6ecbcf@redhat.com>
Date: Tue, 26 Jul 2022 12:13:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 11/16] vhost: introduce restart and release for
 vhost_dev's vqs
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <98cc06919b016e16b9abc606dd514ac2b4f85c06.1658141552.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <98cc06919b016e16b9abc606dd514ac2b4f85c06.1658141552.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/7/18 19:17, Kangjie Xu 写道:
> Introduce vhost_dev_virtqueue_restart(), which can restart the
> virtqueue when the vhost has already started running.
>
> Meanwhile, vhost_dev_virtqueue_release(), which can ummap the
> vrings and the desc of a specific vq of a device.
>
> Combining the two functions, we can reset a virtqueue with a
> started vhost.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/virtio/vhost.c         | 29 +++++++++++++++++++++++++++++
>   include/hw/virtio/vhost.h |  6 ++++++
>   2 files changed, 35 insertions(+)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index e467dfc7bc..d158d71866 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1904,3 +1904,32 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>   
>       return -ENOSYS;
>   }
> +
> +void vhost_dev_virtqueue_release(struct vhost_dev *hdev, VirtIODevice *vdev,
> +                                 int vq_index)
> +{
> +    int idx = vq_index - hdev->vq_index;
> +
> +    idx = hdev->vhost_ops->vhost_get_vq_index(hdev, idx);
> +
> +    vhost_virtqueue_unmap(hdev,
> +                          vdev,
> +                          hdev->vqs + idx,
> +                          hdev->vq_index + idx);
> +}


Anything wrong that makes you can't use vhost_virtqueue_stop() here?

Thanks


> +
> +int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, VirtIODevice *vdev,
> +                                int vq_index)
> +{
> +    int idx = vq_index - hdev->vq_index;
> +    int r = 0;
> +
> +    idx = hdev->vhost_ops->vhost_get_vq_index(hdev, idx);
> +
> +    r = vhost_virtqueue_start(hdev,
> +                              vdev,
> +                              hdev->vqs + idx,
> +                              hdev->vq_index + idx);
> +
> +    return r;
> +}
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index a346f23d13..7df7dbe24d 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -277,6 +277,12 @@ bool vhost_has_free_slot(void);
>   int vhost_net_set_backend(struct vhost_dev *hdev,
>                             struct vhost_vring_file *file);
>   
> +
> +void vhost_dev_virtqueue_release(struct vhost_dev *hdev, VirtIODevice *vdev,
> +                                 int vq_index);
> +int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, VirtIODevice *vdev,
> +                                int vq_index);
> +
>   int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write);
>   
>   void vhost_dev_reset_inflight(struct vhost_inflight *inflight);


