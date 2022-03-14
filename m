Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 630C94D8673
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:07:36 +0100 (CET)
Received: from localhost ([::1]:43558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlMF-0007sv-3N
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:07:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nTkdd-0004Wf-Cf
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:21:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nTkdb-00079Z-En
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647264086;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QB4ftPMdCxWcQky3kTtE3Iaxc2v0aSw4Gq/MYx20qxE=;
 b=Wwv15TwVPYc0Y43SV8HmJOyEr3qwwGcVYnjjLxSIesKsCHAi1sqvu8/7/IV+BTm+Bp4r3Y
 +xy4yXIQ04A3o24VjNU4EjacbcZsQnNosA1/va5STdbJwsq5ic/Zix9lHofgpCvrOMh+Eo
 mpF9fkR49erBXuvjLfJBCxIf7kR4mg8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-qFtx4hJ4PeGsJGvph4dlfA-1; Mon, 14 Mar 2022 09:21:23 -0400
X-MC-Unique: qFtx4hJ4PeGsJGvph4dlfA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB9D51C0338B;
 Mon, 14 Mar 2022 13:21:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C76EC465034;
 Mon, 14 Mar 2022 13:21:20 +0000 (UTC)
Date: Mon, 14 Mar 2022 13:21:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] x86: q35: require split irqchip for large CPU count
Message-ID: <Yi9BTkZIM3iZsvdK@redhat.com>
References: <20220311143901.96481-1-imammedo@redhat.com>
 <8d4912d595bcaca36013e22060c22c1bfe3c44c1.camel@infradead.org>
 <20220314113532.10518837@redhat.com>
 <0d0f10cf1e593be0fb4546749cd7ee11765accb5.camel@infradead.org>
MIME-Version: 1.0
In-Reply-To: <0d0f10cf1e593be0fb4546749cd7ee11765accb5.camel@infradead.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 12:59:38PM +0000, David Woodhouse wrote:
> On Mon, 2022-03-14 at 11:35 +0100, Igor Mammedov wrote:
> > On Fri, 11 Mar 2022 14:58:41 +0000
> > David Woodhouse <
> > dwmw2@infradead.org
> > > wrote:
> > 
> > > On Fri, 2022-03-11 at 09:39 -0500, Igor Mammedov wrote:
> > > > if VM is started with:
> > > > 
> > > >    -enable-kvm -smp 256
> > > > 
> > > > without specifying 'split' irqchip, VM might eventually boot
> > > > but no more than 255 CPUs will be operational and following
> > > > error messages in guest could be observed:
> > > >    ...
> > > >    smpboot: native_cpu_up: bad cpu 256
> > > >    ...
> > > > It's a regression introduced by [1], which removed dependency
> > > > on intremap=on that were implicitly requiring 'split' irqchip
> > > > and forgot to check for 'split' irqchip.
> > > > Instead of letting VM boot a broken VM, error out and tell
> > > > user how to fix CLI.  
> > > 
> > > Hm, wasn't that already fixed in the patches I posted in December?
> > 
> > It might be, could you point to the commit/series that fixed it.
> 
> https://lore.kernel.org/all/20211209220840.14889-1-dwmw2@infradead.org/
> is the patch I was thinking of, but although that moves the check to a
> more useful place and fixes the X2APIC check, it *doesn't* include the
> fix you're making; it's still using kvm_irqchip_in_kernel().
> 
> I can change that and repost the series, which is still sitting (with
> fixed Reviewed-By/Acked-By attributions that I screwed up last time) in
> https://git.infradead.org/users/dwmw2/qemu.git
> 
> > Regardless of that, fixing it in recent kernels doesn't help
> > as still supported kernels are still affected by it.
> > 
> > If there is a way to detect that fix, I can add to q35 a compat
> > property and an extra logic to enable kernel-irqchip if fix is present.
> > Otherwise the fix does not exist until minimum supported kernel
> > version reaches version where it was fixed.
> 
> Hm, I'm not sure I follow here. Do you mean recent versions of *qemu*
> when you say 'kernels'? 
> 
> I'm not even sure I agree with the observation that qemu should error
> out here. The guest boots fine and the guest can even *use* all the
> CPUs. IPIs etc. will all work fine. The only thing that doesn't work is
> delivering *external* interrupts to CPUs above 254.
> 
> Ultimately, this is the *guest's* problem. Some operating systems can
> cope; some can't.
> 
> The fact that *Linux* has a fundamental assumption that *all* CPUs can
> receive all interrupts and that affinity can't be limited in hardware,
> is a Linux problem. I tried to fix it once but it was distinctly non-
> trivial and eventually I gave up and took a different approach.
> https://lore.kernel.org/linux-iommu/87lfgj59mp.fsf@nanos.tec.linutronix.de/T/
> 
> But even if we 'fix' the check as you suggest to bail out and refuse to
> boot a certain configuration because Linux guest wouldn't be able to
> fully utilize it... Even if we boot with the split IRQ chip and the 15-
> bit MSI enlightenment, we're still in the same position. Some guests
> will be able to use it; some won't.
> 
> In fact, there are operating systems that don't even know about X2APIC.
> 
> Why should qemu refuse to even start up?

We've generally said QEMU should not reject / block startup of valid
hardware configurations, based on existance of bugs in certain guest
OS, if the config would be valid for other guest.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


