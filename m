Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F35860EA2F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:23:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmvj-0002N8-Ic; Wed, 26 Oct 2022 16:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmvh-0002Ld-VL
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:23:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmvg-0004JZ-Ah
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:23:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666815791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wB/1zCeHiDVs74QXZA2DcI+HrLu+CWHwm+lkoMEukOU=;
 b=XZowyLByKv5e9FVFD5EzKoV1V5Bz55xV9fcGa1wjWXrtLGnPCdPTjruUG9tSp6mfL+6Wkb
 O9lTctaB6eUlruLtGt8oRax5MAeyXzSO0LKhn8bwZIxUlc5uk9n6VKp32f0ypK/Ep0XSdj
 OID7g0QtAkVm5CyLncad/duIlcMjD8w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-456-hmqzKwwtN_iivbo4Xc_AFA-1; Wed, 26 Oct 2022 16:23:10 -0400
X-MC-Unique: hmqzKwwtN_iivbo4Xc_AFA-1
Received: by mail-wm1-f72.google.com with SMTP id
 x12-20020a05600c21cc00b003c8340cb973so796671wmj.7
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wB/1zCeHiDVs74QXZA2DcI+HrLu+CWHwm+lkoMEukOU=;
 b=i6rO46WDWm5MZW0KKj0J8mZ2GN5TANlLUT5WnUtb9G02sPA8oz92La3DniU+CjD2cz
 GmuUHExIRlydyawXd74/bEdGyY3UVS9nbVw8e8Av02GT5BhbFT3ZpPZzNQOY2YkNbnJc
 E5daSvc94rIu9zQZO84UoD34BFuUyPxVBsAvmf3lRcFZDqiZZM642/p4XZLTX26SR9DH
 OXzMNzAYhNGpuQ4zUODT0nLvF0Ixer6OApy4SZLCLSwnztFPG3is35dEXDF/BcjzHAuy
 ouq52PzKk7aAK9aJoFSGf20ku1VDyZXiddNZH6I9fEWrBtevYEbBP2M/JGomV+/CAYuN
 oDbA==
X-Gm-Message-State: ACrzQf1D0RMZdfLPKDaX93QQWJi8E/9oQGxxgf1xOgNVeuk8HTLjtHUF
 7LNv8ZqkeF03IMtwiuLllQ5IFHfxqkiRCnPdHQBU4cTvhSoQkKS5RlYYBJaDNx5wzDARn/XIJgg
 nnD07NQc99ZfplOU=
X-Received: by 2002:a05:6000:1565:b0:235:37f6:9e06 with SMTP id
 5-20020a056000156500b0023537f69e06mr24882153wrz.211.1666815789149; 
 Wed, 26 Oct 2022 13:23:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4tTYHtRnkz/1/gIhkiimRWfj6D4Buc9yimf9fOawoY5taoSvxF+s82oKU49+QMnaO2Kqy47g==
X-Received: by 2002:a05:6000:1565:b0:235:37f6:9e06 with SMTP id
 5-20020a056000156500b0023537f69e06mr24882145wrz.211.1666815788932; 
 Wed, 26 Oct 2022 13:23:08 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 bi15-20020a05600c3d8f00b003b497138093sm2572103wmb.47.2022.10.26.13.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:23:08 -0700 (PDT)
Date: Wed, 26 Oct 2022 16:23:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Brivio <sbrivio@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2 0/2] virtio-net: re-arm/re-schedule when tx_burst
 stops virtio_net_flush_tx()
Message-ID: <20221026162244-mutt-send-email-mst@kernel.org>
References: <20221014132004.114602-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221014132004.114602-1-lvivier@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 14, 2022 at 03:20:02PM +0200, Laurent Vivier wrote:
> When virtio_net_flush_tx() reaches the tx_burst value all the queue is
> not flushed and nothing restart the timer or the bottom half function.
> 
> For BH, this is only missing in the virtio_net_tx_complete() function.
> For the timer, the same fix is needed in virtio_net_tx_complete() but
> it must be also managed in the TX timer function.
> 
> v2:
> - fix also tx timer


Jason's area, and he wants a small nit fixed.
Looks good to me overall:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> Laurent Vivier (2):
>   virtio-net: fix bottom-half packet TX on asynchronous completion
>   virtio-net: fix TX timer with tx_burst
> 
>  hw/net/virtio-net.c | 68 +++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 56 insertions(+), 12 deletions(-)
> 
> -- 
> 2.37.3
> 


