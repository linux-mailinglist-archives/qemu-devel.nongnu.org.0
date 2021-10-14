Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E517B42D791
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 12:57:36 +0200 (CEST)
Received: from localhost ([::1]:57314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mayQa-0002yU-1r
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 06:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mayPK-0002H0-6s
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 06:56:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mayPG-0004rV-Jv
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 06:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634208973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhDlvi2aSack3yZIbOGZ6e3xqLGMHIiNtNQlMRo9t0w=;
 b=Dr+O2Ce84CMRlZg178NsAecpbMxhmxNYWBUnTXZufbWIJrSEJTOhKfNFN2f1G4Ph00XHZw
 UAcJtiGF9eic3JiE2w/RtAFKE5gLysBYSH9ZPVOe6buiKlFZH52xnPNZlXA4mpyiQQ4xJt
 pmprPoPswZEYVMOdMa86tbNCRLTsKJ0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-Y3SERsi2M_eMk87mSk2-kQ-1; Thu, 14 Oct 2021 06:56:12 -0400
X-MC-Unique: Y3SERsi2M_eMk87mSk2-kQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 t18-20020a056402021200b003db9e6b0e57so4821467edv.10
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 03:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=xhDlvi2aSack3yZIbOGZ6e3xqLGMHIiNtNQlMRo9t0w=;
 b=s+MsflrICA8WeS5J2TCUU+RIth/974Bg0C5SHVOI6MM0lWqLHu6nD6tMiIJ6PDCGA4
 90iMOfWIVoM4oLuv8vdMZZdRH9J9EPu9EjpeFee1urIx0Rt8AXHLwnoI01rcQ/A5He7n
 JclNAz1EwuD1tbMQwkSO1TsLuz6KyKj9w3ubXSVniLNv1YFy6U3erJH9OgGvco6vA4XP
 MXoV9KQhY/4TCJhqFvTQEB9FNWAll1DLvZ7vV/pIr16oF25yFAKpteP/zd2hy3iEMKpK
 fgyb58S0dcQ+VBpYIbqllpd5n/8QIu5uYg8rRJQyxs8Kl2tF8g/kA6Ye9S5tSvfibGNh
 GNfQ==
X-Gm-Message-State: AOAM533UbdI46G7I/KFvytfgDn4J+nhJIEWAUAJQjnfbxWaRSysNzDF+
 4J0kS47GixEbLckNlSkri4S66nkR1eXpZ5d9o1pzbvsgEB6Gxfk7bgOLHSgXYKLvm76V44GYDNI
 xEZGho9FxKciagVY=
X-Received: by 2002:a05:6402:4402:: with SMTP id
 y2mr7867293eda.222.1634208970669; 
 Thu, 14 Oct 2021 03:56:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxr008DAWdEGSvFKd48+OPXHMBGMTCfwMtEOgE73f2cGSscYKAbSFz6eRb967T0HP7Uin9Tw==
X-Received: by 2002:a05:6402:4402:: with SMTP id
 y2mr7867271eda.222.1634208970442; 
 Thu, 14 Oct 2021 03:56:10 -0700 (PDT)
Received: from [192.168.1.132] (host-79-34-250-211.business.telecomitalia.it.
 [79.34.250.211])
 by smtp.gmail.com with ESMTPSA id g8sm2344446edb.60.2021.10.14.03.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 03:56:09 -0700 (PDT)
Message-ID: <89ecc3ac37eb5e07a37730a730648d0ca11c4f8c.camel@redhat.com>
Subject: Re: [PATCH v1] vsock: don't send messages when vsock device is not
 started
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jiang Wang <jiang.wang@bytedance.com>, qemu-devel@nongnu.org
Date: Thu, 14 Oct 2021 12:56:09 +0200
In-Reply-To: <20211001184223.3600083-1-jiang.wang@bytedance.com>
References: <20211001184223.3600083-1-jiang.wang@bytedance.com>
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please CC maintainers (MST in this case)

On Fri, 2021-10-01 at 18:42 +0000, Jiang Wang wrote:
> Added a check in vhost_vsock_common_send_transport_reset,
> and only send messages on event queue when the vsock host
> device is started.
> 
> Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> ---
>  hw/virtio/vhost-vsock-common.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-
> common.c
> index 4ad6e234ad..64425719a2 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -138,8 +138,10 @@ static void
> vhost_vsock_common_send_transport_reset(VHostVSockCommon *vvc)
>          goto out;
>      }
>  
> -    virtqueue_push(vq, elem, sizeof(event));
> -    virtio_notify(VIRTIO_DEVICE(vvc), vq);
> +    if (vvc->vhost_dev.started) {
> +        virtqueue_push(vq, elem, sizeof(event));
> +        virtio_notify(VIRTIO_DEVICE(vvc), vq);
> +    }
>  
>  out:
>      g_free(elem);

I agree that we should avoid to enqueue reset messages if the device is
not started, but this change is wrong, because we are still doing
`virtqueue_pop()`.

I think we should skip vhost_vsock_common_send_transport_reset()
entirely.

Thanks,
Stefano





