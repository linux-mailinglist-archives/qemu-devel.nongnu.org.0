Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A706442FCFA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 22:27:05 +0200 (CEST)
Received: from localhost ([::1]:53014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbTnE-0003nN-Pg
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 16:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbTmO-00033b-PX
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 16:26:12 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:55084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbTmM-0000x7-3T
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 16:26:12 -0400
Received: by mail-pj1-x1034.google.com with SMTP id np13so7983307pjb.4
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 13:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=x6akHA6Ep9FbtsPCXvk4HQ8cnbXwELNrja+SP4OwBR4=;
 b=uH20phqSCPK4d9VZw7q1naXB1ZLa//YloBL265atgxClVJQ1hmfyVeE9k41GIT/EHy
 xSdoD9KjF+Aog9Qv/PqcsaGcYw7wAPiiHN3PIU704dwwGnighHpuNXHypQD4Ab5OV5Wj
 mEJbbW5TY5Ydy7Q5lHwyRjK2VjzVLcPjVm/ht4Kgr0644ozQaSccjeq/AQ/tBUWw0tXb
 hYsj93TmtERWGREUWsIlSZv2+9u5LuQdEWZSRbfZS1z4vg6bUerVJqOpZMrXa+LOmUq3
 o1cd5EC21OzjWAKZ3JpvMNlSJW/ikAb3AsiCmECrJUhMMeafb8eCUY/HidIfLoQHiWbU
 NmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x6akHA6Ep9FbtsPCXvk4HQ8cnbXwELNrja+SP4OwBR4=;
 b=FuqzsuKHIVe17vAc1sJAd0Og36HiqxnIDf36Spa/ii5BpYiQpSpVC9UpLX+WhVSOQY
 X5eKEwYDQcFi57qOri1ImPi3hz6iOxUkCMl1OiZuxXsmpnBO/ANuqcwQcFKp2Ad1eo/C
 QCpJmr6XIbFrT4t9e8dQ1srcFZMJvkw5X+m68FmYKxEHu3TBRBOZSKZ+Ynmmp0nRAZga
 SB3acWj8xi+M062FYiPsG6QjeUHmRv/md0uj0iCPUUn8jyPZ8Ubl+pM06poVinmOFY1b
 dLB8r8DclYnVPn3NJMD6ohwKUyx8AEhSA0H/F7q4SWrwKhCPHNHHOZH74aMYcnmbXvE0
 cZ4g==
X-Gm-Message-State: AOAM530HnVG7is74d4FzubMy118d1q5hdQ8bak/Krkchp8Z0pr2QTpRc
 zy9N7HwgoSK64ouA909w3hcJnkuR5bjM5A==
X-Google-Smtp-Source: ABdhPJyZRBQu2eUG9j88KMBZg8LtsHVwf4ESPioM6IMu1iucAxOIWUBdMjf7OCVZZRfrcbcNIJL0rQ==
X-Received: by 2002:a17:902:b615:b0:13f:6525:c004 with SMTP id
 b21-20020a170902b61500b0013f6525c004mr12807902pls.14.1634329568446; 
 Fri, 15 Oct 2021 13:26:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me18sm5656765pjb.33.2021.10.15.13.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 13:26:08 -0700 (PDT)
Subject: Re: [PULL 00/15] qdev: Add JSON -device
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20211015144640.198044-1-kwolf@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <44e6d230-05cf-b7be-290d-b1258c0b0aa4@linaro.org>
Date: Fri, 15 Oct 2021 13:26:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015144640.198044-1-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 7:46 AM, Kevin Wolf wrote:
> The following changes since commit 4d1a525dfafe995a98bb486e702da09e31b68b9c:
> 
>    Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2021-10-14 10:49:38 -0700)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/kevin.git tags/for-upstream
> 
> for you to fetch changes up to 5dacda5167560b3af8eadbce5814f60ba44b467e:
> 
>    vl: Enable JSON syntax for -device (2021-10-15 16:11:22 +0200)
> 
> ----------------------------------------------------------------
> qdev: Add JSON -device
> 
> - Add a JSON mode to the -device command line option
> - net/vhost-{user,vdpa}: Fix device compatibility check
> - Minor iotests fixes
> 
> ----------------------------------------------------------------
> Damien Hedde (1):
>        softmmu/qdev-monitor: add error handling in qdev_set_id
> 
> Kevin Wolf (14):
>        net: Introduce NetClientInfo.check_peer_type()
>        net/vhost-user: Fix device compatibility check
>        net/vhost-vdpa: Fix device compatibility check
>        qom: Reduce use of error_propagate()
>        iotests/245: Fix type for iothread property
>        iotests/051: Fix typo
>        qdev: Avoid using string visitor for properties
>        qdev: Make DeviceState.id independent of QemuOpts
>        qemu-option: Allow deleting opts during qemu_opts_foreach()
>        qdev: Add Error parameter to hide_device() callbacks
>        virtio-net: Store failover primary opts pointer locally
>        virtio-net: Avoid QemuOpts in failover_find_primary_device()
>        qdev: Base object creation on QDict rather than QemuOpts
>        vl: Enable JSON syntax for -device
> 
>   qapi/qdev.json                      |  15 ++++--
>   include/hw/qdev-core.h              |  16 ++++--
>   include/hw/virtio/virtio-net.h      |   2 +
>   include/monitor/qdev.h              |  27 +++++++++-
>   include/net/net.h                   |   2 +
>   hw/arm/virt.c                       |   2 +-
>   hw/core/qdev-properties-system.c    |   6 +++
>   hw/core/qdev.c                      |  11 ++--
>   hw/net/virtio-net.c                 |  85 +++++++++++++++---------------
>   hw/pci-bridge/pci_expander_bridge.c |   2 +-
>   hw/ppc/e500.c                       |   2 +-
>   hw/vfio/pci.c                       |   4 +-
>   hw/xen/xen-legacy-backend.c         |   3 +-
>   net/vhost-user.c                    |  41 +++++----------
>   net/vhost-vdpa.c                    |  37 +++++--------
>   qom/object.c                        |   7 ++-
>   qom/object_interfaces.c             |  19 +++----
>   softmmu/qdev-monitor.c              | 100 +++++++++++++++++++++++-------------
>   softmmu/vl.c                        |  63 ++++++++++++++++++++---
>   util/qemu-option.c                  |   4 +-
>   tests/qemu-iotests/051              |   2 +-
>   tests/qemu-iotests/051.pc.out       |   4 +-
>   tests/qemu-iotests/245              |   4 +-
>   23 files changed, 280 insertions(+), 178 deletions(-)

Applied, thanks.

r~


