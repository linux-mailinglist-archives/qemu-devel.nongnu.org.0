Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B092C2FCB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 19:13:15 +0100 (CET)
Received: from localhost ([::1]:58912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khcoU-0007FN-ID
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 13:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1khcng-0006qF-A9
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 13:12:25 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1khcnc-0001PJ-By
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 13:12:23 -0500
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4CgXB758yXz67DF8;
 Wed, 25 Nov 2020 02:10:23 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 24 Nov 2020 19:12:07 +0100
Received: from localhost (10.52.124.203) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 24 Nov
 2020 18:12:06 +0000
Date: Tue, 24 Nov 2020 18:11:50 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] hw/arm/virt enable support for virtio-mem
Message-ID: <20201124181150.0000025f@Huawei.com>
In-Reply-To: <5b1dff01-7e6b-78d2-d55a-20c0617c3076@redhat.com>
References: <20201105174311.566751-1-Jonathan.Cameron@huawei.com>
 <5b1dff01-7e6b-78d2-d55a-20c0617c3076@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.124.203]
X-ClientProxiedBy: lhreml714-chm.china.huawei.com (10.201.108.65) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, linuxarm@huawei.com, qemu-devel@nongnu.org,
 Auger Eric <eric.auger@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Nov 2020 20:47:09 +0100
David Hildenbrand <david@redhat.com> wrote:

+CC Eric based on similar query in other branch of the thread.

> On 05.11.20 18:43, Jonathan Cameron wrote:
> > Basically a cut and paste job from the x86 support with the exception of
> > needing a larger block size as the Memory Block Size (MIN_SECTION_SIZE)
> > on ARM64 in Linux is 1G.
> > 
> > Tested:
> > * In full emulation and with KVM on an arm64 server.
> > * cold and hotplug for the virtio-mem-pci device.
> > * Wide range of memory sizes, added at creation and later.
> > * Fairly basic memory usage of memory added.  Seems to function as normal.
> > * NUMA setup with virtio-mem-pci devices on each node.
> > * Simple migration test.
> > 
> > Related kernel patch just enables the Kconfig item for ARM64 as an
> > alternative to x86 in drivers/virtio/Kconfig
> > 
> > The original patches from David Hildenbrand stated that he thought it should
> > work for ARM64 but it wasn't enabled in the kernel [1]
> > It appears he was correct and everything 'just works'.
> > 
> > The build system related stuff is intended to ensure virtio-mem support is
> > not built for arm32 (build will fail due no defined block size).
> > If there is a more elegant way to do this, please point me in the right
> > direction.  
> 
> You might be aware of https://virtio-mem.gitlab.io/developer-guide.html 
> and the "issue" with 64k base pages - 512MB granularity. Similar as the 
> question from Auger, have you tried running arm64 with differing page 
> sizes in host/guest?
> 

Hi David,

> With recent kernels, you can use "memhp_default_state=online_movable" on 
> the kernel cmdline to make memory unplug more likely to succeed - 
> especially with 64k base pages. You just have to be sure to not hotplug 
> "too much memory" to a VM.

Thanks for the pointer - that definitely simplifies testing.  Was getting a bit
tedious with out that.

As ever other stuff got in the way, so I only just got back to looking at this.

I've not done a particularly comprehensive set of tests yet, but things seem
to 'work' with mixed page sizes.

With 64K pages in general, you run into a problem with the device block_size being
smaller than the subblock_size.  I've just added a check for that into the
virtio-mem kernel driver and have it fail to probe if that happens.  I don't
think such a setup makes any sense anyway so no loss there.  Should it make sense
to drop that restriction in the future we can deal with that then without breaking
backwards compatibility.

So the question is whether it makes sense to bother with virtio-mem support
at all on ARM64 with 64k pages given currently the minimum workable block_size
is 512MiB?  I guess there is an argument of virtio-mem being a possibly more
convenient interface than full memory HP.  Curious to hear what people think on
this?

4K guest on 64K host seems fine and no such limit is needed - though there
may be performance issues doing that.

64k guest on 4k host with 512MiB block size seems fine.

If there are any places anyone thinks need particular poking I'd appreciate a hint :)

Jonathan



> 
> 
> I had my prototype living at
> 
> git@github.com:davidhildenbrand/qemu.git / virtio-mem-arm64
> 
> which looks very similar to your patch. That is good :)
> 
> [...]
> 
> >   static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
> >                                           DeviceState *dev, Error **errp)
> >   {
> > @@ -2336,6 +2389,9 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
> >       if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> >           virt_memory_plug(hotplug_dev, dev, errp);
> >       }
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> > +        virt_virtio_md_pci_plug(hotplug_dev, dev, errp);
> > +    }  
> 
> These better all be "else if".
> 
> >       if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> >           PCIDevice *pdev = PCI_DEVICE(dev);
> >   
> > @@ -2363,6 +2419,11 @@ static void virt_dimm_unplug_request(HotplugHandler *hotplug_dev,
> >           goto out;
> >       }
> >   
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> > +        error_setg(&local_err,
> > +                   "virtio-mem based memory devices cannot be unplugged.");
> > +        goto out;
> > +    }  
> 
> This should go into virt_machine_device_unplug_request_cb() instead, no?
> [...]
> 
> 


