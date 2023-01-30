Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8794681382
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:38:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMVJ2-00010r-Bb; Mon, 30 Jan 2023 09:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMVIz-0000yo-Lf
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:38:45 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMVIw-0005aO-UM
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:38:45 -0500
Received: by mail-pl1-x62e.google.com with SMTP id d3so11786703plr.10
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nYBTjxROHAgJDGr7FXiUjqn8vsgiiY0iAQfTy6Tt/ao=;
 b=Qbgk3FD0BEth2GKgm1ytHjhhATGbUgzp1p6rHQKv4b6JAwUJ/nKqbJRxvfJzqwM8KV
 PFLKOWYfW4arSdif0QvvcSIidSz04gj50xaNxS4gBMC8hA2qNw9C2zwjY4vjdJAZv95l
 Lk/NwQwSK032IthRzmtA7W43Os3CdwEdh4yJ+qOgWXLPOveoo/ojDxPPdc28qT4r4T5Q
 zfN8EbGqpu2kT5RHhjmSwnWH4Bh9BCFXXxoTAH7x22r6mfwTGgoR/CfHRWVM/rpDOVgX
 ba7Vw3DEKZg2b4o2zrOSK5q5tQlrfZ58Js1QOlMIX8scWEBVMMqlLPvlZGBppFoMaX+a
 4C5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nYBTjxROHAgJDGr7FXiUjqn8vsgiiY0iAQfTy6Tt/ao=;
 b=nVAIVUkHmb0671Gnm71qQWwuVVVPOiWjVmNKkGyDmo4NHubQGq6XZF9YOm6aknHDNj
 ovDvqcSXC25o6+VdRb3M6R5PQkoCDJW1CBxxHAFBUVut6XBTj8USr5zEbkddYPf6wQTF
 P9s2KfyyqHuC9KtaKC5IKQXjVIgfv5CPs/nPNJlJ9NJ+rUsD7qdlRSlv5c51VfPzQWV2
 n7QvvvEdsteonMG0stTec9+t4jihnF6ab4k9RNaebK+SqDRFjNLo4V3eFET2RVbMS3Mr
 NKMWRMjF7/y4uO/pOfZf8CQDSJwEVFA2Q73WtY0Fxl2hCi6+vlSyMZ/i4aQOFCNV7FZo
 s4sw==
X-Gm-Message-State: AO0yUKWG1kI95S7QMFJs/ffKttgdqvx8YruFemggYqUn71OlhgZ0lZax
 h8NXGbG4x+X6xvLzaVwlxs5eUw==
X-Google-Smtp-Source: AK7set9cGLLwgtYgMwER4H6r/dsacLYOeUEuaf/V5r1vcg4le6/Bquh3nj8aQB+9Y4us2sDTRX7zdA==
X-Received: by 2002:a17:90a:86c1:b0:22c:1bca:2caf with SMTP id
 y1-20020a17090a86c100b0022c1bca2cafmr18362007pjv.35.1675089521553; 
 Mon, 30 Jan 2023 06:38:41 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 ie10-20020a17090b400a00b0022c1f78c920sm7013188pjb.35.2023.01.30.06.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 06:38:41 -0800 (PST)
Message-ID: <d3879c06-e3f7-2d33-d762-adf37cb54a1a@daynix.com>
Date: Mon, 30 Jan 2023 23:38:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 00/13] Introduce igb
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "devel@daynix.com" <devel@daynix.com>, Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20230114041004.36459-1-akihiko.odaki@daynix.com>
 <CACGkMEvAwrfUwQVAj0qZFy+Wib5FSBwayyN_qGbZ8edNwB_18g@mail.gmail.com>
 <afbd035c-e275-4600-d2b8-7445008ebbd2@daynix.com>
 <DBBP189MB1433ACFCB19263B4CD0414AF95C99@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
 <DBBP189MB1433E546762B9D56CA40E9C495CF9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
 <f849216a-7518-3a01-7946-15c77698a1c9@daynix.com>
 <DBBP189MB143319A7E3CD30FFB12810E395CD9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <DBBP189MB143319A7E3CD30FFB12810E395CD9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/01/29 5:57, Sriram Yagnaraman wrote:
>> -----Original Message-----
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Sent: Thursday, 26 January 2023 12:32
>> To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>; Jason Wang
>> <jasowang@redhat.com>
>> Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>; Michael S. Tsirkin
>> <mst@redhat.com>; Marcel Apfelbaum <marcel.apfelbaum@gmail.com>;
>> Alex Bennée <alex.bennee@linaro.org>; Philippe Mathieu-Daudé
>> <philmd@linaro.org>; Thomas Huth <thuth@redhat.com>; Wainer dos Santos
>> Moschetta <wainersm@redhat.com>; Beraldo Leal <bleal@redhat.com>;
>> Cleber Rosa <crosa@redhat.com>; Laurent Vivier <lvivier@redhat.com>;
>> Paolo Bonzini <pbonzini@redhat.com>; Alexander Bulekov <alxndr@bu.edu>;
>> Bandan Das <bsd@redhat.com>; Stefan Hajnoczi <stefanha@redhat.com>;
>> Darren Kenny <darren.kenny@oracle.com>; Qiuhao Li
>> <Qiuhao.Li@outlook.com>; qemu-devel@nongnu.org; qemu-
>> ppc@nongnu.org; devel@daynix.com; Yan Vugenfirer
>> <yvugenfi@redhat.com>; Yuri Benditovich <yuri.benditovich@daynix.com>
>> Subject: Re: [PATCH v2 00/13] Introduce igb
>>
>> On 2023/01/26 18:34, Sriram Yagnaraman wrote:
>>>
>>>> -----Original Message-----
>>>> From: Sriram Yagnaraman
>>>> Sent: Tuesday, 24 January 2023 09:54
>>>> To: Akihiko Odaki <akihiko.odaki@daynix.com>; Jason Wang
>>>> <jasowang@redhat.com>
>>>> Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>; Michael S. Tsirkin
>>>> <mst@redhat.com>; Marcel Apfelbaum <marcel.apfelbaum@gmail.com>;
>> Alex
>>>> Bennée <alex.bennee@linaro.org>; Philippe Mathieu-Daudé
>>>> <philmd@linaro.org>; Thomas Huth <thuth@redhat.com>; Wainer dos
>>>> Santos Moschetta <wainersm@redhat.com>; Beraldo Leal
>>>> <bleal@redhat.com>; Cleber Rosa <crosa@redhat.com>; Laurent Vivier
>>>> <lvivier@redhat.com>; Paolo Bonzini <pbonzini@redhat.com>; Alexander
>>>> Bulekov <alxndr@bu.edu>; Bandan Das <bsd@redhat.com>; Stefan
>> Hajnoczi
>>>> <stefanha@redhat.com>; Darren Kenny <darren.kenny@oracle.com>;
>> Qiuhao
>>>> Li <Qiuhao.Li@outlook.com>; qemu-devel@nongnu.org; qemu-
>>>> ppc@nongnu.org; devel@daynix.com; Yan Vugenfirer
>>>> <yvugenfi@redhat.com>; Yuri Benditovich <yuri.benditovich@daynix.com>
>>>> Subject: RE: [PATCH v2 00/13] Introduce igb
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>> Sent: Tuesday, 24 January 2023 05:54
>>>>> To: Jason Wang <jasowang@redhat.com>; Sriram Yagnaraman
>>>>> <sriram.yagnaraman@est.tech>
>>>>> Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>; Michael S. Tsirkin
>>>>> <mst@redhat.com>; Marcel Apfelbaum
>> <marcel.apfelbaum@gmail.com>;
>>>> Alex
>>>>> Bennée <alex.bennee@linaro.org>; Philippe Mathieu-Daudé
>>>>> <philmd@linaro.org>; Thomas Huth <thuth@redhat.com>; Wainer dos
>>>> Santos
>>>>> Moschetta <wainersm@redhat.com>; Beraldo Leal <bleal@redhat.com>;
>>>>> Cleber Rosa <crosa@redhat.com>; Laurent Vivier <lvivier@redhat.com>;
>>>>> Paolo Bonzini <pbonzini@redhat.com>; Alexander Bulekov
>>>>> <alxndr@bu.edu>; Bandan Das <bsd@redhat.com>; Stefan Hajnoczi
>>>>> <stefanha@redhat.com>; Darren Kenny <darren.kenny@oracle.com>;
>>>> Qiuhao
>>>>> Li <Qiuhao.Li@outlook.com>; qemu-devel@nongnu.org; qemu-
>>>>> ppc@nongnu.org; devel@daynix.com; Yan Vugenfirer
>>>>> <yvugenfi@redhat.com>; Yuri Benditovich
>>>>> <yuri.benditovich@daynix.com>
>>>>> Subject: Re: [PATCH v2 00/13] Introduce igb
>>>>>
>>>>> On 2023/01/16 17:01, Jason Wang wrote:
>>>>>> On Sat, Jan 14, 2023 at 12:10 PM Akihiko Odaki
>>>>> <akihiko.odaki@daynix.com> wrote:
>>>>>>>
>>>>>>> Based-on: <20230114035919.35251-1-akihiko.odaki@daynix.com>
>>>>>>> ([PATCH 00/19] e1000x cleanups (preliminary for IGB))
>>>>>>>
>>>>>>> igb is a family of Intel's gigabit ethernet controllers. This
>>>>>>> series implements
>>>>>>> 82576 emulation in particular. You can see the last patch for the
>>>>> documentation.
>>>>>>>
>>>>>>> Note that there is another effort to bring 82576 emulation. This
>>>>>>> series was developed independently by Sriram Yagnaraman.
>>>>>>> https://lists.gnu.org/archive/html/qemu-devel/2022-
>> 12/msg04670.htm
>>>>>>> l
>>>>>>>
>>>>>>> It is possible to merge the work from Sriram Yagnaraman and to
>>>>>>> cherry-pick useful changes from this series later.
>>>>>>>
>>>>>>> I think there are several different ways to get the changes into
>>>>>>> the
>>>> mainline.
>>>>>>> I'm open to any options.
>>>>>>
>>>>>> I can only do reviews for the general networking part but not the
>>>>>> 82576 specific part. It would be better if either of the series can
>>>>>> get some ACKs from some ones that they are familiar with 82576,
>>>>>> then I can try to merge.
>>>>>>
>>>>>> Thanks
>>>>>
>>>>> I have just sent v3 to the list.
>>>>>
>>>>> Sriram Yagnaraman, who wrote another series for 82576, is the only
>>>>> person I know who is familiar with the device.
>>>>>
>>>>> Sriram, can you take a look at v3 I have just sent?
>>>>
>>>> I am at best a good interpreter of the 82576 datasheet. I will review
>>>> your changes get back here.
>>>
>>> I have reviewed and tested your changes and it looks great to me in general.
>>> I would like to note some features that I would like to add on top of
>>> your patch, if you have not worked on these already :)
>>> - PFRSTD (PF reset done)
>>> - SRRCTL (Rx desc buf size)
>>> - RLPML (oversized packet handling)
>>> - MAC/VLAN anti-spoof checks
>>> - VMOLR_STRVLAN and RPLOLR_STRVLAN (VLAN stripping for VFs)
>>> - VMVIR (VLAN insertion for VFs)
>>> - VF reset
>>> - VFTE, VFRE, VFLRE
>>> - VF stats
>>> - Set EITR initial value
>>>
>>> Since this is a new device and there are no existing users, is it possible to get
>> the change into baseline first and fix missing features and bugs soon after?
>>
>> Thanks for reviewing,
>>
>> I have just submitted v4. The difference from v3 is only that igb now correctly
>> specifies VFs associated with queues for DMA.
>>
>> RX descriptor buffer size in SRRCTL is respected since v3. I think the other
>> features are missing. I am not planning to implement them either, but I'm
>> considering to test the code with DPDK and I may add features it requires.
> 
> Ok, I just sent a patchset adding most of the features I listed above ([PATCH 0/9] igb: add missing feature set).

Thanks for your work and responding to my comments. Please check the 
comments for the latest series I have just sent, and also rebase it to 
the latest version of this series.

> 
>>
>> I also want to get this series into the mainline before adding new features as it
>> is already so big, but please tell me if you noticed bugs, especially ones which
>> can be fixed without adding more code.
> 
> LGTM, I have tested your changes and it works perfectly. Thank you.
> Is it possible to squash your igb commits into one patch that I can give an ACK to?

igb patches are now squahed in the latest version, which I have just sent.

> 
>>
>> Regards,
>> Akihiko Odaki
>>
>>>
>>>>
>>>>>
>>>>> Regards,
>>>>> Akihiko Odaki
>>>>>
>>>>>>
>>>>>>>
>>>>>>> V1 -> V2:
>>>>>>> - Spun off e1000e general improvements to a distinct series.
>>>>>>> - Restored vnet_hdr offload as there seems nothing preventing from
>> that.
>>>>>>>
>>>>>>> Akihiko Odaki (13):
>>>>>>>      hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr
>>>>>>>      pcie: Introduce pcie_sriov_num_vfs
>>>>>>>      e1000: Split header files
>>>>>>>      igb: Copy e1000e code
>>>>>>>      igb: Rename identifiers
>>>>>>>      igb: Build igb
>>>>>>>      igb: Transform to 82576 implementation
>>>>>>>      tests/qtest/e1000e-test: Fabricate ethernet header
>>>>>>>      tests/qtest/libqos/e1000e: Export macreg functions
>>>>>>>      tests/qtest/libqos/igb: Copy e1000e code
>>>>>>>      tests/qtest/libqos/igb: Transform to igb tests
>>>>>>>      tests/avocado: Add igb test
>>>>>>>      docs/system/devices/igb: Add igb documentation
>>>>>>>
>>>>>>>     MAINTAINERS                                   |    9 +
>>>>>>>     docs/system/device-emulation.rst              |    1 +
>>>>>>>     docs/system/devices/igb.rst                   |   70 +
>>>>>>>     hw/net/Kconfig                                |    5 +
>>>>>>>     hw/net/e1000.c                                |    1 +
>>>>>>>     hw/net/e1000_common.h                         |  102 +
>>>>>>>     hw/net/e1000_regs.h                           |  927 +---
>>>>>>>     hw/net/e1000e.c                               |    3 +-
>>>>>>>     hw/net/e1000e_core.c                          |    1 +
>>>>>>>     hw/net/e1000x_common.c                        |    1 +
>>>>>>>     hw/net/e1000x_common.h                        |   74 -
>>>>>>>     hw/net/e1000x_regs.h                          |  940 ++++
>>>>>>>     hw/net/igb.c                                  |  615 +++
>>>>>>>     hw/net/igb_common.h                           |  144 +
>>>>>>>     hw/net/igb_core.c                             | 3946 +++++++++++++++++
>>>>>>>     hw/net/igb_core.h                             |  147 +
>>>>>>>     hw/net/igb_regs.h                             |  624 +++
>>>>>>>     hw/net/igbvf.c                                |  327 ++
>>>>>>>     hw/net/meson.build                            |    2 +
>>>>>>>     hw/net/net_tx_pkt.c                           |    6 +
>>>>>>>     hw/net/net_tx_pkt.h                           |    8 +
>>>>>>>     hw/net/trace-events                           |   32 +
>>>>>>>     hw/pci/pcie_sriov.c                           |    5 +
>>>>>>>     include/hw/pci/pcie_sriov.h                   |    3 +
>>>>>>>     .../org.centos/stream/8/x86_64/test-avocado   |    1 +
>>>>>>>     tests/avocado/igb.py                          |   38 +
>>>>>>>     tests/qtest/e1000e-test.c                     |   17 +-
>>>>>>>     tests/qtest/fuzz/generic_fuzz_configs.h       |    5 +
>>>>>>>     tests/qtest/igb-test.c                        |  243 +
>>>>>>>     tests/qtest/libqos/e1000e.c                   |   12 -
>>>>>>>     tests/qtest/libqos/e1000e.h                   |   14 +
>>>>>>>     tests/qtest/libqos/igb.c                      |  185 +
>>>>>>>     tests/qtest/libqos/meson.build                |    1 +
>>>>>>>     tests/qtest/meson.build                       |    1 +
>>>>>>>     34 files changed, 7492 insertions(+), 1018 deletions(-)
>>>>>>>     create mode 100644 docs/system/devices/igb.rst
>>>>>>>     create mode 100644 hw/net/e1000_common.h
>>>>>>>     create mode 100644 hw/net/e1000x_regs.h
>>>>>>>     create mode 100644 hw/net/igb.c
>>>>>>>     create mode 100644 hw/net/igb_common.h
>>>>>>>     create mode 100644 hw/net/igb_core.c
>>>>>>>     create mode 100644 hw/net/igb_core.h
>>>>>>>     create mode 100644 hw/net/igb_regs.h
>>>>>>>     create mode 100644 hw/net/igbvf.c
>>>>>>>     create mode 100644 tests/avocado/igb.py
>>>>>>>     create mode 100644 tests/qtest/igb-test.c
>>>>>>>     create mode 100644 tests/qtest/libqos/igb.c
>>>>>>>
>>>>>>> --
>>>>>>> 2.39.0
>>>>>>>
>>>>>>

