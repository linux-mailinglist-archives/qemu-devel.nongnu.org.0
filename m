Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADCE5FC1A4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 10:11:20 +0200 (CEST)
Received: from localhost ([::1]:53102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiWpj-0005zj-Bq
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 04:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oiWhw-0002R8-NH
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:03:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oiWhu-0008LK-25
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665561792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oSBP3/MVD3TBvfceJFTToFFOYTLRz6RSlLbrr4kb9Hw=;
 b=Ws2bifuQ/DPWmfh1sP4J5YR8hEvPmn4jRZIbfdKO4RkFmHCeEXBGjryBVcwDtlIyp7bCKd
 3jHABM1wpTo7FXv29GgJyvyVSJRhc6/TcKUO0uZpSsbtxP72gKi3kcwwq+VbO7C1knN1/d
 47vKM5kN+KhBzgB9yr3f864ZIPHJ6eE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-IkOkrjYMNiGCYhf9xkk-UQ-1; Wed, 12 Oct 2022 04:03:09 -0400
X-MC-Unique: IkOkrjYMNiGCYhf9xkk-UQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5075D185A7A3;
 Wed, 12 Oct 2022 08:03:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18C171463EC1;
 Wed, 12 Oct 2022 08:03:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EA68621E691D; Wed, 12 Oct 2022 10:03:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  Michal Privoznik <mprivozn@redhat.com>,  Igor
 Mammedov <imammedo@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v2 4/7] util: Add write-only "node-affinity" property
 for ThreadContext
References: <20221010091117.88603-1-david@redhat.com>
 <20221010091117.88603-5-david@redhat.com>
 <8735buj3rd.fsf@pond.sub.org>
 <f147185e-0cf4-2ba5-0adb-a07e56fd7c63@redhat.com>
Date: Wed, 12 Oct 2022 10:03:07 +0200
In-Reply-To: <f147185e-0cf4-2ba5-0adb-a07e56fd7c63@redhat.com> (David
 Hildenbrand's message of "Tue, 11 Oct 2022 09:34:44 +0200")
Message-ID: <87zge1eaf8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

David Hildenbrand <david@redhat.com> writes:

> On 11.10.22 08:03, Markus Armbruster wrote:
>> David Hildenbrand <david@redhat.com> writes:
>> 
>>> Let's make it easier to pin threads created via a ThreadContext to
>>> all CPUs currently belonging to a given set of NUMA nodes -- which is the
>>> common case.
>>>
>>> "node-affinity" is simply a shortcut for setting "cpu-affinity" manually
>>> to the list of CPUs belonging to the set of nodes. This property can only
>>> be written.
>>>
>>> A simple QEMU example to set the CPU affinity to Node 1 on a system with
>>> two NUMA nodes, 24 CPUs each:
>>>      qemu-system-x86_64 -S \
>>>        -object thread-context,id=tc1,node-affinity=1
>>>
>>> And we can query the cpu-affinity via HMP/QMP:
>>>      (qemu) qom-get tc1 cpu-affinity
>>>      [
>>>          1,
>>>          3,
>>>          5,
>>>          7,
>>>          9,
>>>          11,
>>>          13,
>>>          15,
>>>          17,
>>>          19,
>>>          21,
>>>          23,
>>>          25,
>>>          27,
>>>          29,
>>>          31,
>>>          33,
>>>          35,
>>>          37,
>>>          39,
>>>          41,
>>>          43,
>>>          45,
>>>          47
>>>      ]
>> 
>> Double-checking my understanding: on this system, the even CPUs belong
>> to NUMA node 0, and the odd ones to node 1.  Setting node-affinity=1 is
>> therefore sugar for setting cpu-affinity to the set of even CPUs.
>> Correct?
>
> Yes!
>
> # lscpu
> ...
> NUMA:
>   NUMA node(s):          2
>   NUMA node0 CPU(s):     0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46
>   NUMA node1 CPU(s):     1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47

Thanks!

>>> We cannot query the node-affinity:
>>>      (qemu) qom-get tc1 node-affinity
>>>      Error: Insufficient permission to perform this operation
>> 
>> The error message is somewhat misleading.  "Insufficient permission"
>> suggests this could work if I had more "permission".  Not the case.  The
>> message comes from object_property_get(), i.e. it's not this patch's
>> fault.  I'll post a patch to improve it.
>
> I agree, thanks!

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


