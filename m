Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78842788D
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 11:44:00 +0200 (CEST)
Received: from localhost ([::1]:56124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZ8ta-0004l0-N4
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 05:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1916945fef=david.dai@montage-tech.com>)
 id 1mZ8s4-00044o-UB
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 05:42:24 -0400
Received: from usmail.montage-tech.com ([12.176.92.53]:63573)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=1916945fef=david.dai@montage-tech.com>)
 id 1mZ8s2-0000vv-Li
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 05:42:24 -0400
X-MDAV-Result: clean
X-MDAV-Processed: usmail.montage-tech.com, Sat, 09 Oct 2021 02:42:19 -0700
Received: from shmail.montage-tech.com by usmail.montage-tech.com with ESMTP
 id md5001005832862.msg; Sat, 09 Oct 2021 02:42:18 -0700
X-Spam-Processed: usmail.montage-tech.com, Sat, 09 Oct 2021 02:42:18 -0700
 (not processed: message from trusted or authenticated source)
X-MDArrival-Date: Sat, 09 Oct 2021 02:42:18 -0700
X-Return-Path: prvs=1916945fef=david.dai@montage-tech.com
X-Envelope-From: david.dai@montage-tech.com
X-MDaemon-Deliver-To: qemu-devel@nongnu.org
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=montage-tech.com;
 s=MDaemon; t=1633772509; x=1634377309;
 i=david.dai@montage-tech.com; q=dns/txt; h=Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To; bh=ntFKL1+bOXB1I/8XZV58JzyU00bd
 pN4pJx3IP4rNGtU=; b=S+w3wtMdzNmrNnUBtgYBvVq1UdR0CEFjN9oCWBTDEOZG
 aRgp0F9I8A5qhAL2jekXGVNmZn9jKJNeeUzQssqg8mel4MgsqC1VbtlOUlIAe4wj
 nSAEDfGlRAVqXxCjnmim1MUYQ5rY46xlmt52nhkwuLqISVr+q27jlA8TN4c3maY=
X-MDAV-Result: clean
X-MDAV-Processed: shmail.montage-tech.com, Sat, 09 Oct 2021 17:41:49 +0800
Received: from tianmu-host-sw-01 by shmail.montage-tech.com with ESMTPA id
 pp5001017616619.msg; Sat, 09 Oct 2021 17:41:48 +0800
X-Spam-Processed: shmail.montage-tech.com, Sat, 09 Oct 2021 17:41:48 +0800
 (not processed: message from trusted or authenticated source)
Date: Sat, 9 Oct 2021 17:42:33 +0800
From: "david.dai" <david.dai@montage-tech.com>
To: "David Hildenbrand (david@redhat.com)" <david@redhat.com>
Subject: Re: [PATCH] hw/misc: Add a virtual pci device to dynamically attach
 memory to QEMU
Message-ID: <20211009094233.GA13867@tianmu-host-sw-01>
References: <20210926021614.76933-1-david.dai@montage-tech.com>
 <YVGAWh7e96f8yed0@stefanha-x1.localdomain>
 <38a0312e-3b00-ac41-3cb0-ab5592b06dc1@redhat.com>
 <20210927122848.GB144947@tianmu-host-sw-01>
 <c87c301e-62af-ab5a-2b9c-fa2ef28898f1@redhat.com>
 <20210930094007.GA239054@tianmu-host-sw-01>
 <5eba1406-4012-481a-b7ed-0090654668d2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5eba1406-4012-481a-b7ed-0090654668d2@redhat.com>
X-MDCFSigsAdded: montage-tech.com
Received-SPF: pass client-ip=12.176.92.53;
 envelope-from=prvs=1916945fef=david.dai@montage-tech.com;
 helo=usmail.montage-tech.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, eajames@linux.ibm.com,
 qemu-devel@nongnu.org, changguo.du@montage-tech.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 12:33:30PM +0200, David Hildenbrand (david@redhat.com) wrote:
> 
> 
> On 30.09.21 11:40, david.dai wrote:
> > On Wed, Sep 29, 2021 at 11:30:53AM +0200, David Hildenbrand (david@redhat.com) wrote:
> > > 
> > > On 27.09.21 14:28, david.dai wrote:
> > > > On Mon, Sep 27, 2021 at 11:07:43AM +0200, David Hildenbrand (david@redhat.com) wrote:
> > > > > 
> > > > > CAUTION: This email originated from outside of the organization. Do not
> > > > > click links or open attachments unless you recognize the sender and know the
> > > > > content is safe.
> > > > > 
> > > > > 
> > > > > On 27.09.21 10:27, Stefan Hajnoczi wrote:
> > > > > > On Sun, Sep 26, 2021 at 10:16:14AM +0800, David Dai wrote:
> > > > > > > Add a virtual pci to QEMU, the pci device is used to dynamically attach memory
> > > > > > > to VM, so driver in guest can apply host memory in fly without virtualization
> > > > > > > management software's help, such as libvirt/manager. The attached memory is
> > > > > 
> > > > > We do have virtio-mem to dynamically attach memory to a VM. It could be
> > > > > extended by a mechanism for the VM to request more/less memory, that's
> > > > > already a planned feature. But yeah, virito-mem memory is exposed as
> > > > > ordinary system RAM, not only via a BAR to mostly be managed by user space
> > > > > completely.
> > > 
> > > There is a virtio-pmem spec proposal to expose the memory region via a PCI
> > > BAR. We could do something similar for virtio-mem, however, we would have to
> > > wire that new model up differently in QEMU (it's no longer a "memory device"
> > > like a DIMM then).
> > > 
> > > > > 
> > > > 
> > > > I wish virtio-mem can solve our problem, but it is a dynamic allocation mechanism
> > > > for system RAM in virtualization. In heterogeneous computing environments, the
> > > > attached memory usually comes from computing device, it should be managed separately.
> > > > we doesn't hope Linux MM controls it.
> > > 
> > > If that heterogeneous memory would have a dedicated node (which usually is
> > > the case IIRC) , and you let it manage by the Linux kernel (dax/kmem), you
> > > can bind the memory backend of virtio-mem to that special NUMA node. So all
> > > memory managed by that virtio-mem device would come from that heterogeneous
> > > memory.
> > > 
> > 
> > Yes, CXL type 2, 3 devices expose memory to host as a dedicated node, the node
> > is marked as soft_reserved_memory, dax/kmem can take over the node to create a
> > dax devcie. This dax device can be regarded as the memory backend of virtio-mem
> > 
> > I don't sure whether a dax device can be open by multiple VMs or host applications.
> 
> virito-mem currently relies on having a single sparse memory region (anon
> mmap, mmaped file, mmaped huge pages, mmap shmem) per VM. Although we can
> share memory with other processes, sharing with other VMs is not intended.
> Instead of actually mmaping parts dynamically (which can be quite
> expensive), virtio-mem relies on punching holes into the backend and
> dynamically allocating memory/file blocks/... on access.
> 
> So the easy way to make it work is:
> 
> a) Exposing the CXL memory to the buddy via dax/kmem, esulting in device
> memory getting managed by the buddy on a separate NUMA node.
>

Linux kernel buddy system? how to guarantee other applications don't apply memory
from it

>
> b) (optional) allocate huge pages on that separate NUMA node.
> c) Use ordinary memory-device-ram or memory-device-memfd (for huge pages),
> *bidning* the memory backend to that special NUMA node.
>
 
"-object memory-backend/device-ram or memory-device-memfd, id=mem0, size=768G"
How to bind backend memory to NUMA node

>
> This will dynamically allocate memory from that special NUMA node, resulting
> in the virtio-mem device completely being backed by that device memory,
> being able to dynamically resize the memory allocation.
> 
> 
> Exposing an actual devdax to the virtio-mem device, shared by multiple VMs
> isn't really what we want and won't work without major design changes. Also,
> I'm not so sure it's a very clean design: exposing memory belonging to other
> VMs to unrelated QEMU processes. This sounds like a serious security hole:
> if you managed to escalate to the QEMU process from inside the VM, you can
> access unrelated VM memory quite happily. You want an abstraction
> in-between, that makes sure each VM/QEMU process only sees private memory:
> for example, the buddy via dax/kmem.
> 
Hi David
Thanks for your suggestion, also sorry for my delayed reply due to my long vacation.
How does current virtio-mem dynamically attach memory to guest, via page fault?

Thanks,
David 


> -- 
> Thanks,
> 
> David / dhildenb
> 
> 



