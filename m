Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE28C37296D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 13:09:29 +0200 (CEST)
Received: from localhost ([::1]:33408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsvg-0002QN-Rj
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 07:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ldsuT-0001dD-Eg
 for qemu-devel@nongnu.org; Tue, 04 May 2021 07:08:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ldsuN-0006qL-VK
 for qemu-devel@nongnu.org; Tue, 04 May 2021 07:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620126486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+9f6+oNGYwFZazCh9BQQOjtxbmcuLJBQJnQlCmm800=;
 b=B9ZwzlaM0fwPHigKijYarNV0i5u7/66pKkk0CYrLXKHXPYw3xmfJ4tyTNf7jH04/rUdBVX
 1Oie88VaCVkTPQb24fMzrRyVJGGTknwe4osb8m3bPpcXTHuTRzZAcSkAXXdjQXmymF78yH
 pMiPa2F8HJ+H/bEAqgOPeE8T4DUm6jE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-30aEn2PgPteLftqvlAu2Rg-1; Tue, 04 May 2021 07:08:04 -0400
X-MC-Unique: 30aEn2PgPteLftqvlAu2Rg-1
Received: by mail-wr1-f72.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so5575936wrm.13
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 04:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Y+9f6+oNGYwFZazCh9BQQOjtxbmcuLJBQJnQlCmm800=;
 b=XA9T3pr6OOaoD24JovZOnbxmv/J6cC3NT296+/34kEtPyeZyAm6h2NQrUIO3phoY1V
 UctAZ5l3CCu+xHJbF9qqZzmlpp9n3ddirQ+SdzZGXNS1mIzGgAMIhScduQojijWde1hV
 BkNAzNSrmaz5sVZ5CO2KqWPef9tc8sDy9VkMyFgVdYKArEnRFm9mUDqnenJ2pHvhq/SN
 4vuaRLY1L/7T9xik5pY8O6+L3T+0+JzLGgIt+6/nEJfAv3Ytx6+uh/89ArkArZtvpxvN
 c1xarRT4S0v2OEAqpa653x2VNJDmHgv0o7C185hgKxr6a5HCuGp3UKNb/PL3wuDsvAfe
 DmjA==
X-Gm-Message-State: AOAM533I4wZXnhAJ7Cwp6j35QiD4mOL5niBKwi9h3cb2g/byV2GONC52
 myPB70PjTOejUFariUXvUfsJW5NabWlRsWda1MA4ATeoSK/3iC7rxiLstsI62uwYPVK5+vRXFrS
 cmE437/Sz2nyOVL0=
X-Received: by 2002:a7b:c0cf:: with SMTP id s15mr3057972wmh.110.1620126483710; 
 Tue, 04 May 2021 04:08:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAb7TSTcmgVpRjjyzUaFEKakJihv9xcfTq6TTTn1SzjMvXDz5s/0HvOVPKxZjWQtVm4WVC3g==
X-Received: by 2002:a7b:c0cf:: with SMTP id s15mr3057927wmh.110.1620126483407; 
 Tue, 04 May 2021 04:08:03 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6fae.dip0.t-ipconnect.de. [91.12.111.174])
 by smtp.gmail.com with ESMTPSA id e10sm15831460wrw.20.2021.05.04.04.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 04:08:03 -0700 (PDT)
Subject: Re: [PATCH v7 10/15] hostmem: Wire up RAM_NORESERVE via "reserve"
 property
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210428133754.10713-1-david@redhat.com>
 <20210428133754.10713-11-david@redhat.com> <YJEeFtpZFcoR35He@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <1a865f85-f616-993f-58e1-bb441cec344b@redhat.com>
Date: Tue, 4 May 2021 13:08:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJEeFtpZFcoR35He@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Nitesh Lal <nilal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.05.21 12:12, Daniel P. Berrangé wrote:
> On Wed, Apr 28, 2021 at 03:37:49PM +0200, David Hildenbrand wrote:
>> Let's provide a way to control the use of RAM_NORESERVE via memory
>> backends using the "reserve" property which defaults to true (old
>> behavior).
>>
>> Only Linux currently supports clearing the flag (and support is checked at
>> runtime, depending on the setting of "/proc/sys/vm/overcommit_memory").
>> Windows and other POSIX systems will bail out with "reserve=false".
>>
>> The target use case is virtio-mem, which dynamically exposes memory
>> inside a large, sparse memory area to the VM. This essentially allows
>> avoiding to set "/proc/sys/vm/overcommit_memory == 0") when using
>> virtio-mem and also supporting hugetlbfs in the future.
>>
>> Reviewed-by: Peter Xu <peterx@redhat.com>
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>> Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
>> Cc: Markus Armbruster <armbru@redhat.com>
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   backends/hostmem-file.c  | 11 ++++++-----
>>   backends/hostmem-memfd.c |  1 +
>>   backends/hostmem-ram.c   |  1 +
>>   backends/hostmem.c       | 32 ++++++++++++++++++++++++++++++++
>>   include/sysemu/hostmem.h |  2 +-
>>   qapi/qom.json            | 10 ++++++++++
>>   6 files changed, 51 insertions(+), 6 deletions(-)
>>
>> diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
>> index b683da9daf..9d550e53d4 100644
>> --- a/backends/hostmem-file.c
>> +++ b/backends/hostmem-file.c
>> @@ -40,6 +40,7 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>>                  object_get_typename(OBJECT(backend)));
>>   #else
>>       HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(backend);
>> +    uint32_t ram_flags;
>>       gchar *name;
>>   
>>       if (!backend->size) {
>> @@ -52,11 +53,11 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>>       }
>>   
>>       name = host_memory_backend_get_name(backend);
>> -    memory_region_init_ram_from_file(&backend->mr, OBJECT(backend),
>> -                                     name,
>> -                                     backend->size, fb->align,
>> -                                     (backend->share ? RAM_SHARED : 0) |
>> -                                     (fb->is_pmem ? RAM_PMEM : 0),
>> +    ram_flags = backend->share ? RAM_SHARED : 0;
>> +    ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
>> +    ram_flags |= fb->is_pmem ? RAM_PMEM : 0;
>> +    memory_region_init_ram_from_file(&backend->mr, OBJECT(backend), name,
>> +                                     backend->size, fb->align, ram_flags,
>>                                        fb->mem_path, fb->readonly, errp);
>>       g_free(name);
>>   #endif
>> diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
>> index 93b5d1a4cf..f3436b623d 100644
>> --- a/backends/hostmem-memfd.c
>> +++ b/backends/hostmem-memfd.c
>> @@ -55,6 +55,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>>   
>>       name = host_memory_backend_get_name(backend);
>>       ram_flags = backend->share ? RAM_SHARED : 0;
>> +    ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
>>       memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
>>                                      backend->size, ram_flags, fd, 0, errp);
>>       g_free(name);
>> diff --git a/backends/hostmem-ram.c b/backends/hostmem-ram.c
>> index 741e701062..b8e55cdbd0 100644
>> --- a/backends/hostmem-ram.c
>> +++ b/backends/hostmem-ram.c
>> @@ -29,6 +29,7 @@ ram_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>>   
>>       name = host_memory_backend_get_name(backend);
>>       ram_flags = backend->share ? RAM_SHARED : 0;
>> +    ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
>>       memory_region_init_ram_flags_nomigrate(&backend->mr, OBJECT(backend), name,
>>                                              backend->size, ram_flags, errp);
>>       g_free(name);
>> diff --git a/backends/hostmem.c b/backends/hostmem.c
>> index c6c1ff5b99..58fdc1b658 100644
>> --- a/backends/hostmem.c
>> +++ b/backends/hostmem.c
>> @@ -217,6 +217,11 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
>>       Error *local_err = NULL;
>>       HostMemoryBackend *backend = MEMORY_BACKEND(obj);
>>   
>> +    if (!backend->reserve && value) {
>> +        error_setg(errp, "'prealloc=on' and 'reserve=off' are incompatible");
>> +        return;
>> +    }
>> +
>>       if (!host_memory_backend_mr_inited(backend)) {
>>           backend->prealloc = value;
>>           return;
>> @@ -268,6 +273,7 @@ static void host_memory_backend_init(Object *obj)
>>       /* TODO: convert access to globals to compat properties */
>>       backend->merge = machine_mem_merge(machine);
>>       backend->dump = machine_dump_guest_core(machine);
>> +    backend->reserve = true;
>>       backend->prealloc_threads = 1;
>>   }
>>   
>> @@ -426,6 +432,28 @@ static void host_memory_backend_set_share(Object *o, bool value, Error **errp)
>>       backend->share = value;
>>   }
>>   
>> +static bool host_memory_backend_get_reserve(Object *o, Error **errp)
>> +{
>> +    HostMemoryBackend *backend = MEMORY_BACKEND(o);
>> +
>> +    return backend->reserve;
>> +}
>> +
>> +static void host_memory_backend_set_reserve(Object *o, bool value, Error **errp)
>> +{
>> +    HostMemoryBackend *backend = MEMORY_BACKEND(o);
>> +
>> +    if (host_memory_backend_mr_inited(backend)) {
>> +        error_setg(errp, "cannot change property value");
>> +        return;
>> +    }
>> +    if (backend->prealloc && !value) {
>> +        error_setg(errp, "'prealloc=on' and 'reserve=off' are incompatible");
>> +        return;
>> +    }
>> +    backend->reserve = value;
>> +}
>> +
>>   static bool
>>   host_memory_backend_get_use_canonical_path(Object *obj, Error **errp)
>>   {
>> @@ -494,6 +522,10 @@ host_memory_backend_class_init(ObjectClass *oc, void *data)
>>           host_memory_backend_get_share, host_memory_backend_set_share);
>>       object_class_property_set_description(oc, "share",
>>           "Mark the memory as private to QEMU or shared");
>> +    object_class_property_add_bool(oc, "reserve",
>> +        host_memory_backend_get_reserve, host_memory_backend_set_reserve);
>> +    object_class_property_set_description(oc, "reserve",
>> +        "Reserve swap space (or huge pages) if applicable");
>>       /*
>>        * Do not delete/rename option. This option must be considered stable
>>        * (as if it didn't have the 'x-' prefix including deprecation period) as
>> diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
>> index df5644723a..9ff5c16963 100644
>> --- a/include/sysemu/hostmem.h
>> +++ b/include/sysemu/hostmem.h
>> @@ -64,7 +64,7 @@ struct HostMemoryBackend {
>>       /* protected */
>>       uint64_t size;
>>       bool merge, dump, use_canonical_path;
>> -    bool prealloc, is_mapped, share;
>> +    bool prealloc, is_mapped, share, reserve;
>>       uint32_t prealloc_threads;
>>       DECLARE_BITMAP(host_nodes, MAX_NODES + 1);
>>       HostMemPolicy policy;
>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index cd0e76d564..4fa3137aab 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -545,6 +545,9 @@
>>   # @share: if false, the memory is private to QEMU; if true, it is shared
>>   #         (default: false)
>>   #
>> +# @reserve: if true, reserve swap space (or huge pages) if applicable
>> +#           default: true)
>> +#
>>   # @size: size of the memory region in bytes
>>   #
>>   # @x-use-canonical-path-for-ramblock-id: if true, the canoncial path is used
>> @@ -556,6 +559,12 @@
>>   #                                        false generally, but true for machine
>>   #                                        types <= 4.0)
>>   #
>> +# Note: prealloc=true and reserve=false cannot be set at the same time. With
>> +#       reserve=true, the behavior depends on the operating system: for example,
>> +#       Linux will not reserve swap space for shared file mappings --
>> +#       "not applicable". In contrast, reserve=false will bail out if it cannot
>> +#       be configured accordingly.
>> +#
>>   # Since: 2.1
>>   ##
>>   { 'struct': 'MemoryBackendProperties',
>> @@ -566,6 +575,7 @@
>>               '*prealloc': 'bool',
>>               '*prealloc-threads': 'uint32',
>>               '*share': 'bool',
>> +            '*reserve': 'bool',
>>               'size': 'size',
>>               '*x-use-canonical-path-for-ramblock-id': 'bool' } }
> 
> IIUC from the previous patch in the series, 'reserve' is only implemented
> on Linux.  If we make this QAPI prop dependant on CONFIG_LINUX, then mgmt
> apps will do the right thing to detect what platform(s) it works on.

Would that mean only conditionally calling (or ifdeffing) the 
object_property_add_* in backends/hostmem.c?

Note that the "share" property is basically ignored on Windows and only 
implemented on POSIX and we don't even bail out when set ...

Thanks!

-- 
Thanks,

David / dhildenb


