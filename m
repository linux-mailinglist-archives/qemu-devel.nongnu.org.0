Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08166341829
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 10:26:04 +0100 (CET)
Received: from localhost ([::1]:50006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNBOM-0002hF-Rp
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 05:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lNBMm-0001ee-62
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:24:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lNBMk-0004t5-Ok
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616145861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=llB9uNiGPJzVQ9k1PaTShs6zmwXpfrlUsmRjgJ/A/iE=;
 b=TZkQE60dKUIShqMMs2i4KrAwanvVPixX3y1BftPieCI+udKXDOSIJmGECoW8a4uJykURwP
 1kZerB0X9hlU5RDfAfrHv1VmPIBgKanFySAnbD4qkIPbBpie02D2VFKR8NriuLOil7E33u
 Y8RBL3vbe1nfVIvSaQbndPinpTos8D4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-OmpaZD39PveTXZxQxXl79g-1; Fri, 19 Mar 2021 05:24:20 -0400
X-MC-Unique: OmpaZD39PveTXZxQxXl79g-1
Received: by mail-wr1-f71.google.com with SMTP id 75so21359981wrl.3
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 02:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=llB9uNiGPJzVQ9k1PaTShs6zmwXpfrlUsmRjgJ/A/iE=;
 b=KXqkdq+t8sJXUruqmNnuusAWNnbljjmNjnc8H9TyaP8UKSZSQl5Upy880FsG745Pk7
 XqvIk+jiW6R550/QYJ8zoEVVjjnnmGEsJenoK/kN4yCRYBBifjRl8nnqFbWoJiVVmOHf
 im2A5u0PNgkMV5HaCS+3ppVSgx1A2MgcsQpc/vjKniib3qMAoVM1/oF41wYe+YHboqvZ
 t/52yi6bQE3Czh3ExmdhFS5he70SerOTxhkhaTFPsT8Ta/iYYtfI9shtZV24QiKFLrSq
 xHoLEACr1NS9JFWKJnVo3MSlHEbiCqXPsDYu0pYesTY1z84FI6pkOnXkbH6RzE4R+BVf
 H7CQ==
X-Gm-Message-State: AOAM532eezNDbcfGj5qWqm6FsmuGUvibLDulE8C/XYADMz0QtcW73+v6
 MOKqgYhgAOPL6zOHIqZgJy36NBAc8mB1ttCcVO0xn52/o9+isos2JetTT9RJVCQ8SUVSAxfHJiz
 Ghg5UozvPp+D5kwY=
X-Received: by 2002:adf:f3c2:: with SMTP id g2mr3544370wrp.300.1616145859188; 
 Fri, 19 Mar 2021 02:24:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKpAiaQkCHa9egGzXmaKs3pZLpDjPKXn86W3eQrI3XMxTUd2I161E0k7N3Izl8cal99q6f4w==
X-Received: by 2002:adf:f3c2:: with SMTP id g2mr3544358wrp.300.1616145859006; 
 Fri, 19 Mar 2021 02:24:19 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id o7sm6943976wrs.16.2021.03.19.02.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 02:24:18 -0700 (PDT)
Date: Fri, 19 Mar 2021 10:24:16 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] virtio: Fix virtio_mmio_read()/virtio_mmio_write()
Message-ID: <20210319092416.i54rvwh7u24yrrgf@steredhat>
References: <20210314200300.3259170-1-laurent@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <20210314200300.3259170-1-laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 14, 2021 at 09:03:00PM +0100, Laurent Vivier wrote:
>Both functions don't check the personality of the interface (legacy or
>modern) before accessing the configuration memory and always use
>virtio_config_readX()/virtio_config_writeX().
>
>With this patch, they now check the personality and in legacy mode
>call virtio_config_readX()/virtio_config_writeX(), otherwise call
>virtio_config_modern_readX()/virtio_config_modern_writeX().
>
>This change has been tested with virtio-mmio guests (virt stretch/armhf and
>virt sid/m68k) and virtio-pci guests (pseries RHEL-7.3/ppc64 and /ppc64le).
>
>Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>---
> hw/virtio/virtio-mmio.c | 74 +++++++++++++++++++++++++++++------------
> 1 file changed, 52 insertions(+), 22 deletions(-)
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


