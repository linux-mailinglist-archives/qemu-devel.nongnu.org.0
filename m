Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC54C38C5C5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 13:33:58 +0200 (CEST)
Received: from localhost ([::1]:48342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk3Ph-0002vP-LR
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 07:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk3Oe-0002E5-Sm
 for qemu-devel@nongnu.org; Fri, 21 May 2021 07:32:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk3Oc-0002su-GJ
 for qemu-devel@nongnu.org; Fri, 21 May 2021 07:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621596769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PcEYtReWpW8vTiRquGgjz+1A0prIy69DrW7jlmMS2cI=;
 b=RlRopb/r4OT654Zn4lG6qtQBxl41PERH4rUVx2aelt3+eSgz7Z2OnD5zYh3t2oV7EUv/So
 InyFmqtoscn4RBC9NSo1PWl9Ssnv0Ovbs+rS1d2iGfR87YA1rW/+kGebiV1SrRUaHmDj4R
 qWcGncdyN9KzeJZtukyNY6E5skJRIjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-cH_fLieqNDyflc_heSjiyw-1; Fri, 21 May 2021 07:32:45 -0400
X-MC-Unique: cH_fLieqNDyflc_heSjiyw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43331501F4;
 Fri, 21 May 2021 11:32:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 671AD10013C1;
 Fri, 21 May 2021 11:32:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CEFAE113865F; Fri, 21 May 2021 13:32:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 0/9] Initial support for machine creation via QMP
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <93ae82d3-f9a7-f347-a013-54ae5cdc95f7@redhat.com>
Date: Fri, 21 May 2021 13:32:41 +0200
In-Reply-To: <93ae82d3-f9a7-f347-a013-54ae5cdc95f7@redhat.com> (Paolo
 Bonzini's message of "Thu, 13 May 2021 19:52:41 +0200")
Message-ID: <87zgwo5nl2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 Mirela Grujic <mirela.grujic@greensocs.com>, mark.burton@greensocs.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Hi Mirela, this is very interesting!
>
> It's unfortunate that I completely missed the discussions in
> January/February.  You might have noticed that in the 5.2/6.0
> timeframe I worked on cleaning up the machine initialization phases
> and qemu_init.   The idea behind the cleanup was to identify clearly
> the steps from one phase to the next.  I am very happy that you are
> already benefitting from that work in this series and you were able to
> make a prototype with so little code.
>
> My plan was a bit more ambitious though :) and it is laid out at
> https://wiki.qemu.org/User:Paolo_Bonzini/Machine_init_sequence.
>
> My plan was to have completely different binaries than the current
> qemu-system-*.

Now you have 2x problems :)

>                 These would only have a handful of command line
> options (such as -name, -sandbox, -trace, -L) and would open a QMP
> connection on stdio.
>
> All other command line option would be either considered legacy or
> adjusted to be part of two new QMP commands, machine-set and
> accel-set, which would advance through the phases like this:
>
> PHASE_NO_MACHINE
>    -> machine-set -> PHASE_MACHINE_CREATED ->
>    -> accel-set -> PHASE_ACCEL_CREATED -> PHASE_MACHINE_INITIALIZED ->
>    -> finish-machine-init -> PHASE_MACHINE_READY
>    -> cont

Is machine-set one big command, or a sequence of commands, where each
command configures just one thing?

Same for accel-set.

Permit me to go off on a tangent: how much and what kind of magic do we
want in the initialization sequence?

The existing order is a confusing mess grown out of a half-hearted
attempt to make things just work.  We've talked about it a few times,
e.g. here:

    Message-ID: <87poomg77m.fsf@dusky.pond.sub.org>
    https://lists.nongnu.org/archive/html/qemu-devel/2016-09/msg00163.html

Are you aiming for "leave ordering to the user", or for "do the right
thing" (the user's order doesn't matter)", or for "neither; confusing
messes are fun"?

Another tangent:

1. A command line option is like a QMP command that returns nothing.
Generating CLI options from a QAPI schema is no harder than generating
QMP commands, it's just work.

2. A configuration file is like a command line, only easier to work with
when configuration becomes non-trivial.  Generating configuration file
language from a QAPI schema is no harder than generating QMP commands /
CLI options, it's just work.

3. QMP is strictly more powerful than CLI or comfiguration file.  It's
also less convenient for ad hoc use by humans: compare -readconfig
vm123.cfg to feeding the equivalent QMP commands with socat.

4. We'll see whether the convenience for humans can motivate us to put
in the work.

> I think this idea would work well with your plan below, because the
> preconfiguration that you need to do happens mostly at 
> PHASE_MACHINE_INITIALIZED.
>
> Of course, the disadvantage of my approach is that, in the initial
> version, a lot of capabilities of QEMU are not available (especially 
> with respect to the UI, since there's no "display-add"
> command). However, the basic implementation of machine-set and
> accel-set should not really be *that* much more work, and it should be
> doable in parallel with the conversion efforts for those options.  For
> example, today I posted a series that maps -smp to -M (and then, SMP
> configuration would automatically become available in machine-set).
>
> I have placed the skeleton of the work I was doing at
> https://gitlab.com/bonzini/qemu/ in the branch qemu-qmp-targets.  You 
> can see a sample execution at
> https://asciinema.org/a/TXMX8EZh8Md0fZnuE7uhfv6cO.  I have not touched 
> some of the patches in a long time, but I plan to give them a quick
> test tomorrow.  Starting from the code in that branch, it should not
> be hard to implement the machine-set and accel-set commands in the
> same fashion as QEMU 5.2's implementation of object-add.
>
> Thanks for posting these patches, I have started a light review of them.

Please cc: on future work in this area.

I'm about to drop off for two weeks of vacation, though :)


