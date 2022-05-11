Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3977E5233E1
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 15:18:20 +0200 (CEST)
Received: from localhost ([::1]:36932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nomEN-000273-BY
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 09:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nomDD-0001B4-I2
 for qemu-devel@nongnu.org; Wed, 11 May 2022 09:17:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nomD9-0002HX-W5
 for qemu-devel@nongnu.org; Wed, 11 May 2022 09:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652275021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=75EDh4AGaeGRax34JyME7rp1qjwH3nefW1+NILc/aWY=;
 b=I9HEq/+/j6TeTanMv7YQFu5Fy4aiovhGDlQOOOaoOAQAAa6hio2vbM/0ZO4ZsFlcnLLLbB
 bumPFvN9/78qKho4klF7kGySo5q//2ztJK+8tfSLOVb407GF34qs9ZXvOwQTbZyS+x+b7J
 HH6t+a6nWHb6MBGUQpJ71GNwRVVhFYI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-dtIizGBjO9Gng87cg8X5nw-1; Wed, 11 May 2022 09:17:00 -0400
X-MC-Unique: dtIizGBjO9Gng87cg8X5nw-1
Received: by mail-wr1-f70.google.com with SMTP id
 y12-20020a5d4acc000000b0020cdff2382fso544682wrs.11
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 06:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=75EDh4AGaeGRax34JyME7rp1qjwH3nefW1+NILc/aWY=;
 b=ZnBBM07WrCW+5HVdIhkBDIo68/Mks5cQK+/s180N9TdthbCh4wTCttrwOIt1l9fQgB
 H1eQCjt2OBMWk/90/uJeJoFH0Nk930erKeKbDgGK4wz+DHWtxOmWapFxFdFZDFhcVWFD
 dw8EjYmJ0KNnM42oVL8pN91xazXnR6gGubBox11pM5dMYnIkO+j/lq4c65zDAMDn//I0
 8C/yAgjOxM0HHCVbqU8trsNl6rEk76y2ifKPq3+4JX9LnIRanf5ulKWpZWosHyO506Xg
 MZ0DPd7tVDTn4Ib5oOwI4Z0z4CbpK083RKjKd5m7LhtJdAzq7+33UVYgxRwLYCfer4qA
 gEmQ==
X-Gm-Message-State: AOAM533wZLkf5DdBFli3Xdr9v7FkNoSW/t9CV4aIv/Fwe3SSr3qIYX1W
 TShZb3zxxAXVlHRHPXNTvwnYThd/Tx+SDaLYWPMB9bAtAr5CTha28VkdNCZz3LnQ1tPR+fD0ifm
 Cli9PDW8f6dpxXKM=
X-Received: by 2002:a5d:6a4c:0:b0:20c:dff2:34b2 with SMTP id
 t12-20020a5d6a4c000000b0020cdff234b2mr1889216wrw.671.1652275018723; 
 Wed, 11 May 2022 06:16:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXazAit5ZgiyzR6SwEqHnba3l8eM15mRt7Enxqe+huDT6N9x7Jr3sF0XCogjPgksem7xlVEg==
X-Received: by 2002:a5d:6a4c:0:b0:20c:dff2:34b2 with SMTP id
 t12-20020a5d6a4c000000b0020cdff234b2mr1889182wrw.671.1652275018374; 
 Wed, 11 May 2022 06:16:58 -0700 (PDT)
Received: from [10.43.2.180] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a056000010200b0020cd54239c8sm1637531wrx.61.2022.05.11.06.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 06:16:57 -0700 (PDT)
Message-ID: <c8d84b1f-2a64-fdb4-35f3-875da0575c4d@redhat.com>
Date: Wed, 11 May 2022 15:16:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] util: NUMA aware memory preallocation
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, david@redhat.com
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
 <YnoshVqLNjGFpfEl@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <YnoshVqLNjGFpfEl@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
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

On 5/10/22 11:12, Daniel P. Berrangé wrote:
> On Tue, May 10, 2022 at 08:55:33AM +0200, Michal Privoznik wrote:
>> When allocating large amounts of memory the task is offloaded
>> onto threads. These threads then use various techniques to
>> allocate the memory fully (madvise(), writing into the memory).
>> However, these threads are free to run on any CPU, which becomes
>> problematic on NUMA machines because it may happen that a thread
>> is running on a distant node.
>>
>> Ideally, this is something that a management application would
>> resolve, but we are not anywhere close to that, Firstly, memory
>> allocation happens before monitor socket is even available. But
>> okay, that's what -preconfig is for. But then the problem is that
>> 'object-add' would not return until all memory is preallocated.
>>
>> Long story short, management application has no way of learning
>> TIDs of allocator threads so it can't make them run NUMA aware.
> 
> So I'm wondering what the impact of this problem is for various
> scenarios.

The scenario which I tested this with was no <emulatorpin/> but using
'virsh emulatorpin' afterwards to pin emulator thread somewhere. For
those which are unfamiliar with libvirt, this is about placing the main
qemu TID (with the main eventloop) into a CGroup that restricts on what
CPUs it can run.

> 
> The default config for a KVM guest with libvirt is no CPU pinning
> at all. The kernel auto-places CPUs and decides on where RAM is to
> be allocated. So in this case, whether or not libvirt can talk to
> QMP in time to query threads is largely irrelevant, as we don't
> want todo placement in any case.
> 
> In theory the kernel should allocate RAM on the node local to
> where the process is currently executing. So as long as the
> guest RAM fits in available free RAM on the local node, RAM
> should be allocated from the node that matches the CPU running
> the QEMU main thread.
> 
> The challenge is if we spawn N more threads to do pre-alloc,
> these can be spread onto other nodes. I wonder if the kernel
> huas any preference for keeping threads within a process on
> the same NUMA node ?

That's not exactly what I saw. I would have thought too that initially
the prealloc thread could be spawned just anywhere but after few
iterations the scheduler realized what NUMA node the thread is close to
and automatically schedule it to run there. Well, it didn't happen.

> 
> Overall, if libvirt is not applying pinning to the QEMU guest,
> then we're 100% reliant on the kernel todo something sensible,
> both for normal QEMU execution and for prealloc. Since we're
> not doing placement of QEMU RAM or CPUs, the logic in this
> patch won't do anything either.
> 
> 
> If the guest has more RAM than can fit on the local NUMA node,
> then we're doomed no matter what, even ignoring prealloc, there
> will be cross-node traffic. This scenario requires the admin to
> setup proper CPU /memory pinning for QEMU in libvirt.
> 
> If libvirt is doing CPU pinning (as instructed by the mgmt app
> above us), then when we first start QEMU, the process thread
> leader will get given affinity by libvirt prior to exec. This
> affinity will be the union of affinity for all CPUs that will
> be later configured.
> 
> The typical case for CPU pinning, is that everything fits in
> one NUMA node, and so in this case, we don't need todo anything
> more. The prealloc threads will already be constrained to the
> right place by the affinity of the QEMU thread leader, so the
> logic in this patch will run, but it won't do anything that
> was not already done.
> 
> So we're left with the hardest case, where the guest is explicitly
> spread across multiple NUMA nodes. In this case the thread leader
> affinity will span many NUMA nodes, and so the prealloc threads
> will freely be placed across any CPU that is in the union of CPUs
> the guest is placed on. Just as with thue non-pinned case, the
> prealloc will be at the mercy of the kernel making sensible
> placement decisions.

Indeed, but it's at least somewhat restricted. NB, in real scenario
users will map guest NUMA nodes onto host ones with 1:1 relationship.
And each guest NUMA node will have its own memdev=, i.e. its own set of
threads, so in the end, prealloc threads won't jump between host NUMA
nodes but stay local to the node they are allocating memory on.

> 
> The very last cases is the only one where this patch can potentially
> be beneficial. The problem is that because libvirt is in charge of
> enforcing CPU affinity, IIRC, we explicitly block QEMU from doing
> anything with CPU affinity. So AFAICT, this patch should result in
> an error from sched_setaffinity when run under libvirt.

Yes, I had to disable capability dropping in qemu.conf.

After all, I think maybe the right place to fix this is kernel? I mean,
why don't prealloc threads converge to the nodes they are working with?

Michal


