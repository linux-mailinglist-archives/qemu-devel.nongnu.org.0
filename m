Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDDE69C5C0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 08:02:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU0BU-0001HK-WE; Mon, 20 Feb 2023 02:02:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pU0BS-00019a-N7
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:01:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pU0BQ-0005dM-9V
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:01:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676876514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fGDmQFJ5Z9EcE5FgLsLYiBNylaaqQibgFHnG08aG080=;
 b=T83qpT7ZRzOlxK3y2fIgganoUXylFstbKLNHpy33A7dW6Qn6XY3LwAo5X8onsNgHUX9Mrn
 uq7dyswgsG3zW885BEmv+eK90CNxoSD4nyD6vJPMEjp3rUMluw/VUNE78Nj8k2QJGa9Rym
 D4Ak5cjDNrWbTwshSpkj5Zjg8AjCNis=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-GbyWN4NAORuwyUbv86ehkQ-1; Mon, 20 Feb 2023 02:01:52 -0500
X-MC-Unique: GbyWN4NAORuwyUbv86ehkQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 d14-20020a170902b70e00b00198e0564d73so234066pls.22
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 23:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fGDmQFJ5Z9EcE5FgLsLYiBNylaaqQibgFHnG08aG080=;
 b=dxqlOHF5gpCfNI7e/fPW99qwolB+ikrIg9TVMwsKq7T6GQS2QXLHyrk4VOCG932eQI
 tA60Fb8+JjEjVZmG5ln9nQayEQmEa62J83XPQ9aKq9X71v25uwMCL8HdimYyYv90xcEZ
 knEh9ofMighZBZqAML7mNYm3AFZuZwVRe6zjoK7vBaL7NQVs0u7d7PW1sApQEYZZvcuC
 JkMkSXgk1PZEHvXajx+DVCdcch335rOziCvokCiFSGKUxjRty/FxgGPwIS7aYq/pHerp
 LNJAGDUmi9lLzKbdTM4Ps0e4mO/YWgQii6dwRheVXvuCOkiaZ8Toce3ltHHWcQlAXhUH
 0NpQ==
X-Gm-Message-State: AO0yUKWRDrOgrDqMTTdC0+MlqqFmzXQCtADIv0urOisplYc6Xa0KLDac
 pSdaRfRgIMq0XzsyPfMkyE0aWHvLQbxhmMDwh7/eGIObdTMWNQKcbucEHg7dp6080kasc7YflFz
 Y7kdEiLOX48V8e5k=
X-Received: by 2002:a17:903:247:b0:19a:80fe:1f4 with SMTP id
 j7-20020a170903024700b0019a80fe01f4mr3560041plh.12.1676876511733; 
 Sun, 19 Feb 2023 23:01:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+P7hh095qOPX4wAlDeyAGGT90zrFzAQcp3WPET+kaweOYuFtNhJfmd8LjonDytVl9lDCP9mg==
X-Received: by 2002:a17:903:247:b0:19a:80fe:1f4 with SMTP id
 j7-20020a170903024700b0019a80fe01f4mr3560004plh.12.1676876511332; 
 Sun, 19 Feb 2023 23:01:51 -0800 (PST)
Received: from [10.72.12.218] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a170902d30400b0019462aa090bsm2575918plc.284.2023.02.19.23.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Feb 2023 23:01:51 -0800 (PST)
Message-ID: <f2d51a9b-b107-cad6-a16b-dc1e360da628@redhat.com>
Date: Mon, 20 Feb 2023 15:01:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v8 0/8] Introduce igb
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
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
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <d273c8a4-7e95-eaa1-b057-e69513b4d3f3@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2023/2/6 20:30, Akihiko Odaki 写道:
> Hi Jason,
>
> Let me remind that every patches in this series now has Reviewed-by: 
> or Acked-by: tag though I forgot to include tags the prior versions of 
> this series received to the latest version:


No worries, I can do that.

But when I try, it doesn't apply cleanly on master, are there any 
dependence I missed?

# git am *.eml
Applying: pcie: Introduce pcie_sriov_num_vfs
Applying: e1000: Split header files
error: patch failed: hw/net/e1000_regs.h:470
error: hw/net/e1000_regs.h: patch does not apply
error: patch failed: hw/net/e1000x_common.c:29
error: hw/net/e1000x_common.c: patch does not apply
Patch failed at 0002 e1000: Split header files
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Thanks


>
> "Introduce igb"
> https://lore.kernel.org/qemu-devel/DBBP189MB143365704198DC9A0684DEA595D09@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM/ 
>
>
> "docs/system/devices/igb: Add igb documentation"
> https://lore.kernel.org/qemu-devel/741a0975-9f7a-b4bc-9651-cf45f03d1787@kaod.org/ 
>
>
> Regards,
> Akihiko Odaki
>
> On 2023/02/04 13:36, Akihiko Odaki wrote:
>> Based-on: <20230201033539.30049-1-akihiko.odaki@daynix.com>
>> ([PATCH v5 00/29] e1000x cleanups (preliminary for IGB))
>>
>> igb is a family of Intel's gigabit ethernet controllers. This series 
>> implements
>> 82576 emulation in particular. You can see the last patch for the 
>> documentation.
>>
>> Note that there is another effort to bring 82576 emulation. This 
>> series was
>> developed independently by Sriram Yagnaraman.
>> https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html
>>
>> V7 -> V8:
>> - Removed obsolete patch
>>    "hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr" (Cédric Le 
>> Goater)
>>
>> V6 -> V7:
>> - Reordered statements in igb_receive_internal() so that checksum 
>> will be
>>    calculated only once and it will be more close to 
>> e1000e_receive_internal().
>>
>> V5 -> V6:
>> - Rebased.
>> - Renamed "test" to "packet" in tests/qtest/e1000e-test.c.
>> - Fixed Rx logic so that a Rx pool without enough space won't prevent 
>> other
>>    pools from receiving, based on Sriram Yagnaraman's work.
>>
>> V4 -> V5:
>> - Rebased.
>> - Squashed patches to copy from e1000e code and modify it.
>> - Listed the implemented features.
>> - Added a check for interrupts availablity on PF.
>> - Fixed the declaration of igb_receive_internal(). (Sriram Yagnaraman)
>>
>> V3 -> V4:
>> - Rebased.
>> - Corrected PCIDevice specified for DMA.
>>
>> V2 -> V3:
>> - Rebased.
>> - Fixed PCIDevice reference in hw/net/igbvf.c.
>> - Fixed TX packet switching when VM loopback is enabled.
>> - Fixed VMDq enablement check.
>> - Fixed RX descriptor length parser.
>> - Fixed the definitions of RQDPC readers.
>> - Implemented VLAN VM filter.
>> - Implemented VT_CTL.Def_PL.
>> - Implemented the combination of VMDq and RSS.
>> - Noted that igb is tested with Windows HLK.
>>
>> V1 -> V2:
>> - Spun off e1000e general improvements to a distinct series.
>> - Restored vnet_hdr offload as there seems nothing preventing from that.
>>
>> Akihiko Odaki (8):
>>    pcie: Introduce pcie_sriov_num_vfs
>>    e1000: Split header files
>>    Intrdocue igb device emulation
>>    tests/qtest/e1000e-test: Fabricate ethernet header
>>    tests/qtest/libqos/e1000e: Export macreg functions
>>    igb: Introduce qtest for igb device
>>    tests/avocado: Add igb test
>>    docs/system/devices/igb: Add igb documentation
>>
>>   MAINTAINERS                                   |    9 +
>>   docs/system/device-emulation.rst              |    1 +
>>   docs/system/devices/igb.rst                   |   71 +
>>   hw/net/Kconfig                                |    5 +
>>   hw/net/e1000.c                                |    1 +
>>   hw/net/e1000_common.h                         |  102 +
>>   hw/net/e1000_regs.h                           |  927 +---
>>   hw/net/e1000e.c                               |    3 +-
>>   hw/net/e1000e_core.c                          |    1 +
>>   hw/net/e1000x_common.c                        |    1 +
>>   hw/net/e1000x_common.h                        |   74 -
>>   hw/net/e1000x_regs.h                          |  940 ++++
>>   hw/net/igb.c                                  |  612 +++
>>   hw/net/igb_common.h                           |  146 +
>>   hw/net/igb_core.c                             | 4043 +++++++++++++++++
>>   hw/net/igb_core.h                             |  144 +
>>   hw/net/igb_regs.h                             |  648 +++
>>   hw/net/igbvf.c                                |  327 ++
>>   hw/net/meson.build                            |    2 +
>>   hw/net/trace-events                           |   32 +
>>   hw/pci/pcie_sriov.c                           |    5 +
>>   include/hw/pci/pcie_sriov.h                   |    3 +
>>   .../org.centos/stream/8/x86_64/test-avocado   |    1 +
>>   tests/avocado/igb.py                          |   38 +
>>   tests/qtest/e1000e-test.c                     |   25 +-
>>   tests/qtest/fuzz/generic_fuzz_configs.h       |    5 +
>>   tests/qtest/igb-test.c                        |  243 +
>>   tests/qtest/libqos/e1000e.c                   |   12 -
>>   tests/qtest/libqos/e1000e.h                   |   14 +
>>   tests/qtest/libqos/igb.c                      |  185 +
>>   tests/qtest/libqos/meson.build                |    1 +
>>   tests/qtest/meson.build                       |    1 +
>>   32 files changed, 7600 insertions(+), 1022 deletions(-)
>>   create mode 100644 docs/system/devices/igb.rst
>>   create mode 100644 hw/net/e1000_common.h
>>   create mode 100644 hw/net/e1000x_regs.h
>>   create mode 100644 hw/net/igb.c
>>   create mode 100644 hw/net/igb_common.h
>>   create mode 100644 hw/net/igb_core.c
>>   create mode 100644 hw/net/igb_core.h
>>   create mode 100644 hw/net/igb_regs.h
>>   create mode 100644 hw/net/igbvf.c
>>   create mode 100644 tests/avocado/igb.py
>>   create mode 100644 tests/qtest/igb-test.c
>>   create mode 100644 tests/qtest/libqos/igb.c
>>
>


