Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D3A58AD7E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:49:52 +0200 (CEST)
Received: from localhost ([::1]:56516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJza9-0000l1-W1
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJzXx-0005gH-QS
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:47:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJzXr-0003oV-IY
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659714446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0r/pfRm4BOzhNGEpRSfbirb3kDYP44lBt7e1lBUpjTM=;
 b=CwuIt+MEmOMs38b91a0hhSg68QfyxKM5b2hd7L4rn2+zRNjmiRbKSzhLzmhbEj1xpUBQk6
 wbVV1+WAPXsNdVkwuC4n8kJ3iPbLvdSQHyQDBElLw0vgyJKI0OELL6HRlac7qb1G+uhowd
 VAIW1J3nLDlJfWNKGNhHju9XhZIYC5g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-Zu19TeMdMB6YSy4INjtiRA-1; Fri, 05 Aug 2022 11:47:25 -0400
X-MC-Unique: Zu19TeMdMB6YSy4INjtiRA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k27-20020a05600c1c9b00b003a2fee19a80so4369463wms.1
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 08:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=0r/pfRm4BOzhNGEpRSfbirb3kDYP44lBt7e1lBUpjTM=;
 b=thF4CFKgGL+hRKTrYuxMqHN7m8aixOPEPF3fsYbb4CiwsyaAe9fw5jEXP+3t1suKoB
 xcX1SiZXptfTLUv/YuCUVdj3QT3eRyQ/WewQyoinc99xnDN7BrceusNj+DTPkOysarxw
 /XFg440i318ASIptZAriqClr/6r0KBF40JKDVXVlDfFs9MsyA75AdufxPHvDaRyJE9iF
 LdfpeBX9/6tlcSWEPFf+yXrehnFmed/mufq78Cf68ldXYjYHoKOmXHsn3ehWfM3HmsNU
 bdlZm4Jl55fmzgKGkNoVsVkdL6LNsoVYddsbYpj796jKGswWpF30eZLbUk9xygQWMkXe
 I6BA==
X-Gm-Message-State: ACgBeo1TzVhMveBV6nmUEiZXp57jjbqNT4/rx4FNaZ2XXuNkcZPmMjBW
 lQNWrLCDVosJ8obNBu1x40SVRH4Un1prwgH+8ib028sTyjLKAvXUn/IGBTkNiJl2/zNTQJqQZ0h
 5932UEfQhDDgLVDk=
X-Received: by 2002:a05:600c:3d08:b0:3a5:726:790f with SMTP id
 bh8-20020a05600c3d0800b003a50726790fmr5077232wmb.98.1659714443936; 
 Fri, 05 Aug 2022 08:47:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Lj7ASv1iszJjucqkKVfGxm5itFivPZ5937bgqe3BvAJ8D/Noq5d/7u5CDyCzjfeWSQisihA==
X-Received: by 2002:a05:600c:3d08:b0:3a5:726:790f with SMTP id
 bh8-20020a05600c3d0800b003a50726790fmr5077210wmb.98.1659714443669; 
 Fri, 05 Aug 2022 08:47:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:fb00:f5c3:24b2:3d03:9d52?
 (p200300cbc706fb00f5c324b23d039d52.dip0.t-ipconnect.de.
 [2003:cb:c706:fb00:f5c3:24b2:3d03:9d52])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a5d58e5000000b0021eed2414c9sm4111585wrd.40.2022.08.05.08.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 08:47:23 -0700 (PDT)
Message-ID: <0212ab4f-8c23-e58c-f447-374f1b200bf8@redhat.com>
Date: Fri, 5 Aug 2022 17:47:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20220721120732.118133-1-david@redhat.com>
 <c41ee5f5-fd9f-984f-126b-21fa371a827b@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH RFC 0/7] hostmem: NUMA-aware memory preallocation using
 ThreadContext
In-Reply-To: <c41ee5f5-fd9f-984f-126b-21fa371a827b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

> 
> I've timed 'virsh start' with a guest that has 47GB worth of 1GB
> hugepages and seen the startup time halved basically (from 10.5s to
> 5.6s). The host has 4 NUMA nodes and I'm pinning the guest onto two nodes.
> 
> I've written libvirt counterpart (which I'll post as soon as these are
> merged). The way it works is the whenever .prealloc-threads= is to be
> used AND qemu is capable of thread-context the thread-context object is
> generated before every memory-backend-*, like this:

Once interesting corner case might be with CPU-less NUMA nodes. Setting
the node-affinity would fail because there are no CPUs. Libvirt could
figure that out by testing if the selected node(s) have CPUs.

> 
> -object
> '{"qom-type":"thread-context","id":"tc-ram-node0","node-affinity":[2]}' \
> -object
> '{"qom-type":"memory-backend-memfd","id":"ram-node0","hugetlb":true,"hugetlbsize":1073741824,"share":true,"prealloc":true,"prealloc-threads":16,"size":21474836480,"host-nodes":[2],"policy":"bind","prealloc-context":"tc-ram-node0"}'
> \
> -numa node,nodeid=0,cpus=0,cpus=2,memdev=ram-node0 \
> -object
> '{"qom-type":"thread-context","id":"tc-ram-node1","node-affinity":[3]}' \
> -object
> '{"qom-type":"memory-backend-memfd","id":"ram-node1","hugetlb":true,"hugetlbsize":1073741824,"share":true,"prealloc":true,"prealloc-threads":16,"size":28991029248,"host-nodes":[3],"policy":"bind","prealloc-context":"tc-ram-node1"}'
> \
> 
> 
> Now, it's not visible in this snippet, but my code does not reuse
> thread-context objects. So if there's another memfd, it'll get its own TC:
> 
> -object
> '{"qom-type":"thread-context","id":"tc-memdimm0","node-affinity":[1]}' \
> -object
> '{"qom-type":"memory-backend-memfd","id":"memdimm0","hugetlb":true,"hugetlbsize":1073741824,"share":true,"prealloc":true,"prealloc-threads":16,"size":1073741824,"host-nodes":[1],"policy":"bind","prealloc-context":"tc-memdimm0"}'
> \
> 
> The reason is that logic generating memory-backends is very complex and
> separating out parts of it so that thread-context objects can be
> generated first and reused by those backends would inevitably lead to

Sounds like something we can work on later.

> regression. I guess my question is, whether it's a problem that libvirt
> would leave one additional thread, sleeping in a semaphore, for each
> memory-backend (iff prealloc-threads are used).

I guess in most setups we just don't care. Of course, with 256 DIMMs or
endless number of nodes, we *might* care.


One optimization for some ordinary setups (not caring about NUMA-aware
preallocation during DIMM hotplug) would be to assign some dummy thread
context once prealloc finished (e.g., once QEMU initialized after
prealloc) and delete the original thread context along with the thread.

> 
> Although, if I read the code correctly, thread-context object can be
> specified AFTER memory backends, because they are parsed and created
> before backends anyway. Well, something to think over the weekend.

Yes, the command line order does not matter.

[...]

> 
> Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Thanks!

-- 
Thanks,

David / dhildenb


