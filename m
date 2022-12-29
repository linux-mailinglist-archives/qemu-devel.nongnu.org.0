Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E27E6588AF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 03:44:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAisf-0005RG-6e; Wed, 28 Dec 2022 21:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pAisc-0005Qr-Tg
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 21:42:50 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pAisa-0004xp-VW
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 21:42:50 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 36so11590376pgp.10
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 18:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8hDolg3B37g0PEseo4goTFhCnP+4ggh+xlUSaYqALi4=;
 b=Tpb5thM0oBYErl0FXSIakdpDOPUXCksUPRlHJAzjYjTKV/aFeooODrhAUBegYpsOWy
 JI6/oqQMiaYkp6eb+cQLOITrBgEWuvNGLEyEOkjrDRcJSwotPt0JazK45XnaE0MhY48T
 NQdcblX1qtqw4x2tQ1LibXg3ZCzMgxhSYk5zaOFGI6neNEBUh3rruEMJ4qpdUhf/zIOg
 eSi2+S3XshGM7GfCdfFkR3FKQmNLHr6tQ4xH9oJb1QbEfwHku6HTyBB9aEAorE0OEdHj
 9jD4SlI5U71UU6ezxtp5wU+u7PNHPvhnq5+2I2SO9vQj8dX/uVXGN9WMngo7xzzdjT84
 UNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8hDolg3B37g0PEseo4goTFhCnP+4ggh+xlUSaYqALi4=;
 b=5vpvING+NhunPA8H1APjjZgkN9PsRRlkQ9BpcGP34gsSxKv8AED2ljG9tfNdpvsr6h
 UgP1Ok2QAtWEznp7FGX/KRjgK28ABccXs9ENvPqS+kB5nUk0yDlTI4xSJJJ4KndIqrMG
 yG3AkSvrdXy2lC6j3ZpoDSWHrcgMG0zc1y6FKGfCWPmNvy/iJDd5q74J6SU7jhIjkSPf
 YiXHGAdvYAdbuU1zY8L5mIX2RHC8bfNf5ZR5C1mAENYfkPXq94fbj1TxWG041harG23d
 7zfyAefzJZ0V4GHrGPvHWcamghnYQfefLAYBfJZefg8B2RnCy43Ym6VYHsRfhOxVWikT
 hLwQ==
X-Gm-Message-State: AFqh2kqd+06G7n2KYCjxuO6Wng4BrcKVJrtakfdp/VOsGruM40CwQhPw
 H3TravzXyUe9tEfAVB95KeE=
X-Google-Smtp-Source: AMrXdXszytHHx8zYAELvGpkXFG9a8/vcj/0rGiHxxhWabgsPiwcUExVnie5UJBKYJv+h8GyEvn3JXA==
X-Received: by 2002:a05:6a00:3217:b0:581:7430:aba with SMTP id
 bm23-20020a056a00321700b0058174300abamr6314867pfb.10.1672281754512; 
 Wed, 28 Dec 2022 18:42:34 -0800 (PST)
Received: from ?IPV6:2400:4050:c360:8200:7b99:f7c3:d084:f1e2?
 ([2400:4050:c360:8200:7b99:f7c3:d084:f1e2])
 by smtp.gmail.com with ESMTPSA id
 141-20020a621493000000b005815217e665sm4597897pfu.65.2022.12.28.18.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 18:42:33 -0800 (PST)
Message-ID: <34526159-762f-46ba-016e-5b9b0eae59bf@gmail.com>
Date: Thu, 29 Dec 2022 11:42:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/5] hw/net/igb: emulated network device with SR-IOV
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yan Vugenfirer <yan@daynix.com>
References: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
 <CACGkMEtFvmQ3th8TxApOuOtRVQz-7S7NZ-dFyOX73L1YS7Fh4g@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CACGkMEtFvmQ3th8TxApOuOtRVQz-7S7NZ-dFyOX73L1YS7Fh4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2022/12/23 12:23, Jason Wang wrote:
> On Thu, Dec 22, 2022 at 7:43 PM Sriram Yagnaraman
> <sriram.yagnaraman@est.tech> wrote:
>>
>> A new attempt at adding support for Intel 82576 Gigabit Ethernet adapter
>> with SR-IOV support.
>>
>> Start qemu with the following parameters.
>>     qemu-system-x86_64 -enable-kvm -M q35 \
>>     ...
>>     -device pcie-root-port,slot=3,id=pcie_port.3 \
>>     -netdev tap,id=net3,script=no,downscript=/tmp/rmtap,ifname=xcbr3_t2,queues=1 \
>>     -device igb,bus=pcie_port.3,netdev=net3,mac=00:00:00:01:03:02
>>
>> Load IGB/IGBVF modules if needed.
>> modprobe igb
>> modprobe igbvf
>>
>> Create VFs via /sys
>> ls /sys/bus/pci/devices/0000:01:00.0/
>> echo 2 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
>>
>> Sriram Yagnaraman (5):
>>    pcie: add helper function to get number of VFs
>>    hw/net/net_tx_pkt: helper function to get l2 hdr
>>    hw/net/igb: register definitions
>>    hw/net/igb: emulated intel IGB (82576EB) network device
>>    hw/net/igb: build support for igb/igbvf devices
> 
> Haven't reviewed this series but I think we'd have two more things:
> 
> 1) update the MAINTAINERS
> 2) a qtest for igb (having a qtest for sr-iov would be even better)
> 
> Thanks
> 
>>
>>   hw/i386/Kconfig             |    1 +
>>   hw/net/Kconfig              |    5 +
>>   hw/net/e1000_regs.h         |  357 +++-
>>   hw/net/e1000x_common.c      |   13 +
>>   hw/net/e1000x_common.h      |   28 +
>>   hw/net/igb.c                |  627 ++++++
>>   hw/net/igb.h                |  184 ++
>>   hw/net/igb_core.c           | 3782 +++++++++++++++++++++++++++++++++++
>>   hw/net/igb_core.h           |  216 ++
>>   hw/net/igbvf.c              |  262 +++
>>   hw/net/meson.build          |    2 +
>>   hw/net/net_tx_pkt.c         |   17 +-
>>   hw/net/net_tx_pkt.h         |    8 +
>>   hw/net/trace-events         |  190 ++
>>   hw/pci/pcie_sriov.c         |    6 +
>>   include/hw/pci/pcie_sriov.h |    5 +
>>   16 files changed, 5671 insertions(+), 32 deletions(-)
>>   create mode 100644 hw/net/igb.c
>>   create mode 100644 hw/net/igb.h
>>   create mode 100644 hw/net/igb_core.c
>>   create mode 100644 hw/net/igb_core.h
>>   create mode 100644 hw/net/igbvf.c
>>
>> --
>> 2.34.1
>>
> 
> 

Hi Sriram and Jason,

Coincidentally we has also been working on igb emulation. Our tree is 
available at:
https://github.com/daynix/qemu/tree/akihikodaki/igb_sriov_rebase

Briefly looking at Sriram's series, it seems to have better feature 
coverage, but there are some changes present only in our tree as well. 
For instance, our tree includes a qtest though it does not test SR-IOV 
functionality.

I'd like to suggest you to review and merge Sriram's series first, and I 
can rebase our tree to extract changes present only in our tree, 
including qtest. Or it can be the other way around; I think I can finish 
my series in weeks so I may submit it once it is ready, and you can 
apply changes in Sriram's series on top it. I'd like to hear which is 
more convenient for you, or another idea if you have.

Regards,
Akihiko Odaki

