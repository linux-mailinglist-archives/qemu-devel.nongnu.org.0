Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FFB3D1408
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:22:21 +0200 (CEST)
Received: from localhost ([::1]:42820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6EzE-0006V8-Ia
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6EwM-0003yu-LE
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:19:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6EwJ-0006YM-H4
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626884355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IFNBH+B2gAdI90dz42kUYOMLjfR7LXs4J45kjT5GKiQ=;
 b=T/yg5V+qGWZmJQLLg2Em1tM7iqxLFfB0YfS1yXUwmZ6PJyNx0ta6YaxdUNsGQHx+ZZVARx
 UUwEhJ2usXVbvKVqVbbxdK2kFw5BGJb+ZnMF0f/dqFDM8EanAjz1LzcXvGock6VnEBDu1N
 VlpRCPNwixPBZ03MSepYGDVMW17/gsA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-kUw8gcvCMPCVyX7ltxrvbg-1; Wed, 21 Jul 2021 12:19:04 -0400
X-MC-Unique: kUw8gcvCMPCVyX7ltxrvbg-1
Received: by mail-wm1-f70.google.com with SMTP id
 g13-20020a05600c4ecdb0290242a8f4cf9cso753604wmq.5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 09:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IFNBH+B2gAdI90dz42kUYOMLjfR7LXs4J45kjT5GKiQ=;
 b=AiO87Kp6M9mbvsdahWivf5WHLGTOgEYuZQaJgXFs6kzK/vMPP3hUe1ZX+aaq/xA+ns
 UYCmyV1Jw7euTN4Msn+RwkRimLezfQAJivx1p2Cn/sbKRhQKmTO43CiDIncRyysjll62
 2FFdH3xtU+srIeuxUi1cyaMxxKTeEY262nJ+LfRICYZmQHrHEkZDaL6mkCUfliu+t+6a
 X1V0b/EAIwG2Pn0T4DBXB+aDM6YXS33DpmjnZyjosAp+NNZ2KJ97Bz4uANKo8rIc3Y7c
 vf5x9BMJDcmrqDbtw2xsl339GjtJgBtG8hFGlTSsgF3Hj1GCT9KNZ1kIttybVHHgaZtF
 1J9g==
X-Gm-Message-State: AOAM530GVqgrGS200l+7Zt7CpGLQb/NSAEC57dswHixzgK4Lb+zemojf
 JarQxJHde81B+bBO5CE6Eao6OQfBM1iQMcn3ylCdiOdY45gU4S01qkcD7cTJe7OUKlx0J1zquEl
 FgLn/RfMqePlvkPU=
X-Received: by 2002:a05:600c:364c:: with SMTP id
 y12mr4882942wmq.78.1626884343208; 
 Wed, 21 Jul 2021 09:19:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsserDqTLvA7yv/bZvIWKES+YGvK4ns3shi6JpGP1i3z4mgk2r4h3LmQKTt6MooJExDuhVcw==
X-Received: by 2002:a05:600c:364c:: with SMTP id
 y12mr4882918wmq.78.1626884343004; 
 Wed, 21 Jul 2021 09:19:03 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id g138sm27300970wmg.32.2021.07.21.09.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 09:19:02 -0700 (PDT)
Subject: Re: [PATCH v4] failover: unregister ROM on unplug
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20210721160905.234915-1-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <785aa26e-260c-fd30-de55-c2bf6ab4e5a7@redhat.com>
Date: Wed, 21 Jul 2021 18:19:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721160905.234915-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 6:09 PM, Laurent Vivier wrote:
> The intend of failover is to allow to migrate a VM with a VFIO
> networking card without disrupting the network operation by switching
> to a virtio-net device during the migration.
> 
> This simple change allows to test failover with a simulated device
> like e1000e rather than a vfio device, even if it's useless in real
> life it can help to debug failover.
> 
> This is interesting to developers that want to test failover on
> a system with no vfio device. Moreover it simplifies host networking
> configuration as we can use the same bridge for virtio-net and
> the other failover networking device.
> 
> Without this change the migration of a system configured with failover
> fails with:
> 
>   ...
>   -device virtio-net-pci,id=virtionet0,failover=on,...  \
>   -device e1000,failover_pair_id=virtionet0,... \
>   ...
> 
>   (qemu) migrate ...
> 
>   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
>   error while loading state for instance 0x0 of device 'ram'
>   load of migration failed: Invalid argument
> 
> This happens because QEMU correctly unregisters the interface vmstate but
> not the ROM one. This patch fixes that.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
> 
> Notes:
>     v4:
>       export and use pci_del_option_rom()
>     
>     v3:
>       remove useless space before comma
>     
>     v2:
>       reset has_rom to false
>       update commit log message
> 
>  include/hw/pci/pci.h | 2 ++
>  hw/net/virtio-net.c  | 1 +
>  hw/pci/pci.c         | 3 +--
>  3 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


