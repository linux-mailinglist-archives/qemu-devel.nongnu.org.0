Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985BD542DF8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 12:36:53 +0200 (CEST)
Received: from localhost ([::1]:60960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyt3U-0004mG-5r
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 06:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nyt0w-0002md-Ub
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 06:34:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nyt0p-0000AP-Ur
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 06:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654684446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GjYAinFSTQjWUtJ9rxhyf44LZXrIKqYSSwVd5w8zKHg=;
 b=h15ktq83VZtwp3pCGOquLXduJdyz9NqDoDT3eVVLBDn7eUqtR2WPL9NYRQNey05GWzzeJN
 0fxoy57Pbhh+hIm61yd7FUyjZUyhLVI1X95ze0LlmQmvlVVV/C7geV9w+eWsb1n75cpFA/
 5aDASx/rb8/MFKCvNWUgYeCVwiPG6yQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-Y7a1_EKxOV2kWfFj_B2owg-1; Wed, 08 Jun 2022 06:34:04 -0400
X-MC-Unique: Y7a1_EKxOV2kWfFj_B2owg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k15-20020a7bc40f000000b0039c4b7f7d09so3982118wmi.8
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 03:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=GjYAinFSTQjWUtJ9rxhyf44LZXrIKqYSSwVd5w8zKHg=;
 b=yEShvPQ5WZ6VBLJ3RFaG9zSYdiwj0xp1E0S4jdH9vO0Yb3lJkKCdC9tmdiFCyrKICC
 fb2FRytNNOUPQRPW8A1S+JTekkmvDeqFPk/XdWSMJA+eghcKkPa8006kjPe4X27xIKzq
 6ucxGER5JbB3tKsbYtJCvvqEXeq4XShLMrNLlZX6lheP5cAqPLoNetm5ZpNCuhIRoeWQ
 FCY1rIPWfeuYUFDIk4DtDqXNH/csSLBv9UYT0PNygQmHgzVHJ3JY2rXCKD7NNvUjqrib
 dyZzUopYe/Z4BhKfiMFIyAdlsw3vjtkghIRb20rzIRWJtiZ43m33prZ2+YrHmszF9RO8
 dvJg==
X-Gm-Message-State: AOAM533vPaXpWyb2rMwbFCbbHrVv9lygYAV+OfhJBSK1A379XzKtKWUi
 4agYQ2ab3uMyxhjmZ8/p4nl+5BFFJnZHYPepv4UalW0ZOrYllT3rMZaeEgK4DGwF1DclBGW3i25
 OVfYsheiv5IeI8dE=
X-Received: by 2002:adf:f902:0:b0:20e:66db:b9d2 with SMTP id
 b2-20020adff902000000b0020e66dbb9d2mr33254397wrr.682.1654684443586; 
 Wed, 08 Jun 2022 03:34:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzkF7Mbe0wW48cq32jJp0lkINqq+8flPNvur7GG6cKd7tVGfk1i7+XgeYo6+ulm1+nYqrHBQ==
X-Received: by 2002:adf:f902:0:b0:20e:66db:b9d2 with SMTP id
 b2-20020adff902000000b0020e66dbb9d2mr33254362wrr.682.1654684443237; 
 Wed, 08 Jun 2022 03:34:03 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:ad00:db2:4c6:8f3a:2ec4?
 (p200300cbc705ad000db204c68f3a2ec4.dip0.t-ipconnect.de.
 [2003:cb:c705:ad00:db2:4c6:8f3a:2ec4])
 by smtp.gmail.com with ESMTPSA id
 x8-20020adff0c8000000b00210a6bd8019sm20285545wro.8.2022.06.08.03.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 03:34:02 -0700 (PDT)
Message-ID: <c89ecc12-ad7d-78be-e01c-df1812ea1c9d@redhat.com>
Date: Wed, 8 Jun 2022 12:34:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
 <Ynt/v2SHmnO2afg4@redhat.com>
 <8a6b84ed-50bc-8f6e-4b71-7e15247c4ac0@redhat.com>
 <YnuDONrdbMcJT08p@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] util: NUMA aware memory preallocation
In-Reply-To: <YnuDONrdbMcJT08p@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 11.05.22 11:34, Daniel P. Berrangé wrote:
> On Wed, May 11, 2022 at 11:31:23AM +0200, David Hildenbrand wrote:
>>>> Long story short, management application has no way of learning
>>>> TIDs of allocator threads so it can't make them run NUMA aware.
>>>
>>> This feels like the key issue. The preallocation threads are
>>> invisible to libvirt, regardless of whether we're doing coldplug
>>> or hotplug of memory-backends. Indeed the threads are invisible
>>> to all of QEMU, except the memory backend code.
>>>
>>> Conceptually we need 1 or more explicit worker threads, that we
>>> can assign CPU affinity to, and then QEMU can place jobs on them.
>>> I/O threads serve this role, but limited to blockdev work. We
>>> need a generalization of I/O threads, for arbitrary jobs that
>>> QEMU might want to farm out to specific numa nodes.
>>
>> At least the "-object iothread" thingy can already be used for actions
>> outside of blockdev. virtio-balloon uses one for free page hinting.
> 
> Ah that's good to know, so my idea probably isn't so much work as
> I thought it might be.

Looking into the details, iothreads are the wrong tool to use here.

I can imagine use cases where you'd want to perform preallcoation
* Only one some specific CPUs of a NUMA node (especially, not ones where 
  we pinned VCPUs)
* On CPUs that are on a different NUMA node then the actual backend 
  memory ... just thinking about all of the CPU-less nodes for PMEM and 
  CXL that we're starting to see.


So ideally, we'd let the user configure either
* Set of physical CPUs to use (low hanging fruit)
* Set of NUMA nodes to use (harder)
and allow libvirt to easily configure it similarly by pinning threads.

As CPU affinity is inherited when creating a new thread, so here is one
IMHO reasonable simple thing to get the job done and allow for such
flexibility.


Introduce a "thread-context" user-creatable object that is used to
configure CPU affinity.

Internally, thread-context creates exactly one thread called "TC $id".
That thread serves no purpose besides spawning new threads that inherit the
affinity.

Internal users (like preallocation, but we could reuse the same concept for other
non-io threads, such as userfaultfd, and some other potential non-io thread
users) simply use that thread context to spawn new threads.


Spawned threads get called "TC $id/$threadname", whereby $threadname is the
ordinary name supplied by the internal user. This could be used to identify
long-running threads if needed in the future.

It's worth nothing that this is not a thread pool.


a) Ordinary cmdline usage:

-object thread-context,id="tc1",cpus=0-9,cpus=12

QEMU tries setting the CPU affinity and fails if that's impossible.

-object memory-backend-file,...,prealloc=on,prealloc-threads=16,prealloc-thread-context=tc1

When a context is set, preallcoation code will use the thread-context to spawn threads.


b) Libvirt, ..., usage:

-object thread-context,id="tc1"

Then, libvirt identifies and sets the affinity for the "TC tc1" thread.

-object memory-backend-file,...,prealloc=on,prealloc-threads=16,prealloc-thread-context=tc1



thread-context can be reused for successive preallcoation etc, obviously.


-- 
Thanks,

David / dhildenb


