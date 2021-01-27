Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5CA30669A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:44:49 +0100 (CET)
Received: from localhost ([::1]:48728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4scK-0002o8-8y
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l4sXK-0000Ej-Ru
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:39:38 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:41652
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l4sXJ-0002QA-9M
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:39:38 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id E9ECE123390; Wed, 27 Jan 2021 13:39:34 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 24A39122C5B;
 Wed, 27 Jan 2021 13:39:28 -0800 (PST)
Date: Wed, 27 Jan 2021 13:39:26 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: Handling multiple inheritance [for CXL]
Message-ID: <20210127213926.bmzav2nnkb4ruvor@mail.bwidawsk.net>
References: <20210126213013.6v24im4sler3q3am@mail.bwidawsk.net>
 <20210127211824.4d64b45d@redhat.com>
 <20210127202544.htdvme3yij2asybm@mail.bwidawsk.net>
 <20210127223337.24bc5dfa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127223337.24bc5dfa@redhat.com>
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-27 22:33:37, Igor Mammedov wrote:
> On Wed, 27 Jan 2021 12:25:44 -0800
> Ben Widawsky <ben@bwidawsk.net> wrote:
> 
> > On 21-01-27 21:18:24, Igor Mammedov wrote:
> > > On Tue, 26 Jan 2021 13:33:52 -0800
> > > Ben Widawsky <ben@bwidawsk.net> wrote:
> > >   
> > > > I'm working on CXL 2.0 type 3 memory devices [1]. In short, these are PCIe devices
> > > > that have persistent memory on them. As such, it would be nice to inherit from
> > > > both a PCI_DEVICE class as well as an NVDIMM device class.
> > > > 
> > > > Truth be told, using TYPE_MEMORY_DEVICE as the interface does provide most of
> > > > what I need.  
> > > could you be more specific on what you need from it?
> > >   
> > 
> > I'm trying to register my persistent memory as normal system memory. I assume
> > it's required that I implement the memory interface to do that. If it's not,
> > that's fine too.
> > 
> > For reference:
> > https://gitlab.com/bwidawsk/qemu/-/blob/cxl-2.0v3/hw/mem/cxl_type3.c
> 
> if you use TYPE_MEMORY_DEVICE machinery, then address/(max)size a device takes in
> hotplug ram window, is fixed at device creation time.
> If you use PCI BAR to map memory, it should be possible to reprogram BAR
> anywhere in PCI address space at runtime.
> 

This is not part of the PCI address space. I believe there will be quite a bit
of work to support hotplug properly for CXL devices, but I believe making it a
PCI BAR is the wrong approach.

If you're not yet familiar with the spec, it might make some sense to take a
look as I think I'm not doing a good job conveying what this hardware is.

https://www.computeexpresslink.org/download-the-specification

> > > >I'm wondering what the best way to handle this is. Currently, the
> > > > only thing NVDIMM class provides is write/read_label_data, this is driven by
> > > > _DSM. For CXL, the mechanism to read/write the equivalent area is not done via
> > > > _DSM, but done directly via a mailbox interface. However, the intent is the
> > > > same, and so utilizing similar code seems ideal.
> > > > 
> > > > If there's a desire to unify these code paths, I'd need something like multiple
> > > > inheritance. I'm looking for some feedback here on how to do it.
> > > > 
> > > > Thanks.
> > > > Ben
> > > > 
> > > > [1]: https://lore.kernel.org/qemu-devel/20210105165323.783725-1-ben.widawsky@intel.com/
> > > >   
> > >   
> > 
> 

