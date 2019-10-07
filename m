Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375CFCEA0C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 19:04:48 +0200 (CEST)
Received: from localhost ([::1]:47842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHWRD-0005Cn-8G
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 13:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36329)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iHWOr-00049n-9E
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 13:02:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iHWOm-0003ZH-BR
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 13:02:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52332)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iHWOm-0003ZD-5M; Mon, 07 Oct 2019 13:02:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 57FD8A44AC2;
 Mon,  7 Oct 2019 17:02:15 +0000 (UTC)
Received: from gondolin (ovpn-116-231.ams2.redhat.com [10.36.116.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2DE4600C1;
 Mon,  7 Oct 2019 17:02:09 +0000 (UTC)
Date: Mon, 7 Oct 2019 19:02:03 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 0/5] s390x/mmu: Implement more facilities
Message-ID: <20191007190203.14714176.cohuck@redhat.com>
In-Reply-To: <2cb4d6b8-4058-dca0-95e2-6e8d62741a2c@redhat.com>
References: <20190926101627.23376-1-david@redhat.com>
 <2cb4d6b8-4058-dca0-95e2-6e8d62741a2c@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Mon, 07 Oct 2019 17:02:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Oct 2019 15:23:32 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 26.09.19 12:16, David Hildenbrand wrote:
> > This is the follow up of:
> >     [PATCH-for-4.2 v1 0/9] s390x: MMU changes and extensions
> > Without the general MMU rework. It's based on:
> >     [PATCH v2 0/7] s390x/mmu: DAT translation rewrite
> > 
> > This series adds adds EDAT2 MMU support, and implements/indicates related
> > facilities (ESOP-1, ESOP-2, IEP, ...) for TCG. The QEMU CPU model is
> > updated.
> > 
> > IEP under QEMU TCG seems to work just fine, when eabling it via the "max"
> > CPU model - via kvm unit tests:
> >     t460s: ~/git/kvm-unit-tests master $ ./s390x-run s390x/iep.elf -cpu max
> >     [...]
> >     PASS: iep: iep protection: Program interrupt: expected(4) == received(4)
> >     SUMMARY: 1 tests
> > 
> >     EXIT: STATUS=1
> > 
> > Changes since "[PATCH-for-4.2 v1 0/9] s390x: MMU changes and extensions":
> > - "s390x/mmu: Add EDAT2 translation support"
> > -- Fix vaddr offset within 2GB page
> > - "s390x/mmu: Implement ESOP-2 and ..."
> > -- Squashed two patches as requested.
> > -- Also set ilen to "2" in case of MMU_INST_FETCH on mmu_translate_real
> > - "s390x/mmu: Implement Instruction-Execution-Protection Facility"
> > -- Make sure s390_cpu_get_phys_page_debug() doesn't choke on IEP
> > - "s390x/cpumodel: Add new TCG features to QEMU cpu model"
> > -- Add comment "features introduced after the z13"
> > 
> > Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> > 
> > David Hildenbrand (5):
> >   s390x/mmu: Add EDAT2 translation support
> >   s390x/mmu: Implement ESOP-2 and
> >     access-exception-fetch/store-indication facility
> >   s390x/mmu: Implement Instruction-Execution-Protection Facility
> >   s390x/cpumodel: Prepare for changes of QEMU model
> >   s390x/cpumodel: Add new TCG features to QEMU cpu model
> > 
> >  hw/s390x/s390-virtio-ccw.c  |  2 ++
> >  target/s390x/cpu.h          |  1 +
> >  target/s390x/gen-features.c | 11 +++++++++-
> >  target/s390x/helper.c       |  6 +++++-
> >  target/s390x/mmu_helper.c   | 42 +++++++++++++++++++++++++++++++++++--
> >  5 files changed, 58 insertions(+), 4 deletions(-)
> >   
> 
> @Christian (@Conny) if I can get an ACK on the last patch, I can send
> this directly upstream.
> 

No objections from my side, I won't get around to reviewing it in
detail anyway.

