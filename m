Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC1666BAFD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:55:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHMCQ-0003H1-UB; Mon, 16 Jan 2023 04:54:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pHMCN-0003Gr-WE
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:54:40 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pHMCL-0000sB-Jv
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:54:39 -0500
Received: by mail-pl1-x62d.google.com with SMTP id g23so14217656plq.12
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 01:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D2GDMoWgASW2We4/JIOfkBIbkr65G9EstAObU3XjG3U=;
 b=yzbJcBgtqqNn8hm6SubDYpwA/Rar2YBCtxVsSbdJrY3MS7LVVYo07tobCCBxqNuPiz
 5ySh0yP0M+UG2Et/Cih0816DjOkeDyONiLltbBPXuo8zYD59Y65Q+5D/zkmKYHotla1u
 ArQPtN3kcCyQlohKUppCkUbC4Kr26Gn/1TwfhWzF26ywNl+fJdQCWvYc3qoJfnZBSiHN
 U+Izq6fNkebdMDGCbfmtQ4RNu1NLnWFHX/vVi2qBZ8h4XvlK12KD8GRp1nQGJ2zBM/KD
 tJzEpq8XcIJZFuLBotJZmIFfxWGEz3I5EZpc9kJfaUL1yq452qKMQEdKIqeYIhgTpF0c
 l3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D2GDMoWgASW2We4/JIOfkBIbkr65G9EstAObU3XjG3U=;
 b=OdakNExS2Cige6iyxV3rM2tBiL/5/+afnBHp5d9LHfL/dZXNxRPRWK1/s5+1h/5sPz
 9RaEDhETAdCrBZmXa3THck2cidLBgQBva+EtINoT7yOc+VZFo1PKPBITdx4KyNiWXxYX
 n7efPGGzuOhLel+vrCjdjzrqJylwj88G9LiR4m79iWjn2EuXUqrqgbeo13gLJOIWHj31
 ItFiQVH6P2VZNC5RwWqgvAxrQqLr4+9bEs6XoUh0vqP+DHYu64VgdcbFZ9qV/tveT7TO
 UbAd+T2NSrzM6wD4sLHn/nkws4YJGP3T2IJaH1Ue78wyJjUmNY0qyj5PXAz948jWfX9z
 aPWQ==
X-Gm-Message-State: AFqh2kpIV/VhvY7COSE4HTYDHBM9/78y31sAZPYxj9YrkoZqV0VZRv7o
 yRS7cUmO+iVmnyLwS6kqDFkivg==
X-Google-Smtp-Source: AMrXdXu/PWDW4A6yrjULYfXt19IwBpx5vdofrhhKuWST+eRqv3rHVXowmLtIEez1kx13BO4fyVpzVg==
X-Received: by 2002:a05:6a20:7a93:b0:b8:5916:c720 with SMTP id
 u19-20020a056a207a9300b000b85916c720mr6602283pzh.45.1673862866095; 
 Mon, 16 Jan 2023 01:54:26 -0800 (PST)
Received: from [10.3.43.196] ([61.213.176.5]) by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b0019327f40bfasm16105989plw.119.2023.01.16.01.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 01:54:25 -0800 (PST)
Message-ID: <e91ab7d3-1a5a-08f1-cfbe-500885abb1f2@bytedance.com>
Date: Mon, 16 Jan 2023 17:53:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Re: [for-8.0 v2 00/11] Refactor cryptodev
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: arei.gonglei@huawei.com, dgilbert@redhat.com, eblake@redhat.com,
 armbru@redhat.com, michael.roth@amd.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
 <20221220103602-mutt-send-email-mst@kernel.org>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20221220103602-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 12/20/22 23:36, Michael S. Tsirkin wrote:
> On Tue, Nov 22, 2022 at 10:07:45PM +0800, zhenwei pi wrote:
>> v1 -> v2:
>> - fix coding style and use 'g_strjoin()' instead of 'char services[128]'
>>    (suggested by Dr. David Alan Gilbert)
>> - wrapper function 'cryptodev_backend_account' to record statistics, and
>>    allocate sym_stat/asym_stat in cryptodev base class. see patch:
>>    'cryptodev: Support statistics'.
>> - add more arguments into struct CryptoDevBackendOpInfo, then
>>    cryptodev_backend_crypto_operation() uses *op_info only.
>> - support cryptodev QoS settings(BPS&OPS), both QEMU command line and QMP
>>    command works fine.
>> - add myself as the maintainer for cryptodev.
>>
>> v1:
>> - introduce cryptodev.json to describe the attributes of crypto device, then
>>    drop duplicated type declare, remove some virtio related dependence.
>> - add statistics: OPS and bandwidth.
>> - add QMP command: query-cryptodev
>> - add HMP info command: cryptodev
>> - misc fix: detect akcipher capability instead of exposing akcipher service
>>    unconditionally.
> 
> 
> Can we get ACK on QAPI things please?
> Thanks!
> 

Hi Michael

I pinged QAPI maintainers, but I got no ACK.
Could you please have a glance at this?

>> Zhenwei Pi (11):
>>    cryptodev: Introduce cryptodev.json
>>    cryptodev: Remove 'name' & 'model' fields
>>    cryptodev: Introduce cryptodev alg type in QAPI
>>    cryptodev: Introduce server type in QAPI
>>    cryptodev: Introduce 'query-cryptodev' QMP command
>>    cryptodev: Support statistics
>>    cryptodev-builtin: Detect akcipher capability
>>    hmp: add cryptodev info command
>>    cryptodev: Use CryptoDevBackendOpInfo for operation
>>    cryptodev: support QoS
>>    MAINTAINERS: add myself as the maintainer for cryptodev
>>
>>   MAINTAINERS                     |   2 +
>>   backends/cryptodev-builtin.c    |  42 +++--
>>   backends/cryptodev-lkcf.c       |  19 +-
>>   backends/cryptodev-vhost-user.c |  13 +-
>>   backends/cryptodev-vhost.c      |   4 +-
>>   backends/cryptodev.c            | 295 +++++++++++++++++++++++++++++---
>>   hmp-commands-info.hx            |  14 ++
>>   hw/virtio/virtio-crypto.c       |  48 ++++--
>>   include/monitor/hmp.h           |   1 +
>>   include/sysemu/cryptodev.h      |  94 +++++-----
>>   monitor/hmp-cmds.c              |  36 ++++
>>   qapi/cryptodev.json             | 144 ++++++++++++++++
>>   qapi/meson.build                |   1 +
>>   qapi/qapi-schema.json           |   1 +
>>   qapi/qom.json                   |   8 +-
>>   15 files changed, 604 insertions(+), 118 deletions(-)
>>   create mode 100644 qapi/cryptodev.json
>>
>> -- 
>> 2.20.1
> 

-- 
zhenwei pi

