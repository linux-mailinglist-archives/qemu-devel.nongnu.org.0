Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F0E3691D4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 14:16:00 +0200 (CEST)
Received: from localhost ([::1]:43726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZuj1-00070U-8T
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 08:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZugx-0006GM-4C
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 08:13:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZugt-0005qm-Jq
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 08:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619180027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w37/f0UTkCDdV7oVM2ODkDvoBrLw5oF4otSGC3IoPRk=;
 b=hLF8BJWg6XE21Re5F/BJCqLSDxvGqyPd59Raxdv3el/KDrESrmbCNCeRzCjuVNbPJSvfwi
 TVknDWcZsu1qLM/f8ZmKVKZMUtIlPz2ccjD/Uxv8t0bO7S/5Wni9gVu9qLf8jN+AbKus5B
 1S02JvD1y73SfJ+rt/MfMs+t0qbjzq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-d82T3MeVNXuDmp_QWEldqg-1; Fri, 23 Apr 2021 08:13:45 -0400
X-MC-Unique: d82T3MeVNXuDmp_QWEldqg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30CB38030A0;
 Fri, 23 Apr 2021 12:13:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CB8419C71;
 Fri, 23 Apr 2021 12:13:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C3BB7113525D; Fri, 23 Apr 2021 14:13:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 14/15] qmp: Include "reserve" property of memory
 backends
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-15-david@redhat.com>
 <87im4di7u9.fsf@dusky.pond.sub.org>
 <190f173c-b3f9-6c70-42bb-27f50a5f9380@redhat.com>
 <87h7jxgsa0.fsf@dusky.pond.sub.org>
 <79cdbd39-cf5c-a8ab-b2c9-68d8e4ab2333@redhat.com>
Date: Fri, 23 Apr 2021 14:13:25 +0200
In-Reply-To: <79cdbd39-cf5c-a8ab-b2c9-68d8e4ab2333@redhat.com> (David
 Hildenbrand's message of "Fri, 23 Apr 2021 13:33:20 +0200")
Message-ID: <87zgxpfbbu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
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

> On 23.04.21 13:21, Markus Armbruster wrote:
>> David Hildenbrand <david@redhat.com> writes:
>>=20
>>> On 23.04.21 13:00, Markus Armbruster wrote:
>>>> David Hildenbrand <david@redhat.com> writes:
>>>>
>>>>> Let's include the new property.
>>>>>
>>>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>>> Cc: Eric Blake <eblake@redhat.com>
>>>>> Cc: Markus Armbruster <armbru@redhat.com>
>>>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>> ---
>>>>>    hw/core/machine-qmp-cmds.c | 1 +
>>>>>    qapi/machine.json          | 4 ++++
>>>>>    2 files changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
>>>>> index d41db5b93b..2d135ecdd0 100644
>>>>> --- a/hw/core/machine-qmp-cmds.c
>>>>> +++ b/hw/core/machine-qmp-cmds.c
>>>>> @@ -175,6 +175,7 @@ static int query_memdev(Object *obj, void *opaque=
)
>>>>>            m->dump =3D object_property_get_bool(obj, "dump", &error_a=
bort);
>>>>>            m->prealloc =3D object_property_get_bool(obj, "prealloc", =
&error_abort);
>>>>>            m->share =3D object_property_get_bool(obj, "share", &error=
_abort);
>>>>> +        m->reserve =3D object_property_get_bool(obj, "reserve", &err=
or_abort);
>>>>>            m->policy =3D object_property_get_enum(obj, "policy", "Hos=
tMemPolicy",
>>>>>                                                 &error_abort);
>>>>>            host_nodes =3D object_property_get_qobject(obj,
>>>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>>>> index 32650bfe9e..5932139d20 100644
>>>>> --- a/qapi/machine.json
>>>>> +++ b/qapi/machine.json
>>>>> @@ -798,6 +798,9 @@
>>>>>    #
>>>>>    # @share: whether memory is private to QEMU or shared (since 6.1)
>>>>>    #
>>>>> +# @reserve: whether swap space (or huge pages) was reserved if appli=
cable
>>>>> +#           (since 6.1)
>>>>> +#
>>>>>    # @host-nodes: host nodes for its memory policy
>>>>>    #
>>>>>    # @policy: memory policy of memory backend
>>>>> @@ -812,6 +815,7 @@
>>>>>        'dump':       'bool',
>>>>>        'prealloc':   'bool',
>>>>>        'share':      'bool',
>>>>> +    'reserve':    'bool',
>>>>>        'host-nodes': ['uint16'],
>>>>>        'policy':     'HostMemPolicy' }}
>>>>
>>>> Double-checking: true means definitely reserved, and false means
>>>> definitely not reserved.  Correct?
>>>
>>> True means "reserved if applicable" which means "not reserved if not
>>> applicable". False means "definitely not reserved".
>>>
>>> (any recommendation how to rephrase are appreciated; I tried my best --
>>> this interface here makes it especially hard -- it's easier for the
>>> property itself)
>>=20
>> When is it "applicable"?
>
> When the OS supports it for the memory type and it hasn't been disabled.
>
> Linux handling as described in
>   [PATCH v6 09/15] util/mmap-alloc: Support RAM_NORESERVE via
>   MAP_NORESERVE under Linux
> and
>
>   https://www.kernel.org/doc/Documentation/vm/overcommit-accounting
>
> Summary *without* MAP_NORESERVE:
>
> a) !Hugetlbfs with Memory overcommit disabled via
>     ("/proc/sys/vm/overcommit_memory =3D=3D 2"): never
>
> b) !Hugetlbfs with Memory overcommit enabled
>   1) Shared mappings on files: never
>
>   2) Private mappings on files: only when writable (for us always)
>
>   3) Shared anonymous memory: always
>
>   4) Private anonymous memory: only when writable (for us always)
>
> c) Hugetlbfs: Always
>
>
> Under Windows: always. On other POSIX besides Linux -- don't know.

Would working some of this into the doc comment help users of the
interface?  Up to you.


