Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805283421FB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 17:34:29 +0100 (CET)
Received: from localhost ([::1]:60156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNI4y-0003Vq-4y
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 12:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNI3V-0002vK-Dq
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 12:32:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNI3S-0003SO-Fr
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 12:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616171572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s/fe/Iip5LP85oZ3mfiUEfOrfMa8TM6aBe/zbQsE6Eg=;
 b=CEnFh7tJqVR/vTIypc6BgwtPddq0vkZAJjLfB0bOQIWfl8kbCOR4IsrpH9L8xRP0qvQdBw
 g6b87YJRR2auaRDcwv0ijH/tjWYJeKUyaJQCmsrCKIcCvh6X4bT0+kSSrgPFH0ncnMUYZf
 vbMd5VnvLXyU5Vf/LZEmlU5OwY+hU18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-a3BgDi4DMgmg7BYFp5btKA-1; Fri, 19 Mar 2021 12:32:49 -0400
X-MC-Unique: a3BgDi4DMgmg7BYFp5btKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E03F81431E;
 Fri, 19 Mar 2021 16:32:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 561D05D6D5;
 Fri, 19 Mar 2021 16:32:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DF50511386A7; Fri, 19 Mar 2021 17:32:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 13/14] qmp: Include "reserve" property of memory
 backends
References: <20210319101230.21531-1-david@redhat.com>
 <20210319101230.21531-14-david@redhat.com>
 <87ft0ri23r.fsf@dusky.pond.sub.org>
 <84f961a5-6292-8364-9491-f8330b401a65@redhat.com>
Date: Fri, 19 Mar 2021 17:32:25 +0100
In-Reply-To: <84f961a5-6292-8364-9491-f8330b401a65@redhat.com> (David
 Hildenbrand's message of "Fri, 19 Mar 2021 16:49:01 +0100")
Message-ID: <87zgyzf6jq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

> On 19.03.21 16:40, Markus Armbruster wrote:
>> David Hildenbrand <david@redhat.com> writes:
>> 
>>> Let's include the new property.
>>>
>>> Cc: Eric Blake <eblake@redhat.com>
>>> Cc: Markus Armbruster <armbru@redhat.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>   hw/core/machine-qmp-cmds.c | 1 +
>>>   qapi/machine.json          | 6 ++++++
>>>   2 files changed, 7 insertions(+)
>>>
>>> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
>>> index 68a942595a..bd2a7f2dd0 100644
>>> --- a/hw/core/machine-qmp-cmds.c
>>> +++ b/hw/core/machine-qmp-cmds.c
>>> @@ -174,6 +174,7 @@ static int query_memdev(Object *obj, void *opaque)
>>>           m->merge = object_property_get_bool(obj, "merge", &error_abort);
>>>           m->dump = object_property_get_bool(obj, "dump", &error_abort);
>>>           m->prealloc = object_property_get_bool(obj, "prealloc", &error_abort);
>>> +        m->reserve = object_property_get_bool(obj, "reserve", &error_abort);
>>>           m->policy = object_property_get_enum(obj, "policy", "HostMemPolicy",
>>>                                                &error_abort);
>>>           host_nodes = object_property_get_qobject(obj,
>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>> index c0c52aef10..12860a1f79 100644
>>> --- a/qapi/machine.json
>>> +++ b/qapi/machine.json
>>> @@ -814,6 +814,11 @@
>>>   #
>>>   # @prealloc: enables or disables memory preallocation
>>>   #
>>> +# @reserve: enables or disables reservation of swap space (or huge pages
>>> +#           if applicable). If reservation is enabled (default), actual
>>> +#           reservation depends on underlying OS support. In contrast,
>>> +#           disabling reservation without OS support will bail out. (since 6.1)
>>> +#
>>
>> Provides two settings: "enable reservation if possible", and "disable
>> reservation or else fail".
>>
>> Does "enable reservation or else fail" make no sense, or is it merely
>> unimplemented?
>
> The default for now used to be "enable reservation if possible". For
> example, Windows always reserves/commits the whole region. Under
> Linux, reservation is always done for private memory mappings,
> however, especially for basically all (with one exception) shared
> memory there is no reservation of any kind (with another exception).
>
> For example, it does not make sense to reserve swap space for a
> file-backed mapping; we can just writeback to the file in case we run 
> out of memory. Therefore, Linux will never reserve swap space in that case.
>
> So if we were to implement a "enable reservation or else fail", the
> default ("true") would no longer work for existing setups.
>
> Usually we want "enable reservation if possible" unless in spacial
> cases ("definitely avoid the reservation")

Wait a second...  struct Memdev is actually the result of query-memdev,
and *not* a command or option argument.

Saying "enables or disables reservation of swap space" is misleading.
This isn't ever about enabling or disabling things, it's about querying
whether things are enabled or disabled.

Existing member documentation has the same issue:

    # @merge: enables or disables memory merge support
    #
    # @dump: includes memory backend's memory in a core dump or not
    #
    # @prealloc: enables or disables memory preallocation

Should be something like

    # @merge: whether memory merge support is enabled
    #
    # @dump: whether the memory backend's memory is included in a core dump
    #
    # @prealloc: whether memory is preallocated

The new member could be phrased like:

    # @reserved: whether swap space (or huge pages if applicable) have
    # been reserved.

Mind, I'm proposing how to phrase things, not how things are.  You'll
likely have to adjust the contents of my proposal to match reality.

If we can't always tell whether swap space (or whatever) has been
reserved, then

* If we can only ever tell when it has *not* been reserved, make false
  mean "not reserved", and true mean "dunno".

* If we can tell sometimes

  - but nobody cares for the difference between "reserved" and "dunno",
    same as above.

  - and users may care for the difference, we need three values: "not
    reserved", "reserved", and "dunno".  There are various ways to do
    that.  No use talking about them before we know we need one of them.


