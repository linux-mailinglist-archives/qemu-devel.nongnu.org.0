Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAE03C9A5E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 10:17:59 +0200 (CEST)
Received: from localhost ([::1]:50638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3wZC-000634-3H
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 04:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m3wYH-0004Bc-OB
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 04:17:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m3wYE-0003e6-60
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 04:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626337015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ant1sPHqPCnxyFLVvD5lyDNG81QyM89tKf7yhGg694E=;
 b=Pkqn7lz+CEvFoigL6cFUmqu1rjuLWJ5fv2etkq2+ie9MupZDPDYFZhckLuuN6/fwnjWcuJ
 R//U35h6TjE5Zn1KZSVFj+/+ANBQFCTXtw3svcGwy889eNSSO/GQxNIAzyhgF3E7GU9EzU
 XlezpKXljCmegQvE6cTSJZzowYARbF4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-2oRulqkJMn6EF-aHeSzF5A-1; Thu, 15 Jul 2021 04:16:54 -0400
X-MC-Unique: 2oRulqkJMn6EF-aHeSzF5A-1
Received: by mail-wr1-f70.google.com with SMTP id
 32-20020adf82a30000b029013b21c75294so2950840wrc.14
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 01:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ant1sPHqPCnxyFLVvD5lyDNG81QyM89tKf7yhGg694E=;
 b=azdbeA9ceh6mw1EZp8stH0wiwulZRIi2YYpNUinG/TUgcVLAs5De+RvNb0InFvDPWI
 6vQHHAgrsPZY9YXj6lSvN8Qcr0cB1aGOk5sEta33MJ6JPIkXURqHCFLeO32ouaXTUmS3
 c0my9RdTVgsOsrcKltmR0blMOGVJd5+LVbQMaWK4gwoXGHaBKihGUlN1bKXv5d38IQVD
 Abg/7ry0ivWdyF2i/q8CMY7AkMYF6SzugNoItIrh7808oUBA865Fhqzg/ZCBMKSEJpKR
 FSx8P1XgP6xguryol2VW/WlY+Qb407ezrWxcOps1TSwhHWMKQU1eUDunyAk4pO1qDJkH
 8p5w==
X-Gm-Message-State: AOAM5300kkb37O8i9LYM1BmpnMWE2AZPSEK4QO5HBlQrUA+Qe7kOGXAo
 R7sTSbkupZB1jAJCPBJkF8+M5yWdQN2WLSmDo0ruS/Ss+DNvPFuiyZ3G1ubS0YHLS74zCe4w/2m
 lq6+TCGVaPzlRkwc=
X-Received: by 2002:a5d:634e:: with SMTP id b14mr3769483wrw.81.1626337013288; 
 Thu, 15 Jul 2021 01:16:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8Z5I6WjGjyQSzqEESGnMYWeb1LFuYzB3oZYe4gBgtUN7jpJDuzpH0cOaFDuhLMx/k+3oy8w==
X-Received: by 2002:a5d:634e:: with SMTP id b14mr3769451wrw.81.1626337013048; 
 Thu, 15 Jul 2021 01:16:53 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23bb3.dip0.t-ipconnect.de. [79.242.59.179])
 by smtp.gmail.com with ESMTPSA id o3sm5585280wrm.5.2021.07.15.01.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 01:16:52 -0700 (PDT)
Subject: Re: tests/acceptance/multiprocess.py test failure
To: Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 David Hildenbrand <dhildenb@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Willian Rampazzo <willianr@redhat.com>
References: <CA+bd_6+2zk0N=s-D2OG4FUZ-HirJ+8HkMUktF=Jqyf9_HhyH1w@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <287d8097-f865-6f89-6062-567a7994987c@redhat.com>
Date: Thu, 15 Jul 2021 10:16:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CA+bd_6+2zk0N=s-D2OG4FUZ-HirJ+8HkMUktF=Jqyf9_HhyH1w@mail.gmail.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.07.21 03:59, Cleber Rosa wrote:
> Hi everyone,
> 
> The tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_x86_64
> is currently failing (as of a9649a719a44894b81f38dc1c5c1888ee684acef).
> Unfortunately CI was unable to catch this issue earlier, because tests
> that require KVM are not yet running (but this should change soon).
> The relevant part of the test logs is:
> 
> VM launch command: './qemu-system-x86_64 -display none -vga none
> -chardev socket,id=mon,path=/var/tmp/avo_qemu_sock_5g22rvrp/qemu-427815-monitor.sock
> -mon chardev=mon,mode=control -chardev
> socket,id=console,path=/var/tmp/avo_qemu_sock_5g22rvrp/qemu-427815-console.sock,server=on,wait=off
> -serial chardev:console -machine pc -accel kvm -cpu host -object
> memory-backend-memfd,id=sysmem-file,size=2G --numa
> node,memdev=sysmem-file -m 2048 -kernel
> /home/cleber/avocado/data/cache/by_location/b4c64f15a75b083966d39d9246dd8db177736bb4/vmlinuz
> -initrd /home/cleber/avocado/data/cache/by_location/b4c64f15a75b083966d39d9246dd8db177736bb4/initrd.img
> -append printk.time=0 console=ttyS0 rdinit=/bin/bash -device
> x-pci-proxy-dev,id=lsi1,fd=16'
>>>> {'execute': 'qmp_capabilities'}
> 
> The test remains stuck here for as long as the test is allowed to run.
> Because there's currently no timeout in the test, it can remain stuck
> forever.  But, with a timeout, we end up getting:
> 
> Error launching VM
> Command: './qemu-system-x86_64 -display none -vga none -chardev
> socket,id=mon,path=/var/tmp/avo_qemu_sock_5g22rvrp/qemu-427815-monitor.sock
> -mon chardev=mon,mode=control -chardev
> socket,id=console,path=/var/tmp/avo_qemu_sock_5g22rvrp/qemu-427815-console.sock,server=on,wait=off
> -serial chardev:console -machine pc -accel kvm -cpu host -object
> memory-backend-memfd,id=sysmem-file,size=2G --numa
> node,memdev=sysmem-file -m 2048 -kernel
> /home/cleber/avocado/data/cache/by_location/b4c64f15a75b083966d39d9246dd8db177736bb4/vmlinuz
> -initrd /home/cleber/avocado/data/cache/by_location/b4c64f15a75b083966d39d9246dd8db177736bb4/initrd.img
> -append printk.time=0 console=ttyS0 rdinit=/bin/bash -device
> x-pci-proxy-dev,id=lsi1,fd=16'
> Output: "qemu-system-x86_64: ../../src/qemu/softmmu/physmem.c:2055:
> qemu_ram_alloc_from_fd: Assertion `(ram_flags & ~(RAM_SHARED |
> RAM_PMEM | RAM_NORESERVE)) == 0' failed.\n"
> 
> I've bisected it to:
> 
> ---
> 
> d5015b80134047013eeec10000df5ce2014ee114 is the first bad commit
> commit d5015b80134047013eeec10000df5ce2014ee114
> Author: David Hildenbrand <david@redhat.com>
> Date:   Mon May 10 13:43:17 2021 +0200
> 
>      softmmu/memory: Pass ram_flags to qemu_ram_alloc_from_fd()
> 
>      Let's pass in ram flags just like we do with qemu_ram_alloc_from_file(),
>      to clean up and prepare for more flags.
> 
>      Simplify the documentation of passed ram flags: Looking at our
>      documentation of RAM_SHARED and RAM_PMEM is sufficient, no need to be
>      repetitive.
> 
>      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>      Reviewed-by: Peter Xu <peterx@redhat.com>
>      Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend
> and machine core
>      Signed-off-by: David Hildenbrand <david@redhat.com>
>      Message-Id: <20210510114328.21835-5-david@redhat.com>
>      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
>   backends/hostmem-memfd.c | 7 ++++---
>   hw/misc/ivshmem.c        | 5 ++---
>   include/exec/memory.h    | 9 +++------
>   include/exec/ram_addr.h  | 6 +-----
>   softmmu/memory.c         | 7 +++----
>   5 files changed, 13 insertions(+), 21 deletions(-)
> 
> ---
> 
> To reproduce it:
> 
> 1. configure --target-list=x86_64-softmmu
> 2. meson compile
> 3. make check-venv
> 4. ./tests/venv/bin/avocado --show=test run --job-timeout=20s
> tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_x86_64
> 
> It'd be helpful to know if anyone else is experiencing the same failure.

Hi,

maybe

https://lkml.kernel.org/r/20210709052800.63588-1-yang.zhong@intel.com

resolves your issue. If not, pleas let me know and I'll try reproducing 
(will have to install avocado).

-- 
Thanks,

David / dhildenb


