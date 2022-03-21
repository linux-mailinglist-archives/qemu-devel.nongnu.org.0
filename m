Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325BF4E2849
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:54:29 +0100 (CET)
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWIUO-00064l-9o
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:54:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWIQc-0003ps-0Z
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:50:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWIQa-0005lc-2j
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:50:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647870630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I4qXjoQXfLjWIIyjDwAe1oOFfpPMN/d31Nd3bn7IMrQ=;
 b=C9sv2RdkD7SUSOZnbYkV8YcvaW0Vu5Q0GyI3cNQkNUS2JvgZCUrnBOioh6LiutsTjg7tuM
 TqJQUaSit77B0n9ubIR9P/OV1ldZEAI0HQjpGGUzvUDLkDi5W0Dz7cVbyLWw8aYZAsA/Bc
 U9eJZ4T3zVpVVfwSKujPLVxrTkm+5qw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-Umj6yI4dOTe4uBN4yRBGww-1; Mon, 21 Mar 2022 09:50:27 -0400
X-MC-Unique: Umj6yI4dOTe4uBN4yRBGww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB18A3C23FA1;
 Mon, 21 Mar 2022 13:50:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AE3340CF8FA;
 Mon, 21 Mar 2022 13:50:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6846821E66C8; Mon, 21 Mar 2022 14:50:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v4 1/3] qmp: Support for querying stats
References: <20220215150433.2310711-1-mark.kanda@oracle.com>
 <20220215150433.2310711-2-mark.kanda@oracle.com>
 <87a6dw7i55.fsf@pond.sub.org>
 <efd0b85b-beb1-feeb-6c38-510f8bc36af9@oracle.com>
Date: Mon, 21 Mar 2022 14:50:25 +0100
In-Reply-To: <efd0b85b-beb1-feeb-6c38-510f8bc36af9@oracle.com> (Mark Kanda's
 message of "Mon, 14 Mar 2022 12:28:02 -0500")
Message-ID: <874k3r5s9q.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First: sorry for my slow response.

Mark Kanda <mark.kanda@oracle.com> writes:

> Thank you Markus.
>
> On 3/11/2022 7:06 AM, Markus Armbruster wrote:
>> Mark Kanda <mark.kanda@oracle.com> writes:
>>
>>> Introduce QMP support for querying stats. Provide a framework for adding new
>>> stats and support for the following commands:
>>>
>>> - query-stats
>>> Returns a list of all stats per target type (only VM and vCPU to start), with
>>> additional options for specifying stat names, vCPU qom paths, and providers.
>>>
>>> - query-stats-schemas
>>> Returns a list of stats included in each target type, with an option for
>>> specifying the provider.
>>>
>>> The framework provides a method to register callbacks for these QMP commands.
>>>
>>> The first use-case will be for fd-based KVM stats (in an upcoming patch).
>>>
>>> Examples (with fd-based KVM stats):
>>>
>>> - Query all VM stats:
>>>
>>> { "execute": "query-stats", "arguments" : { "target": "vm" } }
>>>
>>> { "return": {
>>>    "vm": [
>>>       { "provider": "kvm",
>>>         "stats": [
>>>            { "name": "max_mmu_page_hash_collisions", "value": 0 },
>>>            { "name": "max_mmu_rmap_size", "value": 0 },
>>>            { "name": "nx_lpage_splits", "value": 148 },
>>>            ...
>>>       { "provider": "xyz",
>>>         "stats": [ ...
>>>       ...
>>> ] } }
>>>
>>> - Query all vCPU stats:
>>>
>>> { "execute": "query-stats", "arguments" : { "target": "vcpu" } }
>>>
>>> { "return": {
>>>      "vcpus": [
>>>        { "path": "/machine/unattached/device[0]"
>>>          "providers": [
>>>            { "provider": "kvm",
>>>              "stats": [
>>>                { "name": "guest_mode", "value": 0 },
>>>                { "name": "directed_yield_successful", "value": 0 },
>>>                { "name": "directed_yield_attempted", "value": 106 },
>>>                ...
>>>            { "provider": "xyz",
>>>              "stats": [ ...
>>>             ...
>>>        { "path": "/machine/unattached/device[1]"
>>>          "providers": [
>>>            { "provider": "kvm",
>>>              "stats": [...
>>>            ...
>>> } ] } }
>>>
>>> - Query 'exits' and 'l1d_flush' KVM stats, and 'somestat' from provider 'xyz'
>>> for vCPUs '/machine/unattached/device[2]' and '/machine/unattached/device[4]':
>>>
>>> { "execute": "query-stats",
>>>    "arguments": {
>>>      "target": "vcpu",
>>>      "vcpus": [ "/machine/unattached/device[2]",
>>>                 "/machine/unattached/device[4]" ],
>>>      "filters": [
>>>        { "provider": "kvm",
>>>          "fields": [ "l1d_flush", "exits" ] },
>>>        { "provider": "xyz",
>>>          "fields": [ "somestat" ] } ] } }
>> Are the stats bulky enough to justfify the extra complexity of
>> filtering?
>
> If this was only for KVM, the complexity probably isn't worth it. However, the 
> framework is intended to support future stats with new providers and targets 
> (there has also been mention of moving existing stats to this framework). 
> Without some sort of filtering, I think the payload could become unmanageable.

I'm deeply wary of "may need $complexity in the future" when $complexity
could be added when we actually need it :)

>>> { "return": {
>>>      "vcpus": [
>>>        { "path": "/machine/unattached/device[2]"
>>>          "providers": [
>>>            { "provider": "kvm",
>>>              "stats": [ { "name": "l1d_flush", "value": 41213 },
>>>                         { "name": "exits", "value": 74291 } ] },
>>>            { "provider": "xyz",
>>>              "stats": [ ... ] } ] },
>>>        { "path": "/machine/unattached/device[4]"
>>>          "providers": [
>>>            { "provider": "kvm",
>>>              "stats": [ { "name": "l1d_flush", "value": 16132 },
>>>                         { "name": "exits", "value": 57922 } ] },
>>>            { "provider": "xyz",
>>>              "stats": [ ... ] } ] } ] } }
>>>
>>> - Query stats schemas:
>>>
>>> { "execute": "query-stats-schemas" }
>>>
>>> { "return": {
>>>      "vcpu": [
>>>        { "provider": "kvm",
>>>          "stats": [
>>>             { "name": "guest_mode",
>>>               "unit": "none",
>>>               "base": 10,
>>>               "exponent": 0,
>>>               "type": "instant" },
>>>            { "name": "directed_yield_successful",
>>>               "unit": "none",
>>>               "base": 10,
>>>               "exponent": 0,
>>>               "type": "cumulative" },
>>>               ...
>>>        { "provider": "xyz",
>>>          ...
>>>     "vm": [
>>>        { "provider": "kvm",
>>>          "stats": [
>>>             { "name": "max_mmu_page_hash_collisions",
>>>               "unit": "none",
>>>               "base": 10,
>>>               "exponent": 0,
>>>               "type": "peak" },
>>>        { "provider": "xyz",
>>>        ...
>> Can you give a use case for query-stats-schemas?
>
> 'query-stats-schemas' provide the the type details about each stat; such as the 
> unit, base, etc. These details are not reported by 'query-stats' (only the stat 
> name and raw values are returned).

Yes, but what is going to use these type details, and for what purpose?

>>> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
>>> ---
>>>   include/monitor/stats.h |  51 ++++++++
>>>   monitor/qmp-cmds.c      | 219 +++++++++++++++++++++++++++++++++
>>>   qapi/meson.build        |   1 +
>>>   qapi/qapi-schema.json   |   1 +
>>>   qapi/stats.json         | 259 ++++++++++++++++++++++++++++++++++++++++
>>
>> That's a lot of schema code.
>>
>> How much of it is for query-stats, and how much for query-stats-schemas?
>
> It's roughly 60% query-stats, 40% query-stats-schemas.
>
>> How much of the query-stats part is for filtering?
>
> I think filtering is about 40% of query-stats.

Have you considered splitting this up into three parts: unfiltered
query-stats, filtering, and query-stats-schemas?

[...]
>>>   5 files changed, 531 insertions(+)
>>>   create mode 100644 include/monitor/stats.h
>>>   create mode 100644 qapi/stats.json
>> [...]
>>
>>> diff --git a/qapi/stats.json b/qapi/stats.json
>>> new file mode 100644
>>> index 0000000000..ae5dc3ee2c
>>> --- /dev/null
>>> +++ b/qapi/stats.json

[...]

>>> +##
>>> +# @StatsValue:
>>> +#
>>> +# @scalar: single uint64.
>>> +# @list: list of uint64.
>>> +#
>>> +# Since: 7.0
>>> +##
>>> +{ 'alternate': 'StatsValue',
>>> +  'data': { 'scalar': 'uint64',
>>> +            'list': 'StatsValueArray' } }
>>
>> Any particular reason for wrapping the array in a struct?
>
> Due to the limitation in the QAPI framework, I hit:
> ../qapi/stats.json:139: 'data' member 'list' cannot be an array
>
> I can look at adding support...

That would be nice.  Could you use help to get started with it?

We could perhaps merge with the current schema, then clean it up on top,
both in 7.1, if that's easier for you.


