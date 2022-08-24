Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111F959F24B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 05:59:31 +0200 (CEST)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQhY9-0006VR-JH
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 23:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhVj-0001hc-Bg
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 23:57:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhVe-0007sT-Tq
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 23:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661313413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kx33psbeoXJqx8OD+HrXZqKxinWyiZr0QAwdpmioDmw=;
 b=XrCTNNLP6qCH2bI/i/hP8DPVwHr53shQ+HlzxN9dHJx4vJ7s9B+mWD3z9P4OeuI7YgKVey
 +6ARpNiItcl8zoE6b0HeTxFwvJeBIxuGO1II9zDnm+2ZV3oPonJ3PMeo/2HYhsKmBfdCyu
 8bQKiQ/4xytfbIo31F2ztRQoQv8pkzM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-j2ytYfxcMGi43rgvaksKag-1; Tue, 23 Aug 2022 23:56:44 -0400
X-MC-Unique: j2ytYfxcMGi43rgvaksKag-1
Received: by mail-pl1-f198.google.com with SMTP id
 b9-20020a170903228900b001730a0e11e5so1730455plh.19
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 20:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Kx33psbeoXJqx8OD+HrXZqKxinWyiZr0QAwdpmioDmw=;
 b=gTkP4S+TtZP2ZnkNwZ3kQ95NICLx9Xf2TS07DEG+3qtyfwht7k58qO96ACuWjIilI7
 i9mGnJg6wqJ3bgfB5GeFa59Dy7XGe2FeDCIVpOPvg0Oremw5H0SxmomsnDx7teva4Z2H
 sJ5xcNg+tsuQ6e/WaLJvFK/UM7wGpb311Q++oNyOQfN5x6oTKrOsHWNrBIlBlDfZYg8t
 owhNn45VoGvisyDKVf8lua4UO6oJuV9SPUz0XNgc8TDUMh/3uDQA+zIhBu9zdu99cdnc
 1PtNOc7P3cg1EPFB3CPvv07hWq2YCpLbyV44ls/vx1JjEgEjoMnH0dblvyuC7HPgHTW9
 cp/Q==
X-Gm-Message-State: ACgBeo22/1AGgDnKZ0RZQaMX93gvEea7atRC53p3xQzanVuDZtwM5nVp
 1khngouE0xI40LJj0L6wZdoLJHTxhi4jNZs0t0VvF7/AitTohLf5xgWGPxxeekyY47APKjIDAtH
 4sWAOtwf7HXjOyrA=
X-Received: by 2002:a17:90b:1e49:b0:1f5:1dbf:4c3a with SMTP id
 pi9-20020a17090b1e4900b001f51dbf4c3amr6462212pjb.232.1661313403579; 
 Tue, 23 Aug 2022 20:56:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7b0RGWl7OG7Mp6dndg5Q/fWhXqgFr43yXzVvnYGKtqCcsGH+UC7x8PKFjFW+cpDrbWjwpJVQ==
X-Received: by 2002:a17:90b:1e49:b0:1f5:1dbf:4c3a with SMTP id
 pi9-20020a17090b1e4900b001f51dbf4c3amr6462200pjb.232.1661313403337; 
 Tue, 23 Aug 2022 20:56:43 -0700 (PDT)
Received: from [10.72.13.242] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a170902da8100b0016be596c8afsm11415558plx.282.2022.08.23.20.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 20:56:42 -0700 (PDT)
Message-ID: <5eac5f68-e4e4-6cb5-a336-d475052a4fc6@redhat.com>
Date: Wed, 24 Aug 2022 11:56:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 16/24] vhost: vhost-user: update
 vhost_dev_virtqueue_stop()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <a9483de778d0aa4c79acd9c716feeaf0677c9718.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <a9483de778d0aa4c79acd9c716feeaf0677c9718.1660611460.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


在 2022/8/16 09:06, Kangjie Xu 写道:
> Update vhost_dev_virtqueue_stop() for vhost-user scenario.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/virtio/vhost.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index fc3f550c76..a0d6824353 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1908,10 +1908,29 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>   void vhost_dev_virtqueue_stop(struct vhost_dev *hdev, VirtIODevice *vdev,
>                                 int idx)
>   {
> +    const VhostOps *vhost_ops = hdev->vhost_ops;
> +    struct vhost_vring_state state;
> +    int r;
> +
> +    assert(vhost_ops);
> +
> +    if (vhost_ops->vhost_reset_vring) {
> +        state.index = hdev->vq_index + idx;
> +        r = vhost_ops->vhost_reset_vring(hdev, &state);
> +        if (r < 0) {
> +            goto err_queue_reset;
> +        }
> +    }
> +


So this worries me:

1) having two similar functions

vhost_virtqueue_stop()

and

vhost_dev_virtqueue_stop()

It can easily confuse the people who want stop the device.

I think we need rename vhost_dev_virtqueue_stop() to 
vhost_virqtueue_reset() since it has different semantic compared to stop:

1) stop means the virtqueue state is reserved, e.g the index could be 
synced via get_vring_base()
2) reset means the virqtueue state is lost

Thanks


>       vhost_virtqueue_unmap(hdev,
>                             vdev,
>                             hdev->vqs + idx,
>                             idx);
> +
> +    return;
> +
> +err_queue_reset:
> +    error_report("Error when stopping the qeuue.");
>   }
>   
>   int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, VirtIODevice *vdev,


