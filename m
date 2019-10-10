Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72380D20CC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 08:31:23 +0200 (CEST)
Received: from localhost ([::1]:34300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIRys-0002FH-DO
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 02:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iIRxC-0001Gj-LZ
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 02:29:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iIRxB-0007BV-Ju
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 02:29:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36674)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iIRx9-0007Ad-47; Thu, 10 Oct 2019 02:29:35 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ABBA83164683;
 Thu, 10 Oct 2019 06:29:33 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EB5360BF4;
 Thu, 10 Oct 2019 06:29:32 +0000 (UTC)
Date: Thu, 10 Oct 2019 08:29:29 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH 3/5] target/arm/kvm: Implement cpu feature kvm-adjvtime
Message-ID: <20191010062929.arxwmdlc3i7p2u6u@kamzik.brq.redhat.com>
References: <20191007170622.1814-1-drjones@redhat.com>
 <20191007170622.1814-4-drjones@redhat.com>
 <892976b9-0e43-940d-1d36-046749d652c9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <892976b9-0e43-940d-1d36-046749d652c9@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 10 Oct 2019 06:29:33 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, maz@kernel.org,
 qemu-devel@nongnu.org, bijan.mottahedeh@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 09, 2019 at 08:50:02PM -0400, Richard Henderson wrote:
> On 10/7/19 1:06 PM, Andrew Jones wrote:
> > +static void kvm_arm_vm_state_change(void *opaque, int running, RunState state)
> > +{
> > +    CPUState *cs = opaque;
> > +    ARMCPU *cpu = ARM_CPU(cs);
> > +
> > +    if (running) {
> > +        if (cpu->kvm_adjvtime) {
> > +            kvm_arm_set_virtual_time(cs);
> > +        }
> > +    }
> > +}
> 
> Worth putting this in kvm.c too, so you don't have to duplicate it?  You can
> always split it apart later if you ever do need a different hook for 32 vs 64.

True. I'll send a v1 without the premature duplication of this function
and your r-b's

Thanks,
drew

