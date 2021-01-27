Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AA430650F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 21:26:36 +0100 (CET)
Received: from localhost ([::1]:35300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4rOd-0002mA-JI
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 15:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l4rNw-0002N2-BQ
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:25:52 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:40902
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l4rNu-0002Ks-LA
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:25:52 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id 47ED5122C84; Wed, 27 Jan 2021 12:25:48 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 94351122C5B;
 Wed, 27 Jan 2021 12:25:45 -0800 (PST)
Date: Wed, 27 Jan 2021 12:25:44 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: Handling multiple inheritance [for CXL]
Message-ID: <20210127202544.htdvme3yij2asybm@mail.bwidawsk.net>
References: <20210126213013.6v24im4sler3q3am@mail.bwidawsk.net>
 <20210127211824.4d64b45d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127211824.4d64b45d@redhat.com>
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

On 21-01-27 21:18:24, Igor Mammedov wrote:
> On Tue, 26 Jan 2021 13:33:52 -0800
> Ben Widawsky <ben@bwidawsk.net> wrote:
> 
> > I'm working on CXL 2.0 type 3 memory devices [1]. In short, these are PCIe devices
> > that have persistent memory on them. As such, it would be nice to inherit from
> > both a PCI_DEVICE class as well as an NVDIMM device class.
> > 
> > Truth be told, using TYPE_MEMORY_DEVICE as the interface does provide most of
> > what I need.
> could you be more specific on what you need from it?
> 

I'm trying to register my persistent memory as normal system memory. I assume
it's required that I implement the memory interface to do that. If it's not,
that's fine too.

For reference:
https://gitlab.com/bwidawsk/qemu/-/blob/cxl-2.0v3/hw/mem/cxl_type3.c

> >I'm wondering what the best way to handle this is. Currently, the
> > only thing NVDIMM class provides is write/read_label_data, this is driven by
> > _DSM. For CXL, the mechanism to read/write the equivalent area is not done via
> > _DSM, but done directly via a mailbox interface. However, the intent is the
> > same, and so utilizing similar code seems ideal.
> > 
> > If there's a desire to unify these code paths, I'd need something like multiple
> > inheritance. I'm looking for some feedback here on how to do it.
> > 
> > Thanks.
> > Ben
> > 
> > [1]: https://lore.kernel.org/qemu-devel/20210105165323.783725-1-ben.widawsky@intel.com/
> > 
> 

