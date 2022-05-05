Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633A651C0D0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 15:31:48 +0200 (CEST)
Received: from localhost ([::1]:38688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmba7-0007ws-HY
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 09:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmbX0-0005fO-4E
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:28:34 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:53320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmbWw-0002Sn-9p
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651757309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TVpldYy9XoEFwzKtalylLDDEcOgo3M/tyWv4H2mcji0=;
 b=JACUPfuDBe3GeuB7zgltXf0fvdxO5ah7Wyryq60EdL/91++jBuFJlDPRnBr9tflDkGdxYU
 xHOhjwBZLKH4E1yi4kTrUnttSpCuvis53L8+TqzOxpDfweoqKf7XTO4D3BEj5vKib9PU4Z
 Dq4jkv8bzX+koM/6X+ASHapVWqlOJmM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-q-A7eqMqOfeVFcAEeZ1RSw-1; Thu, 05 May 2022 09:28:27 -0400
X-MC-Unique: q-A7eqMqOfeVFcAEeZ1RSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89B633C138A9;
 Thu,  5 May 2022 13:28:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71CA6111DCF2;
 Thu,  5 May 2022 13:28:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3D83821E6880; Thu,  5 May 2022 15:28:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  mark.kanda@oracle.com,  berrange@redhat.com,
 dgilbert@redhat.com
Subject: Re: [PATCH 1/8] qmp: Support for querying stats
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-2-pbonzini@redhat.com>
 <87sfpp3018.fsf@pond.sub.org>
 <41B27AED-A9E0-4666-AEBB-0F3C9F436DF1@redhat.com>
Date: Thu, 05 May 2022 15:28:23 +0200
In-Reply-To: <41B27AED-A9E0-4666-AEBB-0F3C9F436DF1@redhat.com> (Paolo
 Bonzini's message of "Thu, 05 May 2022 09:10:17 +0200")
Message-ID: <87v8ukt8g8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.74; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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

> Il 4 maggio 2022 15:22:27 CEST, Markus Armbruster <armbru@redhat.com> ha scritto:
>>Can you point to existing uses of KVM binary stats introspection data?
>
> There's none, but Google is using it in house. The same data was available before in debugfs and available via the kvm_stat script, so you could also refer to Christian Borntraeger's KVM Forum 2019 talk. The problems with debugfs are basically that it's only available to root and is disabled by secure boot (both issues are not fixable on general because they are Linux policy).

I keep bothering you about use cases, because I'm habitually opposed to
adding features without credible use cases.

For small features, a bit of plausible hand-waving can suffice, but this
one isn't small enough for that.

Plausible hand-waving can sometimes suffice for *experimental* features.
Say when the use case can't really materialize without the feature.

Double-checking (pardon my ignorance): we're basically exposing the host
kernel's KVM stats via QMP, with the option of extending it to other
sources of stats in the future.  Correct?

I think the argument for accepting the interface is basically "if it's
good enough for the kernel, it's good enough for us".  Valid point.

This means we'll acquire yet another introspection system, unrelated to
the introspection systems we already have in QEMU.

There is overlap.  Quite a few query- commands return stats.  Should
they be redone as statistics provides in this new introspection system?

Assuming the answer is no for at least some of them: what kind of stats
should go where?

I'd love to have a better feel for future directions before comitting to
this.

>>> index 4912b9744e..92d7ecc52c 100644
>>> --- a/qapi/qapi-schema.json
>>> +++ b/qapi/qapi-schema.json
>>> @@ -93,3 +93,4 @@
>>>  { 'include': 'audio.json' }
>>>  { 'include': 'acpi.json' }
>>>  { 'include': 'pci.json' }
>>> +{ 'include': 'stats.json' }
>>> diff --git a/qapi/stats.json b/qapi/stats.json
>>> new file mode 100644
>>> index 0000000000..7454dd7daa
>>> --- /dev/null
>>> +++ b/qapi/stats.json
>>> @@ -0,0 +1,192 @@
>>> +# -*- Mode: Python -*-
>>> +# vim: filetype=python
>>> +#
>>> +# Copyright (c) 2022 Oracle and/or its affiliates.
>>> +#
>>> +# This work is licensed under the terms of the GNU GPL, version 2 or later.
>>> +# See the COPYING file in the top-level directory.
>>> +#
>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>> +
>>> +##
>>> +# = Statistics
>>> +##
>>> +
>>> +##
>>> +# @StatsType:
>>> +#
>>> +# Enumeration of statistics types
>>> +#
>>> +# @cumulative: stat is cumulative; value can only increase.
>>> +# @instant: stat is instantaneous; value can increase or decrease.
>>> +# @peak: stat is the peak value; value can only increase.
>>> +# @linear-hist: stat is a linear histogram.
>>> +# @log-hist: stat is a logarithmic histogram.
>>
>>For better or worse, we tend to eschew abbreviations in schema
>>identifiers.  Would you mind @linear-histogram and @log-histogram?
>
> Sure.
>
>
>>> +# Since: 7.1
>>> +##
>>> +{ 'enum': 'StatsTarget',
>>> +  'data': [ 'vm', 'vcpu' ] }
>>
>>Do VM stats include vCPU stats?  "Entire virtual machine" suggests they
>>do...
>
> No, they don't. They are a different sets of data that is gathered on resources shared by the whole VM. Stuff such as "# of pages taken by the KVM page tables" goes there because VCPUs share a single copy of the page tables, as opposed to "# of page faults" which is a VCPU stat.

I'm fine with whatever partition you think is useful, I'm just pointing
out that to me the documentation suggests something that ain't :)

>>> +# The arguments to the query-stats command; specifies a target for which to
>>> +# request statistics, and which statistics are requested from each provider.
>>> +#
>>> +# Since: 7.1
>>> +##
>>> +{ 'struct': 'StatsFilter',
>>> +  'data': { 'target': 'StatsTarget' } }
>>
>>The "and which statistics" part will be implemented later in this
>>series?
>
> Oh, indeed it is. Thanks for noticing.
>
>>> +{ 'struct': 'StatsResult',
>>> +  'data': { 'provider': 'StatsProvider',
>>> +            '*qom-path': 'str',
>>
>>When exactly will @qom-path be present?
>
> Only if the target is vcpus, for the current set of targets. Because the target is in the command I am not repeating it here with another discriminated record.

Needs to be documented then.

Alternatively, maybe: the "QOM path of the object for which the
statistics are returned" could be "/" or "/machine" when the object is
the VM.

>>> +# @type: kind of statistic, a @StatType.
>>
>>Generated documentation looks like
>>
>>       type: StatsType
>>              kind of statistic, a StatType.
>>
>>I think ", a @StatType" should be dropped.
>>
>>If we decide to keep it: @StatsType.
>
> Gotcha.
>
>>
>>> +#
>>> +# @unit: base unit of measurement for the statistics @StatUnit.
>>
>>"@StatUnit", too.
>>
>>If we decide to keep it: @StatsUnit.
>>
>>@unit is optional.  What's the default?
>
> The stat is an adimensional number: a count of events such a page faults, or the maximum length of a bucket in a hash table,  etc. It's actually the common case.

I've come to prefer defaulting to a value over giving "absent" its own
meaning.  However, own meaning is somewhat entrenched in the schema
language and its usage, and "absent @unit means adimensional" is kind of
fitting, so I'm not objecting.  I am asking for better documentation,
though :)

>>> +# @base: base for the multiple of @unit that the statistic uses, either 2 or 10.
>>> +#        Only present if @exponent is non-zero.
>>> +#
>>> +# @exponent: exponent for the multiple of @unit that the statistic uses
>>
>>Alright, given a stat value 42, what does it mean for the possible
>>combinations of @base and @exponent?
>
> Base and exponent are used to represent units like KiB, nanoseconds, etc.

Put that in doc comments, please.

>>> +# @bucket-size: Used with linear-hist to report the width of each bucket
>>> +#               of the histogram.
>>
>>Feels too terse.  Example, perhaps?
>>
>>I assume @bucket-size is present exactly when @type is @linear-hist.
>>Correct?
>
> Yep, will expand.
>
>>> +##
>>> +# @StatsSchema:
>>> +#
>>> +# Schema for all available statistics for a provider and target.
>>> +#
>>> +# @provider: provider for this set of statistics.
>>> +#
>>> +# @target: kind of object that can be queried through this provider.
>>> +#
>>> +# @stats: list of statistics.
>>> +#
>>> +# Since: 7.1
>>> +##
>>> +{ 'struct': 'StatsSchema',
>>> +  'data': { 'provider': 'StatsProvider',
>>> +            'target': 'StatsTarget',
>>> +            'stats': [ 'StatsSchemaValue' ] } }
>>
>>How am I to connect each element of the result of query-stats to an
>>element of the result of query-stats-schema?
>
> You gave the target to query-stats and the result of query-stats has the provider and name. Target+provider+name uniquely identify a StatsSchemaValue in the result of query-stats-schemas.

Can we have that spelled out in documentation?

Doc comments or something under docs/, up to you.

>
> Paolo
>
>>
>>> +
>>> +##
>>> +# @query-stats-schemas:
>>> +#
>>> +# Return the schema for all available runtime-collected statistics.
>>> +#
>>> +# Since: 7.1
>>> +##
>>> +{ 'command': 'query-stats-schemas',
>>> +  'data': { },
>>> +  'returns': [ 'StatsSchema' ] }
>>


