Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F3B65BA9D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 07:17:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCaaU-0002z3-IQ; Tue, 03 Jan 2023 01:15:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pCaaS-0002wu-8x
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 01:15:48 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pCaaP-0007xY-FT
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 01:15:47 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso27030663pjb.1
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 22:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0KX/1327QMdN1zrEIpKsgdsU0YAE5QrjJdBguxXe9V4=;
 b=IzMnK2awvyVhZikC6xm7CKTEh22gq/t6U/XGY9VrMdmimj//Ef6389hBv55G+LV50n
 VAITtwrwnZjnqutUGj6Gu/WSl0LXDLIHsECYgehJGoNJXkCmCJVO7HPrkna9/uNtJbwv
 Yg6QY16X/BgiQ0OLRy02rK72YFtRabClpUtX/4MieHDO8HwATFPHCRI+tE0VS6Zbae+1
 xrpnCOkPfUgNdBMCpRsQvz0r8RcPxfwRAuvuS9aEs6aki27yBot99iXvNKzu84TrjWqF
 7KFYA3gv0ta4HY01zr47nT3Y/qEcDrZma2Z9L94k/k4f4GCrpfz6zrF/g16AZSnSWBKo
 /OSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0KX/1327QMdN1zrEIpKsgdsU0YAE5QrjJdBguxXe9V4=;
 b=JcRYv+5nOiVNOdChQRXteo3PxzLy9coOsqaZXGKTg1sfv3j8beM9DpqfVOUnJ+aPby
 meu8VuaPE4CuJj+V/4a07sCzRJxHK/xPAxfZt+XTEL4fh8AB1zRlPlZNMnOAUzrVltHN
 oIhYEhKS3bALeTyawa3RqrSuCkL6nyvneq8endpBEeeqAqYwsPjai39tl8iBgjXHQxMw
 SCCcBclfpUgNX1aviQs5KUmz3TL+bTZ8wF5iO3Zj6nPDNcSaeuFJ1hwhqf4eM4YKrSvr
 IKFJCVz/yc9XNQfPSzmMNCy9yPk8frTbu+xMm5cDwAo2oPMXhDUEgaHuiQyYaCEReNVX
 BY2g==
X-Gm-Message-State: AFqh2kqdngirm1MHc/RxZ8NEkfoJoAGNW9JgCNNU3BjpCzJIvgTxjCV9
 Lwf3dsQXfutYkZN75a6RxTVgaA==
X-Google-Smtp-Source: AMrXdXsNqmcWX7vQws/ifci5hdWOiVZIVLc0jnHa8yPi/EW3xF7tPPF0UDeDX6ebaW/w8shPpjgFQw==
X-Received: by 2002:a05:6a21:2d09:b0:a4:aa40:2253 with SMTP id
 tw9-20020a056a212d0900b000a4aa402253mr51969562pzb.21.1672726519016; 
 Mon, 02 Jan 2023 22:15:19 -0800 (PST)
Received: from [10.3.43.196] ([61.213.176.12])
 by smtp.gmail.com with ESMTPSA id
 123-20020a621881000000b00528a097aeffsm19480711pfy.118.2023.01.02.22.15.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 22:15:18 -0800 (PST)
Message-ID: <2e1c1254-2753-3c1c-8650-7b3b3d009b68@bytedance.com>
Date: Tue, 3 Jan 2023 14:14:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: PING: [for-8.0 v2 00/11] Refactor cryptodev
From: zhenwei pi <pizhenwei@bytedance.com>
To: armbru@redhat.com, michael.roth@amd.com
Cc: arei.gonglei@huawei.com, dgilbert@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, eblake@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
 <20221220103602-mutt-send-email-mst@kernel.org>
 <5823a483-9189-4e81-42f7-12579995bcfe@bytedance.com>
Content-Language: en-US
In-Reply-To: <5823a483-9189-4e81-42f7-12579995bcfe@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi, Markus & Michael

Could you please take a look at the changes of QAPI part?

On 12/22/22 10:04, zhenwei pi wrote:
> 
> 
> On 12/20/22 23:36, Michael S. Tsirkin wrote:
>> On Tue, Nov 22, 2022 at 10:07:45PM +0800, zhenwei pi wrote:
>>> v1 -> v2:
>>> - fix coding style and use 'g_strjoin()' instead of 'char services[128]'
>>>    (suggested by Dr. David Alan Gilbert)
>>> - wrapper function 'cryptodev_backend_account' to record statistics, and
>>>    allocate sym_stat/asym_stat in cryptodev base class. see patch:
>>>    'cryptodev: Support statistics'.
>>> - add more arguments into struct CryptoDevBackendOpInfo, then
>>>    cryptodev_backend_crypto_operation() uses *op_info only.
>>> - support cryptodev QoS settings(BPS&OPS), both QEMU command line and 
>>> QMP
>>>    command works fine.
>>> - add myself as the maintainer for cryptodev.
>>>
>>> v1:
>>> - introduce cryptodev.json to describe the attributes of crypto 
>>> device, then
>>>    drop duplicated type declare, remove some virtio related dependence.
>>> - add statistics: OPS and bandwidth.
>>> - add QMP command: query-cryptodev
>>> - add HMP info command: cryptodev
>>> - misc fix: detect akcipher capability instead of exposing akcipher 
>>> service
>>>    unconditionally.
>>
>>
>> Can we get ACK on QAPI things please?
>> Thanks!
>>
> 
> Hi, Markus & Michael
> 
> Could you please review the changes of QAPI part?
> 
>>> Zhenwei Pi (11):
>>>    cryptodev: Introduce cryptodev.json
>>>    cryptodev: Remove 'name' & 'model' fields
>>>    cryptodev: Introduce cryptodev alg type in QAPI
>>>    cryptodev: Introduce server type in QAPI
>>>    cryptodev: Introduce 'query-cryptodev' QMP command
>>>    cryptodev: Support statistics
>>>    cryptodev-builtin: Detect akcipher capability
>>>    hmp: add cryptodev info command
>>>    cryptodev: Use CryptoDevBackendOpInfo for operation
>>>    cryptodev: support QoS
>>>    MAINTAINERS: add myself as the maintainer for cryptodev
>>>
>>>   MAINTAINERS                     |   2 +
>>>   backends/cryptodev-builtin.c    |  42 +++--
>>>   backends/cryptodev-lkcf.c       |  19 +-
>>>   backends/cryptodev-vhost-user.c |  13 +-
>>>   backends/cryptodev-vhost.c      |   4 +-
>>>   backends/cryptodev.c            | 295 +++++++++++++++++++++++++++++---
>>>   hmp-commands-info.hx            |  14 ++
>>>   hw/virtio/virtio-crypto.c       |  48 ++++--
>>>   include/monitor/hmp.h           |   1 +
>>>   include/sysemu/cryptodev.h      |  94 +++++-----
>>>   monitor/hmp-cmds.c              |  36 ++++
>>>   qapi/cryptodev.json             | 144 ++++++++++++++++
>>>   qapi/meson.build                |   1 +
>>>   qapi/qapi-schema.json           |   1 +
>>>   qapi/qom.json                   |   8 +-
>>>   15 files changed, 604 insertions(+), 118 deletions(-)
>>>   create mode 100644 qapi/cryptodev.json
>>>
>>> -- 
>>> 2.20.1
>>
> 

-- 
zhenwei pi

