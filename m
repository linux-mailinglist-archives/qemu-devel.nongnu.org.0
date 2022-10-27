Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C69B60F325
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 11:03:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onymU-0001tn-9o; Thu, 27 Oct 2022 05:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1onymS-0001pM-3f
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:02:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1onymQ-0002wr-C9
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666861345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xim0qupnotOLbc5D0H9fN+rx0BDFmOABHGtdick0HO0=;
 b=ToxpA5KyStXfSInv/qdMtdCSwIJfNgdr0WrdcFnbUcL7U3UhNjn52OfjHXNmV2iaQCAXmm
 k7S+/Wo67VerXIPrcE78Fe9QQa2OlwhT7Oy83t1g8mee3VdPllqRMo2TvHXRccmGbDUVwN
 desoDt6m9TH0e+AKSl74Rr/rnX41BC8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-nD2Fm5CBMtymyFZNHqqzrA-1; Thu, 27 Oct 2022 05:02:18 -0400
X-MC-Unique: nD2Fm5CBMtymyFZNHqqzrA-1
Received: by mail-wm1-f70.google.com with SMTP id
 az11-20020a05600c600b00b003c6e3d4d5b1so410497wmb.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 02:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xim0qupnotOLbc5D0H9fN+rx0BDFmOABHGtdick0HO0=;
 b=8HHGgsJ2AKA+N+h6P0siL07SQ3oqXyeSoUs0ADcJzzNxs+i7cOt33AzQRiSHeE+Eeh
 8VDCf3m31zj22gWgpk8PORLEM810nc/n7lRYvo8db3RKfLVVnhvGI/Sswmxg2N8+QC6f
 t/kT3hC0xH1BVH0uJthxEYcnUG3/U4ZfXiLroifV3tTrd0E9qOZSB+QXTD77FQHI5fO/
 VPAO/qW8mhlC/fhoIeGdyOyLGMpYusnUcCIqXGOQwSYTeL/nCH6lFo9Rbl/ptAKSRkAH
 DQUrse2M/AZYrwoCslatEE4jWd/nFb7Z1GGOIY67ZwfP8SOj0B6LqlHhQcxHcRI7MSss
 jFEw==
X-Gm-Message-State: ACrzQf3BKZPgLCqeuVtJGXEbedX+jecNZxbwGqsYL1kez1JQ7qiGmhcH
 JSqu9YaQJSx6zbuQtmMmR0TojpVVHllsqemIOUdiUALE34V0//aOTbJRlG3LjptcMD7KgIMnBQb
 DeFK2P3crZp4NTunKnqpNPKPLVqKZh2Foaa9sVNy8qXJ9VGuVv1v2RA0WNtWsqqM=
X-Received: by 2002:a5d:5643:0:b0:236:699c:6cd8 with SMTP id
 j3-20020a5d5643000000b00236699c6cd8mr15688442wrw.435.1666861337669; 
 Thu, 27 Oct 2022 02:02:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5FJgyg46yXuz2pEvsUCfvvWaCZSRIs4rXp9Kbmrc6LdGB22i137hcN69j/fQ07Sicy5VhpYw==
X-Received: by 2002:a5d:5643:0:b0:236:699c:6cd8 with SMTP id
 j3-20020a5d5643000000b00236699c6cd8mr15688405wrw.435.1666861337264; 
 Thu, 27 Oct 2022 02:02:17 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:1400:56d0:60d4:f71c:2091?
 (p200300cbc707140056d060d4f71c2091.dip0.t-ipconnect.de.
 [2003:cb:c707:1400:56d0:60d4:f71c:2091])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a05600c46d000b003c6f426467fsm4257070wmo.40.2022.10.27.02.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 02:02:16 -0700 (PDT)
Message-ID: <312f188d-9b0c-839f-d747-9f7c4ac95683@redhat.com>
Date: Thu, 27 Oct 2022 11:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 0/7] hostmem: NUMA-aware memory preallocation using
 ThreadContext
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20221014134720.168738-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221014134720.168738-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14.10.22 15:47, David Hildenbrand wrote:
> This is a follow-up on "util: NUMA aware memory preallocation" [1] by
> Michal.
> 
> Setting the CPU affinity of threads from inside QEMU usually isn't
> easily possible, because we don't want QEMU -- once started and running
> guest code -- to be able to mess up the system. QEMU disallows relevant
> syscalls using seccomp, such that any such invocation will fail.
> 
> Especially for memory preallocation in memory backends, the CPU affinity
> can significantly increase guest startup time, for example, when running
> large VMs backed by huge/gigantic pages, because of NUMA effects. For
> NUMA-aware preallocation, we have to set the CPU affinity, however:
> 
> (1) Once preallocation threads are created during preallocation, management
>      tools cannot intercept anymore to change the affinity. These threads
>      are created automatically on demand.
> (2) QEMU cannot easily set the CPU affinity itself.
> (3) The CPU affinity derived from the NUMA bindings of the memory backend
>      might not necessarily be exactly the CPUs we actually want to use
>      (e.g., CPU-less NUMA nodes, CPUs that are pinned/used for other VMs).
> 
> There is an easy "workaround". If we have a thread with the right CPU
> affinity, we can simply create new threads on demand via that prepared
> context. So, all we have to do is setup and create such a context ahead
> of time, to then configure preallocation to create new threads via that
> environment.
> 
> So, let's introduce a user-creatable "thread-context" object that
> essentially consists of a context thread used to create new threads.
> QEMU can either try setting the CPU affinity itself ("cpu-affinity",
> "node-affinity" property), or upper layers can extract the thread id
> ("thread-id" property) to configure it externally.
> 
> Make memory-backends consume a thread-context object
> (via the "prealloc-context" property) and use it when preallocating to
> create new threads with the desired CPU affinity. Further, to make it
> easier to use, allow creation of "thread-context" objects, including
> setting the CPU affinity directly from QEMU, before enabling the
> sandbox option.
> 
> 
> Quick test on a system with 2 NUMA nodes:
> 
> Without CPU affinity:
>      time qemu-system-x86_64 \
>          -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind \
>          -nographic -monitor stdio
> 
>      real    0m5.383s
>      real    0m3.499s
>      real    0m5.129s
>      real    0m4.232s
>      real    0m5.220s
>      real    0m4.288s
>      real    0m3.582s
>      real    0m4.305s
>      real    0m5.421s
>      real    0m4.502s
> 
>      -> It heavily depends on the scheduler CPU selection
> 
> With CPU affinity:
>      time qemu-system-x86_64 \
>          -object thread-context,id=tc1,node-affinity=0 \
>          -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind,prealloc-context=tc1 \
>          -sandbox enable=on,resourcecontrol=deny \
>          -nographic -monitor stdio
> 
>      real    0m1.959s
>      real    0m1.942s
>      real    0m1.943s
>      real    0m1.941s
>      real    0m1.948s
>      real    0m1.964s
>      real    0m1.949s
>      real    0m1.948s
>      real    0m1.941s
>      real    0m1.937s
> 
> On reasonably large VMs, the speedup can be quite significant.
> 
> While this concept is currently only used for short-lived preallocation
> threads, nothing major speaks against reusing the concept for other
> threads that are harder to identify/configure -- except that
> we need additional (idle) context threads that are otherwise left unused.
> 
> This series does not yet tackle concurrent preallocation of memory
> backends. Memory backend objects are created and memory is preallocated one
> memory backend at a time -- and there is currently no way to do
> preallocation asynchronously.
> 
> [1] https://lkml.kernel.org/r/ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com
> 
> v2 -> v3:
> * "util: Introduce ThreadContext user-creatable object"
>   -> Further impove documentation and patch description and add ACK. [Markus]
> * "util: Add write-only "node-affinity" property for ThreadContext"
>   -> Further impove documentation and patch description and add ACK. [Markus]
> 
> v1 -> v2:
> * Fixed some minor style nits
> * "util: Introduce ThreadContext user-creatable object"
>   -> Impove documentation and patch description. [Markus]
> * "util: Add write-only "node-affinity" property for ThreadContext"
>   -> Impove documentation and patch description. [Markus]
> 
> RFC -> v1:
> * "vl: Allow ThreadContext objects to be created before the sandbox option"
>   -> Move parsing of the "name" property before object_create_pre_sandbox
> * Added RB's

I'm queuing this to

https://github.com/davidhildenbrand/qemu.git mem-next

And most probably send a MR tomorrow before soft-freeze.

-- 
Thanks,

David / dhildenb


