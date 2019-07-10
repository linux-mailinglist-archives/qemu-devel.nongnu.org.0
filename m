Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A355628EC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 21:05:12 +0200 (CEST)
Received: from localhost ([::1]:44048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkYwp-00081j-Fe
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 15:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59124)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hkYva-0007ZR-Ex
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 15:03:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hkYvZ-0007co-4L
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 15:03:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34834)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hkYvY-0007Zt-ST
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 15:03:53 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2B7BFF74AF;
 Mon,  8 Jul 2019 19:03:46 +0000 (UTC)
Received: from work-vm (ovpn-117-74.ams2.redhat.com [10.36.117.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C02641001B29;
 Mon,  8 Jul 2019 19:03:44 +0000 (UTC)
Date: Mon, 8 Jul 2019 20:03:42 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Message-ID: <20190708190342.GQ2746@work-vm>
References: <20190705010711.23277-1-marcel.apfelbaum@gmail.com>
 <03CB6DEC-3D25-4C09-9C9C-3A5206D1D1F7@gmail.com>
 <CAMzgYoMzLHEpSwLOu4nZAEK_E50xBsaYUfdXeCeHrq+-kaL=4w@mail.gmail.com>
 <49bb8456-a4b1-5a0e-e34d-cf5977e821ae@gmail.com>
 <20190708160320.GM2746@work-vm>
 <742B9D24-E140-48EF-A729-098F811115D7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <742B9D24-E140-48EF-A729-098F811115D7@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 08 Jul 2019 19:03:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/net: fix vmxnet3 live migration
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
Cc: Sukrit Bhatnagar <skrtbhtngr@gmail.com>,
 Yuval Shaia <yuval.shaia@oracle.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dmitry Fleytman (dmitry.fleytman@gmail.com) wrote:
> 
> 
> > On 8 Jul 2019, at 19:03, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > 
> > * Marcel Apfelbaum (marcel.apfelbaum@gmail.com) wrote:
> >> 
> >> 
> >>> On 7/5/19 2:14 PM, Sukrit Bhatnagar wrote:
> >>>> On Fri, 5 Jul 2019 at 16:29, Dmitry Fleytman <dmitry.fleytman@gmail.com> wrote:
> >>>> 
> >>>>> On 5 Jul 2019, at 4:07, Marcel Apfelbaum <marcel.apfelbaum@gmail.com> wrote:
> >>>>> 
> >>>>> At some point vmxnet3 live migration stopped working and git-bisect
> >>>>> didn't help finding a working version.
> >>>>> The issue is the PCI configuration space is not being migrated
> >>>>> successfully and MSIX remains masked at destination.
> >>>>> 
> >>>>> Remove the migration differentiation between PCI and PCIe since
> >>>>> the logic resides now inside VMSTATE_PCI_DEVICE.
> >>>>> Remove also the VMXNET3_COMPAT_FLAG_DISABLE_PCIE based differentiation
> >>>>> since at 'realize' time is decided if the device is PCI or PCIe,
> >>>>> then the above macro is enough.
> >>>>> 
> >>>>> Use the opportunity to move to the standard VMSTATE_MSIX
> >>>>> instead of the deprecated SaveVMHandlers.
> >>>>> 
> >>>>> Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> >>>> 
> >>>> Reviewed-by: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> >>>> 
> >>> Tested-by: Sukrit Bhatnagar <skrtbhtngr@gmail.com>
> >> 
> >> Thanks for the fast testing and review!
> >> 
> >> David, since the live migration was broken long before this patch,
> >> I don't need  to add any compatibility code, right?
> > 
> > Right, although we should probably bump the version_id field, that way
> > you'll get a nice clean error if you try and migrate from the old<->new.
> > 
> > (It's nice to get rid of the old msix oddity).
> > 
> >> If so, can you merge it using your migration tree?
> > 
> > I could do; or since it's entirely in vmxnet3 Dmitry can take it.
> 
> Dave, please take it to your migration tree.

OK, will do.

Dave

> Thanks, Dmitry.
> 
> > 
> > Dave
> > 
> >> Thanks,
> >> Marcel
> >> 
> >> 
> >>>>> ---
> >>>>> hw/net/vmxnet3.c | 52 ++----------------------------------------------
> >>>>> 1 file changed, 2 insertions(+), 50 deletions(-)
> >>>>> 
> >>>>> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> >>>>> index 10d01d0058..8b17548b02 100644
> >>>>> --- a/hw/net/vmxnet3.c
> >>>>> +++ b/hw/net/vmxnet3.c
> >>>>> @@ -2141,21 +2141,6 @@ vmxnet3_cleanup_msi(VMXNET3State *s)
> >>>>>     msi_uninit(d);
> >>>>> }
> >>>>> 
> >>>>> -static void
> >>>>> -vmxnet3_msix_save(QEMUFile *f, void *opaque)
> >>>>> -{
> >>>>> -    PCIDevice *d = PCI_DEVICE(opaque);
> >>>>> -    msix_save(d, f);
> >>>>> -}
> >>>>> -
> >>>>> -static int
> >>>>> -vmxnet3_msix_load(QEMUFile *f, void *opaque, int version_id)
> >>>>> -{
> >>>>> -    PCIDevice *d = PCI_DEVICE(opaque);
> >>>>> -    msix_load(d, f);
> >>>>> -    return 0;
> >>>>> -}
> >>>>> -
> >>>>> static const MemoryRegionOps b0_ops = {
> >>>>>     .read = vmxnet3_io_bar0_read,
> >>>>>     .write = vmxnet3_io_bar0_write,
> >>>>> @@ -2176,11 +2161,6 @@ static const MemoryRegionOps b1_ops = {
> >>>>>     },
> >>>>> };
> >>>>> 
> >>>>> -static SaveVMHandlers savevm_vmxnet3_msix = {
> >>>>> -    .save_state = vmxnet3_msix_save,
> >>>>> -    .load_state = vmxnet3_msix_load,
> >>>>> -};
> >>>>> -
> >>>>> static uint64_t vmxnet3_device_serial_num(VMXNET3State *s)
> >>>>> {
> >>>>>     uint64_t dsn_payload;
> >>>>> @@ -2203,7 +2183,6 @@ static uint64_t vmxnet3_device_serial_num(VMXNET3State *s)
> >>>>> 
> >>>>> static void vmxnet3_pci_realize(PCIDevice *pci_dev, Error **errp)
> >>>>> {
> >>>>> -    DeviceState *dev = DEVICE(pci_dev);
> >>>>>     VMXNET3State *s = VMXNET3(pci_dev);
> >>>>>     int ret;
> >>>>> 
> >>>>> @@ -2249,8 +2228,6 @@ static void vmxnet3_pci_realize(PCIDevice *pci_dev, Error **errp)
> >>>>>         pcie_dev_ser_num_init(pci_dev, VMXNET3_DSN_OFFSET,
> >>>>>                               vmxnet3_device_serial_num(s));
> >>>>>     }
> >>>>> -
> >>>>> -    register_savevm_live(dev, "vmxnet3-msix", -1, 1, &savevm_vmxnet3_msix, s);
> >>>>> }
> >>>>> 
> >>>>> static void vmxnet3_instance_init(Object *obj)
> >>>>> @@ -2440,29 +2417,6 @@ static const VMStateDescription vmstate_vmxnet3_int_state = {
> >>>>>     }
> >>>>> };
> >>>>> 
> >>>>> -static bool vmxnet3_vmstate_need_pcie_device(void *opaque)
> >>>>> -{
> >>>>> -    VMXNET3State *s = VMXNET3(opaque);
> >>>>> -
> >>>>> -    return !(s->compat_flags & VMXNET3_COMPAT_FLAG_DISABLE_PCIE);
> >>>>> -}
> >>>>> -
> >>>>> -static bool vmxnet3_vmstate_test_pci_device(void *opaque, int version_id)
> >>>>> -{
> >>>>> -    return !vmxnet3_vmstate_need_pcie_device(opaque);
> >>>>> -}
> >>>>> -
> >>>>> -static const VMStateDescription vmstate_vmxnet3_pcie_device = {
> >>>>> -    .name = "vmxnet3/pcie",
> >>>>> -    .version_id = 1,
> >>>>> -    .minimum_version_id = 1,
> >>>>> -    .needed = vmxnet3_vmstate_need_pcie_device,
> >>>>> -    .fields = (VMStateField[]) {
> >>>>> -        VMSTATE_PCI_DEVICE(parent_obj, VMXNET3State),
> >>>>> -        VMSTATE_END_OF_LIST()
> >>>>> -    }
> >>>>> -};
> >>>>> -
> >>>>> static const VMStateDescription vmstate_vmxnet3 = {
> >>>>>     .name = "vmxnet3",
> >>>>>     .version_id = 1,
> >>>>> @@ -2470,9 +2424,8 @@ static const VMStateDescription vmstate_vmxnet3 = {
> >>>>>     .pre_save = vmxnet3_pre_save,
> >>>>>     .post_load = vmxnet3_post_load,
> >>>>>     .fields = (VMStateField[]) {
> >>>>> -            VMSTATE_STRUCT_TEST(parent_obj, VMXNET3State,
> >>>>> -                                vmxnet3_vmstate_test_pci_device, 0,
> >>>>> -                                vmstate_pci_device, PCIDevice),
> >>>>> +            VMSTATE_PCI_DEVICE(parent_obj, VMXNET3State),
> >>>>> +            VMSTATE_MSIX(parent_obj, VMXNET3State),
> >>>>>             VMSTATE_BOOL(rx_packets_compound, VMXNET3State),
> >>>>>             VMSTATE_BOOL(rx_vlan_stripping, VMXNET3State),
> >>>>>             VMSTATE_BOOL(lro_supported, VMXNET3State),
> >>>>> @@ -2508,7 +2461,6 @@ static const VMStateDescription vmstate_vmxnet3 = {
> >>>>>     },
> >>>>>     .subsections = (const VMStateDescription*[]) {
> >>>>>         &vmxstate_vmxnet3_mcast_list,
> >>>>> -        &vmstate_vmxnet3_pcie_device,
> >>>>>         NULL
> >>>>>     }
> >>>>> };
> >>>>> --
> >>>>> 2.17.1
> >>>>> 
> >> 
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

