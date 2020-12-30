Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B392E7C93
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 22:19:20 +0100 (CET)
Received: from localhost ([::1]:39388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuisG-0006Z9-Ok
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 16:19:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kuiqV-000660-Cr
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 16:17:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kuiqS-00065w-BL
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 16:17:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609363042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2JgWaVzCDRJVOlJX6IzevQlppz8ON7JY79zHZfQC3Yg=;
 b=R32FvOB7ZgM2grCvY5Fd7+SINI1OIf1O/Dh85LogNablOvt3pczU3VSPA7gq3IJNNaLY4l
 fC/gfp0z79qUofnUPGfl25OP0TjW297EcEBHYmCl6D0BEpQygBBP/chUgH5Iiy07xZ0r7F
 CxuUG/Bj95qEFBr+WncHxIxSr9m3OYE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-li2GbVhHNeik6gT8Nv6WPQ-1; Wed, 30 Dec 2020 16:17:20 -0500
X-MC-Unique: li2GbVhHNeik6gT8Nv6WPQ-1
Received: by mail-wr1-f69.google.com with SMTP id u3so9247518wri.19
 for <qemu-devel@nongnu.org>; Wed, 30 Dec 2020 13:17:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2JgWaVzCDRJVOlJX6IzevQlppz8ON7JY79zHZfQC3Yg=;
 b=TxYBN2lAJLZygIjfaQXGQdTcQrYiXJcSTIDEbWFKocAkmHLebhGkbnE0pAv8WlKglz
 qZebEeryfmbvK+QO1vYCxGa7wb/cvw2TeyMabVN545DfKVG2Mh8mQByg0e9zxp4anNHi
 voXf1M9L99iROnx+KCHgsHd9b29/zimM0J6wGMEpJdyuo1J1s7xzZqwKK6rBaQKb6Tlw
 vxlMkT4o+9kKxY73ZnbLuMDfpf6cD5KcRq1pSHnx9ey1j1GfqMtJeiw1O5jT2YpKkAWa
 keQBI/n6GIksy6QJCbr4fnjxiLpwkbYsyUX+Z46yVulpkAkkzVE/wzG4EgCIZVARd2rq
 PJxA==
X-Gm-Message-State: AOAM5330GL8g1qEsY+JQ84hl5J6K0eiP+GRsCSQ173JdGhF+eLDc4MgX
 sNF8GPAKFxXzBl+VHLjOOQ8zT+AwZV0EE79+GkXXL4Y5mCDm6vE9l/ZxsTW0LjMRngFFcsNQuna
 S4fO7s8cN7hOtHJA=
X-Received: by 2002:a1c:8115:: with SMTP id c21mr9118935wmd.1.1609363038888;
 Wed, 30 Dec 2020 13:17:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtoWA2OgCbKHhAq6Ypo2egg+DzTDtInOanMuTB+n4KB2f2RL/Q5NmnqGL7/QYM00pTiHnDvw==
X-Received: by 2002:a1c:8115:: with SMTP id c21mr9118916wmd.1.1609363038705;
 Wed, 30 Dec 2020 13:17:18 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id c16sm45237501wrx.51.2020.12.30.13.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Dec 2020 13:17:18 -0800 (PST)
Date: Wed, 30 Dec 2020 16:17:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 5/8] acpi/gpex: Append pxb devs in ascending order
Message-ID: <20201230160814-mutt-send-email-mst@kernel.org>
References: <20201223090836.9075-1-cenjiahui@huawei.com>
 <20201223090836.9075-6-cenjiahui@huawei.com>
 <20201229144735.42faddad@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201229144735.42faddad@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: xieyingtai@huawei.com, Jiahui Cen <cenjiahui@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Ard Biesheuvel <ard.biesheuvel@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 29, 2020 at 02:47:35PM +0100, Igor Mammedov wrote:
> On Wed, 23 Dec 2020 17:08:33 +0800
> Jiahui Cen <cenjiahui@huawei.com> wrote:
> 
> > The overlap check of IO resource window would fail when Linux kernel
> > registers an IO resource [b, c) earlier than another resource [a, b).
> > Though this incorrect check could be fixed by [1], it would be better to
> > append pxb devs into DSDT table in ascending order.
> > 
> > [1]: https://lore.kernel.org/lkml/20201218062335.5320-1-cenjiahui@huawei.com/
> 
> considering there is acceptable fix for kernel I'd rather avoid
> workarounds on QEMU side. So I suggest dropping this patch.

Well there's something to be said for a defined order of things.
And patch is from Dec 2020 will take ages for guests to be fixed,
and changing pci core on stable kernels is risky and needs
a ton of testing, not done eaily ...
Which guests are affected by the bug?

There are also some issues with the patch see below.

> it also should reduce noise in [8/8] masking other changes.
> 
> > Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> > ---
> >  hw/pci-host/gpex-acpi.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> > index 4bf1e94309..95a7a0f12b 100644
> > --- a/hw/pci-host/gpex-acpi.c
> > +++ b/hw/pci-host/gpex-acpi.c
> > @@ -141,7 +141,7 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
> >  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> >  {
> >      int nr_pcie_buses = cfg->ecam.size / PCIE_MMCFG_SIZE_MIN;
> > -    Aml *method, *crs, *dev, *rbuf;
> > +    Aml *method, *crs, *dev, *rbuf, *pxb_devs[nr_pcie_buses];

dynamically sized array on stack poses security issues

> >      PCIBus *bus = cfg->bus;
> >      CrsRangeSet crs_range_set;
> >      CrsRangeEntry *entry;
> > @@ -149,6 +149,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> >  
> >      /* start to construct the tables for pxb */
> >      crs_range_set_init(&crs_range_set);
> > +    memset(pxb_devs, 0, sizeof(pxb_devs));
> >      if (bus) {
> >          QLIST_FOREACH(bus, &bus->child, sibling) {
> >              uint8_t bus_num = pci_bus_num(bus);
> > @@ -190,7 +191,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> >  
> >              acpi_dsdt_add_pci_osc(dev);
> >  
> > -            aml_append(scope, dev);
> > +            pxb_devs[bus_num] = dev;

If bus numbers intersect this will overwrite old one.
I'd rather not worry about it, just have an array
of structs with bus numbers and sort it.


> >          }
> >      }
> >  
> > @@ -278,5 +279,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> >      aml_append(dev, dev_res0);
> >      aml_append(scope, dev);
> >  
> > +    for (i = 0; i < ARRAY_SIZE(pxb_devs); i++) {
> > +        if (pxb_devs[i]) {
> > +            aml_append(scope, pxb_devs[i]);
> > +        }
> > +    }


so this sorts them by bus number not by io address.
Probably happens to help since bios numbers them in the same order ...
Is there a way to address this more robustly in case
bios changes? E.g. I see the bug is only in PIO so sort by that address maybe?

Also pls add a code comment explaining why we are doing all this
with link to patch, which guests are affected etc.

> > +
> >      crs_range_set_free(&crs_range_set);
> >  }


