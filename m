Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDA634212F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 16:51:30 +0100 (CET)
Received: from localhost ([::1]:46588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNHPN-0007o2-Ro
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 11:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNHNL-00073q-8B
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 11:49:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNHNJ-0004k8-JM
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 11:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616168960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5QF6Tn6Ht9GQLRx819QNHuPvUQuEPSWp4pGACwIEdd4=;
 b=bLzcDhxOm1Ryq9Q09ddoPv551fBqmTCX7KydLDQGN74DpdNFnnokRkiqlXDTCSaymrf0ar
 l5+B9Dmd2mQX210nqzkqqB0WtBB44cELRSTPnpyWY9wc7Athk+DFKcuQJQAWFfTtDMa3eS
 KL1uYbxRi35RNQkThRcZd9JUVqKy1AI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-4ddc1rbHO1elQ7xuEYGE7A-1; Fri, 19 Mar 2021 11:49:18 -0400
X-MC-Unique: 4ddc1rbHO1elQ7xuEYGE7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69827107ACCD;
 Fri, 19 Mar 2021 15:49:17 +0000 (UTC)
Received: from [10.36.112.11] (ovpn-112-11.ams2.redhat.com [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDEE15D730;
 Fri, 19 Mar 2021 15:49:01 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
References: <20210319101230.21531-1-david@redhat.com>
 <20210319101230.21531-14-david@redhat.com>
 <87ft0ri23r.fsf@dusky.pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v4 13/14] qmp: Include "reserve" property of memory
 backends
Message-ID: <84f961a5-6292-8364-9491-f8330b401a65@redhat.com>
Date: Fri, 19 Mar 2021 16:49:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87ft0ri23r.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.03.21 16:40, Markus Armbruster wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> Let's include the new property.
>>
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   hw/core/machine-qmp-cmds.c | 1 +
>>   qapi/machine.json          | 6 ++++++
>>   2 files changed, 7 insertions(+)
>>
>> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
>> index 68a942595a..bd2a7f2dd0 100644
>> --- a/hw/core/machine-qmp-cmds.c
>> +++ b/hw/core/machine-qmp-cmds.c
>> @@ -174,6 +174,7 @@ static int query_memdev(Object *obj, void *opaque)
>>           m->merge = object_property_get_bool(obj, "merge", &error_abort);
>>           m->dump = object_property_get_bool(obj, "dump", &error_abort);
>>           m->prealloc = object_property_get_bool(obj, "prealloc", &error_abort);
>> +        m->reserve = object_property_get_bool(obj, "reserve", &error_abort);
>>           m->policy = object_property_get_enum(obj, "policy", "HostMemPolicy",
>>                                                &error_abort);
>>           host_nodes = object_property_get_qobject(obj,
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index c0c52aef10..12860a1f79 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -814,6 +814,11 @@
>>   #
>>   # @prealloc: enables or disables memory preallocation
>>   #
>> +# @reserve: enables or disables reservation of swap space (or huge pages
>> +#           if applicable). If reservation is enabled (default), actual
>> +#           reservation depends on underlying OS support. In contrast,
>> +#           disabling reservation without OS support will bail out. (since 6.1)
>> +#
> 
> Provides two settings: "enable reservation if possible", and "disable
> reservation or else fail".
> 
> Does "enable reservation or else fail" make no sense, or is it merely
> unimplemented?

The default for now used to be "enable reservation if possible". For 
example, Windows always reserves/commits the whole region. Under Linux, 
reservation is always done for private memory mappings, however, 
especially for basically all (with one exception) shared memory there is 
no reservation of any kind (with another exception).

For example, it does not make sense to reserve swap space for a 
file-backed mapping; we can just writeback to the file in case we run 
out of memory. Therefore, Linux will never reserve swap space in that case.

So if we were to implement a "enable reservation or else fail", the 
default ("true") would no longer work for existing setups.

Usually we want "enable reservation if possible" unless in spacial cases 
("definitely avoid the reservation")

-- 
Thanks,

David / dhildenb


