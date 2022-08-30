Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1935A6DC4
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:49:56 +0200 (CEST)
Received: from localhost ([::1]:47108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT7FD-00079G-1p
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lk@c--e.de>)
 id 1oT7BP-0002ye-QM; Tue, 30 Aug 2022 15:46:00 -0400
Received: from cae.in-ulm.de ([217.10.14.231]:58988)
 by eggs.gnu.org with esmtp (Exim 4.90_1) (envelope-from <lk@c--e.de>)
 id 1oT7BK-0007SU-NV; Tue, 30 Aug 2022 15:45:59 -0400
Received: by cae.in-ulm.de (Postfix, from userid 1000)
 id AF27A140306; Tue, 30 Aug 2022 21:45:37 +0200 (CEST)
Date: Tue, 30 Aug 2022 21:45:37 +0200
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Laszlo Ersek <lersek@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Linuxarm <linuxarm@huawei.com>,
 "chenxiang (M)" <chenxiang66@hisilicon.com>,
 "Ard Biesheuvel (kernel.org address)" <ardb@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] fw_cfg: Don't set callback_opaque NULL in
 fw_cfg_modify_bytes_read()
Message-ID: <Yw5o4U/Vqdb+pp9E@cae.in-ulm.de>
References: <20220825161842.841-1-shameerali.kolothum.thodi@huawei.com>
 <43c62060-7a5d-25cf-91a3-1c391d3a58f9@redhat.com>
 <ab43b53b-546a-4056-0e91-31691f716109@redhat.com>
 <ab49a753129e48bd96cb44d876ddf1cf@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab49a753129e48bd96cb44d876ddf1cf@huawei.com>
Received-SPF: none client-ip=217.10.14.231; envelope-from=lk@c--e.de;
 helo=cae.in-ulm.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi,

Shameer: Thanks for bringing this to my attention.

Some comments inline.

On Tue, Aug 30, 2022 at 06:43:56AM +0000, Shameerali Kolothum Thodi wrote:
> 
> 
> > -----Original Message-----
> > From: Shameerali Kolothum Thodi
> > Sent: 26 August 2022 13:15
> > To: 'Laszlo Ersek' <lersek@redhat.com>; qemu-devel@nongnu.org;
> > qemu-arm@nongnu.org
> > Cc: imammedo@redhat.com; peter.maydell@linaro.org; Linuxarm
> > <linuxarm@huawei.com>; chenxiang (M) <chenxiang66@hisilicon.com>; Ard
> > Biesheuvel (kernel.org address) <ardb@kernel.org>; Gerd Hoffmann
> > <kraxel@redhat.com>
> > Subject: RE: [PATCH] fw_cfg: Don't set callback_opaque NULL in
> > fw_cfg_modify_bytes_read()
> > 
> > 
> > 
> > > -----Original Message-----
> > > From: Laszlo Ersek [mailto:lersek@redhat.com]
> > > Sent: 26 August 2022 13:07
> > > To: Shameerali Kolothum Thodi
> > <shameerali.kolothum.thodi@huawei.com>;
> > > qemu-devel@nongnu.org; qemu-arm@nongnu.org
> > > Cc: imammedo@redhat.com; peter.maydell@linaro.org; Linuxarm
> > > <linuxarm@huawei.com>; chenxiang (M) <chenxiang66@hisilicon.com>;
> > Ard
> > > Biesheuvel (kernel.org address) <ardb@kernel.org>; Gerd Hoffmann
> > > <kraxel@redhat.com>
> > > Subject: Re: [PATCH] fw_cfg: Don't set callback_opaque NULL in
> > > fw_cfg_modify_bytes_read()
> > >
> > > +Ard +Gerd, one pointer at the bottom
> > >
> > > On 08/26/22 13:59, Laszlo Ersek wrote:
> > > > On 08/25/22 18:18, Shameer Kolothum wrote:
> > > >> Hi
> > > >>
> > > >> On arm/virt platform, Chen Xiang reported a Guest crash while
> > > >> attempting the below steps,
> > > >>
> > > >> 1. Launch the Guest with nvdimm=on
> > > >> 2. Hot-add a NVDIMM dev
> > > >> 3. Reboot
> > > >> 4. Guest boots fine.
> > > >> 5. Reboot again.
> > > >> 6. Guest boot fails.
> > > >>
> > > >> QEMU_EFI reports the below error:
> > > >> ProcessCmdAddPointer: invalid pointer value in "etc/acpi/tables"
> > > >> OnRootBridgesConnected: InstallAcpiTables: Protocol Error
> > > >>
> > > >> Debugging shows that on first reboot(after hot-adding NVDIMM),
> > > >> Qemu updates the etc/table-loader len,
> > > >>
> > > >> qemu_ram_resize()
> > > >>   fw_cfg_modify_file()
> > > >>      fw_cfg_modify_bytes_read()
> > > >>
> > > >> And in fw_cfg_modify_bytes_read() we set the "callback_opaque" for
> > > >> the "key" entry to NULL. Because of this, on the second reboot,
> > > >> virt_acpi_build_update() is called with a NULL "build_state" and
> > > >> returns without updating the ACPI tables. This seems to be
> > > >> upsetting the firmware.
> > > >>
> > > >> To fix this, don't change the callback_opaque in
> > > fw_cfg_modify_bytes_read().
> > > >>
> > > >> Reported-by: chenxiang <chenxiang66@hisilicon.com>
> > > >> Signed-off-by: Shameer Kolothum
> > > <shameerali.kolothum.thodi@huawei.com>
> > > >> ---
> > > >> I am still not very convinced this is the root cause of the issue.
> > > >> Though it looks like setting callback_opaque to NULL while updating
> > > >> the file size is wrong, what puzzles me is that on the second reboot
> > > >> we don't have any ACPI table size changes and ideally firmware should
> > > >> see the updated tables from the first reboot itself.
> > > >>
> > > >> Please take a look and let me know.
> > > >>
> > > >> Thanks,
> > > >> Shameer
> > > >>
> > > >> ---
> > > >>  hw/nvram/fw_cfg.c | 1 -
> > > >>  1 file changed, 1 deletion(-)
> > > >>
> > > >> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> > > >> index d605f3f45a..dfe8404c01 100644
> > > >> --- a/hw/nvram/fw_cfg.c
> > > >> +++ b/hw/nvram/fw_cfg.c
> > > >> @@ -728,7 +728,6 @@ static void
> > > *fw_cfg_modify_bytes_read(FWCfgState *s, uint16_t key,
> > > >>      ptr = s->entries[arch][key].data;
> > > >>      s->entries[arch][key].data = data;
> > > >>      s->entries[arch][key].len = len;
> > > >> -    s->entries[arch][key].callback_opaque = NULL;
> > > >>      s->entries[arch][key].allow_write = false;
> > > >>
> > > >>      return ptr;
> > > >>


The code as it stands clears callback_opaque (the data pointer
of the callbacks) while leaving the actual callbacks in place.
I think it is obvious that this cannot be correct.

IMHO the change to allow_write is wrong for similar reasons but
I don't think that this matters in practice.

If this path is hit for the table-loader file the ACPI tables in the
guest will be corrupt.


> > > > I vaguely recall seeing the same issue report years ago (also in
> > > > relation to hot-adding NVDIMM). However, I have no capacity to
> > > > participate in the discussion. Making this remark just for clarity.
> > >
> > > The earlier report I've had in mind was from Shameer as well:
> > >
> > >
> > http://mid.mail-archive.com/5FC3163CFD30C246ABAA99954A238FA83F3F
> > > B328@lhreml524-mbs.china.huawei.com
> > 
> > Right. That was a slightly different issue though. It was basically ACPI table
> > size not
> > getting updated on the first reboot of Guest after we hot-add NVDIMM dev.
> > The error
> > from firmware was different in that case,
> > 
> > ProcessCmdAddChecksum: invalid checksum range in "etc/acpi/tables"
> > OnRootBridgesConnected: InstallAcpiTables: Protocol Error
> > 
> > And it was fixed with this series here,
> > https://patchwork.kernel.org/project/qemu-devel/cover/20200403101827.3
> > 0664-1-shameerali.kolothum.thodi@huawei.com/
> > 
> > The current issue only happens on the second reboot of the Guest as
> > described in
> > the steps above.
> > 
> 
> [+Christian]
> 
> I just found that a similar issue was reported here sometime back on Q35/Windows
> setup,
> https://patchew.org/QEMU/YldFMTbFLUcdFIfa@cae.in-ulm.de/
> 
> But there are no further discussions on that thread.

I convinced myself that this cannot happen upstream as the number of
entries in the table-loader is always small. However, it does happen
for us and the suggested patch fixes the issue for us.

Given that Shameer independantly came to the same conclusion
the patch should by considered for inclusion.

    thanks   Christian



