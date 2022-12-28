Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704B265735A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 07:48:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAQEJ-0004Rz-Mo; Wed, 28 Dec 2022 01:47:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pAQEA-0004Oj-GP
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 01:47:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pAQE9-0002hj-4b
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 01:47:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672210068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+0V+KHDkTKzcOucSS3FxuSSpCHHmy0PktCvGEbnvWX4=;
 b=aNSIgXCXw8rIjYzkjyCmTaNYuu8bFN9st/jrc0KOmSSqK+h/8QYF9fwHQC4IMMtEY2w+1i
 6k0QsrvbHBhA1s4t8hoY+ZHbJspb5Taj0AGzSrA2kYP51heG5RQJc7YUiuRXTUiIdeyBbQ
 KZHYhE4YhWCWMsa4p+DL4vUmL87GtHc=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-251-2z7CTLf4M-u4e2RKbNE4DQ-1; Wed, 28 Dec 2022 01:47:46 -0500
X-MC-Unique: 2z7CTLf4M-u4e2RKbNE4DQ-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-14fa3e986a2so5453071fac.17
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 22:47:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+0V+KHDkTKzcOucSS3FxuSSpCHHmy0PktCvGEbnvWX4=;
 b=NQBiWKxceFzPP8DNY/apxib1caNtVa/tY+LOtfAFwWody8YuosOIF0jfzlbrw40Bh/
 cIAaMzHHu9AEGHtr5p0nlLsMSJaOmj55AgGwa2D4VCBmgnxFVl3FYRwVYJtvi3iveLAU
 c926UqS5uQmwyHpUjpwWg6kT026qHRwOt8oDnvG7yQVw4GT72clEk6rmb6iHBskP/nbv
 VknUNJg2uph1zGztnVWuRGsNq0Rtw3exgz2cbHFQ2aYTYmbqQ+ufO2j/ET7RmD8kXIua
 o6kB7t+WXfRVoKU1HtqY3bGeDczDQ0Lvn2+Khde4dfip7GfvYqy8IlGBZwj6uKcT+TFM
 we4w==
X-Gm-Message-State: AFqh2kr3pZZQZuXc0DChbH1PIilR5INx2hzpf3gs5ubivswaS88jx7QG
 YJKuiF8hqw/VOZtB0KjBzimHBuWt7KZtCqy8rNnrLazq5cTyO0KI06KY2zUDUkk6w2NQp4zTZQ0
 V8r/9wkMEFPCZNVX/5W1kaoRgNESD+UI=
X-Received: by 2002:a9d:7843:0:b0:678:1eb4:3406 with SMTP id
 c3-20020a9d7843000000b006781eb43406mr1528835otm.237.1672210066176; 
 Tue, 27 Dec 2022 22:47:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu1eXx8KUBqoMMzffVRICfPE4UrJN1qK6+O1OTRjZ+Z6/qnuQJfpFMQDg7AHvtVuDvvuN3t++kjweoFgKj2LEs=
X-Received: by 2002:a9d:7843:0:b0:678:1eb4:3406 with SMTP id
 c3-20020a9d7843000000b006781eb43406mr1528830otm.237.1672210066008; Tue, 27
 Dec 2022 22:47:46 -0800 (PST)
MIME-Version: 1.0
References: <20221224114848.3062-1-longpeng2@huawei.com>
 <20221224114848.3062-3-longpeng2@huawei.com>
In-Reply-To: <20221224114848.3062-3-longpeng2@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 28 Dec 2022 14:47:35 +0800
Message-ID: <CACGkMEtX+hCHTQ8esBivxVHpH3JcVUwv_nECnaJDOo5by7XKCw@mail.gmail.com>
Subject: Re: [PATCH 2/2] vdpa: harden the error path if get_iova_range failed
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, mst@redhat.com, sgarzare@redhat.com, 
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com, 
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org, 
 eperezma@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Sat, Dec 24, 2022 at 7:49 PM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>
> From: Longpeng <longpeng2@huawei.com>
>
> We should stop if the GET_IOVA_RANGE ioctl failed.

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

>
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  net/vhost-vdpa.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index ffdc435d19..e65023d013 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -797,7 +797,13 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>          return queue_pairs;
>      }
>
> -    vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> +    r = vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> +    if (unlikely(r < 0)) {
> +        error_setg(errp, "vhost-vdpa: get iova range failed: %s",
> +                   strerror(-r));
> +        goto err;
> +    }
> +
>      if (opts->x_svq) {
>          if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
>              goto err_svq;
> --
> 2.23.0
>


