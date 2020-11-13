Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855402B1383
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 01:51:05 +0100 (CET)
Received: from localhost ([::1]:41494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdNIu-0005Lh-Ki
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 19:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1kdNHr-0004w9-S9
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 19:49:59 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:48644
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1kdNHq-0000Er-6e
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 19:49:59 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id EEC55123932; Thu, 12 Nov 2020 16:49:56 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 5DEBA123931;
 Thu, 12 Nov 2020 16:49:54 -0800 (PST)
Date: Thu, 12 Nov 2020 16:49:52 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 16/25] hw/pxb/cxl: Add "windows" for host bridges
Message-ID: <20201113004952.tm45qv2tukwnle52@mail.bwidawsk.net>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-17-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111054724.794888-17-ben.widawsky@intel.com>
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 19:49:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.4,
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
Cc: Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20-11-10 21:47:15, Ben Widawsky wrote:
> In a bare metal CXL capable system, system firmware will program
> physical address ranges on the host. This is done by programming
> internal registers that aren't typically known to OS. These address
> ranges might be contiguous or interleaved across host bridges.
> 
> For a QEMU guest a new construct is introduced allowing passing a memory
> backend to the host bridge for this same purpose. Each memory backend
> needs to be passed to the host bridge as well as any device that will be
> emulating that memory (not implemented here).
> 
> I'm hopeful the interleaving work in the link can be re-purposed here
> (see Link).
> 
> An example to create a host bridges with a 512M window at 0x4c0000000
>  -object memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M
>  -device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52,uid=0,len-memory-base=1,memory-base\[0\]=0x4c0000000,memory\[0\]=cxl-mem1
> 
> Link: https://lists.nongnu.org/archive/html/qemu-devel/2020-08/msg03680.html
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

Hi Phil, wanted to call you out specifically on this one.

The newly released CXL 2.0 specification (which from a topology perspective can
be thought of as very PCIe-like) allows for interleaving of memory access.

Below is an example of two host bridges, each with two root ports, and 5 devices
(two of switch are behind a switch).

RP: Root Port
USP: Upstream Port
DSP: Downstream Port
Type 3 device: Memory Device with persistent or volatile memory.

+-------------------------+      +-------------------------+
|                         |      |                         |
|   CXL 2.0 Host Bridge   |      |   CXL 2.0 Host Bridge   |
|                         |      |                         |
|  +------+     +------+  |      |  +------+     +------+  |
|  |  RP  |     |  RP  |  |      |  |  RP  |     |  RP  |  |
+--+------+-----+------+--+      +--+------+-----+------+--+
      |            |                   |               \--
      |            |                   |        +-------+-\--+------+
   +------+    +-------+            +-------+   |       |USP |      |
   |Type 3|    |Type 3 |            |Type 3 |   |       +----+      |
   |Device|    |Device |            |Device |   |                   |
   +------+    +-------+            +-------+   | +----+     +----+ |
                                                | |DSP |     |DSP | |
                                                +-+----+-----+----+-+
                                                    |          |
                                                +------+    +-------+
                                                |Type 3|    |Type 3 |
                                                |Device|    |Device |
                                                +------+    +-------+

Considering this picture... interleaving of memory access can happen in all 3
layers in the topology.

- Memory access can be interleaved across host bridges (this is accomplished
  based on the physical address chosen for the devices, those address ranges are
  platform specific and not part of the 2.0 spec, for now).

- Memory access can be interleaved across root ports in a host bridge.

- Finally, memory access can be interleaved across downstream ports.

I'd like to start the discussion about how this might overlap with the patch
series you've last been working on to interleave memory. Do you have any
thoughts or ideas on how I should go about doing this?

