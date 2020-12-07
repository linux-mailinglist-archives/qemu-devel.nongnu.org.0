Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4AF2D16B8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 17:48:48 +0100 (CET)
Received: from localhost ([::1]:55588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmJgt-0007Dh-JH
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 11:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kmJcw-0003g1-86
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:44:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kmJcs-0000Tk-Gq
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607359477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UgdjE4fKcDjZBY/heUx1DQEDENSCD7DYWWLFE/GwBEg=;
 b=AiaaUCVjHrh0hsEJDm7XD1DLKeFeODroWOcMEKElNocjWdD6QJiazBUI6e+XlMMrZPnGGr
 F8O9ilw/PxpDF1ddAFb+1BEL4WknsTAl3iMl/P4/8yg5toi04zaRiuI7HZDq59d6oQgwBj
 0JTOE9AJxHD1aKb4FGaFjtyH+5jzj9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-xjKu7mQ6NxSw7npi5lgtfA-1; Mon, 07 Dec 2020 11:44:36 -0500
X-MC-Unique: xjKu7mQ6NxSw7npi5lgtfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C09D1922020;
 Mon,  7 Dec 2020 16:44:34 +0000 (UTC)
Received: from work-vm (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32D6A60C0F;
 Mon,  7 Dec 2020 16:44:30 +0000 (UTC)
Date: Mon, 7 Dec 2020 16:44:28 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steven Price <steven.price@arm.com>, dgibson@redhat.com
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
Message-ID: <20201207164428.GD3135@work-vm>
References: <20201119153901.53705-1-steven.price@arm.com>
 <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
 <20201119184248.4bycy6ouvaxqdiiy@kamzik.brq.redhat.com>
 <db5ad775fa7cfe7defbd78d9ca6ccfd8@kernel.org>
 <c25c297e-e9b5-ab3f-e401-c21ddd4d2ad1@arm.com>
 <CAJc+Z1H7akXwDtVvQLiGVVyZ0DfmsxyJQhE7Sno6aAO9GaafEA@mail.gmail.com>
 <46fd98a2-ee39-0086-9159-b38c406935ab@arm.com>
 <CAFEAcA_Q8RSB-zcS8+cEfvWz_0U5GLzmsf12m_7BFjX8h-1hrA@mail.gmail.com>
 <b975422f-14fd-13b3-c8ca-e8b1a68c0837@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b975422f-14fd-13b3-c8ca-e8b1a68c0837@arm.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Haibo Xu <haibo.xu@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 kvmarm <kvmarm@lists.cs.columbia.edu>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Steven Price (steven.price@arm.com) wrote:
> On 07/12/2020 15:27, Peter Maydell wrote:
> > On Mon, 7 Dec 2020 at 14:48, Steven Price <steven.price@arm.com> wrote:
> > > Sounds like you are making good progress - thanks for the update. Have
> > > you thought about how the PROT_MTE mappings might work if QEMU itself
> > > were to use MTE? My worry is that we end up with MTE in a guest
> > > preventing QEMU from using MTE itself (because of the PROT_MTE
> > > mappings). I'm hoping QEMU can wrap its use of guest memory in a
> > > sequence which disables tag checking (something similar will be needed
> > > for the "protected VM" use case anyway), but this isn't something I've
> > > looked into.
> > 
> > It's not entirely the same as the "protected VM" case. For that
> > the patches currently on list basically special case "this is a
> > debug access (eg from gdbstub/monitor)" which then either gets
> > to go via "decrypt guest RAM for debug" or gets failed depending
> > on whether the VM has a debug-is-ok flag enabled. For an MTE
> > guest the common case will be guests doing standard DMA operations
> > to or from guest memory. The ideal API for that from QEMU's
> > point of view would be "accesses to guest RAM don't do tag
> > checks, even if tag checks are enabled for accesses QEMU does to
> > memory it has allocated itself as a normal userspace program".
> 
> Sorry, I know I simplified it rather by saying it's similar to protected VM.
> Basically as I see it there are three types of memory access:
> 
> 1) Debug case - has to go via a special case for decryption or ignoring the
> MTE tag value. Hopefully this can be abstracted in the same way.
> 
> 2) Migration - for a protected VM there's likely to be a special method to
> allow the VMM access to the encrypted memory (AFAIK memory is usually kept
> inaccessible to the VMM). For MTE this again has to be special cased as we
> actually want both the data and the tag values.
> 
> 3) Device DMA - for a protected VM it's usual to unencrypt a small area of
> memory (with the permission of the guest) and use that as a bounce buffer.
> This is possible with MTE: have an area the VMM purposefully maps with
> PROT_MTE. The issue is that this has a performance overhead and we can do
> better with MTE because it's trivial for the VMM to disable the protection
> for any memory.

Those all sound very similar to the AMD SEV world;  there's the special
case for Debug that Peter mentioned; migration is ...complicated and
needs special case that's still being figured out, and as I understand
Device DMA also uses a bounce buffer (and swiotlb in the guest to make
that happen).


I'm not sure about the stories for the IBM hardware equivalents.

Dave

> The part I'm unsure on is how easy it is for QEMU to deal with (3) without
> the overhead of bounce buffers. Ideally there'd already be a wrapper for
> guest memory accesses and that could just be wrapped with setting TCO during
> the access. I suspect the actual situation is more complex though, and I'm
> hoping Haibo's investigations will help us understand this.
> 
> Thanks,
> 
> Steve
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


