Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6659769C5C3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 08:04:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU0Dj-0002cN-C0; Mon, 20 Feb 2023 02:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pU0De-0002bS-Ve
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:04:17 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pU0Dc-00061i-Hn
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:04:14 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 d1-20020a17090a3b0100b00229ca6a4636so438175pjc.0
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 23:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ak1wPSoJ8huarNYtSX7wHS/VKFUg9TLVlM+WdlBQHO4=;
 b=VW9hgsIoQaiAYFwhICqvfAAhv5e1CJuNBQaEymApy9rbonAvwJtYbEoM7NcsSk8X76
 L6pKIXKOMcJsncU2v9Q2ul9FMZBX64YbsciUK3zk3QGElOlncX/xpxEOBfkh/eiCvdGx
 CSOFOsRwSdeJWRCWQY5+zToC+IbDnM38C63ct26tBPue1gRoPkoCXSY9lAYzR1JMX5OM
 oNRvmsdVp7MRUX8+G87wT6551mPO4fX9j1JgTTMW5s2Ul4p1rpYgNvp+F8lQk/a8bJoM
 7w2+JRbHezwPZA+qOC3GEhbKq5CgnKCviUxApngpa+zZJjdAckq358FCGtn9kyHJt31H
 PO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ak1wPSoJ8huarNYtSX7wHS/VKFUg9TLVlM+WdlBQHO4=;
 b=0bYxQKl1mPMvsOxqTuesH0nwq1VFJUuRva25mmRO3LPEk2/I/YGj04zdsyPS3GpaU3
 yvXqqoeowNhpHIk2BQh0KJJZQ09oevYp/bvptZSlvRnjrCCNNjdbDhHQTZLvmrH+daDn
 5ft1i+UWvC0hVsI14qCriJU42zLOYGgJDFT9cbzcioGyzySwS1Av6wPYgn9Oy6w+vykH
 VjD5vL0G6+4MBntML12Jg82n4ZL41+0abhZ72xG2BoBdlIqIr4Fzp5K+tMWyKWXjm4KV
 k+VtkO/bIN6Xf4rEY1CuewiGcZpX+Np1uVuKee1M29gUTg0AnTwvE2MA46Aw+IbQ6Pag
 Mqbg==
X-Gm-Message-State: AO0yUKXFALVkIbrGpNnXFN6DJKEdBXeQ0vle0RsQM5+0Rq3gPhbC+bdO
 zR5ZXx4a5b+dBuOpvioU9Oe8Tg==
X-Google-Smtp-Source: AK7set+zkf81mkgQAryDk8D6QFzvmi7ySNe1noCOwkkek8jFTR8DJpvVUsMBmEi5DuTE/Y9vUUbpkQ==
X-Received: by 2002:a17:90b:1e05:b0:22c:d44:5669 with SMTP id
 pg5-20020a17090b1e0500b0022c0d445669mr346881pjb.22.1676876650720; 
 Sun, 19 Feb 2023 23:04:10 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c130-20020a633588000000b004fb26a80875sm6400505pga.22.2023.02.19.23.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Feb 2023 23:04:10 -0800 (PST)
Message-ID: <2562d533-e2ca-2792-1a3b-6d04ebd1a9f8@daynix.com>
Date: Mon, 20 Feb 2023 16:04:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v8 0/8] Introduce igb
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
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
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Gal Hammer <gal.hammer@sap.com>
References: <20230204043621.13540-1-akihiko.odaki@daynix.com>
 <d273c8a4-7e95-eaa1-b057-e69513b4d3f3@daynix.com>
 <f2d51a9b-b107-cad6-a16b-dc1e360da628@redhat.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <f2d51a9b-b107-cad6-a16b-dc1e360da628@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On 2023/02/20 16:01, Jason Wang wrote:
> 
> 在 2023/2/6 20:30, Akihiko Odaki 写道:
>> Hi Jason,
>>
>> Let me remind that every patches in this series now has Reviewed-by: 
>> or Acked-by: tag though I forgot to include tags the prior versions of 
>> this series received to the latest version:
> 
> 
> No worries, I can do that.
> 
> But when I try, it doesn't apply cleanly on master, are there any 
> dependence I missed?
> 
> # git am *.eml
> Applying: pcie: Introduce pcie_sriov_num_vfs
> Applying: e1000: Split header files
> error: patch failed: hw/net/e1000_regs.h:470
> error: hw/net/e1000_regs.h: patch does not apply
> error: patch failed: hw/net/e1000x_common.c:29
> error: hw/net/e1000x_common.c: patch does not apply
> Patch failed at 0002 e1000: Split header files
> hint: Use 'git am --show-current-patch' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".

It is Based-on: <20230201033539.30049-1-akihiko.odaki@daynix.com>.
([PATCH v5 00/29] e1000x cleanups (preliminary for IGB))

Please apply the series first.

Regards,
Akihiko Odaki

> 
> Thanks
> 
> 
>>
>> "Introduce igb"
>> https://lore.kernel.org/qemu-devel/DBBP189MB143365704198DC9A0684DEA595D09@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM/
>>
>> "docs/system/devices/igb: Add igb documentation"
>> https://lore.kernel.org/qemu-devel/741a0975-9f7a-b4bc-9651-cf45f03d1787@kaod.org/
>>
>> Regards,
>> Akihiko Odaki
>>
>> On 2023/02/04 13:36, Akihiko Odaki wrote:
>>> Based-on: <20230201033539.30049-1-akihiko.odaki@daynix.com>
>>> ([PATCH v5 00/29] e1000x cleanups (preliminary for IGB))
>>>
>>> igb is a family of Intel's gigabit ethernet controllers. This series 
>>> implements
>>> 82576 emulation in particular. You can see the last patch for the 
>>> documentation.
>>>
>>> Note that there is another effort to bring 82576 emulation. This 
>>> series was
>>> developed independently by Sriram Yagnaraman.
>>> https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html
>>>
>>> V7 -> V8:
>>> - Removed obsolete patch
>>>    "hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr" (Cédric Le 
>>> Goater)
>>>
>>> V6 -> V7:
>>> - Reordered statements in igb_receive_internal() so that checksum 
>>> will be
>>>    calculated only once and it will be more close to 
>>> e1000e_receive_internal().
>>>
>>> V5 -> V6:
>>> - Rebased.
>>> - Renamed "test" to "packet" in tests/qtest/e1000e-test.c.
>>> - Fixed Rx logic so that a Rx pool without enough space won't prevent 
>>> other
>>>    pools from receiving, based on Sriram Yagnaraman's work.
>>>
>>> V4 -> V5:
>>> - Rebased.
>>> - Squashed patches to copy from e1000e code and modify it.
>>> - Listed the implemented features.
>>> - Added a check for interrupts availablity on PF.
>>> - Fixed the declaration of igb_receive_internal(). (Sriram Yagnaraman)
>>>
>>> V3 -> V4:
>>> - Rebased.
>>> - Corrected PCIDevice specified for DMA.
>>>
>>> V2 -> V3:
>>> - Rebased.
>>> - Fixed PCIDevice reference in hw/net/igbvf.c.
>>> - Fixed TX packet switching when VM loopback is enabled.
>>> - Fixed VMDq enablement check.
>>> - Fixed RX descriptor length parser.
>>> - Fixed the definitions of RQDPC readers.
>>> - Implemented VLAN VM filter.
>>> - Implemented VT_CTL.Def_PL.
>>> - Implemented the combination of VMDq and RSS.
>>> - Noted that igb is tested with Windows HLK.
>>>
>>> V1 -> V2:
>>> - Spun off e1000e general improvements to a distinct series.
>>> - Restored vnet_hdr offload as there seems nothing preventing from that.
>>>
>>> Akihiko Odaki (8):
>>>    pcie: Introduce pcie_sriov_num_vfs
>>>    e1000: Split header files
>>>    Intrdocue igb device emulation
>>>    tests/qtest/e1000e-test: Fabricate ethernet header
>>>    tests/qtest/libqos/e1000e: Export macreg functions
>>>    igb: Introduce qtest for igb device
>>>    tests/avocado: Add igb test
>>>    docs/system/devices/igb: Add igb documentation
>>>
>>>   MAINTAINERS                                   |    9 +
>>>   docs/system/device-emulation.rst              |    1 +
>>>   docs/system/devices/igb.rst                   |   71 +
>>>   hw/net/Kconfig                                |    5 +
>>>   hw/net/e1000.c                                |    1 +
>>>   hw/net/e1000_common.h                         |  102 +
>>>   hw/net/e1000_regs.h                           |  927 +---
>>>   hw/net/e1000e.c                               |    3 +-
>>>   hw/net/e1000e_core.c                          |    1 +
>>>   hw/net/e1000x_common.c                        |    1 +
>>>   hw/net/e1000x_common.h                        |   74 -
>>>   hw/net/e1000x_regs.h                          |  940 ++++
>>>   hw/net/igb.c                                  |  612 +++
>>>   hw/net/igb_common.h                           |  146 +
>>>   hw/net/igb_core.c                             | 4043 +++++++++++++++++
>>>   hw/net/igb_core.h                             |  144 +
>>>   hw/net/igb_regs.h                             |  648 +++
>>>   hw/net/igbvf.c                                |  327 ++
>>>   hw/net/meson.build                            |    2 +
>>>   hw/net/trace-events                           |   32 +
>>>   hw/pci/pcie_sriov.c                           |    5 +
>>>   include/hw/pci/pcie_sriov.h                   |    3 +
>>>   .../org.centos/stream/8/x86_64/test-avocado   |    1 +
>>>   tests/avocado/igb.py                          |   38 +
>>>   tests/qtest/e1000e-test.c                     |   25 +-
>>>   tests/qtest/fuzz/generic_fuzz_configs.h       |    5 +
>>>   tests/qtest/igb-test.c                        |  243 +
>>>   tests/qtest/libqos/e1000e.c                   |   12 -
>>>   tests/qtest/libqos/e1000e.h                   |   14 +
>>>   tests/qtest/libqos/igb.c                      |  185 +
>>>   tests/qtest/libqos/meson.build                |    1 +
>>>   tests/qtest/meson.build                       |    1 +
>>>   32 files changed, 7600 insertions(+), 1022 deletions(-)
>>>   create mode 100644 docs/system/devices/igb.rst
>>>   create mode 100644 hw/net/e1000_common.h
>>>   create mode 100644 hw/net/e1000x_regs.h
>>>   create mode 100644 hw/net/igb.c
>>>   create mode 100644 hw/net/igb_common.h
>>>   create mode 100644 hw/net/igb_core.c
>>>   create mode 100644 hw/net/igb_core.h
>>>   create mode 100644 hw/net/igb_regs.h
>>>   create mode 100644 hw/net/igbvf.c
>>>   create mode 100644 tests/avocado/igb.py
>>>   create mode 100644 tests/qtest/igb-test.c
>>>   create mode 100644 tests/qtest/libqos/igb.c
>>>
>>
> 

