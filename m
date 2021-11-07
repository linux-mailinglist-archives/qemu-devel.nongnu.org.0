Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C070447237
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 09:40:14 +0100 (CET)
Received: from localhost ([::1]:59066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjdin-0004GA-E4
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 03:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mjdh5-0003Ya-JH
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 03:38:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mjdh3-000367-JZ
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 03:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636274305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=472cl2xARvIW1tX3bG4qCjBWHmneMEjxN55rvqMuYyE=;
 b=ZJOxmuOUp5xv5AZo5BE5nDezHnYwVxazQBtwG2UwFmNYMYu7xWimRPpPVf3DbiJdsU8fCR
 Sw1GUrt+zp5YDPTf04iAz/0rYf72mE1koH3WTwJc3CfMSeTx70nMWc6Hk9xyU+qsdxV88c
 FHlISjLwqLna2YiNoD5pOMbDAQBgvOk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-gwGqvt5qNZOuf2InnamGCw-1; Sun, 07 Nov 2021 03:38:23 -0500
X-MC-Unique: gwGqvt5qNZOuf2InnamGCw-1
Received: by mail-ed1-f71.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so12328547edl.17
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 01:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=472cl2xARvIW1tX3bG4qCjBWHmneMEjxN55rvqMuYyE=;
 b=8ImxjFBnThch9e3ATiobpVO4YCnM6qX5RO3U55GBqS0Put0xNJWnxOfREMv6IVZ6Q3
 3IvtnhyUgzU1diKO5tBM9YUx9o0I9bbyih6525UxqL7y8i1AEQDUuQLUghX/fzsmnRBK
 2/jz+7+bnkEGoHV1A6jsHA2wyUUwjfsAL48wDIvtA2ktT7Fi/82oac2EHDl1LKSYMvbm
 iVJnyvS++bOwVl8IXhIhuqfKMhDS2l7BNcoo7FTtpdYcQpwR4WTFlWAd6Lbd1ljEVYjw
 2iGYumRO5qRHen/f04kGvhiPWL2RmHztPUoUUvqes1yRazfCzIFktZz52T8XPDlPo+mX
 xWbg==
X-Gm-Message-State: AOAM530V/DQ73TG0xB4Phay0pDoUQF53nO8R6Gk8LZgYAQtdF1JhsMla
 l4CgiF48rmLvxjokaaC8TRWxmaasptUt683ulqTaW5vAkf4tX9HEKKaDOa4j0hhwWP54HW/g/01
 a3P1UStCeQwbSYXg=
X-Received: by 2002:a17:907:2d87:: with SMTP id
 gt7mr19312787ejc.554.1636274302587; 
 Sun, 07 Nov 2021 01:38:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMUwNdajiSApB9L2sl8K7JlYYzmSFb7IyBRJa3WFVmNvdum+I3GVCnZ7sCA0GnezMSFWLtKQ==
X-Received: by 2002:a17:907:2d87:: with SMTP id
 gt7mr19312771ejc.554.1636274302356; 
 Sun, 07 Nov 2021 01:38:22 -0700 (PDT)
Received: from redhat.com ([2.55.155.32])
 by smtp.gmail.com with ESMTPSA id m12sm6428604ejj.63.2021.11.07.01.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 01:38:21 -0700 (PDT)
Date: Sun, 7 Nov 2021 03:38:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] trace-events,pci: unify trace events format
Message-ID: <20211107033751-mutt-send-email-mst@kernel.org>
References: <20211105192541.655831-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211105192541.655831-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 05, 2021 at 08:25:41PM +0100, Laurent Vivier wrote:
> Unify format used by trace_pci_update_mappings_del(),
> trace_pci_update_mappings_add(), trace_pci_cfg_write() and
> trace_pci_cfg_read() to print the device name and bus number,
> slot number and function number.
> 
> For instance:
> 
>   pci_cfg_read virtio-net-pci 00:0 @0x20 -> 0xffffc00c
>   pci_cfg_write virtio-net-pci 00:0 @0x20 <- 0xfea0000c
>   pci_update_mappings_del d=0x555810b92330 01:00.0 4,0xffffc000+0x4000
>   pci_update_mappings_add d=0x555810b92330 01:00.0 4,0xfea00000+0x4000
> 
> becomes
> 
>   pci_cfg_read virtio-net-pci 01:00.0 @0x20 -> 0xffffc00c
>   pci_cfg_write virtio-net-pci 01:00.0 @0x20 <- 0xfea0000c
>   pci_update_mappings_del virtio-net-pci 01:00.0 4,0xffffc000+0x4000
>   pci_update_mappings_add virtio-net-pci 01:00.0 4,0xfea00000+0x4000
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>


Looks good to me. We are in freeze, will queue. Pls ping after
the release to make sure it's not lost.

> ---
>  hw/pci/pci.c        | 4 ++--
>  hw/pci/pci_host.c   | 6 ++++--
>  hw/pci/trace-events | 8 ++++----
>  3 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 4a84e478cef5..9a76905d38c7 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1387,7 +1387,7 @@ static void pci_update_mappings(PCIDevice *d)
>  
>          /* now do the real mapping */
>          if (r->addr != PCI_BAR_UNMAPPED) {
> -            trace_pci_update_mappings_del(d, pci_dev_bus_num(d),
> +            trace_pci_update_mappings_del(d->name, pci_dev_bus_num(d),
>                                            PCI_SLOT(d->devfn),
>                                            PCI_FUNC(d->devfn),
>                                            i, r->addr, r->size);
> @@ -1395,7 +1395,7 @@ static void pci_update_mappings(PCIDevice *d)
>          }
>          r->addr = new_addr;
>          if (r->addr != PCI_BAR_UNMAPPED) {
> -            trace_pci_update_mappings_add(d, pci_dev_bus_num(d),
> +            trace_pci_update_mappings_add(d->name, pci_dev_bus_num(d),
>                                            PCI_SLOT(d->devfn),
>                                            PCI_FUNC(d->devfn),
>                                            i, r->addr, r->size);
> diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> index cf02f0d6a501..0768893aafcf 100644
> --- a/hw/pci/pci_host.c
> +++ b/hw/pci/pci_host.c
> @@ -78,7 +78,8 @@ void pci_host_config_write_common(PCIDevice *pci_dev, uint32_t addr,
>          return;
>      }
>  
> -    trace_pci_cfg_write(pci_dev->name, PCI_SLOT(pci_dev->devfn),
> +    trace_pci_cfg_write(pci_dev->name, pci_dev_bus_num(pci_dev),
> +                        PCI_SLOT(pci_dev->devfn),
>                          PCI_FUNC(pci_dev->devfn), addr, val);
>      pci_dev->config_write(pci_dev, addr, val, MIN(len, limit - addr));
>  }
> @@ -102,7 +103,8 @@ uint32_t pci_host_config_read_common(PCIDevice *pci_dev, uint32_t addr,
>      }
>  
>      ret = pci_dev->config_read(pci_dev, addr, MIN(len, limit - addr));
> -    trace_pci_cfg_read(pci_dev->name, PCI_SLOT(pci_dev->devfn),
> +    trace_pci_cfg_read(pci_dev->name, pci_dev_bus_num(pci_dev),
> +                       PCI_SLOT(pci_dev->devfn),
>                         PCI_FUNC(pci_dev->devfn), addr, ret);
>  
>      return ret;
> diff --git a/hw/pci/trace-events b/hw/pci/trace-events
> index fc777d0b5e6e..7570752c4045 100644
> --- a/hw/pci/trace-events
> +++ b/hw/pci/trace-events
> @@ -1,12 +1,12 @@
>  # See docs/devel/tracing.rst for syntax documentation.
>  
>  # pci.c
> -pci_update_mappings_del(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
> -pci_update_mappings_add(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
> +pci_update_mappings_del(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
> +pci_update_mappings_add(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
>  
>  # pci_host.c
> -pci_cfg_read(const char *dev, unsigned devid, unsigned fnid, unsigned offs, unsigned val) "%s %02u:%u @0x%x -> 0x%x"
> -pci_cfg_write(const char *dev, unsigned devid, unsigned fnid, unsigned offs, unsigned val) "%s %02u:%u @0x%x <- 0x%x"
> +pci_cfg_read(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, unsigned offs, unsigned val) "%s %02x:%02x.%x @0x%x -> 0x%x"
> +pci_cfg_write(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, unsigned offs, unsigned val) "%s %02x:%02x.%x @0x%x <- 0x%x"
>  
>  # msix.c
>  msix_write_config(char *name, bool enabled, bool masked) "dev %s enabled %d masked %d"
> -- 
> 2.31.1


