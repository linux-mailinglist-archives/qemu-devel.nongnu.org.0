Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70953467EE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:43:30 +0100 (CET)
Received: from localhost ([::1]:56770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOm01-0006h2-Lj
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOl1l-0000oz-Pt
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:41:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOl1f-0003WI-NM
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616521266;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZMSgzPqNEI96GTai8bceSFHD7FEfjyxk2Rd9KBrr/IA=;
 b=MIcLv4xQ+B6eDZRwgyZuEnqn/Slf02ivGtOVvDggiT9TJMhfD5gTiOugT3fGll7SZA/zix
 7U9lRHnrUAn4HnwByxDYM/mzPsmuySOwkjxqUS0n9zATXySa/dLKTNmMX1wMYtD/uLR5+n
 wNpqdnqtAIywKacec1QcyYboT2nW9JY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-yLiu8cNyMGSMx9guszQEQg-1; Tue, 23 Mar 2021 13:40:49 -0400
X-MC-Unique: yLiu8cNyMGSMx9guszQEQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6212C190B2A1;
 Tue, 23 Mar 2021 17:40:48 +0000 (UTC)
Received: from redhat.com (ovpn-113-223.ams2.redhat.com [10.36.113.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACBD95C1C5;
 Tue, 23 Mar 2021 17:40:39 +0000 (UTC)
Date: Tue, 23 Mar 2021 17:40:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: Ways to deal with broken machine types
Message-ID: <YFooFMWxwpiSB6ZJ@redhat.com>
References: <20210301195919.9333-1-cheptsov@ispras.ru>
 <20210322114116-mutt-send-email-mst@kernel.org>
 <B813DBC6-B989-4630-B2DE-8F5825484E78@ispras.ru>
 <20210323104542-mutt-send-email-mst@kernel.org>
 <71AD039B-775A-4DF3-B16D-4BC3768A20AC@ispras.ru>
 <a1a1b783-6217-cb22-0dd8-fab9b7971542@proxmox.com>
 <20210323175447.0c57d2a4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210323175447.0c57d2a4@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 qemu devel list <qemu-devel@nongnu.org>, Vitaly Cheptsov <cheptsov@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 05:54:47PM +0100, Igor Mammedov wrote:
> Let me hijack this thread for beyond this case scope.
> 
> I agree that for this particular bug we've done all we could, but
> there is broader issue to discuss here.
> 
> We have machine versions to deal with hw compatibility issues and that covers most of the cases,
> but occasionally we notice problem well after release(s),
> so users may be stuck with broken VM and need to manually fix configuration (and/or VM).
> Figuring out what's wrong and how to fix it is far from trivial. So lets discuss if we
> can help to ease this pain, yes it will be late for first victims but it's still
> better than never.

To summarize the problem situation

 - We rely on a machine type version to encode a precise guest ABI.
 - Due a bug, we are in a situation where the same machine type
   encodes two distinct guest ABIs due to a mistake introduced
   betwen QEMU N-2 and N-1
 - We want to fix the bug in QEMU N
 - For incoming migration there is no way to distinguish between
   the ABIs used in N-2 and N-1, to pick the right one

So we're left with an unwinnable problem:

  - Not fixing the bug =>

       a) user migrating N-2 to N-1 have ABI change
       b) user migrating N-2 to N have ABI change
       c) user migrating N-1 to N are fine

    No mitigation for (a) or (b)

  - Fixing the bug =>

       a) user migrating N-2 to N-1 have ABI change.
       b) user migrating N-2 to N are fine
       c) user migrating N-1 to N have ABI change

    Bad situations (a) and (c) are mitigated by
    backporting fix to N-1-stable too.

Generally we have preferred to fix the bug, because we have
usually identified them fairly quickly after release, and
backporting the fix to stable has been sufficient mitigation
against ill effects. Basically the people left broken are a
relatively small set out of the total userbase.

The real challenge arises when we are slow to identify the
problem, such that we have a large number of people impacted.


> I'll try to sum up idea Michael suggested (here comes my unorganized brain-dump),
> 
> 1. We can keep in VM's config QEMU version it was created on
>    and as minimum warn user with a pointer to known issues if version in
>    config mismatches version of actually used QEMU, with a knob to silence
>    it for particular mismatch.
> 
> When an issue becomes know and resolved we know for sure how and what
> changed and embed instructions on what options to use for fixing up VM's
> config to preserve old HW config depending on QEMU version VM was installed on.

> some more ideas:
>    2. let mgmt layer to keep fixup list and apply them to config if available
>        (user would need to upgrade mgmt or update fixup list somehow)
>    3. let mgmt layer to pass VM's QEMU version to currently used QEMU, so
>       that QEMU could maintain and apply fixups based on QEMU version + machine type.
>       The user will have to upgrade to newer QEMU to get/use new fixups.

The nice thing about machine type versioning is that we are treating the
versions as opaque strings which represent a specific ABI, regardless of
the QEMU version. This means that even if distros backport fixes for bugs
or even new features, the machine type compatibility check remains a
simple equality comparsion.

As soon as you introduce the QEMU version though, we have created a
large matrix for compatibility. This matrix is expanded if a distro
chooses to backport fixes for any of the machine type bugs to their
stable streams. This can get particularly expensive when there are
multiple streams a distro is maintaining.

*IF* the original N-1 qemu has a property that could be queried by
the mgmt app to identify a machine type bug, then we could potentially
apply a fixup automatically.

eg query-machines command in QEMU version N could report against
"pc-i440fx-5.0", that there was a regression fix that has to be
applied if property "foo" had value "bar".

Now, the mgmt app wants to migrate from QEMU N-2 or N-1 to QEMU N.
It can query the value of "foo" on the source QEMU with qom-get.
It now knows whether it has to override this property "foo" when
spawning QEMU N on the target host.

Of course this doesn't help us if neither N-1 or N-2 QEMU had a
property that can be queried to identify the bug - ie if the
property in question was newly introduced in QEMU N to fix the
bug.

> In my opinion both would lead to explosion of 'possibly needed' properties for each
> change we introduce in hw/firmware(read ACPI) and very possibly a lot of conditional
> branches in QEMU code. And I'm afraid it will become hard to maintain QEMU =>
> more bugs in future.
> Also it will lead to explosion of test matrix for downstreams who care about testing.
> 
> If we proactively gate changes on properties, we can just update fixup lists in mgmt,
> without need to update QEMU (aka Insite rules) at a cost of complexity on QMEU side.
> 
> Alternatively we can be conservative in spawning new properties, that means creating
> them only when issue is fixed and require users to update QEMU, so that fixups could
> be applied to VM.
> 
> Feel free to shoot the messenger down or suggest ways how we can deal with the problem.

The best solution is of course to not have introduced the ABI change in
the first place. We have lots of testing, but upstream at least, I don't
think we have anything that is explicitly recording the ABI associated
with each machine type and validating that it hasn't changed. We rely on
the developers to follow the coding practices wrt setting machine type
defaults for back compat, and while we're good, we inevitably screw up
every now & then.

Downstreams do have some of this ABI testing - several problems like the
one we have there, have been identified when RHEL downstream QE did
migration tests and found a change in RHEL machine types, which then
was traced back to upstream.

I feel like we need some standard tool which can be run inside a VM
that dumps all the possible ABI relevant information about the virtual
machine in a nice data format.

We would have to run this for each machine type, and save the
results to git immediately after release. Then for every change to
master, we would have to run the test again for every historic
machine type version and compare to the recorded ABI record.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


