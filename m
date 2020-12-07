Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F76A2D17D6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:50:04 +0100 (CET)
Received: from localhost ([::1]:42968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKeB-0002sx-AS
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:50:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kmKYy-0008A4-G9
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:44:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kmKYp-0001Xj-0L
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607363069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8CxERT4u5MDQXm5Jldr8EFPIiLsHrezNO76Dqv+04UU=;
 b=H/7WO/oHV7/NLwzf1YlRdA++/Wt02N/kugOjxiRNVayw4zk0lKgGzSkQxBFER97imLIEw9
 TsqzduOv1WuoeH5D/tEFVakRqss9Z+WkBoz8uUZbP3mhBIS5ccoFqS04ZX3ELrly2A+VWD
 +8235iLO7gg7GzRkfy9aQQqpWErLtZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-1LUvcVXBNISK6Oz0QmAItQ-1; Mon, 07 Dec 2020 12:44:25 -0500
X-MC-Unique: 1LUvcVXBNISK6Oz0QmAItQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FF75804024;
 Mon,  7 Dec 2020 17:44:23 +0000 (UTC)
Received: from work-vm (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8F6C60636;
 Mon,  7 Dec 2020 17:44:20 +0000 (UTC)
Date: Mon, 7 Dec 2020 17:44:18 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
Message-ID: <20201207174418.GF3135@work-vm>
References: <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
 <20201119184248.4bycy6ouvaxqdiiy@kamzik.brq.redhat.com>
 <db5ad775fa7cfe7defbd78d9ca6ccfd8@kernel.org>
 <c25c297e-e9b5-ab3f-e401-c21ddd4d2ad1@arm.com>
 <CAJc+Z1H7akXwDtVvQLiGVVyZ0DfmsxyJQhE7Sno6aAO9GaafEA@mail.gmail.com>
 <46fd98a2-ee39-0086-9159-b38c406935ab@arm.com>
 <CAFEAcA_Q8RSB-zcS8+cEfvWz_0U5GLzmsf12m_7BFjX8h-1hrA@mail.gmail.com>
 <b975422f-14fd-13b3-c8ca-e8b1a68c0837@arm.com>
 <20201207164428.GD3135@work-vm>
 <CAFEAcA9mq0xh1CNvw9UZoNwcOBuoVnCNcBkRDSUv7UK27qdESg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9mq0xh1CNvw9UZoNwcOBuoVnCNcBkRDSUv7UK27qdESg@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>, Haibo Xu <haibo.xu@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, David Gibson <dgibson@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 kvmarm <kvmarm@lists.cs.columbia.edu>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Mon, 7 Dec 2020 at 16:44, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > * Steven Price (steven.price@arm.com) wrote:
> > > Sorry, I know I simplified it rather by saying it's similar to protected VM.
> > > Basically as I see it there are three types of memory access:
> > >
> > > 1) Debug case - has to go via a special case for decryption or ignoring the
> > > MTE tag value. Hopefully this can be abstracted in the same way.
> > >
> > > 2) Migration - for a protected VM there's likely to be a special method to
> > > allow the VMM access to the encrypted memory (AFAIK memory is usually kept
> > > inaccessible to the VMM). For MTE this again has to be special cased as we
> > > actually want both the data and the tag values.
> > >
> > > 3) Device DMA - for a protected VM it's usual to unencrypt a small area of
> > > memory (with the permission of the guest) and use that as a bounce buffer.
> > > This is possible with MTE: have an area the VMM purposefully maps with
> > > PROT_MTE. The issue is that this has a performance overhead and we can do
> > > better with MTE because it's trivial for the VMM to disable the protection
> > > for any memory.
> >
> > Those all sound very similar to the AMD SEV world;  there's the special
> > case for Debug that Peter mentioned; migration is ...complicated and
> > needs special case that's still being figured out, and as I understand
> > Device DMA also uses a bounce buffer (and swiotlb in the guest to make
> > that happen).
> 
> Mmm, but for encrypted VMs the VM has to jump through all these
> hoops because "don't let the VM directly access arbitrary guest RAM"
> is the whole point of the feature. For MTE, we don't want in general
> to be doing tag-checked accesses to guest RAM and there is nothing
> in the feature "allow guests to use MTE" that requires that the VMM's
> guest RAM accesses must do tag-checking. So we should avoid having
> a design that require us to jump through all the hoops.

Yes agreed, that's a fair distinction.

Dave


 Even if
> it happens that handling encrypted VMs means that QEMU has to grow
> some infrastructure for carefully positioning hoops in appropriate
> places, we shouldn't use it unnecessarily... All we actually need is
> a mechanism for migrating the tags: I don't think there's ever a
> situation where you want tag-checking enabled for the VMM's accesses
> to the guest RAM.
> 
> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


