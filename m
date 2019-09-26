Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CB2BEEA1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 11:42:04 +0200 (CEST)
Received: from localhost ([::1]:33056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDQHj-00035R-T1
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 05:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58550)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iDQGt-0002dh-Jj
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 05:41:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iDQGs-0007LP-L7
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 05:41:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45298)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1iDQGs-0007Kx-En
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 05:41:10 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 99496C05E740;
 Thu, 26 Sep 2019 09:41:09 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A4DB60F9E;
 Thu, 26 Sep 2019 09:41:08 +0000 (UTC)
Message-ID: <f8a138f8c00df4886045d6771415336a7e43b887.camel@redhat.com>
Subject: Re: Questions about the real mode in kvm/qemu
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Li Qiang <liq3ea@gmail.com>
Date: Thu, 26 Sep 2019 12:41:07 +0300
In-Reply-To: <4ed0f9ca-6cd1-fd8e-9abd-4098f85c7f9d@redhat.com>
References: <CAKXe6SJfZt8WcA43Vsh0=GT=jBedcAOUx9DNGZ4Bsvi10oCkog@mail.gmail.com>
 <644968ffb11c11fd580e96c1e67932501a633fe4.camel@redhat.com>
 <CAKXe6SK+cEytTtgKHw8KXY=jY4xv=27GBu55hTbTmbRyTPsfxg@mail.gmail.com>
 <3d3f3a0e6e796260348c66e69e859e1901501ee8.camel@redhat.com>
 <23789310-35fb-8c93-44f4-532bcd34007d@redhat.com>
 <7c019f3a5236daaa79e67467f64cde212ad05f35.camel@redhat.com>
 <4ed0f9ca-6cd1-fd8e-9abd-4098f85c7f9d@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 26 Sep 2019 09:41:09 +0000 (UTC)
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
Cc: Qemu Developers <qemu-devel@nongnu.org>, Avi Kivity <avi.kivity@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2019-09-26 at 11:33 +0200, Paolo Bonzini wrote:
> On 26/09/19 11:24, Maxim Levitsky wrote:
> > On Thu, 2019-09-26 at 11:18 +0200, Paolo Bonzini wrote:
> > > On 26/09/19 10:59, Maxim Levitsky wrote:
> > > > If you mean to ask if there is a way to let guest access use no
> > > > paging at all, that is access host physical addresses directly, then
> > > > indeed there is no way, since regular non 'unrestricted guest' mode
> > > > required both protected mode and paging, and 'unrestricted guest'
> > > > requires EPT. Academically speaking it is of course possible to
> > > > create paging tables that are 1:1...
> > > 
> > > Not so academically, it's exactly what KVM does.
> > 
> > You mean KVM uses 1:1 EPT pages and no guest paging,
> > to allow guest to access host physical address space?
> 
> No, it uses the usual HVA->GPA EPT pages and 1:1 GPA->GVA pages when EPT
> is enabled and guest CR0.PG=0.  This lets KVM work around the CR0.PG=1
> requirement when unrestricted guest mode.
I understand now.

> 
> Thinking more about it, I suppose that saves memory (the same EPT page
> tables can now be used independent of guest CR0.PG), at the cost of
> making TLB misses a little slower.
Don't really understand what you mean. 
Isn't this always the case that EPT and guest paging
are independent (at least when no nesting is involved)?


Best regards,
	Maxim Levitsky


