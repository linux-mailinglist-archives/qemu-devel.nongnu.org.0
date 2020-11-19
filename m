Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C162B9ADF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 19:47:41 +0100 (CET)
Received: from localhost ([::1]:36886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfoy1-0002W2-TY
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 13:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kfotf-0000e4-Ce
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:43:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kfotc-0001Ch-5J
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605811382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y55OZ3OjAK2zbBI3eJj5fJ3qrb+J/+b/r6JS6Ay9OF4=;
 b=PGj5ON1YIwu4CCBba6wY92guzFiRQaWXUGgdcHwxLwoatJ27Emofe+s6dfH27I/MX+6hqR
 Ln/yeG60OYl7Tg5p+I1KTNyGIcjyaUHRKtgARmx080v3uCHux9B7pz0uqmeUsMLwhi5ygR
 MhbVezhNWCbILJeJsGOAUIrQA0MdZLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-S6ZPH1jbP6WK2oA8bMO-Nw-1; Thu, 19 Nov 2020 13:42:59 -0500
X-MC-Unique: S6ZPH1jbP6WK2oA8bMO-Nw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAA36107ACE3;
 Thu, 19 Nov 2020 18:42:56 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19EA060BE2;
 Thu, 19 Nov 2020 18:42:50 +0000 (UTC)
Date: Thu, 19 Nov 2020 19:42:48 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
Message-ID: <20201119184248.4bycy6ouvaxqdiiy@kamzik.brq.redhat.com>
References: <20201119153901.53705-1-steven.price@arm.com>
 <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvmarm <kvmarm@lists.cs.columbia.edu>,
 Haibo Xu <Haibo.Xu@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 James Morse <james.morse@arm.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Marc Zyngier <maz@kernel.org>, Julien Thierry <julien.thierry.kdev@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Steven Price <steven.price@arm.com>,
 Will Deacon <will@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 03:45:40PM +0000, Peter Maydell wrote:
> On Thu, 19 Nov 2020 at 15:39, Steven Price <steven.price@arm.com> wrote:
> > This series adds support for Arm's Memory Tagging Extension (MTE) to
> > KVM, allowing KVM guests to make use of it. This builds on the existing
> > user space support already in v5.10-rc1, see [1] for an overview.
> 
> > The change to require the VMM to map all guest memory PROT_MTE is
> > significant as it means that the VMM has to deal with the MTE tags even
> > if it doesn't care about them (e.g. for virtual devices or if the VMM
> > doesn't support migration). Also unfortunately because the VMM can
> > change the memory layout at any time the check for PROT_MTE/VM_MTE has
> > to be done very late (at the point of faulting pages into stage 2).
> 
> I'm a bit dubious about requring the VMM to map the guest memory
> PROT_MTE unless somebody's done at least a sketch of the design
> for how this would work on the QEMU side. Currently QEMU just
> assumes the guest memory is guest memory and it can access it
> without special precautions...
>

There are two statements being made here:

1) Requiring the use of PROT_MTE when mapping guest memory may not fit
   QEMU well.

2) New KVM features should be accompanied with supporting QEMU code in
   order to prove that the APIs make sense.

I strongly agree with (2). While kvmtool supports some quick testing, it
doesn't support migration. We must test all new features with a migration
supporting VMM.

I'm not sure about (1). I don't feel like it should be a major problem,
but (2).

I'd be happy to help with the QEMU prototype, but preferably when there's
hardware available. Has all the current MTE testing just been done on
simulators? And, if so, are there regression tests regularly running on
the simulators too? And can they test migration? If hardware doesn't
show up quickly and simulators aren't used for regression tests, then
all this code will start rotting from day one.

Thanks,
drew


