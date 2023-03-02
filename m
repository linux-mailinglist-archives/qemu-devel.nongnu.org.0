Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6192D6A7EAE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:50:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfZL-00056h-Lh; Thu, 02 Mar 2023 04:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pXfZH-00056B-V6
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:49:43 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pXfZF-0008Q5-29
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:49:43 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PS5qD0LH4z6JB8s;
 Thu,  2 Mar 2023 17:47:04 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 2 Mar
 2023 09:49:28 +0000
Date: Thu, 2 Mar 2023 09:49:27 +0000
To: Alison Schofield <alison.schofield@intel.com>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Fan Ni
 <fan.ni@samsung.com>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 "Ira Weiny" <ira.weiny@intel.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v2 0/6] hw/cxl: Poison get, inject, clear
Message-ID: <20230302094927.00005671@huawei.com>
In-Reply-To: <Y//4zFIjBCN/Qlkz@aschofie-mobl2>
References: <20230227170311.20054-1-Jonathan.Cameron@huawei.com>
 <Y//4zFIjBCN/Qlkz@aschofie-mobl2>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 1 Mar 2023 17:15:56 -0800
Alison Schofield <alison.schofield@intel.com> wrote:

> On Mon, Feb 27, 2023 at 05:03:05PM +0000, Jonathan Cameron wrote:
> 
> Hi Jonathan,
> Can you share your repo with this support?  How about your qemu cmdline?
> I'm more of a 'try it out' type of a reviewer for qemu changes.

https://gitlab.com/jic23/qemu/-/tree/cxl-2023-02-28
is latest tree with this on.

A completely non minimal command line I'm using for a single device on that
tree is:
 qemu-system-aarch64 -M virt,nvdimm=on,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max -smp 4 \
 -kernel Image \
 -drive if=none,file=full.qcow2,format=qcow2,id=hd \
 -device pcie-root-port,id=root_port1 -device virtio-blk-pci,drive=hd \
 -netdev type=user,id=mynet,hostfwd=tcp::5555-:22 \
 -qmp tcp:localhost:4445,server=on,wait=off \
 -device virtio-net-pci,netdev=mynet,id=bob \
 -nographic -no-reboot -append 'earlycon root=/dev/vda2 fsck.mode=skip maxcpus=4 tp_printk' \
 -monitor telnet:127.0.0.1:1234,server,nowait -bios QEMU_EFI.fd \
 -object memory-backend-ram,size=4G,id=mem0 \
 -numa node,nodeid=0,cpus=0-3,memdev=mem0 \
 -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/t4_p.raw,size=1G,align=1G \
 -object memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/t4_v.raw,size=1G,align=1G \
 -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/t4_plsa.raw,size=1M,align=1M \
 -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1,hdm_for_passthrough=true \
 -device cxl-rp,port=0,bus=cxl.1,id=cxl_root_port0,chassis=0,slot=2 \
 -device cxl-rp,port=1,bus=cxl.1,id=cxl_root_port1,chassis=0,slot=3 \
 -device cxl-type3,bus=cxl_root_port0,persistent-memdev=cxl-mem1,volatile-memdev=cxl-mem2,id=cxl-mem0,lsa=cxl-lsa1,sn=3 \
 -machine cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=1k,cxl-fmw.0.restrictions=0x6,cxl-fmw.1.targets.0=cxl.1,cxl-fmw.1.size=4G,cxl-fmw.1.interleave-granularity=1k,cxl-fmw.1.restrictions=0xa

Few things in here are to test other new features not posted yet.
1) For multiple HDM decoders need the two root ports ato avoid kernel bug around passthrough
   decoders.
2) The restrictions on cfmws is also new and allows restricting CFMWS to volatile or non volatie.

Other than needing the qmp config line, this poison injection doesn't need anything
specific.

Guessing you might want to use an x86 host as well ;) 
qemu-system-x86_64 -M q35,cxl=on,sata=off,smbus=off -m 4g,maxmem=64G,slots=8 -cpu max -smp 4 \

Drop those bits and it shouldn't make any difference for poison injections.

For injection in QMP 

telnet localhost 4445

and send
{ "execute": "qmp_capabilities" }
first followed by poison injection commands like

{ "execute": "cxl-inject-poison",
    "arguments": {
         "path": "/machine/peripheral/cxl-mem0",
         "start": 1024,
         "length": 64
    }
}

The rest of the testing uses your kernel injection and clearing patches.

Thanks,

Jonathan


> Thanks,
> Alison
> 
> > v2: Thanks to Ira for review and also to Philippe as some of the
> >     changes follow through from comments on precusor series.
> > 
> > - Fixed a bunch of endian issues. Note that QEMU CXL suppport only currently
> >   supports platforms that happen to be little endian so these are more
> >   theoretical than bugs that can be triggered.
> > - Improve handling over mailbox inject poison that overlaps with
> >   qmp injected (which can be bigger).
> > - Tighter checks on alignment.
> > - Add 'Since' entries to qapi docs.
> > - Drop the CXLRetCode move out of this series as it isn't needed for this.
> >   Will appear in next series I post instead (Ira's event series)
> > - Drag down the st24_le_p() patch from Ira's Event series so we can use
> >   it in this series.
> > 
> > Note Alison has stated the kernel series will be post 6.3 material
> > so this one isn't quite as urgent as the patches it is based on.
> > However I think this series in a good state (plus I have lots more queued
> > behind it) hence promoting it from RFC.
> > 
> > Changes since RFC v2: Thanks to Markus for review.
> >  - Improve documentation for QMP interface
> >  - Add better description of baseline series
> >  - Include precursor refactors around ret_code / CXLRetCode as this is now
> >    the first series in suggeste merge order to rely on those.
> >  - Include Ira's cxl_device_get_timestamp() function as it was better than
> >    the equivalent in the RFC.
> > 
> > Based on following series (in order)
> > 1. [PATCH v4 00/10] hw/cxl: CXL emulation cleanups and minor fixes for upstream
> > 2. [PATCH v6 0/8] hw/cxl: RAS error emulation and injection
> > 3. [PATCH v2 0/2] hw/cxl: Passthrough HDM decoder emulation
> > 4. [PATCH v4 0/2] hw/mem: CXL Type-3 Volatile Memory Support
> > 
> > Based on: Message-Id: 20230206172816.8201-1-Jonathan.Cameron@huawei.com
> > Based-on: Message-id: 20230227112751.6101-1-Jonathan.Cameron@huawei.com
> > Based-on: Message-id: 20230227153128.8164-1-Jonathan.Cameron@huawei.com
> > Based-on: Message-id: 20230227163157.6621-1-Jonathan.Cameron@huawei.com
> > 
> > The series supports:
> > 1) Injection of variable length poison regions via QMP (to fake real
> >    memory corruption and ensure we deal with odd overflow corner cases
> >    such as clearing the middle of a large region making the list overflow
> >    as we go from one long entry to two smaller entries.
> > 2) Read of poison list via the CXL mailbox.
> > 3) Injection via the poison injection mailbox command (limited to 64 byte
> >    entries)
> > 4) Clearing of poison injected via either method.
> > 
> > The implementation is meant to be a valid combination of impdef choices
> > based on what the spec allowed. There are a number of places where it could
> > be made more sophisticated that we might consider in future:
> > * Fusing adjacent poison entries if the types match.
> > * Separate injection list and main poison list, to test out limits on
> >   injected poison list being smaller than the main list.
> > * Poison list overflow event (needs event log support in general)
> > * Connecting up to the poison list error record generation (rather complex
> >   and not needed for currently kernel handling testing).
> > 
> > As the kernel code is currently fairly simple, it is likely that the above
> > does not yet matter but who knows what will turn up in future!
> > 
> > Kernel patches:
> >  [PATCH v7 0/6] CXL Poison List Retrieval & Tracing
> >  cover.1676685180.git.alison.schofield@intel.com
> >  [PATCH v2 0/6] cxl: CXL Inject & Clear Poison
> >  cover.1674101475.git.alison.schofield@intel.com
> > 
> > 
> > Ira Weiny (2):
> >   hw/cxl: Introduce cxl_device_get_timestamp() utility function
> >   bswap: Add the ability to store to an unaligned 24 bit field
> > 
> > Jonathan Cameron (4):
> >   hw/cxl: rename mailbox return code type from ret_code to CXLRetCode
> >   hw/cxl: QMP based poison injection support
> >   hw/cxl: Add poison injection via the mailbox.
> >   hw/cxl: Add clear poison mailbox command support.
> > 
> >  hw/cxl/cxl-device-utils.c   |  15 ++
> >  hw/cxl/cxl-mailbox-utils.c  | 285 ++++++++++++++++++++++++++++++------
> >  hw/mem/cxl_type3.c          |  92 ++++++++++++
> >  hw/mem/cxl_type3_stubs.c    |   6 +
> >  include/hw/cxl/cxl_device.h |  23 +++
> >  include/qemu/bswap.h        |  23 +++
> >  qapi/cxl.json               |  18 +++
> >  7 files changed, 420 insertions(+), 42 deletions(-)
> > 
> > -- 
> > 2.37.2
> >   


