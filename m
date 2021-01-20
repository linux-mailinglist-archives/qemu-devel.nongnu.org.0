Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3C02FCD89
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 10:44:41 +0100 (CET)
Received: from localhost ([::1]:51268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2A2a-0007Jo-Ib
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 04:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l2A1b-0006pD-4C
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:43:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l2A1Y-0001il-AV
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611135814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h0dvvqZcaBy/Cd9fTX8s4Pjc4hZ4LR7QSR5QI56D5Tg=;
 b=RWklxfKz5uxRZ8AXpx+n//VQJx0WDyjdCzC2PcAAODMPZrHo/2Yk3qJbSUnueTp3vMv++w
 UqNIYn55eCBU2kbrxi5G3n2TYXLsJyAlVwNwETBhjPUXp5cs6JWzrgOf4M9CdT7YKeiwPC
 bniu3ksgWLdcSfTdMK/fef9PTEEvjBw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-BUywhctXOYy26gx0CxXnSA-1; Wed, 20 Jan 2021 04:43:32 -0500
X-MC-Unique: BUywhctXOYy26gx0CxXnSA-1
Received: by mail-wr1-f72.google.com with SMTP id e12so2344732wrx.14
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 01:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h0dvvqZcaBy/Cd9fTX8s4Pjc4hZ4LR7QSR5QI56D5Tg=;
 b=bFgSsklULjIKTGWUNKvR5SGInqRx5y9ElAEL63Jzc0jDQNLTTTbn6pOx8WYbO8KCqu
 zhCaiMc5dVo7w8gh8JohP43deKyaee30j0I/mx14pTiSmQVh8cMfKaABMy21v4+tRPUJ
 cH9Cqb0CCvor3pc2pUZ5kCzpnqbwmkBr5D2aiQXwEbwaw3K+oXhK1dyRQzDjPoiN4HZz
 8d78nOAyH2PeX+aYYRD9ObZ0pF4jPuwsUlpYtUlnlTlqZQC/8IgVcssqtc41JAcH2Nbi
 fDHu0Ve1pYcRZwN9CRLOrv7ATLSQQfDL+tSSSKXyj+O6cYmB3kXpfwQY56FEip1QEEaN
 QmIA==
X-Gm-Message-State: AOAM531tBu+A0WcdFHTKFG3CCcFGl4UUvuiHYID8+d86jaGAGSHfZkxb
 S4RagSffKsOaaKG6+8cpuMlp9lfYQyCO75GhMMiU5NOasUD0D3By4oqZEwg2XpzWVg0KWBSSR8O
 VufmOGL3RxeOtr0o=
X-Received: by 2002:adf:dd09:: with SMTP id a9mr8319669wrm.90.1611135811664;
 Wed, 20 Jan 2021 01:43:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzP1soxq5xQWbXc9hjEDSTUdE6Es86idz0zZyTYSwqGn+mwL+P/8LoqmTZqs9kdaGA6E1Kzfg==
X-Received: by 2002:adf:dd09:: with SMTP id a9mr8319640wrm.90.1611135811349;
 Wed, 20 Jan 2021 01:43:31 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id a12sm3200181wrh.71.2021.01.20.01.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 01:43:30 -0800 (PST)
Date: Wed, 20 Jan 2021 04:43:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 01/12] vhost-user-blk: fix blkcfg->num_queues endianness
Message-ID: <20210120044254-mutt-send-email-mst@kernel.org>
References: <20201207172030.251905-1-stefanha@redhat.com>
 <20201207172030.251905-2-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201207172030.251905-2-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Coiby Xu <coiby.xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 07, 2020 at 05:20:19PM +0000, Stefan Hajnoczi wrote:
> Treat the num_queues field as virtio-endian. On big-endian hosts the
> vhost-user-blk num_queues field was in the wrong endianness.
> 
> Move the blkcfg.num_queues store operation from realize to
> vhost_user_blk_update_config() so feature negotiation has finished and
> we know the endianness of the device. VIRTIO 1.0 devices are
> little-endian, but in case someone wants to use legacy VIRTIO we support
> all endianness cases.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Pls merge with rest of the series.
And maybe CC stable?



> ---
>  hw/block/vhost-user-blk.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 2dd3d93ca0..d9d9dc8a89 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -53,6 +53,9 @@ static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t *config)
>  {
>      VHostUserBlk *s = VHOST_USER_BLK(vdev);
>  
> +    /* Our num_queues overrides the device backend */
> +    virtio_stw_p(vdev, &s->blkcfg.num_queues, s->num_queues);
> +
>      memcpy(config, &s->blkcfg, sizeof(struct virtio_blk_config));
>  }
>  
> @@ -490,10 +493,6 @@ reconnect:
>          goto reconnect;
>      }
>  
> -    if (s->blkcfg.num_queues != s->num_queues) {
> -        s->blkcfg.num_queues = s->num_queues;
> -    }
> -
>      return;
>  
>  virtio_err:
> -- 
> 2.28.0
> 


