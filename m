Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFB8306BBB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 04:53:02 +0100 (CET)
Received: from localhost ([::1]:57680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4yMe-0003g3-MN
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 22:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l4yLd-0003G4-8t
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 22:51:57 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:43680
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l4yLb-0005vy-Aj
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 22:51:57 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id 1A385122C5B; Wed, 27 Jan 2021 19:51:54 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 83143122C5B;
 Wed, 27 Jan 2021 19:51:48 -0800 (PST)
Date: Wed, 27 Jan 2021 19:51:46 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Subject: [RFC] Set addresses for memory devices [CXL]
Message-ID: <20210128035146.gt7ir3u73h5coxrr@mail.bwidawsk.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Dan Williams <dan.j.williams@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi list, Igor.

I wanted to get some ideas on how to better handle this. Per the recent
discussion [1], it's become clear that there needs to be more thought put into
how to manage the address space for CXL memory devices. If you see the
discussion on interleave [2] there's a decent diagram for the problem statement.

A CXL topology looks just like a PCIe topology. A CXL memory device is a memory
expander. It's a byte addressable address range with a combination of persistent
and volatile memory. In a CXL capable system, you can effectively think of these
things as more configurable NVDIMMs. The memory devices have an interface that
allows the OS to program the base physical address range it claims called an HDM
(Host Defined Memory) decoder. A larger address range is claimed by a host
bridge (or a combination of host bridges in the interleaved case) which is
platform specific.

Originally, my plan was to create a single memory backend for a "window" and
subregion the devices in there. So for example, if you had two devices under a
hostbridge, each of 256M size, the window would be some fixed GPA of 512M+ size
memory backend, and those memory devices would be a subregion of the
hostbridge's window. I thought this was working in my patch series, but as it
turns out, this doesn't actually work as I intended. `info mtree` looks good,
but `info memory-devices` doesn't.

So let me list the requirements and hopefully get some feedback on the best way
to handle it.
1. A PCIe like device has a persistent memory region (I don't care about
volatile at the moment).
2. The physical address base for the memory region is programmable.
3. Memory accesses will support interleaving across multiple host bridges.

As far as I can tell, there isn't anything that works quite like this today,
and, my attempts so far haven't been correct.

Thanks.
Ben

References:
[1] https://lore.kernel.org/qemu-devel/20210126213013.6v24im4sler3q3am@mail.bwidawsk.net/
[2] https://lore.kernel.org/qemu-devel/c51b000e-80db-40e9-d878-f260c49e4a2e@amsat.org/

Other:
https://lore.kernel.org/qemu-devel/20210105165323.783725-23-ben.widawsky@intel.com/
https://lore.kernel.org/qemu-devel/20210105165323.783725-26-ben.widawsky@intel.com/

