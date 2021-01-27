Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC25306645
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:35:02 +0100 (CET)
Received: from localhost ([::1]:39976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4sSr-0006uZ-Vz
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:35:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l4sRl-0006I7-Gk
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:33:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l4sRh-0001s5-M1
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:33:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611783227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nuGvYyj8dL7a/jaVv3qaNiCQIuRjgwomQDQhbK6LTdE=;
 b=dRw8vIN+JIs5+1kO55gp+IZW3EQW/kjrD4T8kuQ/EHI0l4dYGHD6ZZVbjz/7/25rqqbSLx
 1q4Zt1jpt0Vt7jAY1ARpzuqa+71+Vnv4JAnH46vzZmuDtRBNClTQP6upqGD4tpTbI/1hco
 DiSlV4PepTewpAdtp/+gFALLftGNtgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-hXLeiqDcPySPBm2IBlPMwg-1; Wed, 27 Jan 2021 16:33:45 -0500
X-MC-Unique: hXLeiqDcPySPBm2IBlPMwg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3821510054FF;
 Wed, 27 Jan 2021 21:33:44 +0000 (UTC)
Received: from localhost (unknown [10.40.208.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B26E55C8AD;
 Wed, 27 Jan 2021 21:33:39 +0000 (UTC)
Date: Wed, 27 Jan 2021 22:33:37 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ben Widawsky <ben@bwidawsk.net>
Subject: Re: Handling multiple inheritance [for CXL]
Message-ID: <20210127223337.24bc5dfa@redhat.com>
In-Reply-To: <20210127202544.htdvme3yij2asybm@mail.bwidawsk.net>
References: <20210126213013.6v24im4sler3q3am@mail.bwidawsk.net>
 <20210127211824.4d64b45d@redhat.com>
 <20210127202544.htdvme3yij2asybm@mail.bwidawsk.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 27 Jan 2021 12:25:44 -0800
Ben Widawsky <ben@bwidawsk.net> wrote:

> On 21-01-27 21:18:24, Igor Mammedov wrote:
> > On Tue, 26 Jan 2021 13:33:52 -0800
> > Ben Widawsky <ben@bwidawsk.net> wrote:
> >   
> > > I'm working on CXL 2.0 type 3 memory devices [1]. In short, these are PCIe devices
> > > that have persistent memory on them. As such, it would be nice to inherit from
> > > both a PCI_DEVICE class as well as an NVDIMM device class.
> > > 
> > > Truth be told, using TYPE_MEMORY_DEVICE as the interface does provide most of
> > > what I need.  
> > could you be more specific on what you need from it?
> >   
> 
> I'm trying to register my persistent memory as normal system memory. I assume
> it's required that I implement the memory interface to do that. If it's not,
> that's fine too.
> 
> For reference:
> https://gitlab.com/bwidawsk/qemu/-/blob/cxl-2.0v3/hw/mem/cxl_type3.c

if you use TYPE_MEMORY_DEVICE machinery, then address/(max)size a device takes in
hotplug ram window, is fixed at device creation time.
If you use PCI BAR to map memory, it should be possible to reprogram BAR
anywhere in PCI address space at runtime.

> > >I'm wondering what the best way to handle this is. Currently, the
> > > only thing NVDIMM class provides is write/read_label_data, this is driven by
> > > _DSM. For CXL, the mechanism to read/write the equivalent area is not done via
> > > _DSM, but done directly via a mailbox interface. However, the intent is the
> > > same, and so utilizing similar code seems ideal.
> > > 
> > > If there's a desire to unify these code paths, I'd need something like multiple
> > > inheritance. I'm looking for some feedback here on how to do it.
> > > 
> > > Thanks.
> > > Ben
> > > 
> > > [1]: https://lore.kernel.org/qemu-devel/20210105165323.783725-1-ben.widawsky@intel.com/
> > >   
> >   
> 


