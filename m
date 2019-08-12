Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BFD89FE7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 15:41:29 +0200 (CEST)
Received: from localhost ([::1]:45654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxAZk-0002jd-Q8
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 09:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56025)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hxAZC-0002Gm-E0
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 09:40:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hxAZB-0000mM-7w
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 09:40:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37618)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hxAZB-0000lx-1p; Mon, 12 Aug 2019 09:40:53 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3A31E30084AD;
 Mon, 12 Aug 2019 13:40:52 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A54E62FC68;
 Mon, 12 Aug 2019 13:40:47 +0000 (UTC)
Date: Mon, 12 Aug 2019 15:40:45 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20190812154045.10393873.cohuck@redhat.com>
In-Reply-To: <bbf905b3-6f32-c478-4e6e-81c341f5601a@redhat.com>
References: <20190805152947.28536-1-david@redhat.com>
 <20190805152947.28536-2-david@redhat.com>
 <e68f8298-8946-37f1-2e65-afa73a45604e@redhat.com>
 <bbf905b3-6f32-c478-4e6e-81c341f5601a@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 12 Aug 2019 13:40:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH-for-4.2 v1 1/9] s390x/mmu: Better ASC
 selection in s390_cpu_get_phys_page_debug()
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Aug 2019 09:52:56 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 12.08.19 09:12, Thomas Huth wrote:
> > On 8/5/19 5:29 PM, David Hildenbrand wrote:  
> >> Let's select the ASC before calling the function and use MMU_DATA_LOAD.
> >> This is a preparation to:
> >> - Remove the ASC magic depending on the access mode from mmu_translate
> >> - Implement IEP support, where we could run into access exceptions
> >>   trying to fetch instructions
> >>
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> >> ---
> >>  target/s390x/helper.c | 10 +++++++++-
> >>  1 file changed, 9 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/target/s390x/helper.c b/target/s390x/helper.c
> >> index 13ae9909ad..08166558a0 100644
> >> --- a/target/s390x/helper.c
> >> +++ b/target/s390x/helper.c
> >> @@ -58,7 +58,15 @@ hwaddr s390_cpu_get_phys_page_debug(CPUState *cs, vaddr vaddr)
> >>          vaddr &= 0x7fffffff;
> >>      }
> >>  
> >> -    if (mmu_translate(env, vaddr, MMU_INST_FETCH, asc, &raddr, &prot, false)) {
> >> +    /*
> >> +     * We want to read the code, however, not run into access exceptions  
> > 
> > Is this really a safe assumption here that we always use this to
> > translate code addresses and not data addresses? ... I don't think so.
> > For example with the "gva2gpa" HMP command, I'd rather expect that it
> > also works with the secondary space mode...?  
> 
> Well, it's what current code does. I am not changing that behavior.

Agreed, that is not actively breaking something.

> 
> While it is in general broken to have a single interface to debug
> code+data (which is only a problem on s390x), it makes a lot of sense if
> you think about single-stepping through disassembled code using the
> gdbstub. Or dumping code where you crashed.

What about the memsave interface?

> 
> In Linux, code+data will luckily usually have the same virtual->physical
> tables, so it's not a real issue.
> 
> > 
> > So maybe we need a proper MemTxAttrs bit or something similar for
> > distinguishing instruction accesses from data accesses here?  
> 
> There would first have to be a way to ask "get_phys_page_debug" to get
> code or data for this to make sense. Right now we used it to get code.

I'm wondering if we're able to do better; but if the code/data
distinction is not considered in architecture independent code,
probably not easily.

