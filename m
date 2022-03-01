Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AC34C9040
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 17:23:18 +0100 (CET)
Received: from localhost ([::1]:48846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP5HR-0006cw-5V
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 11:23:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nP5GC-0005u6-32
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:22:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nP5G0-0002GW-82
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646151706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ac9WfGbistjFm7LiKvOxeSDYCD8Gg7LmnqbwLdMfizE=;
 b=YciBP/kMmqJs//YjcgPVvWP1V3yfCDXlvxxJoY/jDI74Zu03GwE61qJiPnxWufrfygRIUG
 sCMC/iW7t0Qw110FZ1X3QTTyG/k6U5I6G92s3s/OrkXkJEiksXJR6HZnS8dptYm/h5N2b6
 jYDp0WQmHRhisIc1XFIBEhm9gn/DyeI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-Gw7zrMUON0mNaKytYrWBGw-1; Tue, 01 Mar 2022 11:21:45 -0500
X-MC-Unique: Gw7zrMUON0mNaKytYrWBGw-1
Received: by mail-wm1-f71.google.com with SMTP id
 i20-20020a05600c051400b00380d5eb51a7so1439884wmc.3
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 08:21:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ac9WfGbistjFm7LiKvOxeSDYCD8Gg7LmnqbwLdMfizE=;
 b=fID4KcgueaiflfWkVqJuQODqctIMMiB0XH3y9bM2aMbpg4ont2/6M53k3zSleE3Ylt
 X/gYDUjaQJ3zHHvxpsjQ3GscZ5bR3KqtidTnY5I9qRnKkLCRv/MP656b80Z/BcSQwo3+
 TEaic4lQgldHrJGV2bflAa2MkmXorIAwttg57ELjHYIHn54G2vtmJMXDUZeTA2HHrJLz
 uMtj0S0pyuBZ+8PjxNd+cV+9Sf5+vKTlwa2CkjpCtFrel0Ko0hvMAD9qYh9lRrgqCXuq
 f4Yv0bVPkqNTG+S9+9ud42ackyLWEPz8xN0iMW4pWuFunHCo2Y6Gq++KjOB2Ase1w647
 eAXg==
X-Gm-Message-State: AOAM530tlGY7WsMi3GK9iz0h2X2Y+hZmMk9x77I3ivdqQ+O/xKZ3+Xt0
 flYitQetkWdRsXpc0nhqcbKqrMwIaa8ZF4kqSyNBnA4NRasuYiENG6S+U51IfPET6lh6die+wav
 EUpjZ9I2pSgcRKeM=
X-Received: by 2002:a05:6000:cd:b0:1ed:bd9f:69d2 with SMTP id
 q13-20020a05600000cd00b001edbd9f69d2mr20113293wrx.288.1646151703945; 
 Tue, 01 Mar 2022 08:21:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycgS5isqXU9GIuQLrDF3y/TWM3GmZs396UxSScNJGQw1IAMBBON7t0NccxM4wyd8pXTsUTlw==
X-Received: by 2002:a05:6000:cd:b0:1ed:bd9f:69d2 with SMTP id
 q13-20020a05600000cd00b001edbd9f69d2mr20113254wrx.288.1646151703601; 
 Tue, 01 Mar 2022 08:21:43 -0800 (PST)
Received: from redhat.com ([2.53.2.184]) by smtp.gmail.com with ESMTPSA id
 m34-20020a05600c3b2200b00380e3225af9sm3294866wms.0.2022.03.01.08.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 08:21:42 -0800 (PST)
Date: Tue, 1 Mar 2022 11:21:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <20220301111459-mutt-send-email-mst@kernel.org>
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
MIME-Version: 1.0
In-Reply-To: <Yh4+9+UpanJWAIyZ@zx2c4.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: len.brown@intel.com, linux-hyperv@vger.kernel.org, colmmacc@amazon.com,
 berrange@redhat.com, adrian@parity.io, kvm@vger.kernel.org, jannh@google.com,
 gregkh@linuxfoundation.org, linux-pm@vger.kernel.org, rafael@kernel.org,
 linux-kernel@vger.kernel.org, linux@dominikbrodowski.net,
 qemu-devel@nongnu.org, graf@amazon.com, linux-crypto@vger.kernel.org,
 pavel@ucw.cz, tytso@mit.edu, mikelley@microsoft.com, lersek@redhat.com,
 arnd@arndb.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 04:42:47PM +0100, Jason A. Donenfeld wrote:
> Hey folks,
> 
> Having finally wrapped up development of the initial vmgenid driver, I
> thought I'd pull together some thoughts on vmgenid, notification, and
> propagating, from disjointed conversations I've had with a few of you
> over the last several weeks.
> 
> The basic problem is: VMs can be cloned, forked, rewound, or
> snapshotted, and when this happens, a) the RNG needs to reseed itself,
> and b) cryptographic algorithms that are not reuse resistant need to
> reinitialize in one way or another. For 5.18, we're handling (a) via the
> new vmgenid driver, which implements a spec from Microsoft, whereby the
> driver receives ACPI notifications when a 16 byte unique value changes.
> 
> The vmgenid driver basically works, though it is racy, because that ACPI
> notification can arrive after the system is already running again. This
> race is even worse on Windows, where they kick the notification into a
> worker thread, which then publishes it upward elsewhere to another async
> mechanism, and eventually it hits the RNG and various userspace apps.
> On Linux it's not that bad -- we reseed immediately upon receiving the
> notification -- but it still inherits this same "push"-model deficiency,
> which a "pull"-model would not have.
> 
> If we had a "pull" model, rather than just expose a 16-byte unique
> identifier, the vmgenid virtual hardware would _also_ expose a
> word-sized generation counter, which would be incremented every time the
> unique ID changed. Then, every time we would touch the RNG, we'd simply
> do an inexpensive check of this memremap()'d integer, and reinitialize
> with the unique ID if the integer changed. In this way, the race would
> be entirely eliminated. We would then be able to propagate this outwards
> to other drivers, by just exporting an extern symbol, in the manner of
> `jiffies`, and propagate it upwards to userspace, by putting it in the
> vDSO, in the manner of gettimeofday. And like that, there'd be no
> terrible async thing and things would work pretty easily.

I am not sure what the difference is though. So we have a 16 byte unique
value and you would prefer a dword counter. How is the former not a
superset of the later?  I'm not sure how safe it is to expose it to
userspace specifically, but rest of text talks about exposing it to a
kernel driver so maybe not an issue? So what makes interrupt driven
required, and why not just remap and read existing vmgenid in the pull
manner?  What did I miss?


> But that's not what we have, because Microsoft didn't collaborate with
> anybody on this, and now it's implemented in several hypervisors. Given
> that I'm already spending considerable time working on the RNG, entirely
> without funding, somehow I'm not super motivated to lead a
> cross-industry political effort to change Microsoft's vmgenid spec.
> Maybe somebody else has an appetite for this, but either way, those
> changes would be several years off at best.
> 
> So given we have a "push"-model mechanism, there are two problems to
> tackle, perhaps in the same way, perhaps in a different way:
> 
> A) Outwards propagation toward other kernel drivers: in this case, I
>    have in mind WireGuard, naturally, which very much needs to clear its
>    existing sessions when VMs are forked.
> 
> B) Upwards propagation to userspace: in this case, we handle the
>    concerns of the Amazon engineers on this thread who broached this
>    topic a few years ago, in which s2n, their TLS library, wants to
>    reinitialize its userspace RNG (a silly thing, but I digress) and
>    probably clear session keys too, for the same good reason as
>    WireGuard.
> 
> For (A), at least wearing my WireGuard-maintainer hat, there is an easy
> way and there is a "race-free" way. I use scare quotes there because
> we're still in a "push"-model, which means it's still racy no matter
> what.
> 
> The faux "race-free" way involves having `extern u32 rng_vm_generation;`
> or similar in random.h, and then everything that generates a session key
> would snapshot this value, and every time a session key is used, a
> comparison would be made. This works, but given that we're going to be
> racy no matter what, I think I'd prefer avoiding the extra code in the
> hot path and extra per-session storage. It seems like that'd involve a
> lot of fiddly engineering for no real world benefit.
> 
> The easy way, and the way that I think I prefer, would be to just have a
> sync notifier_block for this, just like we have with
> register_pm_notifier(). From my perspective, it'd be simplest to just
> piggy back on the already existing PM notifier with an extra event,
> PM_POST_VMFORK, which would join the existing set of 7, following
> PM_POST_RESTORE. I think that'd be coherent. However, if the PM people
> don't want to play ball, we could always come up with our own
> notifier_block. But I don't see the need. Plus, WireGuard *already*
> uses the PM notifier for clearing keys, so code-wise for my use case,
> that'd amount adding another case for PM_POST_VMFORK, in addition to the
> currently existing PM_HIBERNATION_PREPARE and PM_SUSPEND_PREPARE cases,
> which all would be treated the same way. Ezpz. So if that sounds like an
> interesting thing to the PM people, I think I'd like to propose a patch
> for that, possibly even for 5.18, given that it'd be very straight-
> forward.
> 
> For (B), it's a little bit trickier. But I think our options follow the
> same rubric. We can expose a generation counter in the vDSO, with
> semantics akin to the extern integer I described above. Or we could
> expose that counter in a file that userspace could poll() on and receive
> notifications that way. Or perhaps a third way. I'm all ears here.
> Alex's team from Amazon last year proposed something similar to the vDSO
> idea, except using mmap on a sysfs file, though from what I can tell,
> that wound up being kind of complicated. Due to the fact that we're
> _already_ racy, I think I'm most inclined at this point toward the
> poll() approach for the same reasons as I prefer a notifier_block. But
> on userspace I could be convinced otherwise, and I'd be interested in
> totally different ideas here too.
> 
> Another thing I should note is that, while I'm not currently leaning
> toward it, the vDSO approach also ties into interesting discussions
> about userspace RNGs (generally a silly idea), and their need for things
> like fork detection and also learning when the kernel RNG was last
> reseeded. So cracking open the vDSO book might invite all sorts of other
> interesting questions and discussions, which may be productive or may be
> a humongous distraction. (Also, again, I'm not super enthusiastic about
> userspace RNGs.)
> 
> Also, there is an interesting question to decide with regards to
> userspace, which is whether the vmgenid driver should expose its unique
> ID to userspace, as Alex requested on an earlier thread. I am actually
> sort of opposed to this. That unique ID may or may not be secret and
> entropic; if it isn't, the crypto is designed to not be impacted
> negatively, but if it is, we should keep it secret. So, rather, I think
> the correct flow is that userspace simply calls getrandom() upon
> learning that the VM forked, which is guaranteed to have been
> reinitialized already by add_vmfork_randomness(), and that will
> guarantee a value that is unique to the VM, without having to actually
> expose that value.
> 
> So, anyway, this is more or less where my thinking on this matter is.
> Would be happy to hear some fresh ideas here too.
> 
> Regards,
> Jason


