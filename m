Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAFB54F08F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 07:34:06 +0200 (CEST)
Received: from localhost ([::1]:43756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o24cP-0008GZ-2v
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 01:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o24Zi-0007X4-Np
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 01:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o24Zf-00047Y-4A
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 01:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655443873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fa1cbrYmBn31r0IGiyd6C306Do4GILB0hNYeXtEkWB4=;
 b=EN0q7koyEEaoUCbsdV0Wjywv2KuyW/B+DtvVQUK36MPUr52t48fuELr5Na/jIMvdaLFQmM
 TnvdrDyLO/mNyjyW9tOiySkF+WP7V6JdpNQMsnEQpgNdHBVns+dCYgFCEHnJycM0uWP9Zu
 kl7D16X/B9rotBwYo00FxJnJtbL/Rlk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-AyS1DNcSOM6-8Pkff11wEA-1; Fri, 17 Jun 2022 01:31:11 -0400
X-MC-Unique: AyS1DNcSOM6-8Pkff11wEA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o23-20020a05600c511700b0039743cd8093so1757710wms.6
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 22:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fa1cbrYmBn31r0IGiyd6C306Do4GILB0hNYeXtEkWB4=;
 b=Ud8vceNyeLXgW4G/BxwTGJloQ+jTeri19s/g4lVsGt0ZwcT1R6Lx17Wc0NKciOGy+H
 H30mC7+wXlAC9tRfAbyYT5O+8x3Kxxw1lr5Oq4CuPQFrg4LOAoPxFlKd+JSUXiAIf3FP
 q+ANB6qyAHMwBDkUe6wyB5EI3h4ZVR0+4umcbkISoXyjwhfY1Ft7wMmDeq97AW6DgSWL
 asB9fuYfGFNJ6K+uUeeCYTeEZJXlm3xdH3cegZw8UNLNb7+1NXQADZpeZ1U+7hBTgRil
 k64ni3xKK0dXUf73QJpXTK4dZ1XF6Yy8gZJXOGu8IoB4ps55/Owo2ykgDQjchsqVd2QC
 rnUA==
X-Gm-Message-State: AOAM532ZT1v1H1IOKRQZ0wl8d9ZZrEB/sQ/HnrKlan/U9FUdGm9IzQCK
 drBGVVGvxvj/nMFO+d0pVOVC139R9nBCO03MohMMzpOx4++0JXArgqhCcKlB2p3+h9LHAHTGTei
 Pw7DZHBwGT0o85x4=
X-Received: by 2002:a05:600c:3d07:b0:39c:80a8:db07 with SMTP id
 bh7-20020a05600c3d0700b0039c80a8db07mr18582639wmb.168.1655443870611; 
 Thu, 16 Jun 2022 22:31:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNVD7ybyubSQgHHoo+Dd+zjEkTnCI8/y5/4XqDr8199zwRblwssNeXsmGpwK4CjtRPeu/Lyg==
X-Received: by 2002:a05:600c:3d07:b0:39c:80a8:db07 with SMTP id
 bh7-20020a05600c3d0700b0039c80a8db07mr18582616wmb.168.1655443870367; 
 Thu, 16 Jun 2022 22:31:10 -0700 (PDT)
Received: from redhat.com ([2.54.189.19]) by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c155100b0039ee391a024sm1881167wmg.14.2022.06.16.22.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 22:31:09 -0700 (PDT)
Date: Fri, 17 Jun 2022 01:31:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com
Subject: Re: [PATCH] virtio-iommu: Fix the partial copy of probe request
Message-ID: <20220617012642-mutt-send-email-mst@kernel.org>
References: <20220617034348.3162918-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617034348.3162918-1-zhenzhong.duan@intel.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 17, 2022 at 11:43:48AM +0800, Zhenzhong Duan wrote:
> The structure of probe request doesn't include the tail, this lead to
> a few field is missed to be copied. Currently this isn't an issue as
> those missed field belong to reserved field, just in case reserved
> field will be used in the future.
> 
> By this chance, also remove a few useless code.

I think this code is there to future proof in case more fields are
added. Please just post a bugfix patch. Also a Fixes tag can't hurt.
Probably

commit 5442b854eaf921588e24d5711640ab71e59cb1b8
Author: Eric Auger <eric.auger@redhat.com>
Date:   Fri Feb 14 14:27:37 2020 +0100

    virtio-iommu: Decode the command payload
    

Thanks!

> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  hw/virtio/virtio-iommu.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 7c122ab95780..bc96caf37c0c 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -656,19 +656,16 @@ static int virtio_iommu_probe(VirtIOIOMMU *s,
>                                uint8_t *buf)
>  {
>      uint32_t ep_id = le32_to_cpu(req->endpoint);
> -    size_t free = VIOMMU_PROBE_SIZE;
>      ssize_t count;
>  
>      if (!virtio_iommu_mr(s, ep_id)) {
>          return VIRTIO_IOMMU_S_NOENT;
>      }
>  
> -    count = virtio_iommu_fill_resv_mem_prop(s, ep_id, buf, free);
> +    count = virtio_iommu_fill_resv_mem_prop(s, ep_id, buf, VIOMMU_PROBE_SIZE);
>      if (count < 0) {
>          return VIRTIO_IOMMU_S_INVAL;
>      }
> -    buf += count;
> -    free -= count;
>  
>      return VIRTIO_IOMMU_S_OK;
>  }
> @@ -708,7 +705,8 @@ static int virtio_iommu_handle_probe(VirtIOIOMMU *s,
>                                       uint8_t *buf)
>  {
>      struct virtio_iommu_req_probe req;
> -    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req));
> +    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req,
> +                    sizeof(req) + sizeof(struct virtio_iommu_req_tail));
>  
>      return ret ? ret : virtio_iommu_probe(s, &req, buf);
>  }
> -- 
> 2.25.1


