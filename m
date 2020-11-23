Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31982C0556
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 13:19:00 +0100 (CET)
Received: from localhost ([::1]:39616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAo6-0004z3-Jb
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 07:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khAmQ-0004YI-U5
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 07:17:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khAmO-0006vz-8q
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 07:17:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606133828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RSa6axA8acXlN/nHzWzCr89Oo5Z355MEuIWkDZmMlas=;
 b=Tz653FyfTnDjBoLsc/aAESJ5AzbrMifWYsujGFpquFrKizF5V+QoSMUpg9XEhqOySYM71g
 MMeo7/mx3qhmSR9S+hc5PP0blr65DavMGOH8nupLfNXZYVMfG973L+KMv9drBm213+DPJo
 Yod5eI1/lb3ycRRh8oZH1FqPBKASusM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-OjmxZbq0PEacCG4qpdCK8w-1; Mon, 23 Nov 2020 07:16:20 -0500
X-MC-Unique: OjmxZbq0PEacCG4qpdCK8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBE4A8AEA40;
 Mon, 23 Nov 2020 12:16:17 +0000 (UTC)
Received: from work-vm (ovpn-114-158.ams2.redhat.com [10.36.114.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC31B5D9CC;
 Mon, 23 Nov 2020 12:16:13 +0000 (UTC)
Date: Mon, 23 Nov 2020 12:16:11 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
Message-ID: <20201123121611.GG3022@work-vm>
References: <20201119153901.53705-1-steven.price@arm.com>
 <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Jones <drjones@redhat.com>,
 Haibo Xu <Haibo.Xu@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>, James Morse <james.morse@arm.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm <kvmarm@lists.cs.columbia.edu>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
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

Although that is also changing because of the encrypted/protected memory
in things like SEV.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


