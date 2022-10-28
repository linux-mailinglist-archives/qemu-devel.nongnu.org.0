Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C01611007
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 13:51:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooNrT-0007fT-Az; Fri, 28 Oct 2022 07:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooNrP-0007fM-1D
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 07:49:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooNrN-0004zY-5Y
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 07:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666957751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QRif8mdfVn2XJ3/ra5C73Q0nwa4Z55tL+H+7WWiW130=;
 b=dgJxfaixMTLcLm28MCqcRBYOEac86xtbIG7ZcRuu7KvasWuyt4JY7smfhT2ive8uqLVgr8
 77qoK5c4VF9UPHtS0IbZyu00eMK8iuuZJz8jFsJkFsS9pZv+nEm5+Pad4UvxDdYWCdEL0Q
 UxU7kBZcdpF5sVn4GwOQsCin+k2l+a8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619-L0BACHeXNiOz5ZMsSUxp9A-1; Fri, 28 Oct 2022 07:49:08 -0400
X-MC-Unique: L0BACHeXNiOz5ZMsSUxp9A-1
Received: by mail-wr1-f69.google.com with SMTP id
 b10-20020adfc74a000000b002365575a405so1099233wrh.6
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 04:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QRif8mdfVn2XJ3/ra5C73Q0nwa4Z55tL+H+7WWiW130=;
 b=T7ChoWnkoH5FRD6g+QqREB+ikppRtjZkZhJ7kGFdnnfjoFI/FZAv7ZzrSTcbBSyF+v
 2qYeoLRQcwUBhnfTuU0zNBEEBFqbw3Q8F850I9fXGxoqOftghWUKTCcFWEeLz4/UtJdt
 0WmBJ5/R+l9i7pH3zv4QUvJr/IcXdAO2PNGnLQ+09hQOce3O6W5Z/B4al6paB6aznmNr
 If47TQ7nnUEjsxfS8ZBZLdpZueLgSUiyQCGtfPrDXpmsGpxhY0y6u4NEIwF33TZNGba7
 NpadD5PuF8HSTbk6kIHIU4OQEL1+BmVktUV/xh1oZH+E2t0rUN/MQj85uV88m1AtzLeK
 OSgg==
X-Gm-Message-State: ACrzQf3cTdfBgjGbNb8p7W/CmxiB7xDMMYYl9iMivXVV0XaJWQmZFG/1
 9X5FSzBgdPz2beIIsYDhSn0utEpNQrRm/zJXeAS0nqlGlfflRhg+troZUDrmXEkld3isolPwyXS
 /+Q7xPr45qbQbntk=
X-Received: by 2002:a05:6000:1c1a:b0:236:8321:d875 with SMTP id
 ba26-20020a0560001c1a00b002368321d875mr11466867wrb.45.1666957747777; 
 Fri, 28 Oct 2022 04:49:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM42wPPCEEScFkuSCZx5Op8jZX0qyzws/bNwc72fygfJ/kb0kZOKzliWDcBcux0xxgT0KQEyNQ==
X-Received: by 2002:a05:6000:1c1a:b0:236:8321:d875 with SMTP id
 ba26-20020a0560001c1a00b002368321d875mr11466838wrb.45.1666957747468; 
 Fri, 28 Oct 2022 04:49:07 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-14.web.vodafone.de.
 [109.43.177.14]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b003b4c979e6bcsm7890623wmq.10.2022.10.28.04.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 04:49:06 -0700 (PDT)
Message-ID: <d69816ef-dcaa-2c46-a7aa-9c5512587d10@redhat.com>
Date: Fri, 28 Oct 2022 13:49:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <CAMxuvawoU3P_eHknzzEaPnr6evzCOUij-pMnHJvpdvP4HZpc3g@mail.gmail.com>
 <CAEUhbmWPAa+KX=pu4d5WmnxkSpHTcLKYgaK_JE8g_5X3SK_NvA@mail.gmail.com>
 <CAMxuvawyOgSQtJvxsn0+F8ctxG+PD4a1bYtyr+udoUNL8m89cg@mail.gmail.com>
 <CAEUhbmVto1KVo7X36hs-25=c7XFA+Q9uZFCQD7Zk7FQ-g1ORJQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v6 00/11] tests/qtest: Enable running qtest on Windows
In-Reply-To: <CAEUhbmVto1KVo7X36hs-25=c7XFA+Q9uZFCQD7Zk7FQ-g1ORJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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

On 28/10/2022 11.43, Bin Meng wrote:
> On Fri, Oct 28, 2022 at 5:41 PM Marc-André Lureau
> <marcandre.lureau@redhat.com> wrote:
>>
>> Hi
>>
>> On Fri, Oct 28, 2022 at 1:21 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>
>>> On Fri, Oct 28, 2022 at 4:09 PM Marc-André Lureau
>>> <marcandre.lureau@redhat.com> wrote:
>>>>
>>>> Hi
>>>>
>>>> On Fri, Oct 28, 2022 at 8:58 AM Bin Meng <bin.meng@windriver.com> wrote:
>>>>>
>>>>> In preparation to adding virtio-9p support on Windows, this series
>>>>> enables running qtest on Windows, so that we can run the virtio-9p
>>>>> tests on Windows to make sure it does not break accidently.
>>>>>
>>>>> Changes in v6:
>>>>> - drop patches that are already in Alex and Daniel's tree
>>>>> - remove CONFIG_POSIX from meson.build
>>>>> - include <qemu/sockets.h> in libqtest.c
>>>>> - move documentation comments of qemu_send_full() from util/osdep.c
>>>>>    to qemu/sockets.h
>>>>> - save the "exit_code" in struct QTestState
>>>>> - new patch: "tests/qtest: device-plug-test: Reverse the usage of double/single quotes"
>>>>> - new patch: "tests/qtest: Use EXIT_FAILURE instead of magic number"
>>>>> - new patch: "tests/qtest: libqtest: Introduce qtest_wait_qemu()"
>>>>> - change to use qtest_wait_qemu() API
>>>>> - new patch: "test/qtest/libqos: meson.build: Do not build virtio-9p unconditionally"
>>>>>
>>>>> Changes in v5:
>>>>> - restore to v1 version which does not touch the posix implementation
>>>>> - Drop patches that are already merged
>>>>>
>>>>> Changes in v3:
>>>>> - Add a usleep(1) in the busy wait loop
>>>>> - Drop the host test
>>>>>
>>>>> Changes in v2:
>>>>> - Introduce qemu_send_full() and use it
>>>>> - Move the enabling of building qtests on Windows to a separate
>>>>>    patch to keep bisectablity
>>>>> - Call socket_init() unconditionally
>>>>> - Add a missing CloseHandle() call
>>>>> - Change to a busy wait after migration is canceled
>>>>> - Change the timeout limit to 90 minutes
>>>>> - new patch: "tests/qtest: Enable qtest build on Windows"
>>>>>
>>>>> Bin Meng (8):
>>>>>    tests/qtest: Support libqtest to build and run on Windows
>>>>>    tests/qtest: device-plug-test: Reverse the usage of double/single
>>>>>      quotes
>>>>>    tests/qtest: Use EXIT_FAILURE instead of magic number
>>>>>    tests/qtest: libqtest: Introduce qtest_wait_qemu()
>>>>>    tests/qtest: libqos: Do not build virtio-9p unconditionally
>>>>>    tests/qtest: libqtest: Correct the timeout unit of blocking receive
>>>>>      calls for win32
>>>>>    .gitlab-ci.d/windows.yml: Increase the timeout to 90 minutes
>>>>>    tests/qtest: Enable qtest build on Windows
>>>>>
>>>>> Xuzhou Cheng (3):
>>>>>    accel/qtest: Support qtest accelerator for Windows
>>>>>    tests/qtest: Use send/recv for socket communication
>>>>>    tests/qtest: migration-test: Make sure QEMU process "to" exited after
>>>>>      migration is canceled
>>>>>
>>>>>   include/hw/core/cpu.h           |   1 +
>>>>>   include/qemu/sockets.h          |  13 +++
>>>>>   tests/qtest/libqtest.h          |   9 ++
>>>>>   accel/dummy-cpus.c              |  14 ++-
>>>>>   softmmu/cpus.c                  |   9 +-
>>>>>   tests/qtest/dbus-vmstate-test.c |   2 +-
>>>>>   tests/qtest/device-plug-test.c  |  16 ++--
>>>>>   tests/qtest/libqmp.c            |   5 +-
>>>>>   tests/qtest/libqtest.c          | 151 ++++++++++++++++++++++++++++----
>>>>>   tests/qtest/migration-test.c    |   8 +-
>>>>>   util/osdep.c                    |  22 +++++
>>>>>   .gitlab-ci.d/windows.yml        |   4 +-
>>>>>   accel/meson.build               |   2 +-
>>>>>   accel/qtest/meson.build         |   3 +-
>>>>>   tests/qtest/libqos/meson.build  |   6 +-
>>>>>   tests/qtest/meson.build         |   6 --
>>>>>   16 files changed, 221 insertions(+), 50 deletions(-)
>>>>>
>>>>> --
>>>>> 2.25.1
>>>>>
>>>>
>>>> Series looks good to me:
>>>> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>>
>>>>
>>>> However, many qtests are flaky on Windows. I get a number of "broken pipe" exit code 3 & timeout. Should gitlab ignore windows test failures ? Or perhaps have a new "ignored" job for the windows qtests. What's your experience running gitlab CI with this series? Can you share results? (I kicked off one here https://gitlab.com/marcandre.lureau/qemu/-/pipelines/679511572)
>>>>
>>>
>>> This "broken pipe" error was fixed by [1] which is currently in
>>> Daniel's tree. Please apply it in your tree and it should have a 100%
>>> pass rate.
>>>
>>> [1] http://patchwork.ozlabs.org/project/qemu-devel/patch/20221006151927.2079583-17-bmeng.cn@gmail.com/
>>>
>>
>> Ok I have seen other tests randomly failing. Furthermore:
>> https://gitlab.com/marcandre.lureau/qemu/-/jobs/3241465230
>> ERROR: Job failed: execution took longer than 1h30m0s seconds
>>
>>
>> I think we should drop the last 2 patches for now, until CI testing is under control...
> 
> 2 hours is the maximum time supported by the gitlab shared runners
> which should be enough.
> 
> However people may feel that it takes too long ...

Most jobs run fine within the default timeout of 60 minutes, we've got some 
few exceptions where we bumped it to 70, 80 or even 90 minutes. But I think 
that should really be the uppermost limit - using even more than 90 minutes 
for the slow-running Windows job just feels wrong.

Aren't there other possibilities to cut the run time again? Maybe compile 
with --disable-tools? ... searching for "mingw compilation slow" in the 
internet also reveals that a lot of other people are seeing problems with 
the compilation speed of MinGW ... but there does not seem to be one 
ultimate solution that worked for everybody to speed it up...

I'll queue patches 1-9 for now so that we get the important parts in before 
the soft freeze starts ... if we finally figure out how to deal with the 
slow CI jobs best, I think it's also still OK if we enable it later before 
the hard freeze starts.

  Thomas


