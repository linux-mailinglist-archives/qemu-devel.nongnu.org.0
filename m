Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3801294A7A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 18:37:45 +0200 (CEST)
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzkfA-0008HH-CD
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 12:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40259)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1hzke1-0007cF-3h
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 12:36:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hzkdz-0007yv-PQ
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 12:36:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32836)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hzkdz-0007ye-Jv; Mon, 19 Aug 2019 12:36:31 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A79D7300157A;
 Mon, 19 Aug 2019 16:36:30 +0000 (UTC)
Received: from gondolin (unknown [10.36.116.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EC6760BE2;
 Mon, 19 Aug 2019 16:36:26 +0000 (UTC)
Date: Mon, 19 Aug 2019 18:36:23 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20190819183623.3afe92c4.cohuck@redhat.com>
In-Reply-To: <20190814072355.15333-1-david@redhat.com>
References: <20190814072355.15333-1-david@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 19 Aug 2019 16:36:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH-for-4.2 v2 0/6] s390x/mmu: Storage key
 reference and change bit handling
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
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Aug 2019 09:23:49 +0200
David Hildenbrand <david@redhat.com> wrote:

> The first two patches are modified patches from:
>     [PATCH-for-4.2 v1 0/9] s390x: MMU changes and extensions
> 
> This series primarily fixes minor things in the storage key handling code
> in the MMU and implements fairly reliable reference and change bit handling
> for TCG. To track the reference and change bit, we have to invalidate
> TLB entries whenever the storage key is changed by the guest and make sure
> not TLB entry is writable in case the storage key does not indicate a
> change already.
> 
> With this series, the kvm-unit-test "skey" now passes. \o/
> 
> v1 -> v2:
> - "s390x/tcg: Rework MMU selection for instruction fetches"
> -- Cleanup return value handling
> - Added RB's
> 
> David Hildenbrand (6):
>   s390x/mmu: ASC selection in s390_cpu_get_phys_page_debug()
>   s390x/tcg: Rework MMU selection for instruction fetches
>   s390x/tcg: Flush the TLB of all CPUs on SSKE and RRBE
>   s390x/mmu: Trace the right value if setting/getting the storage key
>     fails
>   s390x/mmu: Better storage key reference and change bit handling
>   s390x/mmu: Factor out storage key handling
> 
>  target/s390x/cpu.h        |   7 ++
>  target/s390x/helper.c     |   5 ++
>  target/s390x/mem_helper.c |   4 ++
>  target/s390x/mmu_helper.c | 133 ++++++++++++++++++++++++--------------
>  4 files changed, 99 insertions(+), 50 deletions(-)
> 

Thanks, applied.

