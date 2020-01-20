Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD72142C81
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 14:47:49 +0100 (CET)
Received: from localhost ([::1]:36814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itXPA-0004jT-Hd
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 08:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35584)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1itXN9-0003Hd-3b
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:45:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1itXN6-0004pa-Mw
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:45:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54895
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1itXN6-0004od-DV
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579527939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oN8F9afqLuIFryMw+qq858SrYas53Kd5xSSXy4jkxUI=;
 b=MQLtTkTU2zlPChBQ94HJe1wWWG0dd/d7PtDEviFsb8hmjQjetvD5njhHshh1nIC1Tf3wW5
 Bw62VsBpr9tqdU8zfkeWYwt19coSlWjz7k5x0jBW9+byEUazZdFRvyx+QXr/H/mgPt7NPH
 +XJhg/CI+xpVS6jqR1J5uxkRvmx5PSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-7w2UE76kPqioDqnFuNQZaw-1; Mon, 20 Jan 2020 08:45:36 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82434100551A;
 Mon, 20 Jan 2020 13:45:34 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBBD87DB5D;
 Mon, 20 Jan 2020 13:45:32 +0000 (UTC)
Date: Mon, 20 Jan 2020 14:45:30 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 0/5] target/arm/kvm: Adjust virtual time
Message-ID: <20200120134530.4w2om4smyyrzsurw@kamzik.brq.redhat.com>
References: <20191212173320.11610-1-drjones@redhat.com>
 <CAFEAcA9FprSotg11rS0fM94QiciysZ6kgKhyU4eQfZg7YYaL5Q@mail.gmail.com>
 <CAFEAcA_oF2MX5PGNtp2YZeNRHB5vHM8NbMqQs2=2sAw1PnqfBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_oF2MX5PGNtp2YZeNRHB5vHM8NbMqQs2=2sAw1PnqfBw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 7w2UE76kPqioDqnFuNQZaw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: bijan.mottahedeh@oracle.com, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@huawei.com>, msys.mizuma@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 16, 2019 at 03:44:05PM +0000, Peter Maydell wrote:
> On Mon, 16 Dec 2019 at 15:33, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> > So, to be clear, you mean that:
> >
> > (1) the kernel headers say:
> >
> > /* EL0 Virtual Timer Registers */
> > #define KVM_REG_ARM_TIMER_CTL           ARM64_SYS_REG(3, 3, 14, 3, 1)
> > #define KVM_REG_ARM_TIMER_CNT           ARM64_SYS_REG(3, 3, 14, 3, 2)
> > #define KVM_REG_ARM_TIMER_CVAL          ARM64_SYS_REG(3, 3, 14, 0, 2)
> >
> > (2) some of the RHSes of these are wrong
> >
> > (3) but the kernel internally is using the same 'wrong' value, so
> > userspace also needs to use that value, ie trust the #defined name
> > rather than manufacturing one ?
> >
> > That's awkward. I think it would be worth at least having a kernel
> > patch to add a comment clearly documenting this bug.
> >
> > (This error seems to only be in the 64-bit ABI, not 32-bit.)
> >
> > QEMU does assume that the kernel's ID register values match
> > the hardware for sysregs in some ways -- we use this when we
> > construct our mapping from KVM register IDs as returned by
> > KVM_GET_REG_LIST to QEMU cpreg definitions and thus CPUState
> > struct fields. I *think* that in this case the only visible
> > effect will be that gdbstub will show you the CNT value
> > if you ask it to print the value of the CVAL sysreg.
>=20
> ...perhaps we should work around this kernel bug in the
> kvm_to_cpreg_id() and cpreg_to_kvm_id() functions. (Need
> to think through/test whether that would break migration.)
>

I just did some grepping for this too and, while it's easy to get
lost, I think I've confirmed what you state, that the only visible
effect is in gdb. I'll try to test this, but I think the workaround
in kvm_to_cpreg_id and cpreg_to_kvm_id is a probably a good idea,
because

   1) new qemu will be corrected

   2) migrate old qemu to new qemu (with same machine type)

      gdb cnt and cval swapped until first kvmstate sync

      (maybe too small a window of brokenness to notice/care?)

   3) migrate new qemu to old qemu (with same machine type)

      gdb cnt and cval correct until first kvmstate sync

      (old machine type keeps its old bug - except for same small
       window as for (2))

Thanks,
drew


