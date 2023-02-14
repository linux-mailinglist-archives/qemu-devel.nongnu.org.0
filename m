Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0990D696C23
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:59:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRzZS-0001gs-Jl; Tue, 14 Feb 2023 12:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pRzZM-0001gY-Un
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:58:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pRzZK-0006BK-PY
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676397495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYp/p6X7AOLiTu2jOPysyGEsOehHU7RkLWq1CkECZTw=;
 b=HAAjQo8yqz5x0DogUcpSloqx9xh0PUQBB7ePk+bjNPLZS57bCmSdztTZrVBfOhUBAxDfY+
 9NpLZu4XRgva7loyn03E6PY6McNp6o1I6St7RafP7EqeHtrWJZenQdo5tx7fwbYaUk8szs
 lhPtgwAhgV/DqVdYuWkVBH1podclOlE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-Q4wyX2tCNe-oyI8i3yhbWw-1; Tue, 14 Feb 2023 12:58:14 -0500
X-MC-Unique: Q4wyX2tCNe-oyI8i3yhbWw-1
Received: by mail-qv1-f69.google.com with SMTP id
 lt2-20020a056214570200b0056eb0500ee1so3780440qvb.18
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 09:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BYp/p6X7AOLiTu2jOPysyGEsOehHU7RkLWq1CkECZTw=;
 b=LFrrAaGAb8EMPMwMEd516zvOOHKhjP1Iy5FIJCaWG8PczH5XjrSTsGFoanzENg6o3E
 yMnFAXWi/MFo4YaQM1wOquOuemJEhgLdLWXVmGqjgii3taDFy7vvTHXBtTEshwkLR3JO
 oTqPZ+vIPvhiExCiw8CtkAmtl1T77vUyaxHJKDvFwSSGeuLmd8Gga1Vqef0cMwce/y0i
 JxkfRXJb8uAl/Clt11kzBHHvYxVVlsQeGADcqBuneAuWMMFtdZIAhT3ynMabretoj7tH
 DoQgP2vHf+JVX9LceYM7NbtKL02027/J2UwErY0zNbyKgOksZyqc3qnLAbMvadeUwSpM
 O3NQ==
X-Gm-Message-State: AO0yUKXyHIp5gVruqebPE4aSWT3eDgCi/UAVz+mG5GZFx8uwFVYJkoKi
 8LrYl943ORlYzUJ9gorJa+my3BczSJiwPK02ipwynjnMmw07amZv1YoRuZjaTQzxjWkzlW5VsRd
 C4xFEtdHm9AN64Ug=
X-Received: by 2002:ad4:5fcb:0:b0:56e:aeb3:52b7 with SMTP id
 jq11-20020ad45fcb000000b0056eaeb352b7mr6964740qvb.4.1676397494360; 
 Tue, 14 Feb 2023 09:58:14 -0800 (PST)
X-Google-Smtp-Source: AK7set9ToNGX8f534zsuSEWcuw3EnelGF5qGw8ixFtoBXqBQzr+ekoHBs+Toq2w6RJa8lO921c1Z+w==
X-Received: by 2002:ad4:5fcb:0:b0:56e:aeb3:52b7 with SMTP id
 jq11-20020ad45fcb000000b0056eaeb352b7mr6964706qvb.4.1676397494091; 
 Tue, 14 Feb 2023 09:58:14 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 n76-20020a37404f000000b00729b7d71ac7sm12163579qka.33.2023.02.14.09.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 09:58:13 -0800 (PST)
Message-ID: <323ad0aa-e38f-bcc1-8c6f-0732c1cd0fc0@redhat.com>
Date: Tue, 14 Feb 2023 18:58:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 00/10] Retire Fork-Based Fuzzing
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Bandan Das <bsd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230205042951.3570008-1-alxndr@bu.edu> <Y+uq234pKMdKpPyT@fedora>
 <f5f42e9a-e0eb-341a-32ff-4d1ebd8830b7@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <f5f42e9a-e0eb-341a-32ff-4d1ebd8830b7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.999 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/14/23 17:08, Philippe Mathieu-Daudé wrote:
> On 14/2/23 16:38, Stefan Hajnoczi wrote:
>> On Sat, Feb 04, 2023 at 11:29:41PM -0500, Alexander Bulekov wrote:
>>> Hello,
>>> This series removes fork-based fuzzing.
>>> How does fork-based fuzzing work?
>>>   * A single parent process initializes QEMU
>>>   * We identify the devices we wish to fuzz (fuzzer-dependent)
>>>   * Use QTest to PCI enumerate the devices
>>>   * After that we start a fork-server which forks the process and executes
>>>     fuzzer inputs inside the disposable children.
>>>
>>> In a normal fuzzing process, everything happens in a single process.
>>>
>>> Pros of fork-based fuzzing:
>>>   * We only need to do common configuration once (e.g. PCI enumeration).
>>>   * Fork provides a strong guarantee that fuzzer inputs will not interfere with
>>>     each-other
>>>   * The fuzzing process can continue even after a child-process crashes
>>>   * We can apply our-own timers to child-processes to exit slow inputs, early
>>>
>>> Cons of fork-based fuzzing:
>>>   * Fork-based fuzzing is not supported by libfuzzer. We had to build our own
>>>     fork-server and rely on tricks using linker-scripts and shared-memory to
>>>     support fuzzing. ( https://physics.bu.edu/~alxndr/libfuzzer-forkserver/ )
>>>   * Fork-based fuzzing is currently the main blocker preventing us from enabling
>>>     other fuzzers such as AFL++ on OSS-Fuzz
>>>   * Fork-based fuzzing may be a reason why coverage-builds are failing on
>>>     OSS-Fuzz. Coverage is an important fuzzing metric which would allow us to
>>>     find parts of the code that are not well-covered.
>>>   * Fork-based fuzzing has high overhead. fork() is an expensive system-call,
>>>     especially for processes running ASAN (with large/complex) VMA layouts.
>>>   * Fork prevents us from effectively fuzzing devices that rely on
>>>     threads (e.g. qxl).
>>>
>>> These patches remove fork-based fuzzing and replace it with reboot-based
>>> fuzzing for most cases. Misc notes about this change:
>>>   * libfuzzer appears to be no longer in active development. As such, the
>>>     current implementation of fork-based fuzzing (while having some nice
>>>     advantages) is likely to hold us back in the future. If these changes
>>>     are approved and appear to run successfully on OSS-Fuzz, we should be
>>>     able to easily experiment with other fuzzing engines (AFL++).
>>>   * Some device do not completely reset their state. This can lead to
>>>     non-reproducible crashes. However, in my local tests, most crashes
>>>     were reproducible. OSS-Fuzz shouldn't send us reports unless it can
>>>     consistently reproduce a crash.
>>>   * In theory, the corpus-format should not change, so the existing
>>>     corpus-inputs on OSS-Fuzz will transfer to the new reset()-able
>>>     fuzzers.
>>>   * Each fuzzing process will now exit after a single crash is found. To
>>>     continue the fuzzing process, use libfuzzer flags such as -jobs=-1
>>>   * We no long control input-timeouts (those are handled by libfuzzer).
>>>     Since timeouts on oss-fuzz can be many seconds long, I added a limit
>>>     on the number of DMA bytes written.
>>>
>>> Alexander Bulekov (10):
>>>    hw/sparse-mem: clear memory on reset
>>>    fuzz: add fuzz_reboot API
>>>    fuzz/generic-fuzz: use reboots instead of forks to reset state
>>>    fuzz/generic-fuzz: add a limit on DMA bytes written
>>>    fuzz/virtio-scsi: remove fork-based fuzzer
>>>    fuzz/virtio-net: remove fork-based fuzzer
>>>    fuzz/virtio-blk: remove fork-based fuzzer
>>>    fuzz/i440fx: remove fork-based fuzzer
>>>    fuzz: remove fork-fuzzing scaffolding
>>>    docs/fuzz: remove mentions of fork-based fuzzing
>>>
>>>   docs/devel/fuzzing.rst              |  22 +-----
>>>   hw/mem/sparse-mem.c                 |  13 +++-
>>>   meson.build                         |   4 -
>>>   tests/qtest/fuzz/fork_fuzz.c        |  41 ----------
>>>   tests/qtest/fuzz/fork_fuzz.h        |  23 ------
>>>   tests/qtest/fuzz/fork_fuzz.ld       |  56 --------------
>>>   tests/qtest/fuzz/fuzz.c             |   6 ++
>>>   tests/qtest/fuzz/fuzz.h             |   2 +-
>>>   tests/qtest/fuzz/generic_fuzz.c     | 111 +++++++---------------------
>>>   tests/qtest/fuzz/i440fx_fuzz.c      |  27 +------
>>>   tests/qtest/fuzz/meson.build        |   6 +-
>>>   tests/qtest/fuzz/virtio_blk_fuzz.c  |  51 ++-----------
>>>   tests/qtest/fuzz/virtio_net_fuzz.c  |  54 ++------------
>>>   tests/qtest/fuzz/virtio_scsi_fuzz.c |  51 ++-----------
>>>   14 files changed, 72 insertions(+), 395 deletions(-)
>>>   delete mode 100644 tests/qtest/fuzz/fork_fuzz.c
>>>   delete mode 100644 tests/qtest/fuzz/fork_fuzz.h
>>>   delete mode 100644 tests/qtest/fuzz/fork_fuzz.ld
>>>
>>> -- 
>>> 2.39.0
>>>
>>
>> Whose tree should this go through? Laurent's qtest tree?
> 
> Do you mean Thomas?
> 
> $ git shortlog -cs tests/qtest/fuzz | sort -rn
>      32  Thomas Huth
>      26  Paolo Bonzini
>      19  Stefan Hajnoczi
>       6  Markus Armbruster
>       5  Alexander Bulekov
>       4  Marc-André Lureau
>       3  Peter Maydell
>       2  Laurent Vivier
>       1  Michael S. Tsirkin
>       1  Gerd Hoffmann
> 
> In doubt, cc'ing both :)

Yes, Thomas is the real maintainer.

> 
>> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> 


