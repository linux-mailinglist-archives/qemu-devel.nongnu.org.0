Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBF93172DF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:07:17 +0100 (CET)
Received: from localhost ([::1]:37882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xdk-0001PG-1c
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1l9xag-0000Fo-OS
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:04:06 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:43637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1l9xae-0000S4-C5
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:04:06 -0500
Received: by mail-pg1-x52e.google.com with SMTP id n10so2137908pgl.10
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KJsYDsWLZUI3GFwAbKlkAHI4n6RJgRzp40rX1kvPzGY=;
 b=n+roNjoFTbvgnjT6me3HWSLPDmrW/92khVyQxqhSDUTh9A62o2VmkgrLyA2g47WYcN
 LFYZBAeNlq5kFSOpVsVWx2gQuAlt8cdenUFQwHHXsHjE0xOAxT5G09APilYGIWpNujvO
 8FXfejDqyvfJe0IlWKb8CYHw6CIn5QHK9pv4fGLgv7ChzZ5VuRzEQX+OsKUxsHkHBmbg
 pvsBV/preEqZQsw//6r1F709ORuSE5VdJAgYEX1blogCshauvxm62QR9gQgaSEZDy0OL
 vkdPIf5E9iH6TmTaHg49a/vD375pxJwvP8JPtjb0NLbAEdCYU4msoD+zgn9ndUZCiUvj
 ltLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KJsYDsWLZUI3GFwAbKlkAHI4n6RJgRzp40rX1kvPzGY=;
 b=HM2WgW2mTg2d7xLGEION/mccN/ZKPxU59/GCP/Fm5q9D4Arkme/9BvwkJUdvuTHU7+
 OERuQKkTgCB4LEs0VlZRDdvqMyzyi9VVALLPV1M8Bx4DyELjAXFIYqlt+ijr4yOyz4LZ
 OdZY1gCs4pTvgOAYrO9PLn73nApUgX21W+8mokt6hsXIhSuipJwIQMkEmSwOU14ShWnS
 sDntl15TqhntFn0lQ5Xb9cLutjAoCG6nBCJK528ltgZGCt1XVxsMsdQb6VnZf2gVDCwn
 ifRexoeXo00BeoTj42KHLsvgwA7NObvP5fdcN/C4oVfvDLBxM7FhTbtLQIJF6kEkhVTM
 Ealw==
X-Gm-Message-State: AOAM530OT1rTXqI+feaJo6wkblo28dx3L9tdOrDJtKCuqgT2+yInFree
 3+fwC4Gh0N0xIXKt22Ojgao=
X-Google-Smtp-Source: ABdhPJxpQDLQahla5RmmX2cgH5mc8AKpBwd337UNLnrmQI3XBi/PVFxcjvKbJhm2WlUiKZEoLEryNQ==
X-Received: by 2002:a62:528c:0:b029:19e:4a39:d9ea with SMTP id
 g134-20020a62528c0000b029019e4a39d9eamr5053285pfb.20.1612994642463; 
 Wed, 10 Feb 2021 14:04:02 -0800 (PST)
Received: from localhost ([2601:647:4600:11e1:d2fd:ba5d:619c:c25d])
 by smtp.gmail.com with ESMTPSA id t17sm3470411pfc.43.2021.02.10.14.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:04:01 -0800 (PST)
Date: Wed, 10 Feb 2021 14:03:53 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 6/9] hw/i386: declare ACPI mother board resource for
 MMCONFIG region
Message-ID: <20210210220353.GB8034@private.email.ne.jp>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
 <ff52a5969a6666235745d7e067f5fb500a8c70fb.1612821109.git.isaku.yamahata@intel.com>
 <20210209165241.5ba1a953@redhat.com>
 <20210209200258.GB28049@private.email.ne.jp>
 <20210210143731.45566d1e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210143731.45566d1e@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, mst@redhat.com,
 qemu-devel@nongnu.org, Isaku Yamahata <yamahata.qemudev@gmail.com>,
 philmd@redhat.com, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 02:37:31PM +0100,
Igor Mammedov <imammedo@redhat.com> wrote:

> On Tue, 9 Feb 2021 12:02:58 -0800
> Isaku Yamahata <yamahata.qemudev@gmail.com> wrote:
> 
> > On Tue, Feb 09, 2021 at 04:52:41PM +0100,
> > Igor Mammedov <imammedo@redhat.com> wrote:
> > 
> > > On Mon,  8 Feb 2021 13:57:25 -0800
> > > isaku.yamahata@gmail.com wrote:
> > >   
> > > > From: Isaku Yamahata <isaku.yamahata@intel.com>
> > > > 
> > > > Declare PNP0C01 device to reserve MMCONFIG region to conform to the
> > > > spec better and play nice with guest BIOSes/OSes.
> > > > 
> > > > According to PCI Firmware Specification, MMCONFIG region must be
> > > > reserved by declaring a motherboard resource.  
> > > could you point to concrete spec version/chapter where it stated.
> > > (should be part of commit message)  
> > 
> > PCI Firmware specification Revision 3.2
> > 4.1.2 MCFG Table Description
> > table 4-2 NOTE 2
> >   If the operating system does not natively comprehend reserving the MMCFG
> >   region, The MMCFG region must e reserved by firmware. ...
> >   For most systems, the mortheroard resource would appear at the root of
> >   the ACPI namespace (under \_SB)...
> >   The resource can optionally be returned in Int15 E820h or EFIGetMemoryMap
> >   as reserved memory but must always be reported through ACPI as a motherboard
> >   resource
> > 
> > Will include it in next respin.
> > 
> > >   
> > > > It's optional to reserve
> > > > the region in memory map by Int 15 E820h or EFIGetMemoryMap.  
> > >   
> > > > If guest BIOS doesn't reserve the region in memory map without the
> > > > reservation by mother board resource, guest linux abandons to use
> > > > MMCFG.  
> > > can parse this, can you rephrase and avoid double negation, please?  
> > 
> > How about this?
> > Guest Linux checks if the MMCFG region is reserved by bios memory map or
> > ACPI resource.
> 
> > It failed, it falls back to legacy PCI configuraiton access.
> clarify what/how failed, pls.

It should be "If it's not reserved".


> > > > +     * When the method of _CRS is called to determine MMCONFIG region,
> > > > +     * only port io is allowed to access PCI configuration space.
> > > > +     * It means qword access isn't allowed.
> > > > +     *
> > > > +     * Device(DRAC)
> > > > +     * {
> > > > +     *     Name(_HID, EisaId("PNP0C01"))
> > > > +     *     OperationRegion(DRR0, PCI_Config, 0x0000000000000060, 0x8)
> > > > +     *     Field(DRR0, DWordAcc, Lock, Preserve)
> > > > +     *     {
> > > > +     *         PEBL, 4,
> > > > +     *         PEBH, 4
> > > > +     *     }  
> > > 
> > > why are you trying to fetch it dynamically?
> > > what prevents you from getting MMCONFIG address in QEMU when building
> > > ACPI tables and encode _CRS statically at that time?  
> > 
> > My motivation is to prepare for TDX where ACPI tables will be part of
> > measurement. I wanted ACPI tables to remain same irrelevant of chipset
> > configuration which guest can change.
> ACPI tables are supposed to be read from QEMU after firmware configured
> PCI subsystem, including MMCONFIG.
> If configuration is changed after that MCFG table won't be correct anymore.
> Given MCFG is statically generated, I see no reason to fetch the same info
> dynamically from DSDT.

Ok, given that other part of ACPI table generation code,
I'll switch to use MMCONFIG address in qemu.


> PS:
> goal of having fixed ACPI tables is hard to achieve in QEMU,
> it might be possible within single QEMU version for a concrete CLI configuration,
> but any deviation from that may trigger ACPI tables change.
> 
> > Thanks,
> 

Thanks,
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

