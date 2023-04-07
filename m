Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D76DA974
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 09:38:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkger-0002iu-GV; Fri, 07 Apr 2023 03:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pkgel-0002im-Kx
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 03:37:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pkgej-00078L-3f
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 03:37:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680853026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bm586z1Ms9Jk/Cgge79gTRee0TwA0r6g36Vf4DKWc/Y=;
 b=g3EyDgo0kh0BMkwU/zzd4xpYpWVU6Z9XM30MWhGpqG35jSWaWOR0M433pnmCMEb/ulDn3o
 /foAnr/fxEW5TLtaZj+kka1rrk0FYZtzC3qIsCRgHj+IhlT6/jttvljMHGfJDvRnmQfPMD
 lzPabOAH47zLeiTu3LYiP4/Ts8mQLDY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336--quL9HHHMs6hcVCl-sb2UA-1; Fri, 07 Apr 2023 03:37:04 -0400
X-MC-Unique: -quL9HHHMs6hcVCl-sb2UA-1
Received: by mail-wm1-f69.google.com with SMTP id
 hg24-20020a05600c539800b003f066c0b044so2468112wmb.0
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 00:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680853023;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bm586z1Ms9Jk/Cgge79gTRee0TwA0r6g36Vf4DKWc/Y=;
 b=cO/rs9ODu/6f3Cqj3en03irGmX9klFf3EmWruF5BGQv291HOQxvJguzTo+trwxlgLv
 8KVIQfF0gB0DokBb4x4GHiF6hpicD91lZyZDG8ECgg5iRd68/NtBxugryQWRm1VajzO8
 Or25fcaxK1GCb8e7kaXGzrR3h5VQ366G670cZx2gzQHi7PhjvpGbdwg72TYI1fv6FBXC
 gdTa6TK5CpEsyaUD4k+L3femB5y8xFfoIqsC7l4TKIU7uzdNwyC0/Hf0SHMK8iaSEzEa
 U2YCZouudA42cIfIV4Opo+b0HR44e9YFJWM2Dpw4K1CJj5TWIU+2tKXyMBJh1bgJ03il
 WnZA==
X-Gm-Message-State: AAQBX9c+pYNhJ/ea2V/AX/GjepCRKKDd56VhbxK7T2X/W70sivkJjwW4
 t0NnFxH8opTlQ28e/UCqt6uJXsn7cRqvEuvAo9Bzgv7Ii9vDZGDWh/HfC73fi5kfTcRIH7Vix4c
 KSjU8yGEK+kjrwIU=
X-Received: by 2002:a7b:cd10:0:b0:3e2:19b0:887d with SMTP id
 f16-20020a7bcd10000000b003e219b0887dmr610237wmj.25.1680853023643; 
 Fri, 07 Apr 2023 00:37:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350bjpsC3+JNXEwadYo9sena4fnEcL1/5HG0DAzEiBmY9CpQxwB3ZEX1eaoxVemHhKK1zVT0CCg==
X-Received: by 2002:a7b:cd10:0:b0:3e2:19b0:887d with SMTP id
 f16-20020a7bcd10000000b003e219b0887dmr610216wmj.25.1680853023344; 
 Fri, 07 Apr 2023 00:37:03 -0700 (PDT)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 iv11-20020a05600c548b00b003ed29189777sm7582776wmb.47.2023.04.07.00.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 00:37:02 -0700 (PDT)
Date: Fri, 7 Apr 2023 03:37:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jonathan Cameron via <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, ani@anisinha.ca,
 berrange@redhat.com, Fan Ni <fan.ni@samsung.com>,
 Dave Jiang <dave.jiang@intel.com>
Subject: Re: [RFC PATCH 0/4] hw/i386: Factor out PXB parts of DSDT into an
 SSDT table
Message-ID: <20230407033509-mutt-send-email-mst@kernel.org>
References: <20230317165440.24846-1-Jonathan.Cameron@huawei.com>
 <20230406112529.00006533@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406112529.00006533@huawei.com>
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

On Thu, Apr 06, 2023 at 11:25:47AM +0100, Jonathan Cameron wrote:
> On Fri, 17 Mar 2023 16:54:36 +0000
> Jonathan Cameron via <qemu-devel@nongnu.org> wrote:
> 
> > Michael Tsirkin raised that we have recently had churn in the bios-tables-test
> > and perhaps it was worth factoring some parts of DSDT out as SSDT files.
> > This is an attempt to do that for the entries from pxb-pcie and pxb-cxl
> > PCI root bridges.
> > 
> > The main PCI root bridge and related elements are left in DSDT as they
> > are present in many more tests than PXB.  However things brings some
> > complexity as some of the DSDT parts are then dependent on building up
> > information whilst creating the PXB entries.  The ordering constraints
> > of RSDT entries prevent easily generating the new SSDT table first
> > (see patch 3)
> > 
> > This series works around that by separating that build up of information from
> > the build up of the PXB parts of the SSDT.  That allows the tables to be
> > build in the standard order, based on knowledge that the SSDT parts will
> > definitely be built later.
> > 
> > Personally, having tried this, I'm not convinced that the advantages of
> > simplifying updates to the test data justify the complexity increase needed.
> > However I will add that I have a series adding CXL QTG DSM support form Dave
> > Jiang in my tree that will only result in updates to SSDT.cxl after this patch
> > rather than DSDT.cxl reducing chance of a clash with other changes
> > in flight. Hence this is an RFC to find out if people think this is
> > a good direction to go in.
> > 
> > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > https://lore.kernel.org/qemu-devel/20230302055544-mutt-send-email-mst@kernel.
> 
> Michael / all, at first glance at least, is sensible to take forwards?
> 
> Whilst I'm not in a rush on this, I'm carrying a bunch of patches
> for next cycle that are on top of this at the moment, so I'm just wondering
> whether it makes sense reorder things based on what might land first
> / not land at all.
> 
> Thanks,
> 
> Jonathan

Yes, I like this. Igor had some reservations about the split-up. Igor
can you comment please?


> > 
> > 
> > Jonathan Cameron (4):
> >   hw/acpi: Make Aml and / or crs_range_set optional in build_crs
> >   tests/acpi: Allow changes to DSDT.cxl/viot and SSDT.cxl/viot
> >   hw/i386/acpi: Separate PXB related parts of DSDT into an SSDT table.
> >   tests/acpi: Updated DSDT and SSDT due to move of PXB info to SSDT
> > 
> >  hw/acpi/aml-build.c           |  75 +++++-----
> >  hw/i386/acpi-build.c          | 249 ++++++++++++++++++++++------------
> >  hw/pci-host/gpex-acpi.c       |   5 +-
> >  include/hw/acpi/aml-build.h   |   4 +-
> >  tests/data/acpi/q35/DSDT.cxl  | Bin 9673 -> 8474 bytes
> >  tests/data/acpi/q35/DSDT.viot | Bin 9470 -> 8429 bytes
> >  tests/data/acpi/q35/SSDT.cxl  | Bin 0 -> 1235 bytes
> >  tests/data/acpi/q35/SSDT.viot | Bin 0 -> 1077 bytes
> >  8 files changed, 208 insertions(+), 125 deletions(-)
> >  create mode 100644 tests/data/acpi/q35/SSDT.cxl
> >  create mode 100644 tests/data/acpi/q35/SSDT.viot
> > 


