Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF874C29D3
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 11:46:09 +0100 (CET)
Received: from localhost ([::1]:45958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNBdQ-0007eQ-JR
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 05:46:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNBb5-0006W7-Hy
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:43:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNBb3-0004aT-2c
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:43:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645699420;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMrO1wHK+f0i5l49rTbD4HIL+P3tUpsU4mhMhEe7j9I=;
 b=AM57WqUAZx65eQmP0VntBtMC27z46a/5PCcAvfM0Fp5VQX9pXk9qzWQmcycCaiV5h9Y5wk
 yosuT9hI73BmzCGciGRn2tesBmjnC/TDAE180dqegRXgxmHjqbrUNnDX4mIzOxJQYGoYHK
 3fY8Oj/4cbIHauQ434/mN9VzhlkTZMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279--UbWN4hpN0-INrWLYK-Htg-1; Thu, 24 Feb 2022 05:43:35 -0500
X-MC-Unique: -UbWN4hpN0-INrWLYK-Htg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 831FE5123;
 Thu, 24 Feb 2022 10:43:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCE9E83197;
 Thu, 24 Feb 2022 10:43:28 +0000 (UTC)
Date: Thu, 24 Feb 2022 10:43:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH RFC v1 0/2] VM fork detection for RNG
Message-ID: <YhdhTlhnj46gqhk+@redhat.com>
References: <20220223131231.403386-1-Jason@zx2c4.com>
 <234d7952-0379-e3d9-5e02-5eba171024a0@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <234d7952-0379-e3d9-5e02-5eba171024a0@amazon.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: linux-s390@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 tytso@mit.edu, adrian@parity.io, kvm@vger.kernel.org, jannh@google.com,
 gregkh@linuxfoundation.org, raduweis@amazon.com, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org, acatan@amazon.com, linux-crypto@vger.kernel.org,
 colmmacc@amazon.com, sblbir@amazon.com, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 09:53:59AM +0100, Alexander Graf wrote:
> Hey Jason,
> 
> On 23.02.22 14:12, Jason A. Donenfeld wrote:
> > This small series picks up work from Amazon that seems to have stalled
> > out later year around this time: listening for the vmgenid ACPI
> > notification, and using it to "do something." Last year, that something
> > involved a complicated userspace mmap chardev, which seems frought with
> > difficulty. This year, I have something much simpler in mind: simply
> > using those ACPI notifications to tell the RNG to reinitialize safely,
> > so we don't repeat random numbers in cloned, forked, or rolled-back VM
> > instances.
> > 
> > This series consists of two patches. The first is a rather
> > straightforward addition to random.c, which I feel fine about. The
> > second patch is the reason this is just an RFC: it's a cleanup of the
> > ACPI driver from last year, and I don't really have much experience
> > writing, testing, debugging, or maintaining these types of drivers.
> > Ideally this thread would yield somebody saying, "I see the intent of
> > this; I'm happy to take over ownership of this part." That way, I can
> > focus on the RNG part, and whoever steps up for the paravirt ACPI part
> > can focus on that.
> > 
> > As a final note, this series intentionally does _not_ focus on
> > notification of these events to userspace or to other kernel consumers.
> > Since these VM fork detection events first need to hit the RNG, we can
> > later talk about what sorts of notifications or mmap'd counters the RNG
> > should be making accessible to elsewhere. But that's a different sort of
> > project and ties into a lot of more complicated concerns beyond this
> > more basic patchset. So hopefully we can keep the discussion rather
> > focused here to this ACPI business.
> 
> 
> The main problem with VMGenID is that it is inherently racy. There will
> always be a (short) amount of time where the ACPI notification is not
> processed, but the VM could use its RNG to for example establish TLS
> connections.
> 
> Hence we as the next step proposed a multi-stage quiesce/resume mechanism
> where the system is aware that it is going into suspend - can block network
> connections for example - and only returns to a fully functional state after
> an unquiesce phase:
> 
>   https://github.com/systemd/systemd/issues/20222

The downside of course is precisely that the guest now needs to be aware
and involved every single time a snapshot is taken.

Currently with virt the act of taking a snapshot can often remain invisible
to the VM with no functional effect on the guest OS or its workload, and
the host OS knows it can complete a snapshot in a specific timeframe. That
said, this transparency to the VM is precisely the cause of the race
condition described.

With guest involvement to quiesce the bulk of activity for time period,
there is more likely to be a negative impact on the guest workload. The
guest admin likely needs to be more explicit about exactly when in time
it is reasonable to take a snapshot to mitigate the impact.

The host OS snapshot operations are also now dependant on co-operation
of a guest OS that has to be considered to be potentially malicious, or
at least crashed/non-responsive. The guest OS also needs a way to receive
the triggers for snapshot capture and restore, most likely via an extension
to something like the QEMU guest agent or an equivalent for othuer
hypervisors.


Despite the above, I'm not against the idea of co-operative involvement
of the guest OS in the acts of taking & restoring snapshots. I can't
see any other proposals so far that can reliably eliminate the races
in the general case, from the kernel right upto user applications.
So I think it is neccessary to have guest cooperative snapshotting.

> What exact use case do you have in mind for the RNG/VMGenID update? Can you
> think of situations where the race is not an actual concern?

Lets assume we do take the approach described in that systemd bug and
have a co-operative snapshot process. If the hypervisor does the right
thing and guest owners install the right things, they'll have a race
free solution that works well in normal operation. That's good.


Realistically though, it is never going to be universally and reliably
put into practice. So what is our attitude to cases where the preferred
solution isn't availble and/or operative ?


There are going to be users who continue to build their guest disk images
without the QEMU guest agent (or equivalent for whatever hypervisor they
run on) installed because they don't know any better. Or where the guest
agent is mis-configured or fails to starts or some other scenario that
prevents the quiesce working as desired. The host mgmt could refuse to
take a snapshot in these cases. More likely is that they are just
going to go ahead and do a snapshot anyway because lack of guest agent
is a very common scenario today and users want their snapshots.


There are going to be virt management apps / hypervisors that don't
support talking to any guest agent across their snapshot operation
in the first place, so systemd gets no way to trigger the required
quiesce dance on snapshot, but they likely have VMGenID support
implemented already.


IOW, I could view VMGenID triggered fork detection integrated with
the kernel RNG as providing a backup line of defence that is going
to "just work", albeit with the known race. It isn't as good as the
guest co-operative snapshot approach, because it only tries to solve
the one specific targetted problem of updating the kernel RNG.

Is it still better than doing nothing at all though, for the scenario
where guest co-operative snapshot is unavailable ?

If it is better than nothing, is it then compelling enough to justify
the maint cost of the code added to the kernel ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


