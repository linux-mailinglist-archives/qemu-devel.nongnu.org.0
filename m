Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6234956A6AB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 17:09:55 +0200 (CEST)
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9T8b-0002g6-OT
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 11:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9T6o-0001Zg-AV
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:08:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9T6k-0004QL-K2
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657206477;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ry4V5hAI+BOjZ1OEnIThgFJip6l11r6t6PRULW0bJio=;
 b=Qt9/gSWqFoo9sxur/l0DK3lrKlDmwKknExqAzJQaitHTtTCdHTJMRwPPo8tR4XwTYGLZrO
 TGWuMq+QIAzyhdIZFxN4FPlVuUDQkk/sKMH4gxigjjlq3NgFXicxKKkFUr4solvDY2N5Ga
 pxX4uVZ1czuKxPu/VeCjyJTeSSWVOtY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-P9Dj-0rRMyafuwFx-sT0pQ-1; Thu, 07 Jul 2022 11:07:48 -0400
X-MC-Unique: P9Dj-0rRMyafuwFx-sT0pQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2B8A3C10697;
 Thu,  7 Jul 2022 15:07:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6F0640315B;
 Thu,  7 Jul 2022 15:07:46 +0000 (UTC)
Date: Thu, 7 Jul 2022 16:07:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: Re: [RFC PATCH] qobject: Rewrite implementation of QDict for
 in-order traversal
Message-ID: <Ysb2wJDaND8ERpP1@redhat.com>
References: <20220705095421.2455041-1-armbru@redhat.com>
 <CAFEAcA-xaQSOGWixtnq0XosSsdt2VKACxgCK5KpdkNscBPD-wA@mail.gmail.com>
 <87zghlatgo.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87zghlatgo.fsf@pond.sub.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jul 07, 2022 at 04:27:35PM +0200, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On Tue, 5 Jul 2022 at 10:54, Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> QDict is implemented as a simple hash table of fixed size.  Observe:
> >>
> >> * Slow for large n.  Not sure this matters.
> >>
> >> * A QDict with n entries takes 4120 + n * 32 bytes on my box.  Wastes
> >>   space for small n, which is a common case.
> >>
> >> * Order of traversal depends on the hash function and on insertion
> >>   order, because it iterates first over buckets, then collision
> >>   chains.
> >>
> >> * Special code ensures qdict_size() takes constant time.
> >>
> >> Replace the hash table by a linked list.  Observe:
> >>
> >> * Even slower for large n.  Might be bad enough to matter.
> >>
> >> * A QDict with n entries takes 32 + n * 24 bytes.
> >>
> >> * Traversal is in insertion order.
> >>
> >> * qdict_size() is linear in the number of entries.
> >>
> >> This is an experiment.  Do not commit to master as is.
> >>
> >> The change of traversal order affects expected test output.  I updated
> >> only the tests covered by "make check" so far.  I expect some more to
> >> hide under tests/qemu-iotests/.
> >
> > Seems to fix the 'rocker' device regression, at least in that
> > it no longer gives an error message on startup.
> >
> > The amount of patching you had to do to expected-output files
> > in 'tests' suggests we have quite a lot of test cases that
> > are currently implicitly reliant on the hash table traversal
> > order, which is not guaranteed to remain stable.
> 
> Correct.
> 
> I expect to find a few more in tests not run by "make check".
> 
> >                                                  Regardless of
> > what we do with this patch it would probably be a good idea
> > for whatever is outputting the text these tests are comparing
> > against to be made to use a stable output order (alphabetical??).
> 
> Traversal order before the patch depends on the (fixed) size of the hash
> table and the has function for (string) keys.  Both have remained
> unchanged since the initial commit (2009), which is why we've gotten
> away with relying on it in tests.

We're lucky to have got away with such a crude hash table impl without
anyone (to our knowledge) identifying a way to abuse it for a denial
of service. For robustness, string key hashing functions really ought
to be non-deterministic between invokations of the program at the very
least, even better if non-deterministic across each hashtable instance.
If hashing is deterministic then a malicious user can sometimes abuse
this to force the hash table performance to degrade from O(log(n)) to
O(n). A fast cryptographic hash function is the gold standard.

See also https://lwn.net/Articles/474912/

I recall we discussed this back in the day when that LWN article came
out and decided QEMU was safe-ish. The believe was that QEMU doesn't
take JSON input from any source that is less trustworthy than itself.
Or when it does, it is already expected that the upper level mgmt
layer will have santised input before passing it to QEMU. eg a qcow2
file can contain JSON backing store, but if an app gets a random disk
image from untrusted source, it must already validate that a backing
store absent or sane, before invoking QEMU (eg to  avoid telling
QEMU to open /dev/shadow as its backing store).

None the less, I would still be more comfortable if we have a robust
non-determinstic hashing function, if we have even the slighest feeling
that that O(1) lookup is important for any part of QEMU's QDict usage.

The QMP communication of course is all betwween QEMU and libvirt, where
QEMU is the untrusted party, so libvirt needs protection aaginst
malicious QEMU, but QEMU trustes libvirt.  QEMU doesn't talk to the
guest agent itself, so ok in that area too, and of course the CLI argv
is trusted.

Particular with the multi-process QEMU work though, and/or vhostuser
backends, etc, we are probably moving to a world where some parts of
QEMU are less trusted than other parts of QEMU. So this kind of thing
may yet become important to some degree.

> Traversal order after the patch depends on insertion order.  I think
> this is already an improvement for the tests: now the expected output
> depends on what the test does, not on how qdict.c does its job.

For machine targetted output it is a saner. For human targetted
output I'd say no significant win.

> If we think this still isn't good enough, we can investigate how to get
> test output where the keys are in alphabetical order.

This essentially comes down to the JSON serializer, which iterates over
the keys when outputting json objects. The serializer could apply sorting
of keys itself based on any criteria it chooses, regardless of what the
QDict impl provides. Probably make JSON serializer marginally less
efficient but not neccessarily the end of the world.

Co-incidentally it'd make libvirt a little happier, as we store the
output of many QMP commands for our test suite, and those output docs
can change wildly as we update them for new QEMU versions / git snapshots


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


