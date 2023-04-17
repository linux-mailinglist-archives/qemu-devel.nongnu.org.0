Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2526E467F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 13:31:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poN3Q-0004OO-A5; Mon, 17 Apr 2023 07:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1poN3O-0004OF-NZ
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 07:29:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1poN3M-0006ad-8i
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 07:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681730985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fXJra3OVAnnqVGIDFNE2AjWwjcBaXmPxoR/ocOZAT9Q=;
 b=DaLnJzyd4loQHmFb53w189BEd5OhXMC55Fts4pObvNcGXvklWePE/nT05rR+rjqU2kaHnw
 /miQUugng8h19xcn/y3FiyXZ6yHwqoVQplyPrCiIuCFTLP0JOsHvQFpbSGPWCWKKb/mkV3
 rvwO+W+9TUgaCe4apm+jccmAMMyin7w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-6SDy1QBnNn--hWMNxi47xQ-1; Mon, 17 Apr 2023 07:29:44 -0400
X-MC-Unique: 6SDy1QBnNn--hWMNxi47xQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 b60-20020a509f42000000b00504eca73d05so8637554edf.18
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 04:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681730983; x=1684322983;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXJra3OVAnnqVGIDFNE2AjWwjcBaXmPxoR/ocOZAT9Q=;
 b=ADw9I3uXHUEcfJMOq8Al3YCwsp8W/qKtrByqqKNEdpB36eMj7Tv7uiy82/NJYDTCW5
 mmaf/ADJcyHCgi1YPJRr0nTqieV/tO93hXrtR/KP4oYMuJO/kPjbwVNRIUyVhLD9ey8H
 5GEKTPLSunHfvroIxIOCCT3+U3gb8bR329/DgYy0oO1qTRdM0ck3brFvKc24hqDFa4SY
 92nmGi5TUwvmlLhGhldCGHklNFujwcVjCEwvfBcs37q5zL/fQyUvRZ0F7PiuraHhLrCW
 7JkDEKKsfqeKBIr1KZHH55L/M6FVLN+uZmV3D/0ZEveP7vh/nH/8ZO7tmbZ3dTfOuKuy
 9xpg==
X-Gm-Message-State: AAQBX9eXn72N0rnChLUe3nwfJosgIwVhauX51MenYlEoWNALRFpSCf//
 mCDGxKiTD7GAKe7WsKHG1aGgbOPlaRER0IBwjCCDGYHTmOxQcXh51xwCmqvlSLp2XJ1adYKjcJ9
 zrBTgAmdK7QbeHEY=
X-Received: by 2002:a17:907:7e9d:b0:94f:a309:67b7 with SMTP id
 qb29-20020a1709077e9d00b0094fa30967b7mr1022744ejc.56.1681730983411; 
 Mon, 17 Apr 2023 04:29:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350aYnK0bIiB5CUxIRjVpr1p/QItabbGG0Ww/Njk7blCkm7jm/Ia00hXvHu2VcMFvh1AH5rQD6A==
X-Received: by 2002:a17:907:7e9d:b0:94f:a309:67b7 with SMTP id
 qb29-20020a1709077e9d00b0094fa30967b7mr1022727ejc.56.1681730983071; 
 Mon, 17 Apr 2023 04:29:43 -0700 (PDT)
Received: from redhat.com ([2.52.136.129]) by smtp.gmail.com with ESMTPSA id
 tg10-20020a1709078dca00b0094ef2003581sm4535559ejc.153.2023.04.17.04.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 04:29:42 -0700 (PDT)
Date: Mon, 17 Apr 2023 07:29:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PULL 70/73] hw/pxb-cxl: Support passthrough HDM Decoders unless
 overridden
Message-ID: <20230417072927-mutt-send-email-mst@kernel.org>
References: <cover.1678237635.git.mst@redhat.com>
 <154070eaf6597c47f64c3ea917bcba62427ae61f.1678237635.git.mst@redhat.com>
 <CAFEAcA-+de+eeLCE4YsAw1O-Qyd_4W1Ra05mGDsU_-3a6d92qw@mail.gmail.com>
 <d98c9298-dd1c-e5d0-bc8c-4a9b6e61db36@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d98c9298-dd1c-e5d0-bc8c-4a9b6e61db36@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Apr 17, 2023 at 01:22:51PM +0200, Thomas Huth wrote:
> On 11/04/2023 12.26, Peter Maydell wrote:
> > On Wed, 8 Mar 2023 at 01:14, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > 
> > > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > 
> > > The CXL r3.0 specification allows for there to be no HDM decoders on CXL
> > > Host Bridges if they have only a single root port. Instead, all accesses
> > > directed to the host bridge (as specified in CXL Fixed Memory Windows)
> > > are assumed to be routed to the single root port.
> > 
> > Hi; in issue https://gitlab.com/qemu-project/qemu/-/issues/1586
> > it's been pointed out that this commit causes an assertion
> > failure during 'make check' if you configure with
> > --enable-qom-cast-debug. You can repro by doing that and running:
> > 
> >   qemu-system-i386 -display none -machine q35,cxl=on -device pxb-cxl,bus=pcie.0
> > 
> > Here's a backtrace:
> > 
> > Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
> > __pthread_kill_implementation (no_tid=0, signo=6,
> > threadid=140737217810816) at ./nptl/pthread_kill.c:44
> > 44      ./nptl/pthread_kill.c: No such file or directory.
> > (gdb) bt
> > #0  __pthread_kill_implementation (no_tid=0, signo=6,
> > threadid=140737217810816) at ./nptl/pthread_kill.c:44
> > #1  __pthread_kill_internal (signo=6, threadid=140737217810816) at
> > ./nptl/pthread_kill.c:78
> > #2  __GI___pthread_kill (threadid=140737217810816,
> > signo=signo@entry=6) at ./nptl/pthread_kill.c:89
> > #3  0x00007ffff4b1c476 in __GI_raise (sig=sig@entry=6) at
> > ../sysdeps/posix/raise.c:26
> > #4  0x00007ffff4b027f3 in __GI_abort () at ./stdlib/abort.c:79
> > #5  0x0000555555cecfab in object_dynamic_cast_assert
> >      (obj=obj@entry=0x555557a70b60, typename=0x555555f80406 "pxb",
> > file=0x555555f80357 "../../hw/pci-bridge/pci_expander_bridge.c",
> > line=line@entry=55, func=0x555555f8040a "PXB_DEV") at
> > ../../qom/object.c:890
> > #6  0x00005555559c7bbd in PXB_DEV (obj=0x555557a70b60) at
> > ../../hw/pci-bridge/pci_expander_bridge.c:54
> > #7  pxb_cxl_dev_reset (dev=0x555557a70b60) at
> > ../../hw/pci-bridge/pci_expander_bridge.c:314
> > #8  0x00005555559bd624 in pci_qdev_realize (qdev=0x555557a70b60,
> > errp=0x7fffffffdd28) at ../../hw/pci/pci.c:2098
> > #9  0x0000555555ce8ada in device_set_realized (obj=<optimised out>,
> > value=true, errp=0x7fffffffdea8) at ../../hw/core/qdev.c:510
> > #10 0x0000555555cf0219 in property_set_bool
> >       (obj=obj@entry=0x555557a70b60, v=v@entry=0x555557a727b0,
> > name=name@entry=0x55555601db04 "realized", opaque=0x55555687b780,
> > errp=errp@entry=0x7fffffffdea8) at ../../qom/object.c:2285
> > #11 0x0000555555cee4e5 in object_property_set
> >       (obj=obj@entry=0x555557a70b60, name=name@entry=0x55555601db04
> > "realized", v=0x555557a727b0, errp=errp@entry=0x7fffffffdea8) at
> > ../../qom/object.c:1420
> > #12 0x0000555555cf23cd in object_property_set_qobject
> >      (obj=obj@entry=0x555557a70b60, name=name@entry=0x55555601db04
> > "realized", value=<optimised out>, errp=errp@entry=0x7fffffffdea8) at
> > ../../qom/qom-qobject.c:28
> > #13 0x0000555555cee93b in object_property_set_bool
> > (obj=0x555557a70b60, name=0x55555601db04 "realized", value=<optimised
> > out>, errp=0x7fffffffdea8)
> >      at ../../qom/object.c:1489
> > #14 0x0000555555a6ae42 in qdev_device_add_from_qdict
> > (opts=0x555557a6fb40, from_json=false, errp=0x7fffffffdea8,
> > errp@entry=0x555556765830 <error_fatal>)
> >      at ../../softmmu/qdev-monitor.c:714
> > #15 0x0000555555a6b202 in qdev_device_add
> > (opts=opts@entry=0x5555568776f0, errp=errp@entry=0x555556765830
> > <error_fatal>) at ../../softmmu/qdev-monitor.c:733
> > #16 0x0000555555a7367f in device_init_func (opaque=opaque@entry=0x0,
> > opts=0x3cd16a, opts@entry=0x5555568776f0, errp=0x6,
> > errp@entry=0x555556765830 <error_fatal>)
> >      at ../../softmmu/vl.c:1140
> > #17 0x0000555555e78331 in qemu_opts_foreach
> >      (list=<optimised out>, func=0x555555a73670 <device_init_func>,
> > opaque=opaque@entry=0x0, errp=0x555556765830 <error_fatal>) at
> > ../../util/qemu-option.c:1135
> > #18 0x0000555555a6dd61 in qemu_create_cli_devices () at ../../softmmu/vl.c:2542
> > #19 qmp_x_exit_preconfig (errp=<optimised out>) at ../../softmmu/vl.c:2610
> > #20 0x0000555555a7177b in qemu_init (argc=<optimised out>,
> > argv=<optimised out>) at ../../softmmu/vl.c:3612
> > #21 0x000055555587b656 in main (argc=3985770, argv=0x3cd16a) at
> > ../../softmmu/main.c:47
> > 
> > The problem is here:
> > 
> > > -static void pxb_dev_reset(DeviceState *dev)
> > > +static void pxb_cxl_dev_reset(DeviceState *dev)
> > 
> > This function is called from  pxb_cxl_dev_realize(),
> > which is the realize function for TYPE_PXB_CXL_DEVICE.
> > That type's parent is TYPE_PCI_DEVICE.
> > 
> > >   {
> > >       CXLHost *cxl = PXB_CXL_DEV(dev)->cxl.cxl_host_bridge;
> > >       CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
> > > +    PCIHostState *hb = PCI_HOST_BRIDGE(cxl);
> > >       uint32_t *reg_state = cxl_cstate->crb.cache_mem_registers;
> > >       uint32_t *write_msk = cxl_cstate->crb.cache_mem_regs_write_mask;
> > > +    int dsp_count = 0;
> > > 
> > >       cxl_component_register_init_common(reg_state, write_msk, CXL2_ROOT_PORT);
> > > -    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 8);
> > > +    /*
> > > +     * The CXL specification allows for host bridges with no HDM decoders
> > > +     * if they only have a single root port.
> > > +     */
> > > +    if (!PXB_DEV(dev)->hdm_for_passthrough) {
> > 
> > However, here we try to cast the device pointer to PXB_DEV.
> > That is not permitted because dev is not of type TYPE_PXB_DEVICE
> > (either directly or as a parent class). So if you have the QOM
> > debugging enabled then the attempt to cast causes an assertion
> > failure.
> > 
> > > +        dsp_count = pcie_count_ds_ports(hb->bus);
> > > +    }
> > > +    /* Initial reset will have 0 dsp so wait until > 0 */
> > > +    if (dsp_count == 1) {
> > > +        cxl->passthrough = true;
> > > +        /* Set Capability ID in header to NONE */
> > > +        ARRAY_FIELD_DP32(reg_state, CXL_HDM_CAPABILITY_HEADER, ID, 0);
> > > +    } else {
> > > +        ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT,
> > > +                         8);
> > > +    }
> > >   }
> > 
> > What was the intention here with the type hierarchy?
> > Should TYPE_PXB_CXL_DEVICE be a subclass of TYPE_PXB_DEVICE,
> > or should the cxl-related functions not be trying to treat
> > it as a PXB device ?
> 
> Maybe we should simply revert the commit for the time being (once the 8.1
> cycle begins), 'til this has properly been solved, so we can enable
> qom-debug by default again?
> 
>  Thomas


Can you post a revert?

-- 
MST


