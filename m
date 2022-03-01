Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA2D4C8F59
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 16:44:34 +0100 (CET)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP4fx-0006YN-AN
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 10:44:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org>)
 id 1nP4eY-0004w9-AB
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:43:06 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:59738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org>)
 id 1nP4eV-0002Qq-Q6
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:43:05 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0C12B81986;
 Tue,  1 Mar 2022 15:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29085C340EE;
 Tue,  1 Mar 2022 15:42:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Kac+Ghbs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1646149373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=JLiE20ERfAkQFV80+EpmUJ32l4pWt7u7GFd3/Smjljc=;
 b=Kac+Ghbs0J+S7FgJnGjfLHTzX3vnHgJEAB0OxfoQbxx04yySDohXAMM2HRfEeyUEK2OqK/
 pmZCqrjaD2690aWP1GxnDzgjg7GPEdvD3QdFZ3AFITYG1z3LFxNjADK6jlyoY+y3i54pu0
 CjjzcBGVb2Fze1SPHfZMLuDTnBcZhtc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bf755614
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 1 Mar 2022 15:42:53 +0000 (UTC)
Date: Tue, 1 Mar 2022 16:42:47 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, linux-hyperv@vger.kernel.org,
 linux-crypto@vger.kernel.org, graf@amazon.com,
 mikelley@microsoft.com, gregkh@linuxfoundation.org,
 adrian@parity.io, lersek@redhat.com, berrange@redhat.com,
 linux@dominikbrodowski.net, jannh@google.com, mst@redhat.com,
 rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz,
 linux-pm@vger.kernel.org, colmmacc@amazon.com, tytso@mit.edu, arnd@arndb.de
Subject: propagating vmgenid outward and upward
Message-ID: <Yh4+9+UpanJWAIyZ@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey folks,

Having finally wrapped up development of the initial vmgenid driver, I
thought I'd pull together some thoughts on vmgenid, notification, and
propagating, from disjointed conversations I've had with a few of you
over the last several weeks.

The basic problem is: VMs can be cloned, forked, rewound, or
snapshotted, and when this happens, a) the RNG needs to reseed itself,
and b) cryptographic algorithms that are not reuse resistant need to
reinitialize in one way or another. For 5.18, we're handling (a) via the
new vmgenid driver, which implements a spec from Microsoft, whereby the
driver receives ACPI notifications when a 16 byte unique value changes.

The vmgenid driver basically works, though it is racy, because that ACPI
notification can arrive after the system is already running again. This
race is even worse on Windows, where they kick the notification into a
worker thread, which then publishes it upward elsewhere to another async
mechanism, and eventually it hits the RNG and various userspace apps.
On Linux it's not that bad -- we reseed immediately upon receiving the
notification -- but it still inherits this same "push"-model deficiency,
which a "pull"-model would not have.

If we had a "pull" model, rather than just expose a 16-byte unique
identifier, the vmgenid virtual hardware would _also_ expose a
word-sized generation counter, which would be incremented every time the
unique ID changed. Then, every time we would touch the RNG, we'd simply
do an inexpensive check of this memremap()'d integer, and reinitialize
with the unique ID if the integer changed. In this way, the race would
be entirely eliminated. We would then be able to propagate this outwards
to other drivers, by just exporting an extern symbol, in the manner of
`jiffies`, and propagate it upwards to userspace, by putting it in the
vDSO, in the manner of gettimeofday. And like that, there'd be no
terrible async thing and things would work pretty easily.

But that's not what we have, because Microsoft didn't collaborate with
anybody on this, and now it's implemented in several hypervisors. Given
that I'm already spending considerable time working on the RNG, entirely
without funding, somehow I'm not super motivated to lead a
cross-industry political effort to change Microsoft's vmgenid spec.
Maybe somebody else has an appetite for this, but either way, those
changes would be several years off at best.

So given we have a "push"-model mechanism, there are two problems to
tackle, perhaps in the same way, perhaps in a different way:

A) Outwards propagation toward other kernel drivers: in this case, I
   have in mind WireGuard, naturally, which very much needs to clear its
   existing sessions when VMs are forked.

B) Upwards propagation to userspace: in this case, we handle the
   concerns of the Amazon engineers on this thread who broached this
   topic a few years ago, in which s2n, their TLS library, wants to
   reinitialize its userspace RNG (a silly thing, but I digress) and
   probably clear session keys too, for the same good reason as
   WireGuard.

For (A), at least wearing my WireGuard-maintainer hat, there is an easy
way and there is a "race-free" way. I use scare quotes there because
we're still in a "push"-model, which means it's still racy no matter
what.

The faux "race-free" way involves having `extern u32 rng_vm_generation;`
or similar in random.h, and then everything that generates a session key
would snapshot this value, and every time a session key is used, a
comparison would be made. This works, but given that we're going to be
racy no matter what, I think I'd prefer avoiding the extra code in the
hot path and extra per-session storage. It seems like that'd involve a
lot of fiddly engineering for no real world benefit.

The easy way, and the way that I think I prefer, would be to just have a
sync notifier_block for this, just like we have with
register_pm_notifier(). From my perspective, it'd be simplest to just
piggy back on the already existing PM notifier with an extra event,
PM_POST_VMFORK, which would join the existing set of 7, following
PM_POST_RESTORE. I think that'd be coherent. However, if the PM people
don't want to play ball, we could always come up with our own
notifier_block. But I don't see the need. Plus, WireGuard *already*
uses the PM notifier for clearing keys, so code-wise for my use case,
that'd amount adding another case for PM_POST_VMFORK, in addition to the
currently existing PM_HIBERNATION_PREPARE and PM_SUSPEND_PREPARE cases,
which all would be treated the same way. Ezpz. So if that sounds like an
interesting thing to the PM people, I think I'd like to propose a patch
for that, possibly even for 5.18, given that it'd be very straight-
forward.

For (B), it's a little bit trickier. But I think our options follow the
same rubric. We can expose a generation counter in the vDSO, with
semantics akin to the extern integer I described above. Or we could
expose that counter in a file that userspace could poll() on and receive
notifications that way. Or perhaps a third way. I'm all ears here.
Alex's team from Amazon last year proposed something similar to the vDSO
idea, except using mmap on a sysfs file, though from what I can tell,
that wound up being kind of complicated. Due to the fact that we're
_already_ racy, I think I'm most inclined at this point toward the
poll() approach for the same reasons as I prefer a notifier_block. But
on userspace I could be convinced otherwise, and I'd be interested in
totally different ideas here too.

Another thing I should note is that, while I'm not currently leaning
toward it, the vDSO approach also ties into interesting discussions
about userspace RNGs (generally a silly idea), and their need for things
like fork detection and also learning when the kernel RNG was last
reseeded. So cracking open the vDSO book might invite all sorts of other
interesting questions and discussions, which may be productive or may be
a humongous distraction. (Also, again, I'm not super enthusiastic about
userspace RNGs.)

Also, there is an interesting question to decide with regards to
userspace, which is whether the vmgenid driver should expose its unique
ID to userspace, as Alex requested on an earlier thread. I am actually
sort of opposed to this. That unique ID may or may not be secret and
entropic; if it isn't, the crypto is designed to not be impacted
negatively, but if it is, we should keep it secret. So, rather, I think
the correct flow is that userspace simply calls getrandom() upon
learning that the VM forked, which is guaranteed to have been
reinitialized already by add_vmfork_randomness(), and that will
guarantee a value that is unique to the VM, without having to actually
expose that value.

So, anyway, this is more or less where my thinking on this matter is.
Would be happy to hear some fresh ideas here too.

Regards,
Jason

