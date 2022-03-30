Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E544E4EBDBD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 11:37:23 +0200 (CEST)
Received: from localhost ([::1]:37474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZUlV-0005ll-Sz
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 05:37:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZUdV-0003I1-P2
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:29:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZUdS-0002rh-6H
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648632540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V6DILtMrWmjcN/zSvN0P5IMR5yuscGyBPn4GFLZqk2Q=;
 b=RWwFCmrvofTb2Q9wgnEiIjcEcqPj7X+Qf1khnCdCzm+Y+l7D9Td10ZANv+VWAFZztFj1mF
 Z45TGZxJpCbpI6yfZ/9zyZv+LC4yDx9wuvMbEY+yEp7Q7KKgi9tqCESnUD+M5/2HzPl4kf
 R0iwutKwJ+WQcRBQrUNHQGdshHUe4qg=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-p-oRd0csP1iNKtkHNLvzKQ-1; Wed, 30 Mar 2022 05:28:59 -0400
X-MC-Unique: p-oRd0csP1iNKtkHNLvzKQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 n2-20020a0565120ac200b0044a2c76f7e1so6254755lfu.5
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 02:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V6DILtMrWmjcN/zSvN0P5IMR5yuscGyBPn4GFLZqk2Q=;
 b=DcgnWmapAJYKQtCBvVT53ZKK04aWAk8zne9tEsekmd+fL3jlx1k3ZkmM3K70/fAEFZ
 H8F2Ynd0cey1MY9xd3YqSixtbQyag+aZdI4vJWsiXkXncVDLyNdFPvhZcga00qYmOsKG
 FRdjT9y2hKa8asn4LuXjpfp2PjXH7dfn8ZETw8BcL4WVeZsP32FRqT/X9ftq+RfxfLd9
 l9T5wrPoV06aQ5yvhvUMLXI0pYhbrELKa+/Qye1fhxM7mkP9fNlL4tAEpQ2SNQlCw9pP
 TmqhxGAAoXU4uKwHQonWTO7/W32Ckv2R+Y7f0HD5LfbGsEkMYfmToi3OC2DTcjVnNv81
 5EMA==
X-Gm-Message-State: AOAM530T2uiL5jBv0xGpOdsGs845WH7cid1ND60hAqsWMY2hdUswHtVe
 DIZcDJOp17955NmExK4BorHoWEMyDuWNiHXpqxyUbt2lhdNUWN+DnHMhJJBlylgCXV0YQmbkRrV
 k4/z80nIAl1LkpUW2Fccw3b4Ds9i84xU=
X-Received: by 2002:a2e:824e:0:b0:249:7e3d:c862 with SMTP id
 j14-20020a2e824e000000b002497e3dc862mr6050310ljh.97.1648632537820; 
 Wed, 30 Mar 2022 02:28:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1gbqRa83cGFVMI3bIEbuBPwvrXPXj4F/MDd/r/TlwDEtnRug3lhoEnhj/FcIesQDg0T7leUpkb0Hs3JRWous=
X-Received: by 2002:a2e:824e:0:b0:249:7e3d:c862 with SMTP id
 j14-20020a2e824e000000b002497e3dc862mr6050279ljh.97.1648632537289; Wed, 30
 Mar 2022 02:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
In-Reply-To: <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Mar 2022 17:28:46 +0800
Message-ID: <CACGkMEuhzv9d-TpB3qvu2ZPaFfO9D171FTW5eP3nZq4xvZnn_w@mail.gmail.com>
Subject: Re: [PATCH 7/7] vhost-vdpa: backend feature should set only once
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> The vhost_vdpa_one_time_request() branch in
> vhost_vdpa_set_backend_cap() incorrectly sends down
> iotls on vhost_dev with non-zero index. This may
> end up with multiple VHOST_SET_BACKEND_FEATURES
> ioctl calls sent down on the vhost-vdpa fd that is
> shared between all these vhost_dev's.
>
> To fix it, send down ioctl only once via the first
> vhost_dev with index 0. Toggle the polarity of the
> vhost_vdpa_one_time_request() test would do the trick.
>
> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/virtio/vhost-vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index c5ed7a3..27ea706 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -665,7 +665,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>
>      features &= f;
>
> -    if (vhost_vdpa_one_time_request(dev)) {
> +    if (!vhost_vdpa_one_time_request(dev)) {
>          r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
>          if (r) {
>              return -EFAULT;
> --
> 1.8.3.1
>


