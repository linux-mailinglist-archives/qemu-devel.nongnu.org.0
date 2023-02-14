Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE883696EDF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 22:09:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS2XG-0002pF-UQ; Tue, 14 Feb 2023 16:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pS2XF-0002oz-Fj
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:08:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pS2XC-0006eQ-Ez
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676408897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmOXLodyKJKC9lamC9x6X2K0nXXNpMp+t5ltA8VrwaM=;
 b=Lp9PRyJK0Hup2zoiem87mVrhuHntuPTrTXzGv8sNiNwInPw4p8oUW6X/jXlPMxfXVSvI4n
 rVTf0phflcCexldeSqWwWeDnaifnjE4NlEUCXKPNSpiSsIuJneKp14kZO6vtcX1A39mLWT
 lXneCKNS8aDBXPnabvGRON5QqcEjkQE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-473-29kZAlqNM5aNjCiHgtumZA-1; Tue, 14 Feb 2023 16:08:15 -0500
X-MC-Unique: 29kZAlqNM5aNjCiHgtumZA-1
Received: by mail-qt1-f199.google.com with SMTP id
 a24-20020ac84d98000000b003b9a4958f0cso10003590qtw.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 13:08:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bmOXLodyKJKC9lamC9x6X2K0nXXNpMp+t5ltA8VrwaM=;
 b=jNoR0DVUgRPg5uzm0rStrL7skt/NtVVfsARn4W+zrJxX4PLgd6wJ8CefvcNbQ/ikVl
 EMPGScjD0/7caLRLyorOHQOIg5WpfHKL+3cAiKOxfzSbD2c3DA/+ctCUX9vFC3VZiz7d
 Ul2+upV13sDvWay7EmRuL8RTS1ugbTOVY2JbE6VbDaGY+/IuvQ0n8rG7URHB/j/E28gc
 2Y+RbkgRetCMm68DDgWMRpHIgnl/keC+s2ieDiRvNEZJHtYdlE5fJFtS2EtLlrImQzZo
 N/qA61rtkicR8SpAqQaRKiTdRqG3VbSffpWAJ6A0MBCt+87OXCKhjQbjh++Yqeg0epZE
 Esxg==
X-Gm-Message-State: AO0yUKVRGO7HbJ7EIa4JM5e9+tNwJobgfkvHYwLfUJ8N2yVAoank+uB6
 2R+m1JBtWgGC8ebweLaMPeImSaB5XFKWbyxKOg8v3zIQ+VFCzlq9ZP5HfP0aUikMSs/zqMLcOik
 HLvH+3bGBXvRc7tA=
X-Received: by 2002:a05:6214:c22:b0:56b:ed1b:ac05 with SMTP id
 a2-20020a0562140c2200b0056bed1bac05mr6879908qvd.43.1676408895241; 
 Tue, 14 Feb 2023 13:08:15 -0800 (PST)
X-Google-Smtp-Source: AK7set9rNhVYpkn5X08Zo3/9h1NuW6o9aJe20ICh8ftrp5iPNDMoZo1nrQRRoDWRzGMYSq3hekYfBA==
X-Received: by 2002:a05:6214:c22:b0:56b:ed1b:ac05 with SMTP id
 a2-20020a0562140c2200b0056bed1bac05mr6879884qvd.43.1676408894967; 
 Tue, 14 Feb 2023 13:08:14 -0800 (PST)
Received: from [192.168.8.104] (tmo-116-175.customers.d1-online.com.
 [80.187.116.175]) by smtp.gmail.com with ESMTPSA id
 e68-20020a37b547000000b0071aacb2c76asm12546354qkf.132.2023.02.14.13.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:08:14 -0800 (PST)
Message-ID: <afd40230-881c-db84-b3fd-fbdf5b6fff5e@redhat.com>
Date: Tue, 14 Feb 2023 22:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 00/10] Retire Fork-Based Fuzzing
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230205042951.3570008-1-alxndr@bu.edu> <Y+uq234pKMdKpPyT@fedora>
 <f5f42e9a-e0eb-341a-32ff-4d1ebd8830b7@linaro.org>
 <deaaf4c2-2a09-dadf-6de2-aa3351ce8abe@redhat.com>
 <20230214191447.ugtjw33n65fio43u@mozz.bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230214191447.ugtjw33n65fio43u@mozz.bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 14/02/2023 20.14, Alexander Bulekov wrote:
> On 230214 2009, Thomas Huth wrote:
>> On 14/02/2023 17.08, Philippe Mathieu-Daudé wrote:
>>> On 14/2/23 16:38, Stefan Hajnoczi wrote:
>>>> On Sat, Feb 04, 2023 at 11:29:41PM -0500, Alexander Bulekov wrote:
>>>>> Hello,
>>>>> This series removes fork-based fuzzing.
>>>>> How does fork-based fuzzing work?
>>>>>    * A single parent process initializes QEMU
>>>>>    * We identify the devices we wish to fuzz (fuzzer-dependent)
>>>>>    * Use QTest to PCI enumerate the devices
>>>>>    * After that we start a fork-server which forks the process and executes
>>>>>      fuzzer inputs inside the disposable children.
>>>>>
>>>>> In a normal fuzzing process, everything happens in a single process.
>>>>>
>>>>> Pros of fork-based fuzzing:
>>>>>    * We only need to do common configuration once (e.g. PCI enumeration).
>>>>>    * Fork provides a strong guarantee that fuzzer inputs will not
>>>>> interfere with
>>>>>      each-other
>>>>>    * The fuzzing process can continue even after a child-process crashes
>>>>>    * We can apply our-own timers to child-processes to exit slow
>>>>> inputs, early
>>>>>
>>>>> Cons of fork-based fuzzing:
>>>>>    * Fork-based fuzzing is not supported by libfuzzer. We had to
>>>>> build our own
>>>>>      fork-server and rely on tricks using linker-scripts and shared-memory to
>>>>>      support fuzzing. (
>>>>> https://physics.bu.edu/~alxndr/libfuzzer-forkserver/ )
>>>>>    * Fork-based fuzzing is currently the main blocker preventing
>>>>> us from enabling
>>>>>      other fuzzers such as AFL++ on OSS-Fuzz
>>>>>    * Fork-based fuzzing may be a reason why coverage-builds are failing on
>>>>>      OSS-Fuzz. Coverage is an important fuzzing metric which
>>>>> would allow us to
>>>>>      find parts of the code that are not well-covered.
>>>>>    * Fork-based fuzzing has high overhead. fork() is an expensive
>>>>> system-call,
>>>>>      especially for processes running ASAN (with large/complex) VMA layouts.
>>>>>    * Fork prevents us from effectively fuzzing devices that rely on
>>>>>      threads (e.g. qxl).
>>>>>
>>>>> These patches remove fork-based fuzzing and replace it with reboot-based
>>>>> fuzzing for most cases. Misc notes about this change:
>>>>>    * libfuzzer appears to be no longer in active development. As such, the
>>>>>      current implementation of fork-based fuzzing (while having some nice
>>>>>      advantages) is likely to hold us back in the future. If these changes
>>>>>      are approved and appear to run successfully on OSS-Fuzz, we should be
>>>>>      able to easily experiment with other fuzzing engines (AFL++).
>>>>>    * Some device do not completely reset their state. This can lead to
>>>>>      non-reproducible crashes. However, in my local tests, most crashes
>>>>>      were reproducible. OSS-Fuzz shouldn't send us reports unless it can
>>>>>      consistently reproduce a crash.
>>>>>    * In theory, the corpus-format should not change, so the existing
>>>>>      corpus-inputs on OSS-Fuzz will transfer to the new reset()-able
>>>>>      fuzzers.
>>>>>    * Each fuzzing process will now exit after a single crash is found. To
>>>>>      continue the fuzzing process, use libfuzzer flags such as -jobs=-1
>>>>>    * We no long control input-timeouts (those are handled by libfuzzer).
>>>>>      Since timeouts on oss-fuzz can be many seconds long, I added a limit
>>>>>      on the number of DMA bytes written.
>>>>>
>>>>> Alexander Bulekov (10):
>>>>>     hw/sparse-mem: clear memory on reset
>>>>>     fuzz: add fuzz_reboot API
>>>>>     fuzz/generic-fuzz: use reboots instead of forks to reset state
>>>>>     fuzz/generic-fuzz: add a limit on DMA bytes written
>>>>>     fuzz/virtio-scsi: remove fork-based fuzzer
>>>>>     fuzz/virtio-net: remove fork-based fuzzer
>>>>>     fuzz/virtio-blk: remove fork-based fuzzer
>>>>>     fuzz/i440fx: remove fork-based fuzzer
>>>>>     fuzz: remove fork-fuzzing scaffolding
>>>>>     docs/fuzz: remove mentions of fork-based fuzzing
>>>>>
>>>>>    docs/devel/fuzzing.rst              |  22 +-----
>>>>>    hw/mem/sparse-mem.c                 |  13 +++-
>>>>>    meson.build                         |   4 -
>>>>>    tests/qtest/fuzz/fork_fuzz.c        |  41 ----------
>>>>>    tests/qtest/fuzz/fork_fuzz.h        |  23 ------
>>>>>    tests/qtest/fuzz/fork_fuzz.ld       |  56 --------------
>>>>>    tests/qtest/fuzz/fuzz.c             |   6 ++
>>>>>    tests/qtest/fuzz/fuzz.h             |   2 +-
>>>>>    tests/qtest/fuzz/generic_fuzz.c     | 111 +++++++---------------------
>>>>>    tests/qtest/fuzz/i440fx_fuzz.c      |  27 +------
>>>>>    tests/qtest/fuzz/meson.build        |   6 +-
>>>>>    tests/qtest/fuzz/virtio_blk_fuzz.c  |  51 ++-----------
>>>>>    tests/qtest/fuzz/virtio_net_fuzz.c  |  54 ++------------
>>>>>    tests/qtest/fuzz/virtio_scsi_fuzz.c |  51 ++-----------
>>>>>    14 files changed, 72 insertions(+), 395 deletions(-)
>>>>>    delete mode 100644 tests/qtest/fuzz/fork_fuzz.c
>>>>>    delete mode 100644 tests/qtest/fuzz/fork_fuzz.h
>>>>>    delete mode 100644 tests/qtest/fuzz/fork_fuzz.ld
>>>>
>>>> Whose tree should this go through? Laurent's qtest tree?
>>>
>>> Do you mean Thomas?
>>
>> I thought Alexander would be doing pull requests for fuzzing-related patches
>> nowadays (since he's the listed maintainer for these files)? Or did I get
>> that wrong?
> 
> I have, though in the past I've been asked to send the PR to different
> people. Who should I send this PR to?

I assume you should have enough experience with sending PRs now, so if Peter 
does not mind, I'd suggest to directly send PRs to Peter now. If that does 
not work for some reason, feel free to send a “not for master” pull request 
to me instead, then I'll take it along with my next qtest-related PR.

  Thomas


