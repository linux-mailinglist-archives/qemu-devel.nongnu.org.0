Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF49181D0E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:58:09 +0100 (CET)
Received: from localhost ([::1]:54800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3kG-00048B-Ai
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1jC3jB-0002aA-W1
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:57:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1jC3j9-0008Cz-Rr
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:57:00 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34582
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1jC3j9-0008Cj-Km
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583942218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F85UEl/OuWM5BQ1xZC759phsL1pa5uQDLcdbiwReg4Y=;
 b=OilzEyhyaAf8kReMYuUNPdun9p0TYU3uc+I2rf6wvrcgnJBuggf79+8e5NNz7b/gBw0/gh
 udvs01T8y718wBrUUyqMdPhNlHpZ8cMpuigAZorwGuw41kZs48m0RxWnhUPfGJNgNj056B
 OyrcDkLiRST2mivKaF92GRwbckcfrZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-U84FdE7KOpS7WmHAbB09Zg-1; Wed, 11 Mar 2020 11:56:48 -0400
X-MC-Unique: U84FdE7KOpS7WmHAbB09Zg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C432B107ACC4;
 Wed, 11 Mar 2020 15:56:46 +0000 (UTC)
Received: from w520.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90ABB60BF1;
 Wed, 11 Mar 2020 15:56:43 +0000 (UTC)
Date: Wed, 11 Mar 2020 09:56:43 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH RESEND 1/3] vfio/pci: fix a null pointer reference in
 vfio_rom_read
Message-ID: <20200311095643.3da3f46b@w520.home>
In-Reply-To: <126f7a20-bd78-fd9c-579f-91b850c99b4f@redhat.com>
References: <20200224064219.1434-1-longpeng2@huawei.com>
 <20200224064219.1434-2-longpeng2@huawei.com>
 <20200224090458.080152c0@w520.home>
 <5b6a9b3c-0efe-8f57-d61e-731e9fd51470@huawei.com>
 <20200310101108.3377b878@x1.home>
 <467b2253-a065-91c3-5b0c-4f03ee236d0c@redhat.com>
 <20200310193624.402fdb18@x1.home>
 <87ftefl673.fsf@dusky.pond.sub.org>
 <126f7a20-bd78-fd9c-579f-91b850c99b4f@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: mst@redhat.com, weifuqiang@huawei.com, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, "Longpeng \(Mike, Cloud Infrastructure Service
 Product Dept.\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Mar 2020 11:28:26 +0100
Laszlo Ersek <lersek@redhat.com> wrote:

> On 03/11/20 08:08, Markus Armbruster wrote:
> > Alex Williamson <alex.williamson@redhat.com> writes:
> >   
> >> On Wed, 11 Mar 2020 00:14:31 +0100
> >> Laszlo Ersek <lersek@redhat.com> wrote:  
> > [...]  
> >>> So from a memcpy() and range perspective, the patch looks OK. But
> >>> there's still a wart I dislike: we should never perform pointer
> >>> arithmetic on a (void*). I suggest casting (vdev->rom) to (uint8_t*) or
> >>> (unsigned char*) first.
> >>>
> >>> Here's an excerpt from the ISO C99 standard:
> >>>
> >>> -v-
> >>> 6.5.6 Additive operators
> >>>
> >>> Constraints
> >>>
> >>> 2 For addition, either both operands shall have arithmetic type, or one
> >>>   operand shall be a pointer to an object type and the other shall have
> >>>   integer type. [...]
> >>> -^-
> >>>
> >>> A "pointer-to-void" is not a "pointer to an object type", because "void"
> >>> is not an object type -- it is an incomplete type that cannot be completed:
> >>>
> >>> -v-
> >>> 6.2.5 Types
> >>>
> >>> 1 [...] Types are partitioned into object types (types that fully
> >>>   describe objects), function types (types that describe functions), and
> >>>   incomplete types (types that describe objects but lack information
> >>>   needed to determine their sizes).
> >>>
> >>> [...]
> >>>
> >>> 19 The void type comprises an empty set of values; it is an incomplete
> >>>    type that cannot be completed.
> >>> -^-
> >>>
> >>> For a different illustration, (vdev->rom + addr) is equivalent to
> >>> &(vdev->rom[addr]) -- and we clearly can't have an "array of void".
> >>>
> >>> This anti-pattern (of doing pointer arithmetic on (void*)) likely comes
> >>> from a guarantee that the standard does make, in the same "6.2.5 Types"
> >>> section:
> >>>
> >>> -v-
> >>> 27 A pointer to void shall have the same representation and alignment
> >>>    requirements as a pointer to a character type. 39) [...]
> >>>
> >>> Footnote 39: The same representation and alignment requirements are
> >>>              meant to imply interchangeability as arguments to
> >>>              functions, return values from functions, and members of
> >>>              unions.
> >>> -^-
> >>>
> >>> It does not extend to the "+" operator.  
> >>
> >> GNU C specifically allows arithmetic on pointers and defines the size
> >> of a void as 1.  I'll comply, but this makes me want to stab myself in
> >> the face :-\  Thanks,  
> > 
> > We rely on GNU C extensions all over theplace.  Making the code uglier
> > to avoid relying on this one here makes no sense to me.
> >   
> 
> I agree, in fact. If GNU-isms are liberally used & tolerated in the QEMU
> source, then there's no reason to diverge from that here. I steer clear
> of GNU-isms as much as I can, regardless of codebase, but I *did* forget
> that QEMU permits GNU-isms -- so there's no need for my pedantry here.
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Oh, thank goodness ;)  Thanks,

Alex


