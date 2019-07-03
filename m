Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5685DA26
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 03:03:16 +0200 (CEST)
Received: from localhost ([::1]:58478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiTg3-0008QD-Hw
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 21:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56299)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hiTcH-0007dB-BL
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 20:59:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hiTcC-0000hF-Q4
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 20:59:21 -0400
Received: from mga07.intel.com ([134.134.136.100]:45832)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hiTc4-0000X3-O7
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 20:59:11 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jul 2019 17:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,445,1557212400"; d="scan'208";a="154601419"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga007.jf.intel.com with ESMTP; 02 Jul 2019 17:58:58 -0700
Date: Wed, 3 Jul 2019 08:58:37 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Pankaj Gupta <pagupta@redhat.com>
Message-ID: <20190703005836.GA18621@richard>
References: <20190619094907.10131-1-pagupta@redhat.com>
 <20190702084934.GA25987@richard>
 <1872807933.38582516.1562062064161.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1872807933.38582516.1562062064161.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
Subject: Re: [Qemu-devel] [PATCH v2 0/7] Qemu virtio pmem device
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: kwolf@redhat.com, aarcange@redhat.com,
 xiaoguangrong eric <xiaoguangrong.eric@gmail.com>, mst@redhat.com,
 cohuck@redhat.com, david@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com, armbru@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>, stefanha@redhat.com,
 pbonzini@redhat.com, lcapitulino@redhat.com, imammedo@redhat.com,
 riel@surriel.com, nilal@redhat.com, dan j williams <dan.j.williams@intel.com>,
 dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 02, 2019 at 06:07:44AM -0400, Pankaj Gupta wrote:
>
>> 
>> On Wed, Jun 19, 2019 at 03:19:00PM +0530, Pankaj Gupta wrote:
>> > This patch series has implementation for "virtio pmem"
>> > device. "virtio pmem" is persistent memory(nvdimm) device in
>> > guest which allows to bypass the guest page cache. This
>> > also implements a VIRTIO based asynchronous flush mechanism.
>> > Details of project idea for 'virtio pmem' flushing interface
>> > is shared [2] & [3].
>> >
>> > Sharing Qemu device emulation in this patchset. Tested with
>> > guest kernel driver [1]. This series is based on David's
>> > memory device refactoring [5] work with modified version of
>> > my initial virtio pmem [4] series.
>> >
>> > Usage:
>> > ./qemu -name test -machine pc -m 8G,slots=240,maxmem=20G
>> > -object memory-backend-file,id=mem1,share,mem-path=test.img,
>> >  size=4G,share
>> > -device virtio-pmem-pci,memdev=mem1,id=nv1
>> >
>> 
>> Hi, Pankaj
>
>Hi Wei,
>
>> 
>> I tried this series with v14 kernel driver, while getting some error on using
>> this. Not sure this is my error configuration.
>> 
>> The qemu command line is:
>> 
>>     -object
>>     memory-backend-file,id=mem1,share=on,mem-path=/dev/dax0.0,size=1G,align=2M
>>     -device virtio-pmem-pci,memdev=mem1,id=nv1
>
>Are you using host backing on real NVDIMM? Currently, we only support backing image 
>file on regular SSD. We have plans to support backing file on real NVDIMM device
>as well but this is part of future work.
>
>Can you please try by allocating a raw image file on regular SSD. It is working fine
>for me.
>

I created a file with 2G on my disk.

#ll -h 2G-file
-rw-r--r-- 1 richard richard 2.0G 6月  26 09:26 2G-file

The command line is changed to:

    -object memory-backend-file,id=mem1,share,mem-path=/home/richard/guest/2G-file,size=2G 
    -device virtio-pmem-pci,memdev=mem1,id=nv1

The behavior in guest is the same.

I took a look into the directory /sys/bus/nd/device. These files are listed.
Compared with normal system, one device file is missed.

btt0.0  dax0.0  namespace0.0  ndbus0  pfn0.0  region0

But the sysfs shows pmem0 block device is created.

/sys/devices/pci0000:00/0000:00:04.0/virtio0/ndbus0/region0/namespace0.0/block/pmem0

Then I took a look into the pci device:

# lspci -vs 00:04.0
00:04.0 Unclassified device [00ff]: Red Hat, Inc. Device 1013
	Subsystem: Red Hat, Inc. Device 001b
	Physical Slot: 4
	Flags: bus master, fast devsel, latency 0, IRQ 11
	I/O ports at c040 [size=64]
	Memory at fe000000 (64-bit, prefetchable) [size=16K]
	Capabilities: [84] Vendor Specific Information: VirtIO: <unknown>
	Capabilities: [70] Vendor Specific Information: VirtIO: Notify
	Capabilities: [60] Vendor Specific Information: VirtIO: DeviceCfg
	Capabilities: [50] Vendor Specific Information: VirtIO: ISR
	Capabilities: [40] Vendor Specific Information: VirtIO: CommonCfg
	Kernel driver in use: virtio-pci

This looks good.

>> 
>> The guest boots up and I can see /dev/pmem0 device. But when I want to
>> partition this device, I got the error:
>> 
>>     # parted /dev/pmem0 mklabel gpt
>>     Warning: Error fsyncing/closing /dev/pmem0: Input/output error
>> 
>> Also I see an error when running "ndctl list":
>> 
>>     libndctl: __sysfs_device_parse: ndctl0: add_dev() failed
>
>Will look at this if it is related.

This log still there.

>
>Thanks,
>Pankaj
>> 
>> Would you mind letting me know which part I am wrong?
>> 
>> > (qemu) info memory-devices
>> >  Memory device [virtio-pmem]: "nv1"
>> >  memaddr: 0x240000000
>> >  size: 4294967296
>> >  memdev: /objects/mem1
>> >
>> > Implementation is divided into two parts:
>> > New virtio pmem guest driver and qemu code changes for new
>> > virtio pmem paravirtualized device. In this series we are
>> > sharing Qemu device emulation.
>> >
>> >1. Guest virtio-pmem kernel driver
>> >---------------------------------
>> >   - Reads persistent memory range from paravirt device and
>> >     registers with 'nvdimm_bus'.
>> >   - 'nvdimm/pmem' driver uses this information to allocate
>> >     persistent memory region and setup filesystem operations
>> >     to the allocated memory.
>> >   - virtio pmem driver implements asynchronous flushing
>> >     interface to flush from guest to host.
>> >
>> >2. Qemu virtio-pmem device
>> >---------------------------------
>> >   - Creates virtio pmem device and exposes a memory range to
>> >     KVM guest.
>> >   - At host side this is file backed memory which acts as
>> >     persistent memory.
>> >   - Qemu side flush uses aio thread pool API's and virtio
>> >     for asynchronous guest multi request handling.
>> >
>> > Virtio-pmem security implications and suggested countermeasures:
>> > ---------------------------------------------------------------
>> >
>> > In previous posting of kernel driver, there was discussion [7]
>> > on possible implications of page cache side channel attacks with
>> > virtio pmem. After thorough analysis of details of known side
>> > channel attacks, below are the suggestions:
>> >
>> > - Depends entirely on how host backing image file is mapped
>> >   into guest address space.
>> >
>> > - virtio-pmem device emulation, by default shared mapping is used
>> >   to map host backing file. It is recommended to use separate
>> >   backing file at host side for every guest. This will prevent
>> >   any possibility of executing common code from multiple guests
>> >   and any chance of inferring guest local data based based on
>> >   execution time.
>> >
>> > - If backing file is required to be shared among multiple guests
>> >   it is recommended to don't support host page cache eviction
>> >   commands from the guest driver. This will avoid any possibility
>> >   of inferring guest local data or host data from another guest.
>> >
>> > - Proposed device specification [6] for virtio-pmem device with
>> >   details of possible security implications and suggested
>> >   countermeasures for device emulation.
>> >
>> >Changes from PATCH v1:
>> > - Change proposed version from qemu 4.0 to 4.1 - Eric
>> > - Remove virtio queue_add from unrealize function - Cornelia
>> >
>> >[1] https://lkml.org/lkml/2019/6/12/624
>> >[2] https://www.spinics.net/lists/kvm/msg149761.html
>> >[3] https://www.spinics.net/lists/kvm/msg153095.html
>> >[4] https://marc.info/?l=linux-kernel&m=153572228719237&w=2
>> >[5] https://marc.info/?l=qemu-devel&m=153555721901824&w=2
>> >[6] https://lists.oasis-open.org/archives/virtio-dev/201903/msg00083.html
>> >[7] https://lkml.org/lkml/2019/1/9/1191
>> >
>> > Pankaj Gupta (3):
>> >  virtio-pmem: add virtio device
>> >  virtio-pmem: sync linux headers
>> >  virtio-pci: proxy for virtio-pmem
>> >
>> > David Hildenbrand (4):
>> >  virtio-pci: Allow to specify additional interfaces for the base type
>> >  hmp: Handle virtio-pmem when printing memory device infos
>> >  numa: Handle virtio-pmem in NUMA stats
>> >  pc: Support for virtio-pmem-pci
>> >
>> > hmp.c                                        |   27 ++-
>> > hw/i386/Kconfig                              |    1
>> > hw/i386/pc.c                                 |   72 ++++++++++
>> > hw/virtio/Kconfig                            |   10 +
>> > hw/virtio/Makefile.objs                      |    2
>> > hw/virtio/virtio-pci.c                       |    1
>> > hw/virtio/virtio-pci.h                       |    1
>> > hw/virtio/virtio-pmem-pci.c                  |  131 ++++++++++++++++++
>> > hw/virtio/virtio-pmem-pci.h                  |   34 ++++
>> > hw/virtio/virtio-pmem.c                      |  189
>> > +++++++++++++++++++++++++++
>> > include/hw/pci/pci.h                         |    1
>> > include/hw/virtio/virtio-pmem.h              |   49 +++++++
>> > include/standard-headers/linux/virtio_ids.h  |    1
>> > include/standard-headers/linux/virtio_pmem.h |   35 +++++
>> > numa.c                                       |   24 +--
>> > qapi/misc.json                               |   28 +++-
>> > 16 files changed, 580 insertions(+), 26 deletions(-)
>> >----
>> 
>> --
>> Wei Yang
>> Help you, Help me
>> 
>> 

-- 
Wei Yang
Help you, Help me

