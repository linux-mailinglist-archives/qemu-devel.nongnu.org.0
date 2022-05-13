Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BA45262B1
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 15:12:48 +0200 (CEST)
Received: from localhost ([::1]:32988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npV67-0004eZ-EW
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 09:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1npV4D-0003Ex-Lb
 for qemu-devel@nongnu.org; Fri, 13 May 2022 09:10:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1npV4A-0007J5-8a
 for qemu-devel@nongnu.org; Fri, 13 May 2022 09:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652447444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TudVkw77nbxZ6BIHOV6ucm8WRKNMf6DQUwPCsrdc6hs=;
 b=i1dmIfEvoZx2/9l+apb4Kvt53smScbl98aqNoTWaFtJyjpmGbTh7g8/HI9zbNXdZUkyFjN
 u6OZKbvk2qz5y7g4OllN9GbJGlMnVn53bZ6ew0/MIyTnFp0TTrgy2cEmdLRV2V+QxvvjyE
 qzR2V8yUajnoOt8HbSrPQqOy2NSnkCA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-BG-N9d37PDyysh28KzWUrQ-1; Fri, 13 May 2022 09:10:41 -0400
X-MC-Unique: BG-N9d37PDyysh28KzWUrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CCD4100BAA0;
 Fri, 13 May 2022 13:10:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB31641047E9;
 Fri, 13 May 2022 13:10:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C269B21E690D; Fri, 13 May 2022 15:10:39 +0200 (CEST)
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
Date: Fri, 13 May 2022 15:10:39 +0200
In-Reply-To: <e7056663-6f22-e0ec-679a-3f474df05788@redhat.com> (Paolo
 Bonzini's message of "Thu, 5 May 2022 15:58:37 +0200")
Message-ID: <87ee0xy3w0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

> On 5/5/22 15:28, Markus Armbruster wrote:
>> Double-checking (pardon my ignorance): we're basically exposing the host
>> kernel's KVM stats via QMP, with the option of extending it to other
>> sources of stats in the future.  Correct?
>
> Yes.  As long as KVM is the only source, it's basically an opaque 1:1
> mapping of what the kernel gives.

I'd like this to be captured in documentation and / or a commit message,
because ...

>> I think the argument for accepting the interface is basically "if it's
>> good enough for the kernel, it's good enough for us".  Valid point.
>
> Also, it was designed from the beginning to be extensible to other
> _kernel_ subsystems as well; i.e. it's not virt-specific in any way.
>
> There is one important point: theoretically, stats names are not part
> of the kernel API.  In practice, you know what the chief penguin
> thinks of breaking userspace and anyway I don't think any of the stats
> have ever been removed when they were in debugfs (which makes them
> even less of a stable API).
>
> For a similar situation see https://lwn.net/Articles/737530/: kernel
> developers hate that tracepoints are part of the stable API, but in 
> practice they are (and stats are much harder to break than
> tracepoints, if it's worth exposing them to userspace in the first
> place).
>
>> This means we'll acquire yet another introspection system, unrelated to
>> the introspection systems we already have in QEMU.

... ^^^ needs justification.  Explain why passing the kernel's
existing interface through QEMU is useful, and to whom.

>> There is overlap.  Quite a few query- commands return stats.  Should
>> they be redone as statistics provides in this new introspection system?
>
> I think so, potentially all of them can be moved.  Whether it is worth
> doing it is another story.
>
> In addition, query-stats provides a home for TCG statistics that
> currently QMP exposes only via x- commands; they can be added without 
> having to design the whole QAPI thing, and with a slightly less strong
> guarantee of stability.

How strong do we feel about the stability of the stats exposed by this
command?  Separate answers for *structure* of the stats and concrete
stats.

If we're confident neither structure nor concrete stats will change
incompatibly, the commands are stable without reservations.

If we're confident the structure is stable, but unable or unwilling to
commit to the concrete stats, we should explain this in documentation.

If we're unsure about both, the commands should be marked unstable.  We
can always upgrade stability later.

[...]


