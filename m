Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08873691D1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 14:14:24 +0200 (CEST)
Received: from localhost ([::1]:41520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZuhT-00061q-Pg
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 08:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZufU-0005I2-Hk
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 08:12:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZufP-0004wL-UQ
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 08:12:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619179934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yIngoKB9sKahc5f6LBp4xpw4kNGoHsjRYgZfWKlMdTU=;
 b=VRDWZHqRXz678mEkNsWPE9VuW2b5jnTH61E/rgeMldlXZrgb14ha3PwU9FmHvQhS34C7sK
 kEvGfGgdCtszn2ZgCGQ+Hz/ywtOaEp/f9E1bxcqMCzDivC7NqDLhtmp4NsAtSTgEzQ9qog
 B2bVya39E/5Cnd1fkaqdxQFKNBpGVRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-0IVYn-eKN9WxMZ84Qt0_dA-1; Fri, 23 Apr 2021 08:12:13 -0400
X-MC-Unique: 0IVYn-eKN9WxMZ84Qt0_dA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DA8CA40C0;
 Fri, 23 Apr 2021 12:12:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E7295C1BB;
 Fri, 23 Apr 2021 12:11:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B066B113525D; Fri, 23 Apr 2021 14:11:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 10/15] hostmem: Wire up RAM_NORESERVE via "reserve"
 property
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-11-david@redhat.com>
 <87a6ppi77c.fsf@dusky.pond.sub.org>
 <8848ab6a-b435-3f95-1742-6593dff72351@redhat.com>
Date: Fri, 23 Apr 2021 14:11:56 +0200
In-Reply-To: <8848ab6a-b435-3f95-1742-6593dff72351@redhat.com> (David
 Hildenbrand's message of "Fri, 23 Apr 2021 13:16:37 +0200")
Message-ID: <874kfxgpyr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

> On 23.04.21 13:14, Markus Armbruster wrote:
>> David Hildenbrand <david@redhat.com> writes:
>> 
>>> Let's provide a way to control the use of RAM_NORESERVE via memory
>>> backends using the "reserve" property which defaults to true (old
>>> behavior).
>>>
>>> Only Linux currently supports clearing the flag (and support is checked at
>>> runtime, depending on the setting of "/proc/sys/vm/overcommit_memory").
>>> Windows and other POSIX systems will bail out with "reserve=false".
>>>
>>> The target use case is virtio-mem, which dynamically exposes memory
>>> inside a large, sparse memory area to the VM. This essentially allows
>>> avoiding to set "/proc/sys/vm/overcommit_memory == 0") when using
>>> virtio-mem and also supporting hugetlbfs in the future.
>>>
>>> Reviewed-by: Peter Xu <peterx@redhat.com>
>>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>> Cc: Markus Armbruster <armbru@redhat.com>
>>> Cc: Eric Blake <eblake@redhat.com>
>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>   backends/hostmem-file.c  | 11 ++++++-----
>>>   backends/hostmem-memfd.c |  1 +
>>>   backends/hostmem-ram.c   |  1 +
>>>   backends/hostmem.c       | 32 ++++++++++++++++++++++++++++++++
>>>   include/sysemu/hostmem.h |  2 +-
>>>   qapi/qom.json            |  4 ++++
>>>   6 files changed, 45 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
>>> index b683da9daf..9d550e53d4 100644
>>> --- a/backends/hostmem-file.c
>>> +++ b/backends/hostmem-file.c
>>> @@ -40,6 +40,7 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>>>                  object_get_typename(OBJECT(backend)));
>>>   #else
>>>       HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(backend);
>>> +    uint32_t ram_flags;
>>>       gchar *name;
>>>         if (!backend->size) {
>>> @@ -52,11 +53,11 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>>>       }
>>>         name = host_memory_backend_get_name(backend);
>>> -    memory_region_init_ram_from_file(&backend->mr, OBJECT(backend),
>>> -                                     name,
>>> -                                     backend->size, fb->align,
>>> -                                     (backend->share ? RAM_SHARED : 0) |
>>> -                                     (fb->is_pmem ? RAM_PMEM : 0),
>>> +    ram_flags = backend->share ? RAM_SHARED : 0;
>>> +    ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
>>> +    ram_flags |= fb->is_pmem ? RAM_PMEM : 0;
>>> +    memory_region_init_ram_from_file(&backend->mr, OBJECT(backend), name,
>>> +                                     backend->size, fb->align, ram_flags,
>>>                                        fb->mem_path, fb->readonly, errp);
>>>       g_free(name);
>>>   #endif
>>> diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
>>> index 93b5d1a4cf..f3436b623d 100644
>>> --- a/backends/hostmem-memfd.c
>>> +++ b/backends/hostmem-memfd.c
>>> @@ -55,6 +55,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>>>         name = host_memory_backend_get_name(backend);
>>>       ram_flags = backend->share ? RAM_SHARED : 0;
>>> +    ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
>>>       memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
>>>                                      backend->size, ram_flags, fd, 0, errp);
>>>       g_free(name);
>>> diff --git a/backends/hostmem-ram.c b/backends/hostmem-ram.c
>>> index 741e701062..b8e55cdbd0 100644
>>> --- a/backends/hostmem-ram.c
>>> +++ b/backends/hostmem-ram.c
>>> @@ -29,6 +29,7 @@ ram_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>>>         name = host_memory_backend_get_name(backend);
>>>       ram_flags = backend->share ? RAM_SHARED : 0;
>>> +    ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
>>>       memory_region_init_ram_flags_nomigrate(&backend->mr, OBJECT(backend), name,
>>>                                              backend->size, ram_flags, errp);
>>>       g_free(name);
>>
>> As the commit message says, @reserve translates to RAM_NORESERVE.
>> Good.
>> I figure passing RAM_NORESERVE can't make these functions fail.
>> Correct?
>> @reserve defaults to true.  The commit message assures us this gives
>> us
>> the old behavior.  Good.  But the patch *adds* flag RAM_NORESERVE when
>> it is true.  Now I'm confused.
>
> ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
>
> translates to
>
> if (!backend->reserve)
> 	ram_flags |= RAM_NORESERVE;

You're right!  /me uncrosses eyes...

> I thought for a while if calling the property "noreserve" would be
> cleaner, but decided against it.

I dislike "negative" flag names, too.


