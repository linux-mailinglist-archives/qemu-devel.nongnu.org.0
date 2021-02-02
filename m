Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0730E30C32A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:14:08 +0100 (CET)
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xNX-00085C-2V
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l6xGC-00076m-6F
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:06:33 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:46034
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l6xGA-0003ne-My
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:06:31 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id 65B641234A4; Tue,  2 Feb 2021 07:06:28 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id D9FAF122C69;
 Tue,  2 Feb 2021 07:06:17 -0800 (PST)
Date: Tue, 2 Feb 2021 07:06:16 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [RFC PATCH v3 21/31] hw/cxl/device: Add a memory device (8.2.8.5)
Message-ID: <20210202150616.s6nvpbmozsosewgm@mail.bwidawsk.net>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
 <20210202005948.241655-22-ben.widawsky@intel.com>
 <ec610f0d-4719-43fd-9293-e5a18e00a7d3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec610f0d-4719-43fd-9293-e5a18e00a7d3@redhat.com>
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 "John Groves \(jgroves\)" <jgroves@micron.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-02 08:26:14, Eric Blake wrote:
> On 2/1/21 6:59 PM, Ben Widawsky wrote:
> > A CXL memory device (AKA Type 3) is a CXL component that contains some
> > combination of volatile and persistent memory. It also implements the
> > previously defined mailbox interface as well as the memory device
> > firmware interface.
> > 
> > Although the memory device is configured like a normal PCIe device, the
> > memory traffic is on an entirely separate bus conceptually (using the
> > same physical wires as PCIe, but different protocol).
> > 
> > The guest physical address for the memory device is part of a larger
> > window which is owned by the platform. Currently, this is hardcoded as
> > an object property on host bridge (PXB) creation, but that will need to
> > change for interleaving.
> > 
> > The following example will create a 256M device in a 512M window:
> > -object "memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M"
> > -device "cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M"
> > 
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > ---
> 
> > +++ b/qapi/machine.json
> > @@ -1394,6 +1394,7 @@
> >  { 'union': 'MemoryDeviceInfo',
> >    'data': { 'dimm': 'PCDIMMDeviceInfo',
> >              'nvdimm': 'PCDIMMDeviceInfo',
> > +            'cxl': 'PCDIMMDeviceInfo',
> >              'virtio-pmem': 'VirtioPMEMDeviceInfo',
> >              'virtio-mem': 'VirtioMEMDeviceInfo'
> >            }
> 
> Missing documentation that 'cxl' was introduced in 6.0.  Also, is it
> worth keeping the branches of this union in lexicographic order?
> 

Sure.

As discussed on the list previously, I think more thought needs to be put in
here, and I could really use some input.

A CXL type3 memory device can have both persistent and volatile capacity. As
such a single PCDIMMDeviceInfo I believe is insufficient. The current code
supports persistent memory only, so this is fine for now.

I'd guess my best bet is to create a new CXLType3DeviceInfo, but I'm not
entirely sure of all the implications that has.

Any advice?

> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
> 
> 

