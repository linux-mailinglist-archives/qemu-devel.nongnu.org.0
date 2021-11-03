Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA63443DFB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:04:41 +0100 (CET)
Received: from localhost ([::1]:42552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miBGC-0006V0-Pw
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miBEW-0005I8-7g
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:02:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miBET-0005Fh-Id
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635926572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTIIG/4S2v7ww/D79KnlRXk32aabES7nI+ZNLau7tQw=;
 b=K+FnouXXpaamm5xjjAngiJIM4saXy1QPFOJfEEDEYbK9/whkxdEQqgziVI0EKV3/r9UstI
 uATZ13McCr+s7KzRsuEzA5f9zEsh1ks46PLJahqHXorSK0ZX8U+DQbBYMoNzGjcB83CfKU
 hxd9sGR1cIEBm5wQi4MW5n5q7YZEAsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-JfCeLrhVN1mIUQNNwI4VhA-1; Wed, 03 Nov 2021 04:02:51 -0400
X-MC-Unique: JfCeLrhVN1mIUQNNwI4VhA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E58DE879512
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 08:02:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9121C1009AB7;
 Wed,  3 Nov 2021 08:02:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2894C11380A7; Wed,  3 Nov 2021 09:02:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] qmp: Stabilize preconfig
References: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
 <87bl3dfg9v.fsf@dusky.pond.sub.org>
 <bb896561-9d0c-6c6c-4bdb-5e7ef5ed71d5@redhat.com>
 <YYAATW1JQmzpDPhu@redhat.com>
Date: Wed, 03 Nov 2021 09:02:49 +0100
In-Reply-To: <YYAATW1JQmzpDPhu@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Mon, 1 Nov 2021 14:57:17 +0000")
Message-ID: <87zgqlzmxi.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Nov 01, 2021 at 03:37:58PM +0100, Michal Pr=C3=ADvozn=C3=ADk wrot=
e:
>> On 10/25/21 2:19 PM, Markus Armbruster wrote:
>> > Michal Privoznik <mprivozn@redhat.com> writes:
>> >=20
>> >> The -preconfig option and exit-preconfig command are around for
>> >> quite some time now. However, they are still marked as unstable.
>> >> This is suboptimal because it may block some upper layer in
>> >> consuming it. In this specific case - Libvirt avoids using
>> >> experimental features.
>> >>
>> >> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>> >=20
>> > If I remember correctly, the motivation for -preconfig was NUMA
>> > configuration via QMP.  More uses may have appeared since.
>> >=20
>> > Back then, I questioned the need for yet another option and yet anothe=
r
>> > state: why not -S?
>> >=20
>> > The answer boiled down to
>> >=20
>> > 0. Yes, having just one would be a simpler and cleaner interface, but
>> >=20
>> > 1. the godawful mess QEMU startup has become makes -S unsuitable for
>> >    some things we want to do, so we need -preconfig,
>> >=20
>> > 2. which is in turn unsuitable for other things we want to do, so we
>> >    still need -S".
>> >=20
>> > 3. Cleaning up the mess to the point where "simpler and cleaner" becom=
es
>> >    viable again is not in the cards right now.
>>=20
>> I see a difference between the two. -preconfig starts QEMU in such a way
>> that its configuration can still be changed (in my particular use case
>> vCPUs can be assigned to NUMA nodes), while -S does not allow that. If
>> we had one state for both, then some commands must be forbidden from
>> executing as soon as 'cont' is issued. Moreover, those commands would
>> need to do much more than they are doing now (e.g. regenerate ACPI table
>> after each run). Subsequently, validating configuration would need to be
>> postponed until the first 'cont' because with just one state QEMU can't
>> know when the last config command was issued.

Doesn't all this apply to x-exit-preconfig already?

* Some commands are only allowed before x-exit-preconfig,
  e.g. set-numa-node.

* The complete (pre-)configuration is only available at
  x-exit-preconfig.  In particular, ACPI tables can be fixed only then.

>> Having said all of that, I'm not sure if -preconfig is the way to go or
>> we want to go the other way. I don't have a strong opinion.
>
> It feels like the scenario here is really just a specialization of the
> more general problem we want to be able to solve. Namely, we want to be
> able to start a bare QEMU and configure it entirely on the fly. IOW, we
> are really targetting for -preconfig to be able to do /all/ configuration=
,
> and with a new ELF binary, at which point -preconfig wouldn't exist, it
> would be the implicit default.

Whether -preconfig is the default or an option doesn't matter for
discussing the state machine.

> Libvirt primarily uses -S because it needs to query various aspects of
> QEMU's config before CPUs start executing, while QEMU can still be
> considered trustworthy (as it hasn't executed untrusted guest code=20
> yet). eg we query vCPU PIDs so that we can apply CPU pinning to them.=20
> We query the CPU model features so we can reflect what exact CPU=20
> features we got from KVM. There are various other examples.

Which of the queries you need work only between x-exit-preconfig and -S?

Which of them could be made to work before x-exit-preconfig?

> I don't see this as inherantly tied to the -S option from a conceptual
> POV. We do have some ordering constraints, but they are not as crude
> as -preconfig / -S.  For querying vCPU PIDs, we have a constraint that
> the accelerator and machine objects must have been created. For querying
> CPU models, we have a similar constraint.  IOW, libvirt should be fine
> with doing /everything/ in a hypothetical -preconfig state, provided
> that we know about the ordering constraints wrt object creation.

Plausible.

> The secondary reason we use -S is that sometimes the mgmt app does
> not actually want the guest CPUs to start running - they actively
> want it in a paused state initially and will manually start CPUs
> later. One reason is to enable them to open the serial console
> backend before CPUs start, to guarantee that no console output is
> lost in that small startup window.  This is really the original
> purpose of -S.  This doesn't imply a need for -S. I'd say that
> -preconfig should essentially imply -S by default. If you're
> already doing lots of things via QMP, being required to issue
> a 'cont' command is no hardship.

I wonder whether we really have to step through three states

         x-exit-preconfig  cont
    preconfig ---> pre run ---> run

and not two

            cont
    pre run ---> run


