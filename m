Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB9B678F8E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:54:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKBJZ-00006u-AX; Mon, 23 Jan 2023 23:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKBJY-00006d-B8
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:53:44 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKBJW-0005wp-JI
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:53:44 -0500
Received: by mail-pg1-x529.google.com with SMTP id f3so10577688pgc.2
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U3cJQYUKHCm6NpMHZygV/16XbHiLFRorTlt7FU/rwfw=;
 b=0iwwoG6Z6qbzgxySw25W3HVdg+unhJJPQb/ffWHitlWGxIF6VnNSDgf1zNEts+yen9
 Fcd2BsDTvcNTyhaTaTFClGO0pYO5U+XbrvB+H1iUfhaWlGOPD5A7WrR0xqAt7dc4gB9F
 tAlqVcwzfkdjkxjPzAgxu8GlBBDau1kdUqyK3JDVeRVOpyBTNoJIZ3Sj5CJ9BbpO3kDH
 2T5yjraCKAXM4Y3h2WvGlWu1Ha7uwt39b5b0nwQ9/46sZWJ6oQErgAp6Sd0uvNB3k4Nm
 JK1xRJMpjndSSWhNY31RT7tUwXhNz06ZzcCk3pBWaqvCGN23FnlW9Lueu66RWdMpwrtA
 k6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U3cJQYUKHCm6NpMHZygV/16XbHiLFRorTlt7FU/rwfw=;
 b=x52wxuGefSJlazycJubZzGY/ByWhW+qAvjiX3iBLXgUgtduBAygWynzilM4j3KqkTG
 gw9Chlqx8uRNWjuRA6nkYmgwu/LM+SwM6VR6U/EERWjfTf/847RYbmvoYTjLg9SIaggp
 XAtvs/ONyUvjzsf5ZmFjtQBn4lp5UMWbb+UAeypAQZ5FsnL/tOWU1EoxXAacDNZJdRls
 s4l7jXUDmT3apFSpTMMj2HpV+UpFOCkUM2Z6Ny03Jq+IVOe1MVtbIjkBAj9vpQv0VOVo
 R/iIMjdY1KzcH99FgUbyZuwRLZa+x9FU7z+7i54fEhN251/AjQcxWnBq1gnFE1t8DJWj
 x9zA==
X-Gm-Message-State: AFqh2koMPSuqb1i73lqIAEYFhHrSRat+86DUWCjy682f+owCztSj9jWC
 nfjubsjgqPWTFCFcvf+mNagMOg==
X-Google-Smtp-Source: AMrXdXucByt2Hjq90J7VZ3JbZTUFl2yGGWCUhJL0uGaLN3+0jA+gZ1FRiHnl1oQZZdh4EOzMsE5H4Q==
X-Received: by 2002:a62:4e0e:0:b0:588:94f3:f564 with SMTP id
 c14-20020a624e0e000000b0058894f3f564mr28302242pfb.30.1674536020839; 
 Mon, 23 Jan 2023 20:53:40 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 i195-20020a6287cc000000b0058bca3b8f76sm477685pfe.78.2023.01.23.20.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 20:53:40 -0800 (PST)
Message-ID: <afbd035c-e275-4600-d2b8-7445008ebbd2@daynix.com>
Date: Tue, 24 Jan 2023 13:53:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 00/13] Introduce igb
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
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
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20230114041004.36459-1-akihiko.odaki@daynix.com>
 <CACGkMEvAwrfUwQVAj0qZFy+Wib5FSBwayyN_qGbZ8edNwB_18g@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CACGkMEvAwrfUwQVAj0qZFy+Wib5FSBwayyN_qGbZ8edNwB_18g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 2023/01/16 17:01, Jason Wang wrote:
> On Sat, Jan 14, 2023 at 12:10 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> Based-on: <20230114035919.35251-1-akihiko.odaki@daynix.com>
>> ([PATCH 00/19] e1000x cleanups (preliminary for IGB))
>>
>> igb is a family of Intel's gigabit ethernet controllers. This series implements
>> 82576 emulation in particular. You can see the last patch for the documentation.
>>
>> Note that there is another effort to bring 82576 emulation. This series was
>> developed independently by Sriram Yagnaraman.
>> https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html
>>
>> It is possible to merge the work from Sriram Yagnaraman and to cherry-pick
>> useful changes from this series later.
>>
>> I think there are several different ways to get the changes into the mainline.
>> I'm open to any options.
> 
> I can only do reviews for the general networking part but not the
> 82576 specific part. It would be better if either of the series can
> get some ACKs from some ones that they are familiar with 82576, then I
> can try to merge.
> 
> Thanks

I have just sent v3 to the list.

Sriram Yagnaraman, who wrote another series for 82576, is the only 
person I know who is familiar with the device.

Sriram, can you take a look at v3 I have just sent?

Regards,
Akihiko Odaki

> 
>>
>> V1 -> V2:
>> - Spun off e1000e general improvements to a distinct series.
>> - Restored vnet_hdr offload as there seems nothing preventing from that.
>>
>> Akihiko Odaki (13):
>>    hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr
>>    pcie: Introduce pcie_sriov_num_vfs
>>    e1000: Split header files
>>    igb: Copy e1000e code
>>    igb: Rename identifiers
>>    igb: Build igb
>>    igb: Transform to 82576 implementation
>>    tests/qtest/e1000e-test: Fabricate ethernet header
>>    tests/qtest/libqos/e1000e: Export macreg functions
>>    tests/qtest/libqos/igb: Copy e1000e code
>>    tests/qtest/libqos/igb: Transform to igb tests
>>    tests/avocado: Add igb test
>>    docs/system/devices/igb: Add igb documentation
>>
>>   MAINTAINERS                                   |    9 +
>>   docs/system/device-emulation.rst              |    1 +
>>   docs/system/devices/igb.rst                   |   70 +
>>   hw/net/Kconfig                                |    5 +
>>   hw/net/e1000.c                                |    1 +
>>   hw/net/e1000_common.h                         |  102 +
>>   hw/net/e1000_regs.h                           |  927 +---
>>   hw/net/e1000e.c                               |    3 +-
>>   hw/net/e1000e_core.c                          |    1 +
>>   hw/net/e1000x_common.c                        |    1 +
>>   hw/net/e1000x_common.h                        |   74 -
>>   hw/net/e1000x_regs.h                          |  940 ++++
>>   hw/net/igb.c                                  |  615 +++
>>   hw/net/igb_common.h                           |  144 +
>>   hw/net/igb_core.c                             | 3946 +++++++++++++++++
>>   hw/net/igb_core.h                             |  147 +
>>   hw/net/igb_regs.h                             |  624 +++
>>   hw/net/igbvf.c                                |  327 ++
>>   hw/net/meson.build                            |    2 +
>>   hw/net/net_tx_pkt.c                           |    6 +
>>   hw/net/net_tx_pkt.h                           |    8 +
>>   hw/net/trace-events                           |   32 +
>>   hw/pci/pcie_sriov.c                           |    5 +
>>   include/hw/pci/pcie_sriov.h                   |    3 +
>>   .../org.centos/stream/8/x86_64/test-avocado   |    1 +
>>   tests/avocado/igb.py                          |   38 +
>>   tests/qtest/e1000e-test.c                     |   17 +-
>>   tests/qtest/fuzz/generic_fuzz_configs.h       |    5 +
>>   tests/qtest/igb-test.c                        |  243 +
>>   tests/qtest/libqos/e1000e.c                   |   12 -
>>   tests/qtest/libqos/e1000e.h                   |   14 +
>>   tests/qtest/libqos/igb.c                      |  185 +
>>   tests/qtest/libqos/meson.build                |    1 +
>>   tests/qtest/meson.build                       |    1 +
>>   34 files changed, 7492 insertions(+), 1018 deletions(-)
>>   create mode 100644 docs/system/devices/igb.rst
>>   create mode 100644 hw/net/e1000_common.h
>>   create mode 100644 hw/net/e1000x_regs.h
>>   create mode 100644 hw/net/igb.c
>>   create mode 100644 hw/net/igb_common.h
>>   create mode 100644 hw/net/igb_core.c
>>   create mode 100644 hw/net/igb_core.h
>>   create mode 100644 hw/net/igb_regs.h
>>   create mode 100644 hw/net/igbvf.c
>>   create mode 100644 tests/avocado/igb.py
>>   create mode 100644 tests/qtest/igb-test.c
>>   create mode 100644 tests/qtest/libqos/igb.c
>>
>> --
>> 2.39.0
>>
> 

