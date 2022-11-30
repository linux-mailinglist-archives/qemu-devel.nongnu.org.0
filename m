Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA163CF9B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 08:11:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0HEp-000280-VK; Wed, 30 Nov 2022 02:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0HEi-00026G-LE
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 02:10:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0HEh-0003mX-AH
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 02:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669792226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hIrG7JuM+VGM9cjextYRABksfCfO2raJwkb2Zzqed2k=;
 b=ZPNEnpU300cmwVv3F4DHB+XS8Cw8pvmb41cOhp602rtmGhDLyeMWY5pJERKE1Oc+6TBvCv
 r5ndkLnRwKEfbzinMXs3MKIL62bo3JvEjNpi5gnSS1lgv/GbkfPnIT1k2IugPNYpFZXlO/
 9TdPB/IzR5aSt4xJI/hdnOXapMR0MX0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-41DS4rnrPEiY3Vtb-0gYDw-1; Wed, 30 Nov 2022 02:10:22 -0500
X-MC-Unique: 41DS4rnrPEiY3Vtb-0gYDw-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso8985762wmb.4
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 23:10:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hIrG7JuM+VGM9cjextYRABksfCfO2raJwkb2Zzqed2k=;
 b=lxMZAN5Thmr4+7BzyS1gR8Fk/cUE2nsICocmRbbtQf4qJstr2ksPsFqa6ADeBtpFgd
 MnuXPRXBScxYldhBr1s9DRgxa5f5Okp9ATN1HsbqAcXVpiCM7758dEDYByyJ7uhqnUgl
 mmCCqR+TKAhwqR2BxMR0VlYSYWJJ2coFfVG2W8GS/RuWsy0UzsuBQsnW5J5XO886bXvB
 UHu3Ci0NqoyEdFZiXKYLloVnMzNnyiz1fLB36OUnzBxPtiCkU+O84k3SqqS9s2HMbaIh
 GCLQK9sZngg3rdhRv7YRquP3pryyoDOw4/1ReCjd3nL4e52wx2MOcm16EG/O60OOCTVN
 s+ag==
X-Gm-Message-State: ANoB5pnxa6gnMY1yD2Q/uQx+WEZWemq1w+rwmewrgBz5X0lEuEmarNqj
 gEy9RDkxwwm630A9levkMSAObzilHpjQwaa84EP0UVAd5nbuiEtKp0DA1lpzU+1DpvTI020/rAy
 XFo4yoJPwKrpSVAY=
X-Received: by 2002:a05:600c:1e8d:b0:3d0:2c5c:e483 with SMTP id
 be13-20020a05600c1e8d00b003d02c5ce483mr28522403wmb.141.1669792221104; 
 Tue, 29 Nov 2022 23:10:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6qvjNyrkkyxHQMTxDIVVrEosTGHqi4NR/XJAXhqdJgZfvrktvru1pGQLhTaW6+7zs7C11IAg==
X-Received: by 2002:a05:600c:1e8d:b0:3d0:2c5c:e483 with SMTP id
 be13-20020a05600c1e8d00b003d02c5ce483mr28522380wmb.141.1669792220871; 
 Tue, 29 Nov 2022 23:10:20 -0800 (PST)
Received: from redhat.com ([2.52.19.245]) by smtp.gmail.com with ESMTPSA id
 h40-20020a05600c49a800b003b3365b38f9sm890828wmp.10.2022.11.29.23.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 23:10:20 -0800 (PST)
Date: Wed, 30 Nov 2022 02:10:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Eli Cohen <eli@mellanox.com>,
 Jason Wang <jasowang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Lei Yang <leiyang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v2 3/4] vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
 vhost_vdpa_net_handle_ctrl_avail
Message-ID: <20221130020602-mutt-send-email-mst@kernel.org>
References: <20221124173314.2123015-1-eperezma@redhat.com>
 <20221124173314.2123015-4-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221124173314.2123015-4-eperezma@redhat.com>
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

On Thu, Nov 24, 2022 at 06:33:13PM +0100, Eugenio Pérez wrote:
> Since this capability is emulated by qemu shadowed CVQ cannot forward it
> to the device. Process all that command within qemu.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  net/vhost-vdpa.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 2b4b85d8f8..8172aa8449 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -489,9 +489,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
>      out.iov_len = iov_to_buf(elem->out_sg, elem->out_num, 0,
>                               s->cvq_cmd_out_buffer,
>                               vhost_vdpa_net_cvq_cmd_len());
> -    dev_written = vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(status));
> -    if (unlikely(dev_written < 0)) {
> -        goto out;
> +    if (*(uint8_t *)s->cvq_cmd_out_buffer == VIRTIO_NET_CTRL_ANNOUNCE) {
> +        /*
> +         * Guest announce capability is emulated by qemu, so dont forward to
> +         * the device.
> +         */

Hmm I'm not sure why. We don't forward the status bit to guest?

> +        dev_written = sizeof(status);
> +        *s->status = VIRTIO_NET_OK;
> +    } else {
> +        dev_written = vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(status));
> +        if (unlikely(dev_written < 0)) {
> +            goto out;
> +        }
>      }
>  
>      if (unlikely(dev_written < sizeof(status))) {
> -- 
> 2.31.1


