Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ACA2AD14F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 09:31:04 +0100 (CET)
Received: from localhost ([::1]:39184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcP3M-0000LV-U8
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 03:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kcP20-0008KY-N1
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:29:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kcP1x-0006ae-Qe
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:29:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604996972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ow1oINGRvxHgz7R9lYkE1Bo9rWT8wbl8ktSDmjxKZgE=;
 b=EHm4kDbBwNzB6Rotmp8dLkJ6dPHM3byBdrYyBt/uHCpg6B8IrdpZkjDAPiCcEuBQS6y1FO
 JwJMNpHElKeWrLPymX1GIc35rwPNzMJuRm5Zadg5sSpS6aFMkRB59Yigr6BcwkMbEIYfYK
 tpidoIskVSvD3JqeYXEwheP6X24E4+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-Yby3Xb1bP9qiKaTWzKUzzQ-1; Tue, 10 Nov 2020 03:29:30 -0500
X-MC-Unique: Yby3Xb1bP9qiKaTWzKUzzQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74F025F9D6
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:29:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1770C6EF7F;
 Tue, 10 Nov 2020 08:29:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 48A331132BD6; Tue, 10 Nov 2020 09:29:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 4/6] qemu-option: clean up id vs. list->merge_lists
References: <20201109133931.979563-1-pbonzini@redhat.com>
 <20201109133931.979563-5-pbonzini@redhat.com>
 <87wnyu4gf9.fsf@dusky.pond.sub.org>
 <736a0053-83b9-3510-82ad-99ea59ea00fe@redhat.com>
 <87a6vq4bqj.fsf@dusky.pond.sub.org>
 <e6fbdb7a-c352-bb81-1dad-7f19c704b108@redhat.com>
Date: Tue, 10 Nov 2020 09:29:27 +0100
In-Reply-To: <e6fbdb7a-c352-bb81-1dad-7f19c704b108@redhat.com> (Paolo
 Bonzini's message of "Mon, 9 Nov 2020 19:59:00 +0100")
Message-ID: <87o8k5zkbc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 09/11/20 19:38, Markus Armbruster wrote:
>>> They are never qemu_opts_find'd with non-NULL id, so I'd say they are.
>> 
>> We also need to check qemu_opts_foreach().
>
> Using qemu_opts_foreach means that e.g. -name id=... was not ignored 
> unlike -M id=....  However, it will be an error now.  We have to check 
> if the callback or its callees use the opt->id

Yes.

> Reminder of how the affected options are affected:

In general, the patch rejects only options that used to be silently
ignored.  As we will see below, there are exceptions where we reject
options that used to work.  Do we want that?

If yes, discuss in commit message and release notes.

More below.

> reopen_opts in qemu-io-cmds.c	qemu_opts_find(&reopen_opts, NULL)

    qopts = qemu_opts_find(&reopen_opts, NULL);
    opts = qopts ? qemu_opts_to_qdict(qopts, NULL) : qdict_new();
    qemu_opts_reset(&reopen_opts);

I guess this could use qemu_find_opts_singleton().  Not sure we want it,
and even if we do, it's not this patch's job.

>
> empty_opts in qemu-io.c		qemu_opts_find(&empty_opts, NULL)

Likewise.

> qemu_rtc_opts			qemu_find_opts_singleton("rtc")
>
> qemu_machine_opts		qemu_find_opts_singleton("machine")

No surprises or funnies here.

> qemu_boot_opts			
> 	QTAILQ_FIRST(&qemu_find_opts("bootopts")->head)

Spelled "boot-opts", and used with a variable spliced on, which defeated
my grep.  It's in hw/nvram/fw_cfg.c and hw/s390x/ipl.c.

vl.c additionally has qemu_opts_find(qemu_find_opts("boot-opts"), NULL).

If the user passes multiple -boot with different ID, we merge the ones
with same ID, and then vl.c gets the (merged) one without ID, but the
other two get the (merged) one that contains the first -boot.  All three
silently ignore the ones they don't get.  Awesomely weird.  I'd call it
a bug.

Test case:

    $ upstream-qemu -S -display none -boot strict=on,id=id -boot strict=off

vl.c uses strict=off, but fw_cfg.c uses strinct=on,id=id.

Outlawing "id" with .merge_lists like this patch does turns the cases
where the two methods yield different results into errors.  This could
break working (if crazy) configurations.  That's okay; I can't see how
the craziness could be fixed without breaking crazy configurations.

I think the commit message should cover this.

I believe we could use qemu_find_opts_singleton() in all three spots.
Not this patch's job.

>
> qemu_name_opts			qemu_opts_foreach->parse_name
> 				parse_name does not use id

First, we use .merge_lists to merge -name with the same ID into a single
QemuOpts, then we use code to merge the resulting QemuOpts, ignoring ID.
Stupid.

Outlawing "id" with .merge_lists like this patch does makes the second
merge a no-op.

This is one of the cases where we reject options that used to work.

If that's wanted, follow-up patch to drop the useless second merge.

If not, unset qemu_name_opts.merge_lists in a separate patch before this
one.

> qemu_mem_opts			qemu_find_opts_singleton("memory")

No surprises or funnies here.

> qemu_icount_opts		qemu_opts_foreach->do_configuree_icount
> 				do_configure_icount->icount_configure
> 				icount_configure does not use id

Same story as for qemu_name_opts.

> qemu_smp_opts
> 	qemu_opts_find(qemu_find_opts("smp-opts"), NULL)

No surprises or funnies here.

> qemu_spice_opts			QTAILQ_FIRST(&qemu_spice_opts.head)

We use the merged one that contains the first -spice, and silently
ignore the rest.  At least we're consistent here.

This is one of the cases where we reject options that used to work.

If that's wanted, follow-up patch to replace the QTAILQ_FIRST() by
something saner.

If not, unset qemu_spice_opts.merge_lists in a separate patch before
this one, and merge like we do for qemu_name_opts.

> To preempt your question, I can add this in the commit message.  Anyway 
> I think it's relatively self-explanatory for most of these that they do 
> not need "id".

Except where they don't need it, but permit it to have an effect anyway.

One of the issues with QemuOpts is that there are too many "clever" ways
to use it.

>>> - merge_lists = false: singleton opts with NULL id; non-NULL id fails
>>
>> Do you mean merge_lists = true here, and ...
>> 
>>> - merge_lists = true: always return new opts; non-NULL id fails if dup
>>
>> ... = false here?
>
> Of course.  1-1 in the brain fart competition.

Hah!


