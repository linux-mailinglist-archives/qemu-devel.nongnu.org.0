Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65220339881
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 21:40:21 +0100 (CET)
Received: from localhost ([::1]:53466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKoa4-0001Np-08
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 15:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lKoYM-0000gP-Ni
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 15:38:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lKoYL-0003V4-5o
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 15:38:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615581512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9ocnIzD9dlpj0e13ccQCn+baLvCjUIHGltEZdAUNfI=;
 b=PIQ9E6FJ7r41wq/jeCXR2k9xllGz6K8Als/wfE/nhMhwi8YloxbKiatNP2mEwOoG4tzm77
 e4I0dY8oltkv84sLs5Ef5Iw1wGPJnJGtLSp/cvXj062gk2Dn/Ee7jWfreSkxU5ZZFSC8hC
 kchfmMLDdlZ1RLp5xNwfF1XRqDLj7Bg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-PRTRsk78O8uV8BTTCVVAVQ-1; Fri, 12 Mar 2021 15:38:24 -0500
X-MC-Unique: PRTRsk78O8uV8BTTCVVAVQ-1
Received: by mail-qv1-f70.google.com with SMTP id j3so18301235qvo.1
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 12:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=u9ocnIzD9dlpj0e13ccQCn+baLvCjUIHGltEZdAUNfI=;
 b=T2rrTRCJmOSLj3czZGisIbrIFCK92Vfv8MG0hPyNkb42heH25VF8PHD/knPYTk+7yM
 Z+F8EmGxGcpic7zAAzKddg8lHS5Zcbfc4WrcBzfVbV3nCjWll1ptryTpuONjGJFMtTpf
 GOso2CSk1xpJaFV31eG28Dvo21dfox5PR7m7dYh/78Dtwjq3dIvKT8a87QmGyu5Fe2Tm
 V2v/Nb6wBSlNetRAmOOOkg2yGmGP3XF/HVNoCeTVe8W7TC45Ym9T/0I/mziirigqyWzM
 d4kYS5BTH065TRDHuS3MiY950qfaSwWjSi2LMgTmSZj6hTi3vmIRtVSnDp7+FxLq64qM
 829g==
X-Gm-Message-State: AOAM530WrFOM/a85ymLjCe4tDVLtacpO9Pqaic61nM7Jy0uwcBcL+Mpn
 VMXsieXuGkLmwN2JN1LP1FcfdCmjxKiCf8/nHFsyhmDQsAmQWgOOcnxqJ4DmqWfKnfYiWs3nFTR
 Z5E9J0D5uWHtUwFc=
X-Received: by 2002:aed:306c:: with SMTP id 99mr13355217qte.352.1615581503685; 
 Fri, 12 Mar 2021 12:38:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1xSx7iSs4YZZVnZcOb6H3K4yIbZSG34drK1vA8TomP9exjh229vIjIRsapq51+WD5k9pfhw==
X-Received: by 2002:aed:306c:: with SMTP id 99mr13355191qte.352.1615581503395; 
 Fri, 12 Mar 2021 12:38:23 -0800 (PST)
Received: from xz-x1 ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id b17sm3377134qtp.73.2021.03.12.12.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 12:38:22 -0800 (PST)
Date: Fri, 12 Mar 2021 15:38:21 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/5] hw/pci-host/prep: Remove unuseful memory region
 mapping
Message-ID: <20210312203821.GN194839@xz-x1>
References: <20210312182851.1922972-1-f4bug@amsat.org>
 <20210312182851.1922972-4-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210312182851.1922972-4-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 12, 2021 at 07:28:49PM +0100, Philippe Mathieu-Daudé wrote:
> The pci_io_non_contiguous region is mapped on top of pci_io
> with higher priority, but simply dispatch into this region
> address space. Simplify by directly registering the former
> region in place, and adapt the address space dispatch offsets.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/pci-host/prep.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> index 0a9162fba97..00a28c2d18c 100644
> --- a/hw/pci-host/prep.c
> +++ b/hw/pci-host/prep.c
> @@ -159,8 +159,7 @@ static uint64_t raven_io_read(void *opaque, hwaddr addr,
>      uint8_t buf[4];
>  
>      addr = raven_io_address(s, addr);
> -    address_space_read(&s->pci_io_as, addr + 0x80000000,
> -                       MEMTXATTRS_UNSPECIFIED, buf, size);
> +    address_space_read(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED, buf, size);
>  
>      if (size == 1) {
>          return buf[0];
> @@ -191,8 +190,7 @@ static void raven_io_write(void *opaque, hwaddr addr,
>          g_assert_not_reached();
>      }
>  
> -    address_space_write(&s->pci_io_as, addr + 0x80000000,
> -                        MEMTXATTRS_UNSPECIFIED, buf, size);
> +    address_space_write(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED, buf, size);

This changes access to s->pci_io_as, but below didn't change s->pci_io_as
layout at all (below is about address_space_mem).  Is this intended?

>  }
>  
>  static const MemoryRegionOps raven_io_ops = {
> @@ -294,9 +292,8 @@ static void raven_pcihost_initfn(Object *obj)
>      address_space_init(&s->pci_io_as, &s->pci_io, "raven-io");
>  
>      /* CPU address space */
> -    memory_region_add_subregion(address_space_mem, 0x80000000, &s->pci_io);
> -    memory_region_add_subregion_overlap(address_space_mem, 0x80000000,
> -                                        &s->pci_io_non_contiguous, 1);
> +    memory_region_add_subregion(address_space_mem, 0x80000000,
> +                                &s->pci_io_non_contiguous);

I don't know any of this code at all... but it seems the two memory regions are
not identical in size:

    memory_region_init(&s->pci_io, obj, "pci-io", 0x3f800000);
    memory_region_init_io(&s->pci_io_non_contiguous, obj, &raven_io_ops, s,
                          "pci-io-non-contiguous", 0x00800000);

Then it seems the memory access dispatching to (0x00800000, 0x3f800000) would
change too, from s->pci_io to nothing.  Raise this up too since I don't know
either whether it's intended..

>      memory_region_add_subregion(address_space_mem, 0xc0000000, &s->pci_memory);
>      pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj), NULL,
>                               &s->pci_memory, &s->pci_io, 0, TYPE_PCI_BUS);
> -- 
> 2.26.2
> 

-- 
Peter Xu


