Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2C1653A74
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 03:03:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8Au3-0001Q2-9r; Wed, 21 Dec 2022 21:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1p8Au1-0001Pd-4L
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 21:01:45 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1p8Aty-00043e-Sp
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 21:01:44 -0500
Received: by mail-pf1-x42b.google.com with SMTP id w26so267603pfj.6
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 18:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oND5vRBnou/T9gazA8yhw3b+NzyhguRbgO6VEjVfod4=;
 b=Jazu6Qq6WvWX6QIXVFqExtMU2C/cHxaM6AuTEamX/4v6BPvUei1wbOsFXsxhBFUt7f
 Ng2OxMyjYu0U2+JrldjhzENPocmyB9MW6dhwrlz/WtYzPtgCcAITRR6tjqnZ38frCOrM
 BRJhE7Rxb0M/F61j2u71RANeBB63buZ7sjowqM6klGs3q68U5t1RMlALh2RHPH6aFrD4
 pb2cbcpVpyQ/2nvE3t+7sgbsL0I2Pu2dSKlXgkex8FBVb/xoH48eqDiCte8eVadZOy1D
 01tUKMM9of+0+Hdkxgw+TngWH8er+XewO+PzNgKYV0mlq0G9aXpqZLfy8yiLQYceyr/d
 93UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oND5vRBnou/T9gazA8yhw3b+NzyhguRbgO6VEjVfod4=;
 b=FgaGdZ3FzMwJYb6xJbgBu0KR8vZMiKz8xsoIxRN70OJ+MYmtY1jyMeRQ7iAli16AI3
 3yGGHQRsciMhVDQEFcpsvE4huYrHjObP+dbqoCZg0uyqTK4iicALnC8vZ8rzS6LcgjHx
 p68g4iYc3Nrwzgfdr6c2rB48jM14qfVakwWbZPRHONWMtmZM0ZJevt7d+y3NUNqOmJ9j
 D0KlLULQ5fzfcbQKJqwU4bGroQIhethVgtVI1nPW5slWcBuaFSsXyXTRhMYWixlzD/Ig
 pTwfUEXjADoyBF7utBCVhPpO05Y1wAvtC3/6kLlOFFK45OLXQYqDDswK9Gfcy9JQXY+K
 nZpg==
X-Gm-Message-State: AFqh2krI98j7XurrPbuIIgVsIsdCiwRRKpQ6ZiAFpGSREoA6NbMxiDZc
 qm7c17c1e0fI1M3dSSj3JzdvbQ==
X-Google-Smtp-Source: AMrXdXuKM5EKSy+C7weJHNOYSE8ifTz0hzfuDAPpTr/swYYDrDbn0wFUpzHR3QGNaJP1v83flJn0WQ==
X-Received: by 2002:aa7:9210:0:b0:577:8bae:29a7 with SMTP id
 16-20020aa79210000000b005778bae29a7mr4575196pfo.33.1671674495637; 
 Wed, 21 Dec 2022 18:01:35 -0800 (PST)
Received: from [10.5.70.213] ([139.177.225.237])
 by smtp.gmail.com with ESMTPSA id
 80-20020a621453000000b0054ee4b632dasm11267292pfu.169.2022.12.21.18.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 18:01:34 -0800 (PST)
Message-ID: <5823a483-9189-4e81-42f7-12579995bcfe@bytedance.com>
Date: Thu, 22 Dec 2022 10:04:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Re: [for-8.0 v2 00/11] Refactor cryptodev
Content-Language: en-US
To: armbru@redhat.com, michael.roth@amd.com
Cc: arei.gonglei@huawei.com, dgilbert@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, eblake@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
 <20221220103602-mutt-send-email-mst@kernel.org>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20221220103602-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001,
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

Hi, Markus & Michael

Could you please review the changes of QAPI part?

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

