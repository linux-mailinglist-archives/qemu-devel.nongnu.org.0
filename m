Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D17BB978
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 18:20:55 +0200 (CEST)
Received: from localhost ([::1]:59206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCR54-0007Fz-1l
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 12:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58053)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iCQzm-0004TO-Bf
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 12:15:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iCQzk-0005QL-7f
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 12:15:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59676)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iCQzi-0005Nf-9c
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 12:15:22 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1173030224AC
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 16:15:18 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C9995C207;
 Mon, 23 Sep 2019 16:15:14 +0000 (UTC)
Date: Mon, 23 Sep 2019 18:15:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 0/2] kvm: clear dirty bitmaps from all overlapping memslots
Message-ID: <20190923181512.144e3b77@redhat.com>
In-Reply-To: <20190923012946.GJ12858@xz-x1>
References: <1568974882-7419-1-git-send-email-pbonzini@redhat.com>
 <20190920121951.GI12858@xz-x1> <20190920155851.7445cd2a@redhat.com>
 <20190923012946.GJ12858@xz-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 23 Sep 2019 16:15:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Sep 2019 09:29:46 +0800
Peter Xu <peterx@redhat.com> wrote:

> On Fri, Sep 20, 2019 at 03:58:51PM +0200, Igor Mammedov wrote:
> > On Fri, 20 Sep 2019 20:19:51 +0800
> > Peter Xu <peterx@redhat.com> wrote:
> >   
> > > On Fri, Sep 20, 2019 at 12:21:20PM +0200, Paolo Bonzini wrote:  
> > > > A single ram_addr (representing a host-virtual address) could be aliased
> > > > to multiple guest physical addresses.  Since the KVM dirty page reporting
> > > > works on guest physical addresses, we need to clear all of the aliases
> > > > when a page is migrated, or there is a risk of losing writes to the
> > > > aliases that were not cleared.    
> > > 
> > > (CCing Igor too so Igor would be aware of these changes that might
> > >  conflict with the recent memslot split work)
> > >   
> > 
> > Thanks Peter,
> > I'll rebase on top of this series and do some more testing  
> 
> Igor,
> 
> It turns out that this series is probably not required for the current
> tree because memory_region_clear_dirty_bitmap() should have handled
> the aliasing issue correctly, but then this patchset will be a
> pre-requisite of your split series because when we split memory slots
> it starts to be possible that log_clear() will be applied to multiple
> kvm memslots.
> 
> Would you like to pick these two patches directly into your series?
> The 1st paragraph in the 2nd patch could probably be inaccurate and
> need amending (as mentioned).

Yep, commit message doesn't fit patch, how about following description:
"
Currently MemoryRegionSection has 1:1 mapping to KVMSlot.
However next patch will allow splitting MemoryRegionSection into
several KVMSlot-s, make sure that kvm_physical_log_slot_clear()
is able to handle such 1:N mapping.
"

> 
> Thanks,
> 


