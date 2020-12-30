Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B802E7C9F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 22:23:45 +0100 (CET)
Received: from localhost ([::1]:42440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuiwa-00084w-A2
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 16:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kuivG-0007WS-I3
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 16:22:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kuivD-0007le-5T
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 16:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609363336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wnuWlLorebI2I2MLX6yAOM0Hv7wXcAVA2THfLByjVVo=;
 b=FGAVnDdSExbh0uvfCpyxzwrdmqYVQ/G7TvPfqXjhXpmbyR5TKLxXH+zX1yVXkK5mR7lGO3
 QqkUghrbvaVVija9z/OS1mAOmB7yIyOowb36y/qyfKYPS3qyColx3hJvD56049D+YxzPZ+
 Lqwmm92qGpQ+0xyWah7F4+xpe4wEu8w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-XiI6HX_IMA268cBG5yocYw-1; Wed, 30 Dec 2020 16:22:15 -0500
X-MC-Unique: XiI6HX_IMA268cBG5yocYw-1
Received: by mail-wm1-f70.google.com with SMTP id h21so2934998wmq.7
 for <qemu-devel@nongnu.org>; Wed, 30 Dec 2020 13:22:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wnuWlLorebI2I2MLX6yAOM0Hv7wXcAVA2THfLByjVVo=;
 b=AxhdfX5p5FI5lloGFGkUtfknlRKDbsj5y53vbh+UZ3eXSE1QHZAT2RMWcc9PUnD1y4
 MIR36cWjBgw9+hG00B+d8Ee3/nUpmZB0wmof/AxWxkQ77faVa6I0SCDzg/cGL4IJMSNh
 1pBJ1zKRlC+QmTzS/apgQt1cLT0N6J5eDA2huNM6F5gkYkXsqjcjFKSlfJVB68x03Zmh
 RBD80qgw972tXTMSnABVMQp561mnnTnB6tV6nKrpzWMGzo504y8Om6ZATY+Ag28Q7V40
 FcbAtS2Rf/y/cb66XYvTgMb8CQU1QQwjjucD2GpyyBqBeqFepo60n1jyAmwOmAxtBeek
 p5QA==
X-Gm-Message-State: AOAM530f13hUDtZvCqXtXzHxlqisE6QnqmHCosrcVeospfnGmjF7BTQ0
 q6o882NXQmaDPd/cJnFiT5hs2ALO2414llxuhBw0Le55klxJfP8mc1d1lc/5zy/kJFL2afemt5e
 X27u5mQ/8GbKLiVU=
X-Received: by 2002:adf:fbd2:: with SMTP id d18mr62588499wrs.222.1609363332088; 
 Wed, 30 Dec 2020 13:22:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRPp+GcXBBNEvvaITxKvD2j/GB8eLjDNJiLQ6ZDkVMLFXVvy/HvdQSKch+aNGqii4aXGC8ug==
X-Received: by 2002:adf:fbd2:: with SMTP id d18mr62588481wrs.222.1609363331832; 
 Wed, 30 Dec 2020 13:22:11 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id b127sm10045904wmc.45.2020.12.30.13.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Dec 2020 13:22:11 -0800 (PST)
Date: Wed, 30 Dec 2020 16:22:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 3/8] acpi/gpex: Inform os to keep firmware resource map
Message-ID: <20201230161942-mutt-send-email-mst@kernel.org>
References: <20201223090836.9075-1-cenjiahui@huawei.com>
 <20201223090836.9075-4-cenjiahui@huawei.com>
 <20201229144142.66583852@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201229144142.66583852@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: xieyingtai@huawei.com, Jiahui Cen <cenjiahui@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ard Biesheuvel <ard.biesheuvel@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 29, 2020 at 02:41:42PM +0100, Igor Mammedov wrote:
> On Wed, 23 Dec 2020 17:08:31 +0800
> Jiahui Cen <cenjiahui@huawei.com> wrote:
> 
> > There may be some differences in pci resource assignment between guest os
> > and firmware.
> > 
> > Eg. A Bridge with Bus [d2]
> >     -+-[0000:d2]---01.0-[d3]----01.0
> > 
> >     where [d2:01.00] is a pcie-pci-bridge with BAR0 (mem, 64-bit, non-pref) [size=256]
> >           [d3:01.00] is a PCI Device with BAR0 (mem, 64-bit, pref) [size=128K]
> >                                           BAR4 (mem, 64-bit, pref) [size=64M]
> > 
> >     In EDK2, the Resource Map would be:
> >         PciBus: Resource Map for Bridge [D2|01|00]
> >         Type = PMem64; Base = 0x8004000000;     Length = 0x4100000;     Alignment = 0x3FFFFFF
> >            Base = 0x8004000000; Length = 0x4000000;     Alignment = 0x3FFFFFF;  Owner = PCI [D3|01|00:20]
> >            Base = 0x8008000000; Length = 0x20000;       Alignment = 0x1FFFF;    Owner = PCI [D3|01|00:10]
> >         Type =  Mem64; Base = 0x8008100000;     Length = 0x100; Alignment = 0xFFF
> >     It would use 0x4100000 to calculate the root bus's PMem64 resource window.
> > 
> >     While in Linux, kernel will use 0x1FFFFFF as the alignment to calculate
> >     the PMem64 size, which would be 0x6000000. So kernel would try to
> >     allocate 0x6000000 from the PMem64 resource window, but since the window
> >     size is 0x4100000 as assigned by EDK2, the allocation would fail.
> > 
> > The diffences could result in resource assignment failure.
> > 
> > Using _DSM #5 method to inform guest os not to ignore the PCI configuration
> > that firmware has done at boot time could handle the differences.
> 
> I'm not sure about this one, 
> OS should able to reconfigure PCI resources according to what and where is plugged
> (and it even more true is hotplug is taken into account)

spec says this:

0: No (The operating system must not ignore the PCI configuration that firmware has done
at boot time. However, the operating system is free to configure the devices in this hierarchy
that have not been configured by the firmware. There may be a reduced level of hot plug
capability support in this hierarchy due to resource constraints. This situation is the same as
the legacy situation where this _DSM is not provided.)
1: Yes (The operating system may ignore the PCI configuration that the firmware has done
at boot time, and reconfigure/rebalance the resources in the hierarchy.)

and

IMPLEMENTATION NOTE
This _DSM function provides backwards compatibility on platforms that can run legacy operating
systems.
Operating systems for two different architectures (e.g., x86 and x64) can be installed on a platform.
The firmware cannot distinguish the operating system in time to change the boot configuration of
devices. Say for instance, an x86 operating system in non-PAE mode is installed on a system. The
x86 operating system cannot access device resource space above 4 GiB. So the firmware is required
to configure devices at boot time using addresses below 4 GiB. On the other hand, if an x64
operating system is installed on this system, it can access device resources above the 4 GiB so it does
not want the firmware to constrain the resource assignment below 4 GiB that the firmware
configures at boot time. It is not possible for the firmware to change this by the time it boots the
operating system. Ignoring the configurations done by firmware at boot time will allow the
operating system to push resource assignment using addresses above 4 GiB for an x64 operating
system while constrain it to addresses below 4 GiB for an x86 operating system.

so fundamentally, saying "1" here just means "you can ignore what
firmware configured if you like".


I have a different question though: our CRS etc is based on what
firmware configured. Is that ok? Or is ACPI expected to somehow
reconfigure itself when OS reconfigures devices?
Think it's ok but could not find documentation either way.


> > 
> > Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> > ---
> >  hw/pci-host/gpex-acpi.c | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> > index 11b3db8f71..c189306599 100644
> > --- a/hw/pci-host/gpex-acpi.c
> > +++ b/hw/pci-host/gpex-acpi.c
> > @@ -112,10 +112,24 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
> >      UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
> >      ifctx = aml_if(aml_equal(aml_arg(0), UUID));
> >      ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(0)));
> > -    uint8_t byte_list[1] = {1};
> > -    buf = aml_buffer(1, byte_list);
> > +    uint8_t byte_list[] = {
> > +                0x1 << 0 /* support for functions other than function 0 */ |
> > +                0x1 << 5 /* support for function 5 */
> > +                };
> > +    buf = aml_buffer(ARRAY_SIZE(byte_list), byte_list);
> >      aml_append(ifctx1, aml_return(buf));
> >      aml_append(ifctx, ifctx1);
> > +
> > +    /* PCI Firmware Specification 3.1
> > +     * 4.6.5. _DSM for Ignoring PCI Boot Configurations
> > +     */
> > +    /* Arg2: Function Index: 5 */
> > +    ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(5)));
> > +    /* 0 - The operating system must not ignore the PCI configuration that
> > +     *     firmware has done at boot time.
> > +     */
> > +    aml_append(ifctx1, aml_return(aml_int(0)));
> > +    aml_append(ifctx, ifctx1);
> >      aml_append(method, ifctx);
> >  
> >      byte_list[0] = 0;


