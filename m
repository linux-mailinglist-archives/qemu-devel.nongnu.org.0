Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED7256BB8F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 16:15:45 +0200 (CEST)
Received: from localhost ([::1]:43938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9olk-0001cx-BG
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 10:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9okN-0000rX-MT
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 10:14:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9okJ-0004g5-C4
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 10:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657289654;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hzK9nW3ujczOjIlYmHmQU60FoWyGm7rYIy7FOwGaLLc=;
 b=c8Y+57bZbCPbOhSzttikY7y+RneOTiVtE601aVMT8HmXOT79smQODL+RoNiEUEfvmDEOd0
 1YvJrILMXq0dLqLn4JRWyvxSxniMdCIxk6wjhg1MX3CcavP/lmIorXPL3pPA94Uq3Mr/zu
 TrqlULQNAnYN/P7DW3FaCHGvoBtYmME=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-GXzkeyMtP7mlaNEtDwJ9Uw-1; Fri, 08 Jul 2022 10:14:10 -0400
X-MC-Unique: GXzkeyMtP7mlaNEtDwJ9Uw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 306878041BE;
 Fri,  8 Jul 2022 14:14:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 452A3492C3B;
 Fri,  8 Jul 2022 14:14:09 +0000 (UTC)
Date: Fri, 8 Jul 2022 15:14:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/i386: pass RNG seed to e820 setup table
Message-ID: <Ysg7rM674vX8rAJN@redhat.com>
References: <20220630113717.1893529-1-Jason@zx2c4.com>
 <YsgcXWuE2HIbFvN6@redhat.com>
 <CAHmME9rp0_6_pw=btXwuMEVthunnose6UZb4JWBYCUk+mo8WCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9rp0_6_pw=btXwuMEVthunnose6UZb4JWBYCUk+mo8WCA@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 08, 2022 at 02:04:40PM +0200, Jason A. Donenfeld wrote:
> Hi Daniel,
> 
> On Fri, Jul 8, 2022 at 2:00 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Jun 30, 2022 at 01:37:17PM +0200, Jason A. Donenfeld wrote:
> > > Tiny machines optimized for fast boot time generally don't use EFI,
> > > which means a random seed has to be supplied some other way, in this
> > > case by the e820 setup table, which supplies a place for one. This
> > > commit adds passing this random seed via the table. It is confirmed to
> > > be working with the Linux patch in the link.
> >
> > IIUC, this approach will only expose the random seed when QEMU
> > is booted using -kernel + -initrd args.
> >
> > I agree with what you say about most VMs not using UEFI right now.
> > I'd say the majority of general purpose VMs are using SeaBIOS
> > still. The usage of -kernel + -initrd, is typically for more
> > specialized use cases.
> 
> Highly disagree, based on seeing a lot of real world deployment.

I guess we're looking at different places then, as all of the large
scale virt mgmt apps I've experianced with KVM (OpenStack, oVirt,
KubeVirt), along with the small scale ones (GNOME Boxes, virt-manager,
virt-install, Cockpit), etc all primarily use SeaBIOS, and in more
recently times a bit of UEFI.  Direct kernel/initrd boot is usualy
reserved for special cases, since users like to be able to manage
their kernel/initrd inside the guest image.

> Furthermore, this is going to be used within Linux itself for kexec,
> so it makes sense to use it here too.

Ok, useful info.

> > Can we get an approach that exposes a random seed regardless of
> > whether using -kernel, or seabios, or uefi, or $whatever firmware ?
> 
> No.
> 
> > Perhaps (ab)use 'fw_cfg', which is exposed for any x86 VM no matter
> > what config it has for booting ?
> 
> That approach is super messy and doesn't work. I've already gone down
> that route.

What's the problem with it ? fw_cfg is a pretty straightforward
mechanism for injecting data into the guest OS, that we already
use for alot of stuff.

> The entire point here is to include the seed on this part of the boot
> protocol. There might be other opportunities for doing it elsewhere.
> For example, EFI already has a thing.
> 
> Please don't sink a good idea because it doesn't handle every possible
> use case. That type of mentality is just going to result in nothing
> ever getting done anywhere, making a decades old problem last for
> another decade. This patch here is simple and makes a tangible
> incremental advance toward something good, and fits the pattern of how
> it's done on all other platforms.

I'm not trying to sink an idea. If this turns out to be the best
idea, I've no problem with that.

I merely asked some reasonable questions about whether there were
alternative approaches that could solve more broadly useful scenarios,
given the narrow usage of direct kernel boot, in context of the common
VM deployments I've seen at large scale. You can't expect reviewers to
blindly accept any proposal without considering it broader context.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


