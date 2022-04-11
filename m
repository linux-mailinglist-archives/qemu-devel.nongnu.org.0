Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E654FC696
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 23:17:07 +0200 (CEST)
Received: from localhost ([::1]:39072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne1PG-0003TM-8g
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 17:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ne1LJ-00013Z-BL
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 17:13:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ne1LD-0005FA-M4
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 17:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649711574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8cmTFNpJApBLns6HnSsKjqxIjwpmkzANic7JGkuTiJQ=;
 b=bxDdFDZzg/kfmA4mvIMaRgpbgFPmLsadgYsCQ3ewvjIlNCe/TBJMtiT2TFf4Av6poZDK09
 OIkZgNtqQeddM4h7ZP+M0DvBMuVUm+g4QEYO61q6/gYjsoDV6udy/uYsQjNEoXvTRtnoTw
 DL8nfxKdEKiPvdvlS2QSOeTrZbmSyJ0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-XwZka_Z7PZKEIIeYslNMkQ-1; Mon, 11 Apr 2022 17:12:53 -0400
X-MC-Unique: XwZka_Z7PZKEIIeYslNMkQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 i184-20020a1c3bc1000000b0038e4c5968b5so227032wma.0
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 14:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8cmTFNpJApBLns6HnSsKjqxIjwpmkzANic7JGkuTiJQ=;
 b=S4RvsJHGdo2KM6eQJUpn4lyco7QstE+2mLjVGAeEv06HrwZ0R0LZCqsOH7c5IbOm96
 NsiNCaaoXsLuq70YNcCSQRmukYwwu2PyMxw6A425sZN/vDn8MetIHuCvfMbx6VmgGeMm
 nrLe+9IZhfmGOivcw0tzxNGUeVTtTAIiz65Ph5C570EBPkaC/NECUBEMxqUGI3f6Rvjd
 Scg331oq+LZXboWtjARJON6/T/58XPwWgfcki7FWA/Z41ZsDc67eR4yFDl3twprD7lML
 lVFQVYCdSQz0Ba92b1JCtTBqUBxXIu2o5JSBaz8TcZhXGnYhGKTWq5enfhBJqVw+TvRd
 qhfw==
X-Gm-Message-State: AOAM533Rdu/UV7tJ0DATE+NntRznP0gDhf+KwMmia46aVwZ45wqMpZxC
 F6efnNrHGKja3tXsZshehaLEErri7I/janfcYDCXPqF3Im7t0GgundHbaQOMNEqgECviZBew9ji
 kQ7GKjoKSbCuvyR4=
X-Received: by 2002:a05:600c:4f46:b0:38c:d4cd:ee31 with SMTP id
 m6-20020a05600c4f4600b0038cd4cdee31mr986758wmq.16.1649711572428; 
 Mon, 11 Apr 2022 14:12:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbuh1XaQSq0OUZrC+aJk6msng1xby2C7T6wU7EXEEzIsJFmyIF38ZQu/VeghKjuoMk0X4zDw==
X-Received: by 2002:a05:600c:4f46:b0:38c:d4cd:ee31 with SMTP id
 m6-20020a05600c4f4600b0038cd4cdee31mr986744wmq.16.1649711572178; 
 Mon, 11 Apr 2022 14:12:52 -0700 (PDT)
Received: from redhat.com ([2.52.1.156]) by smtp.gmail.com with ESMTPSA id
 a9-20020a7bc1c9000000b0038eb67e966esm514494wmj.29.2022.04.11.14.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:12:51 -0700 (PDT)
Date: Mon, 11 Apr 2022 17:12:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: Re: [RFC PATCH v1 1/1] include/hw/pci/pcie_host: Correct
 PCIE_MMCFG_BUS_MASK
Message-ID: <20220411171149-mutt-send-email-mst@kernel.org>
References: <20220411193818.8845-1-frasse.iglesias@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220411193818.8845-1-frasse.iglesias@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 11, 2022 at 09:38:18PM +0200, Francisco Iglesias wrote:
> According to [1] address bits 27 - 20 are mapped to the bus number (the
> TLPs bus number field is 8 bits).
> 
> [1] PCI Express® Base Specification Revision 5.0 Version 1.0
> 
> Signed-off-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> ---
>  include/hw/pci/pcie_host.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/pci/pcie_host.h b/include/hw/pci/pcie_host.h
> index 076457b270..b3c8ce973c 100644
> --- a/include/hw/pci/pcie_host.h
> +++ b/include/hw/pci/pcie_host.h
> @@ -60,7 +60,7 @@ void pcie_host_mmcfg_update(PCIExpressHost *e,
>  /*
>   * PCI express ECAM (Enhanced Configuration Address Mapping) format.
>   * AKA mmcfg address
> - * bit 20 - 28: bus number
> + * bit 20 - 27: bus number
>   * bit 15 - 19: device number
>   * bit 12 - 14: function number
>   * bit  0 - 11: offset in configuration space of a given device

this is correct, or to be more precise:
A[(20 + n – 1):20] and 1 <= n <= 8


> @@ -68,7 +68,7 @@ void pcie_host_mmcfg_update(PCIExpressHost *e,
>  #define PCIE_MMCFG_SIZE_MAX             (1ULL << 29)
>  #define PCIE_MMCFG_SIZE_MIN             (1ULL << 20)
>  #define PCIE_MMCFG_BUS_BIT              20
> -#define PCIE_MMCFG_BUS_MASK             0x1ff
> +#define PCIE_MMCFG_BUS_MASK             0xff
>  #define PCIE_MMCFG_DEVFN_BIT            12
>  #define PCIE_MMCFG_DEVFN_MASK           0xff
>  #define PCIE_MMCFG_CONFOFFSET_MASK      0xfff
> -- 
> 2.20.1


