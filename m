Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959E56522EF
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:44:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dpK-0000pc-R1; Tue, 20 Dec 2022 09:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7dpI-0000ot-3I
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:42:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7dpF-00024l-Vc
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:42:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671547356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PqNgtxV2N4/LOrL/67K9NZ3BfIiWUMGfOZtbvw8MiJU=;
 b=GZucrBm4BFSXBVTSu/4sjM45O3MQljuDp7rebPO0cxfwpqSXbxcJk83sxIO8FVSI5+Ur/A
 Yci05MRiMMgjZSjNAcMT/HTX2hntxZsCFuQocCur0a/ZImXc0WWWIKmbSxi6oh4qCQkzr1
 iL/p6SomD7t3/jnRTXvzxOzYiNjzxJ0=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-152-XFbaHSgLMJa2Vih1QANA0w-1; Tue, 20 Dec 2022 09:42:33 -0500
X-MC-Unique: XFbaHSgLMJa2Vih1QANA0w-1
Received: by mail-yb1-f200.google.com with SMTP id
 195-20020a2505cc000000b0071163981d18so14461085ybf.13
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:42:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PqNgtxV2N4/LOrL/67K9NZ3BfIiWUMGfOZtbvw8MiJU=;
 b=JM73g5XUw2dX8Zp9I9yRUofj/gz5QNCxFdwrQKOgC9dG2zPoAZ5nx1NF7j/O7llpVy
 G2LLA25c7Qfv2htyeo9lgWT+fK2UC32rvKTKltyn5jRls8zXLfOsKpD7nw7uesD2A15Q
 1Kjc9bVgzU0XfPXArBJ+WwOjT/d7rqQx9LCVL0fDtcT2vlG7CeFN1iLpIvPV2Ls3oFZg
 hsvxhVuhEfFoybtWRQPOD2nnaZNURptFwpVp1pWEfL9udSnbBuykVVh6Iyf02OORbGyk
 4s3G9uPQxp0H9873rdh4gjYklfQLkFOc+9Euy9NLXDLTdCJ9ph3XKs/2rNujqOL0eo57
 npEw==
X-Gm-Message-State: AFqh2koVJabR+vnj/H+3YpEMKa1QC1JqqkuBY0A6Jm08Z1jz8ZxJ5IbZ
 C3z+L6TRmlcPgoZSRoskQa5VLypRIso/9aXKfK6KduFMTxLd4VNmlvLwW3OG4voHduTzvAzvs0y
 ILKU4oJDFmo1yOFs=
X-Received: by 2002:a81:1c06:0:b0:440:c35b:ab0f with SMTP id
 c6-20020a811c06000000b00440c35bab0fmr13379774ywc.9.1671547352650; 
 Tue, 20 Dec 2022 06:42:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvdMIJ0hUmOUORnTgD68Hp6a6ReUc2S9PP6ZCHsYe8RHQ973vjWnMiDnJQiAhNcsBdQBYIj0A==
X-Received: by 2002:a81:1c06:0:b0:440:c35b:ab0f with SMTP id
 c6-20020a811c06000000b00440c35bab0fmr13379750ywc.9.1671547352375; 
 Tue, 20 Dec 2022 06:42:32 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 o18-20020a05620a111200b006cfc7f9eea0sm8713497qkk.122.2022.12.20.06.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 06:42:31 -0800 (PST)
Date: Tue, 20 Dec 2022 09:42:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: leixiang <leixiang@kylinos.cn>
Cc: qemu-devel@nongnu.org, xieming@kylinos.cn, zengchi@kylinos.cn
Subject: Re: [RESEND PATCH] virtio-pci: fix vector_irqfd leak in
 virtio_pci_set_guest_notifiers
Message-ID: <20221220093838-mutt-send-email-mst@kernel.org>
References: <20220826030646.1003059-1-leixiang@kylinos.cn>
 <20221130055611.1037023-1-leixiang@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130055611.1037023-1-leixiang@kylinos.cn>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Nov 30, 2022 at 01:56:11PM +0800, leixiang wrote:
> proxy->vector_irqfd did not free when set guest notifier failed.

Can you pls add a Fixes tag so people know where to backport this?

> Signed-off-by: Lei Xiang <leixiang@kylinos.cn>
> Tested-by: Zeng Chi <zengchi@kylinos.cn>
> Suggested-by: Xie Ming <xieming@kylinos.cn>

Looking at the code I see this:

    /* Must set vector notifier after guest notifier has been assigned */
    if ((with_irqfd ||
         (vdev->use_guest_notifier_mask && k->guest_notifier_mask)) &&
        assign) {
        if (with_irqfd) {
            proxy->vector_irqfd =
                g_malloc0(sizeof(*proxy->vector_irqfd) *
                          msix_nr_vectors_allocated(&proxy->pci_dev));
            r = kvm_virtio_pci_vector_vq_use(proxy, nvqs);
            if (r < 0) {
                goto config_assign_error;
            }
            r = kvm_virtio_pci_vector_config_use(proxy);
            if (r < 0) {
                goto config_error;
            }
        }

        r = msix_set_vector_notifiers(&proxy->pci_dev, virtio_pci_vector_unmask,
                                      virtio_pci_vector_mask,
                                      virtio_pci_vector_poll);
        if (r < 0) {
            goto notifiers_error;
        }
    }


doesn't this mean g_free belongs at the label config_assign_error?


> ---
>  hw/virtio/virtio-pci.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index c6b47a9c..4862f83b 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1038,6 +1038,12 @@ assign_error:
>      while (--n >= 0) {
>          virtio_pci_set_guest_notifier(d, n, !assign, with_irqfd);
>      }
> +
> +   g_free(proxy->vector_irqfd);
> +   proxy->vector_irqfd = NULL;
> +
>      return r;
>  }
>  
> -- 
> 
> 
> No virus found
> 		Checked by Hillstone Network AntiVirus


The patch is corrupted. Line counts are wrong, and your antivirus added
trash at the end.

-- 
MST


