Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF804C0FB2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:58:49 +0100 (CET)
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMoQ4-00006P-Eh
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:58:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMnjN-0005PJ-KR
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:14:42 -0500
Received: from [2a00:1450:4864:20::533] (port=43644
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMnjL-0003Da-UP
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:14:41 -0500
Received: by mail-ed1-x533.google.com with SMTP id m3so37117631eda.10
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 01:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q37TGXXlesLIjhyW24s8PmSpO9cvwc40pKnWhZLXxrs=;
 b=WTbMgofq2KCoFdkzqTQ3umoFOYVuPa7KVDleTAfFnPPIHEAKjGx1MsyGAcHRhd3QAG
 G/hdmkfvpNGVQGBOD145Xw4vqMnAe/GuT6MvZ/PJHOkPJGAuQ6YZA3GC8ugY8IDMWhnU
 Rf9quBpylgnfdeVTbx3GKMZNOYy10/ijaIj7SN1+9BB5gGWyk9VhoUXUvSyhgEtJwNnC
 G5srYv8zYgPAcV8lGYLa4QCTW5zCWcQJDbuRjG8xFv7cnDynJC/sw8zczOgvrXqvt5yN
 F/CEAzBu5YOZEKdP6zIWCyL4VAlEFDIcOCzFI/ZRex2FzrjfRdf+dOQ5uWPvH5kSAGDC
 /N1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q37TGXXlesLIjhyW24s8PmSpO9cvwc40pKnWhZLXxrs=;
 b=l4SIoLDio/ItE+LYStpHwbemJkTxHJ7FUz9SSmCZi9nMXNrmTZ/78VJc8CVP9jV693
 rlRjifRPCcAocoxZBxajg9qfsOUXoK/2zuXRh4hTYyRWYZee582B3ozOp9x1zCHku8cO
 Sn//377BFm+g2/RxYnWVm3F1qVV9J2WxitkD4db83RHEitwh7SePaRSdWZ9wGHN84Hxz
 v5Iqfh66EYnWUNJ2CQAOE9+JWFhpHiZ5spp6HAo5i5jGAYwdsNL8zm+NP8cXV86Uwq6e
 MrKhJzijOzZ1DWNScw5qZ+/99zvkuGj/kIzf8sON29sUHyzP0ameyDnBM7XX5WClGkMJ
 XNcg==
X-Gm-Message-State: AOAM53217v1hrjHp77U9NMKgvzr6klnhEz8eXPw/8UroEnVMml3IUXQO
 NSFQQifc741jiG/JIfCYMRs=
X-Google-Smtp-Source: ABdhPJyYIXLUq6/eKnWp6kNIpRU6kx7DDX19+hL9x91v3J5nGR0zMi18lZoIspDtYKVJ8s3Met1XBg==
X-Received: by 2002:a05:6402:42ca:b0:408:ed7:b011 with SMTP id
 i10-20020a05640242ca00b004080ed7b011mr29723041edc.6.1645607672821; 
 Wed, 23 Feb 2022 01:14:32 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id h11sm7184709ejg.109.2022.02.23.01.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 01:14:32 -0800 (PST)
Message-ID: <6b826330-f133-ffd6-234d-d8b8ada01ea4@redhat.com>
Date: Wed, 23 Feb 2022 10:14:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH resend 0/2] kvm/msi: do explicit commit when adding msi
 routes
Content-Language: en-US
To: "Longpeng(Mike)" <longpeng2@huawei.com>
References: <20220222141116.2091-1-longpeng2@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220222141116.2091-1-longpeng2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.williamson@redhat.com, mtosatti@redhat.com, arei.gonglei@huawei.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 15:11, Longpeng(Mike) via wrote:
> From: Longpeng <longpeng2@huawei.com>
> 
> This patchset moves the call to kvm_irqchip_commit_routes() out of
> kvm_irqchip_add_msi_route(). An optimization of vfio migration [1]
> depends on this changes.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00968.html
> 
> Longpeng (Mike) (2):
>    kvm-irqchip: introduce new API to support route change
>    kvm/msi: do explicit commit when adding msi routes
> 
>   accel/kvm/kvm-all.c    |  7 ++++---
>   accel/stubs/kvm-stub.c |  2 +-
>   hw/misc/ivshmem.c      |  5 ++++-
>   hw/vfio/pci.c          |  5 ++++-
>   hw/virtio/virtio-pci.c |  4 +++-
>   include/sysemu/kvm.h   | 23 +++++++++++++++++++++--
>   target/i386/kvm/kvm.c  |  4 +++-
>   7 files changed, 40 insertions(+), 10 deletions(-)
> 

Queued, thanks.

Paolo

