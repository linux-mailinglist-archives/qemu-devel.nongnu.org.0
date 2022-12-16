Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2DF64E653
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 04:22:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p61Hb-000728-1I; Thu, 15 Dec 2022 22:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1p61HY-00071h-EJ
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 22:21:08 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1p61HT-00073L-1J
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 22:21:08 -0500
Received: by mail-pg1-x533.google.com with SMTP id r18so906638pgr.12
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 19:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5E6u7225WPPG19cK035fX5oqfFt2lghLi7vktPKYvzc=;
 b=3QPRIw4b4Xxy/ekq8n2Hs6xCE8gWX84oeqaW7gHDKUrwDVjvQH4DjF5G5WZtNl9TAd
 yaVrCK/CHQueJg6esZW0Jv/vpreQOn9lQf75AksW1+mCf8lIvxua9hfzad9/HTALMAyA
 TxVTbuDHRSwXMmdv5fpKNBDrlHfa5p9TjRk0Hg4Iz3KVCQMpENafiXwf/jxY8l3hO052
 4CGsm3jufniWhpeOjBl04eDQAxoL4cllh6EawgMxpDpPL5K1H/JORE5pDvLTblrFWRX1
 GykXTBb2o30FXu3hX5b5Odt+cpHFZiJJtzJUVitRn8I5zFkCrKTu2I6Ck2l+bvmuABf6
 3Qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5E6u7225WPPG19cK035fX5oqfFt2lghLi7vktPKYvzc=;
 b=c3wbeGD8ENrTdlFFfN31efWSbWnOQAFvaJLht0uMhDSaXYnjmb4RdVFwgU8wNT7ygu
 VlIvhnci+23k/8eamtXMPkcHY1A4wGhbr+mV6q88JDyfCjI4kII+EhwqOSTHcmZ289DY
 xD34pL8K+oXYBkJOsa6H2nFxV1uF45yMKKM/1m0mBKpUMMSTQMWBoDFPMgdzxYuuQNtw
 gpOJ9e/GBR3hI0oqp6ZFzGdVaS3QMZ9RCKJatzEdvJ42xV4Cr1kigFsTyYX9IS0+V3TJ
 8qveSRCg13XvJR+HBrazcaa/mtTpw21boS6z4VM2CEVzIyr/4a5POW3x7YYQWfK7+q1I
 BDBg==
X-Gm-Message-State: ANoB5pkQHq9K2mSAmrN7rFRWPebztv7OdZyTDYwINDEircunFItJdVPu
 ZXzgM/8MD+YuATbDSRbqXl4uhg==
X-Google-Smtp-Source: AA0mqf7gazrSfAnhSL/iBqYKRgSKOmZCq/8g73HU64jYWFQPCQfniBQ5pLnDAA6VRtbYof9JnceDXg==
X-Received: by 2002:aa7:9297:0:b0:573:f869:2115 with SMTP id
 j23-20020aa79297000000b00573f8692115mr27109832pfa.9.1671160860028; 
 Thu, 15 Dec 2022 19:21:00 -0800 (PST)
Received: from [10.5.70.213] ([139.177.225.237])
 by smtp.gmail.com with ESMTPSA id
 i73-20020a62874c000000b0056bc5ad4862sm348294pfe.28.2022.12.15.19.20.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 19:20:59 -0800 (PST)
Message-ID: <f4e3265d-af5a-a4c8-da31-c3322578655d@bytedance.com>
Date: Fri, 16 Dec 2022 11:24:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: PING: [for-8.0 v2 00/11] Refactor cryptodev
To: arei.gonglei@huawei.com, mst@redhat.com, eblake@redhat.com,
 armbru@redhat.com, michael.roth@amd.com, pbonzini@redhat.com,
 dgilbert@redhat.com
Cc: qemu-devel@nongnu.org
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
Content-Language: en-US
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20221122140756.686982-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x533.google.com
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

Hi, Lei

Could you please review this series?

On 11/22/22 22:07, zhenwei pi wrote:
> v1 -> v2:
> - fix coding style and use 'g_strjoin()' instead of 'char services[128]'
>    (suggested by Dr. David Alan Gilbert)
> - wrapper function 'cryptodev_backend_account' to record statistics, and
>    allocate sym_stat/asym_stat in cryptodev base class. see patch:
>    'cryptodev: Support statistics'.
> - add more arguments into struct CryptoDevBackendOpInfo, then
>    cryptodev_backend_crypto_operation() uses *op_info only.
> - support cryptodev QoS settings(BPS&OPS), both QEMU command line and QMP
>    command works fine.
> - add myself as the maintainer for cryptodev.
> 
> v1:
> - introduce cryptodev.json to describe the attributes of crypto device, then
>    drop duplicated type declare, remove some virtio related dependence.
> - add statistics: OPS and bandwidth.
> - add QMP command: query-cryptodev
> - add HMP info command: cryptodev
> - misc fix: detect akcipher capability instead of exposing akcipher service
>    unconditionally.
> 
> Zhenwei Pi (11):
>    cryptodev: Introduce cryptodev.json
>    cryptodev: Remove 'name' & 'model' fields
>    cryptodev: Introduce cryptodev alg type in QAPI
>    cryptodev: Introduce server type in QAPI
>    cryptodev: Introduce 'query-cryptodev' QMP command
>    cryptodev: Support statistics
>    cryptodev-builtin: Detect akcipher capability
>    hmp: add cryptodev info command
>    cryptodev: Use CryptoDevBackendOpInfo for operation
>    cryptodev: support QoS
>    MAINTAINERS: add myself as the maintainer for cryptodev
> 
>   MAINTAINERS                     |   2 +
>   backends/cryptodev-builtin.c    |  42 +++--
>   backends/cryptodev-lkcf.c       |  19 +-
>   backends/cryptodev-vhost-user.c |  13 +-
>   backends/cryptodev-vhost.c      |   4 +-
>   backends/cryptodev.c            | 295 +++++++++++++++++++++++++++++---
>   hmp-commands-info.hx            |  14 ++
>   hw/virtio/virtio-crypto.c       |  48 ++++--
>   include/monitor/hmp.h           |   1 +
>   include/sysemu/cryptodev.h      |  94 +++++-----
>   monitor/hmp-cmds.c              |  36 ++++
>   qapi/cryptodev.json             | 144 ++++++++++++++++
>   qapi/meson.build                |   1 +
>   qapi/qapi-schema.json           |   1 +
>   qapi/qom.json                   |   8 +-
>   15 files changed, 604 insertions(+), 118 deletions(-)
>   create mode 100644 qapi/cryptodev.json
> 

-- 
zhenwei pi

