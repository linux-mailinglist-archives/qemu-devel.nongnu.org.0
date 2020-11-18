Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35222B7E18
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 14:10:11 +0100 (CET)
Received: from localhost ([::1]:43158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfNDu-0005Tn-QD
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 08:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfNCN-00052Z-Lf
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:08:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfNCL-0000S0-1a
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605704911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DsRVkgXA8iXKC4R+qvW031K/BvidSEcmXxdEXwZj3Ig=;
 b=aVd8GZdw9seEdy1OVt4NRiCoQUPSLRQo3dbIQS7cM8qIqiwV+WOQPl7HxjIKYGz6z6eXxI
 kxnBo+PzDsCjbEcNuiFucGBbkrGG/pN1iTnfj5hKC80m+5ImJBmHu7bbSnWAO+MBWqFvWb
 AalKwRCyY3u2Q17npv8K3ujWndTNn2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-hgYxDl3zNo6c4LqOSYT4qg-1; Wed, 18 Nov 2020 08:08:29 -0500
X-MC-Unique: hgYxDl3zNo6c4LqOSYT4qg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A961108E1AB;
 Wed, 18 Nov 2020 13:08:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C91718E3C;
 Wed, 18 Nov 2020 13:08:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1A9A011358BA; Wed, 18 Nov 2020 14:08:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
 <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
 <20201116211352.GC1235237@habkost.net>
 <87mtzgbc29.fsf@dusky.pond.sub.org>
 <20201118011917.GB10041@SPB-NB-133.local>
 <87ft57oycu.fsf@dusky.pond.sub.org>
 <b9307f87-5350-21a6-68dd-d4efbae5e502@redhat.com>
Date: Wed, 18 Nov 2020 14:08:21 +0100
In-Reply-To: <b9307f87-5350-21a6-68dd-d4efbae5e502@redhat.com> (Paolo
 Bonzini's message of "Wed, 18 Nov 2020 10:21:06 +0100")
Message-ID: <87r1oqlsmy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 18/11/20 09:36, Markus Armbruster wrote:
>> 
>> The part that counts is do_configure_accelerator().  I works as follows:
>> 
>> 1. Look up the chosen accelerator's QOM type (can fail)
>> 2. Instantiate it (can't fail)
>> 3. Set properties (can fail)
>> 4. Connect the accelerator to the current machine (can fail)
>> 
>> Aside: step 3 uses &error_fatal, unlike the other failures.  Fishy.
>
> That's because step 3 is a user error, unlike (in the usual case) the 
> others:
>
> 1. You get it from "-accel whpx" if whpx is not available; this is not a 
> user error if there is a fallback.  You also get it from misspellings 
> such as "-accel kvmm", which is presumably a user error, but it's hard 
> to distinguish the two especially if a future version of QEMU ends up 
> adding a "kvmm" accelerator
>
> 3. You get it from "-accel tcg,misspeled-property=off".  This is a user 
> error.  You also get it from "-accel tcg,absent-property=on" and "-accel 
> tcg,invalid-value=42".  This may be a property that the user wants to 
> set but was only added in a future version of QEMU.  Either way, it's 
> quite likely that the user does _not_ want a fallback here.
>
> 4. Here the accelerator exists but the machine does not support it.  The 
> choice is to fallback to the next accelerato.
>
> This means there is no way for the user to distinguish "the accelerator 
> doesn't exist" from "the accelerator exists but is not supported".  This 
> was done for no particular reason other than to keep the code simple.

The resulting error reporting is perhaps not as clear as it could be.

We report several kinds of errors:

(a) Accelerator misconfiguration, immediately fatal

(b) Accelerator doesn't work, not fatal (we fall back to the next one)

(c) "no accelerator found", fatal

(d) "falling back to", not fatal (we carry on)

Reporting (b) as error is questionable, because it need not be an actual
error.

We report (d) when an accelerator works after other(s) didn't.  This is
not actually an error.

Example:

    $ qemu-system-x86_64 -accel xen -S -accel nonexistent -accel kvm
    xencall: error: Could not obtain handle on privileged command interface: No such file or directory
    xen be core: xen be core: can't open xen interface
    can't open xen interface

So far, this is just libxen* and accel/xen/xen-all.c being loquacious.

    qemu-system-x86_64: -accel xen: failed to initialize xen: Operation not permitted
    qemu-system-x86_64: -accel nonexistent: invalid accelerator nonexistent
    qemu-system-x86_64: falling back to KVM

These look like errors, but aren't; things are working exactly as
intended, and QEMU runs.  If we want to be chatty about it, we should
make them info, not error.

Note that a nonsensical accelerator is treated just like an accelerator
that exists, but happens to be unavailable.  Trap for less than perfect
typists.

Same with /dev/kvm made inaccessible:

    $ qemu-system-x86_64 -accel xen -S -accel nonexistent -accel kvm
    [Xen chatter...]
    qemu-system-x86_64: -accel xen: failed to initialize xen: Operation not permitted
    qemu-system-x86_64: -accel nonexistent: invalid accelerator nonexistent
    Could not access KVM kernel module: Permission denied
    qemu-system-x86_64: -accel kvm: failed to initialize kvm: Permission denied

Here, we do have a fatal error.  We report it as four errors.
Tolerable.

If we turn the maybe-not-really-errors into info to make the first
example less confusing, we need to report a "no accelerator works" error
at the end.

>> Failure in step 1 is "accelerator not compiled in".  Predictable with
>> qom-list-types.
>> 
>> Failure in step 3 doesn't look predictable.
>
> It's more or less predictable with qom-list-properties, though of course 
> not the "invalid value for the property" case.
>
>> Failure in step 4 can be due to kernel lacking (a workable version of)
>> KVM, but the current machine gets a say, too.  Also doesn't look
>> predictable.
>> 
>> Aside: kvm_init() reports errors with fprintf(), tsk, tsk, tsk.
>> 
>> Existing query-kvm doesn't really predict failure, either.  'present' is
>> true if CONFIG_KVM.  Should be equivalent to "QOM type exists",
>> i.e. step 1.  I guess 'enabled' is true when the KVM accelerator is in
>> use.
>> 
>> While figuring this out, I noticed that the TYPE_ACCEL instance we
>> create doesn't get its parent set.  It's therefore not in the QOM
>> composition tree, and inaccessible with qom-get.  Paolo, is this as it
>> should be?
>
> It should be added, I agree, perhaps as /machine/accel.

Makes sense.

Thanks!


