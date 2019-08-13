Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DB58B94E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 14:59:13 +0200 (CEST)
Received: from localhost ([::1]:52112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxWOP-0000Gb-4l
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 08:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54053)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hxWI9-000888-Iv
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 08:52:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hxWI8-00037r-JD
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 08:52:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36292)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hxWI8-00037R-DW; Tue, 13 Aug 2019 08:52:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9B51830EA18D;
 Tue, 13 Aug 2019 12:52:43 +0000 (UTC)
Received: from gondolin (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44E8B80FF3;
 Tue, 13 Aug 2019 12:52:39 +0000 (UTC)
Date: Tue, 13 Aug 2019 14:52:37 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20190813145237.58e83eeb.cohuck@redhat.com>
In-Reply-To: <10b59926-4834-7cc6-a01e-7d6c43749057@redhat.com>
References: <20190812112737.6652-1-david@redhat.com>
 <20190812112737.6652-3-david@redhat.com>
 <10b59926-4834-7cc6-a01e-7d6c43749057@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 13 Aug 2019 12:52:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH-for-4.2 v1 2/6] s390x/tcg: Rework MMU
 selection for instruction fetches
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

On Mon, 12 Aug 2019 15:37:39 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 12.08.19 13:27, David Hildenbrand wrote:
> > Instructions are always fetched from primary address space, except when
> > in home address mode. Perform the selection directly in cpu_mmu_index().
> > 
> > get_mem_index() is only used to perform data access, instructions are
> > fetched via cpu_lduw_code(), which translates to cpu_mmu_index(env, true).
> > 
> > We don't care about restricting the access permissions of the TLB
> > entries anymore, as we no longer enter PRIMARY entries into the
> > SECONDARY MMU. Cleanup related code a bit.
> > 
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
> >  target/s390x/cpu.h        |  7 +++++++
> >  target/s390x/mmu_helper.c | 35 ++++++++++++++---------------------
> >  2 files changed, 21 insertions(+), 21 deletions(-)
> > 
> > diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> > index a606547b4d..c34992bb2e 100644
> > --- a/target/s390x/cpu.h
> > +++ b/target/s390x/cpu.h
> > @@ -332,6 +332,13 @@ static inline int cpu_mmu_index(CPUS390XState *env, bool ifetch)
> >          return MMU_REAL_IDX;
> >      }
> >  
> > +    if (ifetch) {
> > +        if ((env->psw.mask & PSW_MASK_ASC) == PSW_ASC_HOME) {
> > +            return MMU_HOME_IDX;
> > +        }
> > +        return MMU_PRIMARY_IDX;
> > +    }
> > +
> >      switch (env->psw.mask & PSW_MASK_ASC) {
> >      case PSW_ASC_PRIMARY:
> >          return MMU_PRIMARY_IDX;
> > diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
> > index 6e9c4d6151..2c9bb3acc0 100644
> > --- a/target/s390x/mmu_helper.c
> > +++ b/target/s390x/mmu_helper.c
> > @@ -349,6 +349,7 @@ int mmu_translate(CPUS390XState *env, target_ulong vaddr, int rw, uint64_t asc,
> >  {
> >      static S390SKeysState *ss;
> >      static S390SKeysClass *skeyclass;
> > +    uint64_t asce;
> >      int r = -1;  
> 
> I can now stop initializing r.
> 
> >      uint8_t key;
> >  
> > @@ -381,35 +382,21 @@ int mmu_translate(CPUS390XState *env, target_ulong vaddr, int rw, uint64_t asc,
> >      if (!(env->psw.mask & PSW_MASK_DAT)) {
> >          *raddr = vaddr;
> >          r = 0;  
> 
> and this can go as well.
> 
> > -        goto out;
> > +        goto nodat;
> >      }
> >    
> 
> 

So, there will be a v2?

