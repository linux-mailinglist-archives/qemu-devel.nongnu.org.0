Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B2F6752C1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 11:48:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIovn-0005SB-4i; Fri, 20 Jan 2023 05:47:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pIovj-0005S3-9p
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:47:31 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pIovf-0004qR-Vh
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:47:30 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Nyx0x24CYz6J7CS;
 Fri, 20 Jan 2023 18:43:13 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 10:47:11 +0000
Date: Fri, 20 Jan 2023 10:47:09 +0000
To: Gregory Price <gregory.price@memverge.com>
CC: Jonathan Cameron via <qemu-devel@nongnu.org>, Lukas Wunner
 <lukas@wunner.de>, Michael Tsirkin <mst@redhat.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 Ira Weiny <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Subject: Re: cxl nvdimm Potential probe ordering issues.
Message-ID: <20230120104709.00000572@Huawei.com>
In-Reply-To: <Y8oeYfyqNuSIIxCt@memverge.com>
References: <Y8CNw/fZT5fZJZcK@memverge.com>
 <20230113091213.00002146@Huawei.com>
 <Y8Foj/12QNl0C96o@memverge.com>
 <20230113144026.000001fb@Huawei.com>
 <20230113144511.00001207@Huawei.com>
 <20230113151206.GA20583@wunner.de> <Y8hG4OyJL7l9oD2f@memverge.com>
 <Y8hJKcy1993SFLLJ@memverge.com>
 <20230119124244.000015b3@Huawei.com>
 <20230119150449.000037f2@huawei.com>
 <Y8oeYfyqNuSIIxCt@memverge.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 19 Jan 2023 23:53:53 -0500
Gregory Price <gregory.price@memverge.com> wrote:

> On Thu, Jan 19, 2023 at 03:04:49PM +0000, Jonathan Cameron wrote:
> > Gregory, would you mind checking if
> > cxl_nvb is NULL here...
> > https://elixir.bootlin.com/linux/v6.2-rc4/source/drivers/cxl/pmem.c#L67
> > (printk before it is used should work).
> >=20
> > Might also be worth checking cxl_nvd and cxl_ds
> > but my guess is cxl_nvb is our problem (it is when I deliberate change
> > the load order).
> >=20
> > Jonathan
> >  =20
>=20
> This is exactly the issue.  cxl_nvb is null, the rest appear fine.
>=20
> Also, note, that weirdly the non-volatile bridge shows up when launching
> this in volatile mode, but no stack trace appears.
>=20
> =C2=AF\_(=E3=83=84)_/=C2=AF
>=20
> After spending way too much time tracing through the current cxl driver
> code, i have only really determined that
>=20
> 1) The code is very pmem oriented, and it's unclear to me how the driver
>    as-is differentiates a persistent device from a volatile device. That
> 	 code path still completely escapes me.  The only differentiating code
> 	 i see is in the memdev probe path that creates mem#/pmem and mem#/ram

Absolutely on pmem.  Target for kernel side of things was always pmem
first. Volatile has been on roadmap / todo list for a few kernel cycles
but I haven't seen any code yet.

>=20
> 2) The code successfully manages probe, enable, and mount a REAL device
>    - cxl memdev appears (/sys/bus/cxl/devices/mem0)
> 	 - a dax device appears (/sys/bus/dax/devices/)
> 	   This happens at boot, which I assume must be bios related
> 	 - The memory *does not* auto-online, instead the dax device can be
> 	   onlined as system-ram *manually* via ndctl and friends

Interesting.  Just curious, is the host a CXL 1.1 host or a CXL 2.0 host?

>=20
> 3) The code creates an nvdimm_bridge IFF a CFMW is defined - regardless
>    of the type-3 device configuration (pmem-only or vmem-only)
>=20
>    # CFMW defined
>    [root@fedora ~]# ls /sys/bus/cxl/devices/
>    decoder0.0  decoder2.0  mem0            port1
>    decoder1.0  endpoint2   nvdimm-bridge0  root0
>=20
>    # CFMW not defined
> 	 [root@fedora ~]# ls /sys/bus/cxl/devices/
>    decoder1.0  decoder2.0  endpoint2  mem0  port1  root0

That should be harmless and may be needed to tie everything
through to DAX.


>=20
> 4) As you can see above, multiple decoders are registered.  I'm not sure
>    if that's correct or not, but it does seem odd given there's only one
> 	 cxl type-3 device.  Odd that decoder0.0 shows up when CFMW is there,
> 	 but not when it isn't.
>=20
> 	 Note: All these tests have two root ports:
> 	 -device pxb-cxl,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52 \
>    -device cxl-rp,id=3Drp0,bus=3Dcxl.0,chassis=3D0,port=3D0,slot=3D0 \
>    -device cxl-rp,id=3Drp1,bus=3Dcxl.0,chassis=3D0,port=3D1,slot=3D1 \

IIRC

decoder0.0 represents the fixed routing in the host as defined
by the CFMWS - not an actual programmable decoder.

decoder1.0 is the routing in the host bridge - may be pass through
decoder if there is only one root port.

decoder2.0 is the one is the endpoint itself.

>=20
>=20
> Don't know why I haven't thought of this until now, but is the CFMW code
> reporting something odd about what's behind it?  Is it assuming the
> devices are pmem?

It reports the ability to support pmem or support volatile or support both.
Currently
https://elixir.bootlin.com/qemu/latest/source/hw/acpi/cxl.c#L107
qemu reports that all CFMWS windows support everything except
"Fixed Device Configuration (Bit[4])" which would tell the OS not
to move devices that are already programmed out of this window
and doesn't really make sense for QEMU to ever set.
That is we support all of:
Device Coherent (type 2 and back invalidate flows on type 3, though we
aren't emulating the back invalidate stuff yet on the EP)
Host only coherent. [thinking about it we should probably not
support both this and device coherent as they would be mutually
incompatible on a real host]
Volatile
Persistent

Jonathan



