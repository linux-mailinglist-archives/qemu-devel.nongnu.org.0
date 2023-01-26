Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA3167C9F6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:32:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0UB-0004Z5-Vw; Thu, 26 Jan 2023 06:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pL0Tm-00044B-EN
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:31:49 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pL0Tj-0007g7-Pw
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:31:42 -0500
Received: by mail-pf1-x435.google.com with SMTP id u5so580191pfm.10
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+3j5lLGFuPWsaagnYc64mnuiaJ0GCbjZjpAjF6+5pi4=;
 b=QFR88o8AtyRpCTd4j9xr7NctA9nb+fEru/8AsllcOGCkKB9c2JhTTzdTesj8cNJWJ+
 oWX6/FNl9HNdSXzZ+sjLED7CNkXxoAHzu487Dmu05nF2MU3lvQJxx6v3J4K4tYu4t1Ju
 ORVgXuaRCv4GgG+XfX7DGShMZcZDTPw0EgEUTCdsYzlwahK2gJudx6LiKOEOLdTDtk+A
 kT7zcxbxvOBndReDb7pHMsNN8vUwOwwE6Dxb/Bu/vFsjzSUq2e63CXDWk9sgb1BD6MPV
 sAP6nPDbTvPWBdVCvkC1KiGY1KiHB6z+InxORchonu7v5PQc7dLkKNbBbG776TqR7uPO
 IIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+3j5lLGFuPWsaagnYc64mnuiaJ0GCbjZjpAjF6+5pi4=;
 b=TGrrKUBscWptNc4nvCNZcwgz8B0FZldvA6bRW9NYMSKSss7WOePfCUSjj4pz7Fi10C
 TJPoYJvAGqCTSs/Db4Ewbm6LaM9QxTMeNIlaGsUIdNDylY6kKywG/y2xLNbVDAKsls9g
 ij5apq4hRNxmgXpiOtcnqI0qnK0SrMMM7Y6pugcAmfBAYk8anhH5m+iZ7TpOzGMvNfW8
 WXiBcs3dwRa6ZsIFbkxG8Kr6YikwGkZajOKkMG5fR6OQueeCPvG3/GrGl0ydS7fdJA2u
 9Xg0DRhQYiOATTsqdgZ0SXD6Mbc87C03oQJVXOgwMxHjuEbqBdu6YUAggteGCHXCglzz
 erRQ==
X-Gm-Message-State: AFqh2kq3Jv0c5ZZahhtuii7ceICafrfKq66Re4I/OEhQ7roNbE7mqamd
 sRdmwRO6DjVk4aL7YJfCCVl/dw==
X-Google-Smtp-Source: AMrXdXukUyV9k/Y4Qft2sJthHbxclBPuHvAowMBbLWxzn1Dj3WcPkdM1cLpohIX5tDUaH81A4D8pGA==
X-Received: by 2002:a05:6a00:1c95:b0:581:6f06:659 with SMTP id
 y21-20020a056a001c9500b005816f060659mr34565693pfw.6.1674732698204; 
 Thu, 26 Jan 2023 03:31:38 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 br13-20020a056a00440d00b00581ad007a9fsm658782pfb.153.2023.01.26.03.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 03:31:37 -0800 (PST)
Message-ID: <f849216a-7518-3a01-7946-15c77698a1c9@daynix.com>
Date: Thu, 26 Jan 2023 20:31:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
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
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <DBBP189MB1433E546762B9D56CA40E9C495CF9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::435;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 2023/01/26 18:34, Sriram Yagnaraman wrote:
> 
>> -----Original Message-----
>> From: Sriram Yagnaraman
>> Sent: Tuesday, 24 January 2023 09:54
>> To: Akihiko Odaki <akihiko.odaki@daynix.com>; Jason Wang
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
>> Subject: RE: [PATCH v2 00/13] Introduce igb
>>
>>
>>> -----Original Message-----
>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> Sent: Tuesday, 24 January 2023 05:54
>>> To: Jason Wang <jasowang@redhat.com>; Sriram Yagnaraman
>>> <sriram.yagnaraman@est.tech>
>>> Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>; Michael S. Tsirkin
>>> <mst@redhat.com>; Marcel Apfelbaum <marcel.apfelbaum@gmail.com>;
>> Alex
>>> Bennée <alex.bennee@linaro.org>; Philippe Mathieu-Daudé
>>> <philmd@linaro.org>; Thomas Huth <thuth@redhat.com>; Wainer dos
>> Santos
>>> Moschetta <wainersm@redhat.com>; Beraldo Leal <bleal@redhat.com>;
>>> Cleber Rosa <crosa@redhat.com>; Laurent Vivier <lvivier@redhat.com>;
>>> Paolo Bonzini <pbonzini@redhat.com>; Alexander Bulekov
>>> <alxndr@bu.edu>; Bandan Das <bsd@redhat.com>; Stefan Hajnoczi
>>> <stefanha@redhat.com>; Darren Kenny <darren.kenny@oracle.com>;
>> Qiuhao
>>> Li <Qiuhao.Li@outlook.com>; qemu-devel@nongnu.org; qemu-
>>> ppc@nongnu.org; devel@daynix.com; Yan Vugenfirer
>>> <yvugenfi@redhat.com>; Yuri Benditovich <yuri.benditovich@daynix.com>
>>> Subject: Re: [PATCH v2 00/13] Introduce igb
>>>
>>> On 2023/01/16 17:01, Jason Wang wrote:
>>>> On Sat, Jan 14, 2023 at 12:10 PM Akihiko Odaki
>>> <akihiko.odaki@daynix.com> wrote:
>>>>>
>>>>> Based-on: <20230114035919.35251-1-akihiko.odaki@daynix.com>
>>>>> ([PATCH 00/19] e1000x cleanups (preliminary for IGB))
>>>>>
>>>>> igb is a family of Intel's gigabit ethernet controllers. This
>>>>> series implements
>>>>> 82576 emulation in particular. You can see the last patch for the
>>> documentation.
>>>>>
>>>>> Note that there is another effort to bring 82576 emulation. This
>>>>> series was developed independently by Sriram Yagnaraman.
>>>>> https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html
>>>>>
>>>>> It is possible to merge the work from Sriram Yagnaraman and to
>>>>> cherry-pick useful changes from this series later.
>>>>>
>>>>> I think there are several different ways to get the changes into the
>> mainline.
>>>>> I'm open to any options.
>>>>
>>>> I can only do reviews for the general networking part but not the
>>>> 82576 specific part. It would be better if either of the series can
>>>> get some ACKs from some ones that they are familiar with 82576, then
>>>> I can try to merge.
>>>>
>>>> Thanks
>>>
>>> I have just sent v3 to the list.
>>>
>>> Sriram Yagnaraman, who wrote another series for 82576, is the only
>>> person I know who is familiar with the device.
>>>
>>> Sriram, can you take a look at v3 I have just sent?
>>
>> I am at best a good interpreter of the 82576 datasheet. I will review your
>> changes get back here.
> 
> I have reviewed and tested your changes and it looks great to me in general.
> I would like to note some features that I would like to add on top of your patch, if you have not worked on these already :)
> - PFRSTD (PF reset done)
> - SRRCTL (Rx desc buf size)
> - RLPML (oversized packet handling)
> - MAC/VLAN anti-spoof checks
> - VMOLR_STRVLAN and RPLOLR_STRVLAN (VLAN stripping for VFs)
> - VMVIR (VLAN insertion for VFs)
> - VF reset
> - VFTE, VFRE, VFLRE
> - VF stats
> - Set EITR initial value
> 
> Since this is a new device and there are no existing users, is it possible to get the change into baseline first and fix missing features and bugs soon after?

Thanks for reviewing,

I have just submitted v4. The difference from v3 is only that igb now 
correctly specifies VFs associated with queues for DMA.

RX descriptor buffer size in SRRCTL is respected since v3. I think the 
other features are missing. I am not planning to implement them either, 
but I'm considering to test the code with DPDK and I may add features it 
requires.

I also want to get this series into the mainline before adding new 
features as it is already so big, but please tell me if you noticed 
bugs, especially ones which can be fixed without adding more code.

Regards,
Akihiko Odaki

> 
>>
>>>
>>> Regards,
>>> Akihiko Odaki
>>>
>>>>
>>>>>
>>>>> V1 -> V2:
>>>>> - Spun off e1000e general improvements to a distinct series.
>>>>> - Restored vnet_hdr offload as there seems nothing preventing from that.
>>>>>
>>>>> Akihiko Odaki (13):
>>>>>     hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr
>>>>>     pcie: Introduce pcie_sriov_num_vfs
>>>>>     e1000: Split header files
>>>>>     igb: Copy e1000e code
>>>>>     igb: Rename identifiers
>>>>>     igb: Build igb
>>>>>     igb: Transform to 82576 implementation
>>>>>     tests/qtest/e1000e-test: Fabricate ethernet header
>>>>>     tests/qtest/libqos/e1000e: Export macreg functions
>>>>>     tests/qtest/libqos/igb: Copy e1000e code
>>>>>     tests/qtest/libqos/igb: Transform to igb tests
>>>>>     tests/avocado: Add igb test
>>>>>     docs/system/devices/igb: Add igb documentation
>>>>>
>>>>>    MAINTAINERS                                   |    9 +
>>>>>    docs/system/device-emulation.rst              |    1 +
>>>>>    docs/system/devices/igb.rst                   |   70 +
>>>>>    hw/net/Kconfig                                |    5 +
>>>>>    hw/net/e1000.c                                |    1 +
>>>>>    hw/net/e1000_common.h                         |  102 +
>>>>>    hw/net/e1000_regs.h                           |  927 +---
>>>>>    hw/net/e1000e.c                               |    3 +-
>>>>>    hw/net/e1000e_core.c                          |    1 +
>>>>>    hw/net/e1000x_common.c                        |    1 +
>>>>>    hw/net/e1000x_common.h                        |   74 -
>>>>>    hw/net/e1000x_regs.h                          |  940 ++++
>>>>>    hw/net/igb.c                                  |  615 +++
>>>>>    hw/net/igb_common.h                           |  144 +
>>>>>    hw/net/igb_core.c                             | 3946 +++++++++++++++++
>>>>>    hw/net/igb_core.h                             |  147 +
>>>>>    hw/net/igb_regs.h                             |  624 +++
>>>>>    hw/net/igbvf.c                                |  327 ++
>>>>>    hw/net/meson.build                            |    2 +
>>>>>    hw/net/net_tx_pkt.c                           |    6 +
>>>>>    hw/net/net_tx_pkt.h                           |    8 +
>>>>>    hw/net/trace-events                           |   32 +
>>>>>    hw/pci/pcie_sriov.c                           |    5 +
>>>>>    include/hw/pci/pcie_sriov.h                   |    3 +
>>>>>    .../org.centos/stream/8/x86_64/test-avocado   |    1 +
>>>>>    tests/avocado/igb.py                          |   38 +
>>>>>    tests/qtest/e1000e-test.c                     |   17 +-
>>>>>    tests/qtest/fuzz/generic_fuzz_configs.h       |    5 +
>>>>>    tests/qtest/igb-test.c                        |  243 +
>>>>>    tests/qtest/libqos/e1000e.c                   |   12 -
>>>>>    tests/qtest/libqos/e1000e.h                   |   14 +
>>>>>    tests/qtest/libqos/igb.c                      |  185 +
>>>>>    tests/qtest/libqos/meson.build                |    1 +
>>>>>    tests/qtest/meson.build                       |    1 +
>>>>>    34 files changed, 7492 insertions(+), 1018 deletions(-)
>>>>>    create mode 100644 docs/system/devices/igb.rst
>>>>>    create mode 100644 hw/net/e1000_common.h
>>>>>    create mode 100644 hw/net/e1000x_regs.h
>>>>>    create mode 100644 hw/net/igb.c
>>>>>    create mode 100644 hw/net/igb_common.h
>>>>>    create mode 100644 hw/net/igb_core.c
>>>>>    create mode 100644 hw/net/igb_core.h
>>>>>    create mode 100644 hw/net/igb_regs.h
>>>>>    create mode 100644 hw/net/igbvf.c
>>>>>    create mode 100644 tests/avocado/igb.py
>>>>>    create mode 100644 tests/qtest/igb-test.c
>>>>>    create mode 100644 tests/qtest/libqos/igb.c
>>>>>
>>>>> --
>>>>> 2.39.0
>>>>>
>>>>

