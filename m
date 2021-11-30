Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A6463BD3
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 17:33:59 +0100 (CET)
Received: from localhost ([::1]:34834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms64r-000819-GV
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 11:33:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1ms63g-0006Rj-09
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 11:32:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1ms63U-0003Gl-El
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 11:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638289950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPGA+S7vd5uHmYXX8OkntnVMgxfsFoGvSsPmCNe151Q=;
 b=YsmxyKH9mRVMGbgDJGlHcV0gFmpe2fZsQePgLDotYRKZkFeoR4YgwI/BwbfUczT0JTQr5I
 +37TJ2Ki4g+6lw8LYliQ8xVihYU9NubmGyVoAIaAp67KGquiNu9bBc4+Y6ni1tU7jCHkiq
 gOzsA169tBNHYE8/4eJlyTIbscJLOIQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-MD0ACee0PlOLoP-i8Eqt7w-1; Tue, 30 Nov 2021 11:32:26 -0500
X-MC-Unique: MD0ACee0PlOLoP-i8Eqt7w-1
Received: by mail-ed1-f70.google.com with SMTP id
 n11-20020aa7c68b000000b003e7d68e9874so17454235edq.8
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 08:32:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kPGA+S7vd5uHmYXX8OkntnVMgxfsFoGvSsPmCNe151Q=;
 b=uOSftZfeTlKd+T4ml7dvktuJlqByMGKCMGYeYKIDbJkW1egxJZNSL7sD3VHCTbZ2HV
 DZSQ017gheB/OQjyTwSVHgxaF0X9bBCDlSvjQclODZZC7P3LlYZfbwiE/d0IEAEzL/Xm
 d5BiYtEqhZlpTU8t7NIlvmZTeuMJ5DgFiBp8Rb+w05trcuSCm3NeVX8EB6THIWSb1Dgn
 cUEHraX4EEErJFZpWVxTQlRA1Stmuj8l3cV6tdADko8cbFFbncMZUsaaogo3lxCdvKmt
 lRBQURU1EoHHcQrkp+qi8cLGyknVmFSLHuuzPAHduzgO1nPozmUZieSib7CgS0CDsEEo
 avtg==
X-Gm-Message-State: AOAM532mSPzjwVXhf/Psv8CYmXiD4ShyUSTYOmwqINUNSYz+T8kfNtfF
 qbEYY8juhovOTPUVx0z6jNv4I0WdqLa956/73CuyW+CPPrjeoVCKRP8CrfgpkWk59RN5nFhZn6C
 nWM0U36vJBlF6Jkw=
X-Received: by 2002:a17:907:7f9e:: with SMTP id
 qk30mr128939ejc.313.1638289945794; 
 Tue, 30 Nov 2021 08:32:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgcYPmekcMifXgWseKJqpaFmmX+MotErORBG22L2J/oggvkAtBuepIKMAkTH1Qdzj+FJSHmg==
X-Received: by 2002:a17:907:7f9e:: with SMTP id
 qk30mr128902ejc.313.1638289945581; 
 Tue, 30 Nov 2021 08:32:25 -0800 (PST)
Received: from [10.43.2.64] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id go10sm9549354ejc.115.2021.11.30.08.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 08:32:25 -0800 (PST)
Message-ID: <7e012038-b4f1-c914-795b-0650d9df60c2@redhat.com>
Date: Tue, 30 Nov 2021 17:32:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v1 0/8] virtio-mem: Support "prealloc=on"
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20211130104136.40927-1-david@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20211130104136.40927-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/21 11:41, David Hildenbrand wrote:
> Based-on: <20211130092838.24224-1-david@redhat.com>
> 
> Patch #1 - #7 are fully reviewed [1] but did not get picked up yet, so I'm
> sending them along here, as they are required to use os_mem_prealloc() in
> a safe way once the VM is running.
> 
> Support preallocation of memory to make virtio-mem safe to use with
> scarce memory resources such as hugetlb. Before acknowledging a plug
> request from the guest, we'll try preallcoating memory. If that fails,
> we'll fail the request gracefully and warn the usr once.
> 
> To fully support huge pages for shared memory, we'll have to adjust shared
> memory users, such as virtiofsd, to map guest memory via MAP_NORESERVE as
> well, because otherwise, they'll end up overwriting the "reserve=off"
> decision made by QEMU and try reserving huge pages for the sparse memory
> region.
> 
> In the future, we might want to process guest requests, including
> preallocating memory, asynchronously via a dedicated iothread.
> 
> [1] https://lkml.kernel.org/r/20211004120208.7409-1-david@redhat.com
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Gavin Shan <gshan@redhat.com>
> Cc: Hui Zhu <teawater@gmail.com>
> Cc: Sebastien Boeuf <sebastien.boeuf@intel.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Michal Prívozník <mprivozn@redhat.com>
> 
> David Hildenbrand (8):
>   util/oslib-posix: Let touch_all_pages() return an error
>   util/oslib-posix: Support MADV_POPULATE_WRITE for os_mem_prealloc()
>   util/oslib-posix: Introduce and use MemsetContext for
>     touch_all_pages()
>   util/oslib-posix: Don't create too many threads with small memory or
>     little pages
>   util/oslib-posix: Avoid creating a single thread with
>     MADV_POPULATE_WRITE
>   util/oslib-posix: Support concurrent os_mem_prealloc() invocation
>   util/oslib-posix: Forward SIGBUS to MCE handler under Linux
>   virtio-mem: Support "prealloc=on" option
> 
>  hw/virtio/virtio-mem.c         |  39 +++++-
>  include/hw/virtio/virtio-mem.h |   4 +
>  include/qemu/osdep.h           |   7 +
>  softmmu/cpus.c                 |   4 +
>  util/oslib-posix.c             | 231 +++++++++++++++++++++++++--------
>  5 files changed, 226 insertions(+), 59 deletions(-)
> 

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Michal


