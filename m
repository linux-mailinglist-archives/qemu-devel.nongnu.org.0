Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB115264AF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:37:01 +0200 (CEST)
Received: from localhost ([::1]:33566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npWPc-0001Yp-KH
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1npWOW-0000lF-I9
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:35:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1npWOT-0005DV-B6
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652452548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3wXXMmQKVki1ojUfC58zhElwaU0uVUw7tFQcxOM4qyQ=;
 b=Y0GAw9OI5JQw+7VcJXIaU3VFg9ORAlzhkvjI73admwXQ06VWdnrQJL38Le8tJygeJs3xOB
 YrDLB9BC/StIXlVEJTcPye1o2P259Ec7J9Qy+ebecDiSHrTnMq2njxC0oXHpKL7e877VY6
 8vqM/GibNk7sT8WZXsHxSGSUp+TGidc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-kXxpL1vqPCOoJ9fh98yPrA-1; Fri, 13 May 2022 10:35:47 -0400
X-MC-Unique: kXxpL1vqPCOoJ9fh98yPrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7832101AA42;
 Fri, 13 May 2022 14:35:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFAEA111F3B6;
 Fri, 13 May 2022 14:35:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 97B0421E690D; Fri, 13 May 2022 16:35:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  mark.kanda@oracle.com,  berrange@redhat.com,
 dgilbert@redhat.com
Subject: Re: [PATCH 1/8] qmp: Support for querying stats
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-2-pbonzini@redhat.com>
 <87sfpp3018.fsf@pond.sub.org>
 <41B27AED-A9E0-4666-AEBB-0F3C9F436DF1@redhat.com>
 <87v8ukt8g8.fsf@pond.sub.org>
 <e7056663-6f22-e0ec-679a-3f474df05788@redhat.com>
 <87ee0xy3w0.fsf@pond.sub.org>
 <51586997-467c-0209-7319-fc82e1796809@redhat.com>
Date: Fri, 13 May 2022 16:35:41 +0200
In-Reply-To: <51586997-467c-0209-7319-fc82e1796809@redhat.com> (Paolo
 Bonzini's message of "Fri, 13 May 2022 15:57:00 +0200")
Message-ID: <87y1z5v6te.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 5/13/22 15:10, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>> On 5/5/22 15:28, Markus Armbruster wrote:
>>>> This means we'll acquire yet another introspection system, unrelated to
>>>> the introspection systems we already have in QEMU.
>> 
>> ... ^^^ needs justification.  Explain why passing the kernel's
>> existing interface through QEMU is useful, and to whom.
>
> There are two justifications.
>
> The first is the contents of the schemas: the new introspection data 
> provides different information than the QAPI data, namely unit of 
> measurement, how the numbers are gathered and change 
> (peak/instant/cumulative/histogram), and histogram bucket sizes.  Unless 
> you think those should be added to the QAPI introspection (and IMO there 
> might be a case only for the unit of measure---and even then it's only a 
> very weak case), the separate introspection data justifies itself.
>
> So the existence of query-stats-schemas in my opinion is justified even 
> if don't consider the usecase of passing through the kernel's descriptions.
>
> The second justification however is indeed about the dynamicity of the 
> schema.  The QAPI introspection data is very much static; and while QOM 
> is somewhat more dynamic, generally we consider that to be a bug rather 
> than a feature these days.  On the other hand, running old QEMU with new 
> kernel is a supported usecase; if old QEMU cannot expose statistics from 
> a new kernel, or if a kernel developer needs to change QEMU before 
> gathering new info from the new kernel, then that is a poor user interface.
>
> Gathering statistics is important for development, for monitoring and 
> for performance measurement.  There are tools such as kvm_stat that do 
> this and they rely on the _user_ knowing the interesting data points 
> rather than the tool (which can treat them as opaque).  The goal here is 
> to take the capabilities of these tools and making them available 
> throughout the whole virtualization stack, so that one can observe, 
> monitor and measure virtual machines without having shell access + root 
> on the host that runs them.

Work this into one of the commit messages, please.

>> How strong do we feel about the stability of the stats exposed by this
>> command?  Separate answers for *structure* of the stats and concrete
>> stats.
>
> I'll try to answer this from the point of view of the kernel:
>
> - will "some" statistics ever be available for all targets that are 
> currently supported?  Yes, resoundingly.
>
> - are the names of statistics stable?  Mostly, but not 100%.  If 
> somebody notices the same value is being tracked with different names in 
> two different architectures, one of them might be renamed.  If the 
> statistic tracks a variable that does not exist anymore as the code 
> changes, the statistic will go away.  If KVM grows two different ways to 
> do the same thing and the default changes, some statistics that were 
> previously useful could now be stuck at 0.  All of these events are 
> expected to be rare, but 100% stability is neither a goal nor attainable 
> in my opinion.
>
> - is the schema format stable?  Yes, it is designed to be extensible but 
> it will be backwards compatible.  Don't break userspace and all that.
>
> And for QEMU:
>
> - will "some" statistics ever be available for all targets that are 
> currently supported?  Yes, and this will be true even if other 
> QEMU-specific targets are added, e.g. block devices.
>
> - will other providers have the same guarantees of stability?  It 
> depends.  Statistics based on the current "query-blockstats" output will 
> probably be even more stable than KVM stats.  TCG stats might be of 
> variable stability.  We can add "x-" in front of providers if we decide 
> that such a convention is useful.
>
> - is the QEMU schema format stable?  Yes.  What we have is more or less 
> a 1:1 conversion of the KVM schema format, which is pretty 
> comprehensive. But if an addition to the schema proves itself worthwhile 
> it can be added with the usual care to QAPI backwards compatibility.
>
>> If we're confident neither structure nor concrete stats will change
>> incompatibly, the commands are stable without reservations.
>> 
>> If we're confident the structure is stable, but unable or unwilling to
>> commit to the concrete stats, we should explain this in documentation.
>
> Based on the above text do you have a suggested wording and, especially, 

Friday afternoon, worst time for word-smithing...  Feel free to ask
again on Monday :)

> a suggested place?  For example, do you think it would fit better in the 
> query-stats or query-stats-schemas documentation?

No obvious best choice.  I'd lean towards query-stats-schema.  Or
perhaps neither; write a separate introduction instead, like this:

    ##
    # = Statistics
    #
    # Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
    # eiusmod tempor incididunt ut labore et dolore magna aliqua.  Ut enim
    # ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
    # aliquip ex ea commodo consequat.  Duis aute irure dolor in
    # reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
    # pariatur.  Excepteur sint occaecat cupidatat non proident, sunt in
    # culpa qui officia deserunt mollit anim id est laborum.
    ##

Comes out in HTML as you'd expect, except it gets also included in the
table of contents, which is a bug.

>> If we're unsure about both, the commands should be marked unstable.  We
>> can always upgrade stability later.


