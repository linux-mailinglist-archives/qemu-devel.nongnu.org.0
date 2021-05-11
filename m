Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF5D37A163
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:07:51 +0200 (CEST)
Received: from localhost ([::1]:44934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNQk-0004kc-Bt
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgNOH-0002hF-Qy
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:05:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgNO8-0003dd-1v
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:05:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vc/9L3gEr0RwTabmk0OPu+Oeu1niTUYSbM1HX1bONck=;
 b=DtVfG9DFagKu18smcIl3fGlrlTZDlKWKMeyXDz3I0/gXcI5rM6YyUrFgna3lLRzLiZWn8g
 uqf0z+46+KgjsLzHqNlsW4cANkNKxnJevV6TpAVoBOtlX9rQKFZG4bL1qaExEckfKtZyDQ
 YR+PkhsJZOfwPVZW6UgluOEHWq1M8dc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-N8DRlLlHOFKVnttCYgdjqQ-1; Tue, 11 May 2021 04:05:04 -0400
X-MC-Unique: N8DRlLlHOFKVnttCYgdjqQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 a7-20020adfc4470000b029010d875c66edso8406762wrg.23
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 01:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vc/9L3gEr0RwTabmk0OPu+Oeu1niTUYSbM1HX1bONck=;
 b=SyKEa3s/t04wy1ormNUVL6A+zUy/IGFWXLonnpa9IKvwpWdR33FsQd8vQo/BebpbIv
 TxEQCJ9F7OwKPCKcQad6Bt4Nm1xBbpKglMwZhakdtL0WrV3eaJ8JByajk4lv50rD7r5W
 Q14ekc9k/BjH4KF4TiZhV+dtiRXZQ5pyJvh15j7k6J6FiJqud7Tf9rtxDDIYDgeGRsUY
 o+MAxI9/5LCb0R84eCoxvc0x7R+xo8m3PUslS74QfaQyMGseefNdaZaZpIF3Lltdt3ba
 5PSxJIG0ocz51g8XRfI+U78eek8ZWgwiURq5UDLtLCZFk16CQR1z+M/KIKsvDg05Ydgs
 c0AQ==
X-Gm-Message-State: AOAM532kS/nuIbi9toM7bW0z8LPLQpKkTbGmjsHY19SX3vBU19meXk62
 z4Whnzsv6dXd+djV9jSD43B+nXvdNuV9zgeFVjrw8mUip+nda6fo+sdkI7jT8mFWq4mZj1RcrS9
 BcueXK4GVZj0+gDc=
X-Received: by 2002:a7b:c34a:: with SMTP id l10mr31484211wmj.46.1620720302396; 
 Tue, 11 May 2021 01:05:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV6eSV7g0Z7Xib10PP9Fpba/MfxgHvyJsu0Y7nE1p2LYnniorsdw+dHOrWUO9+akR64T1gXQ==
X-Received: by 2002:a7b:c34a:: with SMTP id l10mr31484194wmj.46.1620720302232; 
 Tue, 11 May 2021 01:05:02 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n123sm2781118wme.24.2021.05.11.01.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 01:05:01 -0700 (PDT)
Subject: Re: [PATCH] hw/block/nvme: re-enable NVMe PCI hotplug
To: Hannes Reinecke <hare@suse.de>, Keith Busch <keith.busch@wdc.com>,
 Klaus Jensen <its@irrelevant.dk>
References: <20210511073511.32511-1-hare@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <da948c52-c183-4b3d-efcd-972d1e490e18@redhat.com>
Date: Tue, 11 May 2021 10:05:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511073511.32511-1-hare@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Klaus (maintainer)

On 5/11/21 9:35 AM, Hannes Reinecke wrote:
> Ever since commit e570768566 ("hw/block/nvme: support for shared
> namespace in subsystem") NVMe PCI hotplug is broken, as the PCI
> hotplug infrastructure will only work for the nvme devices (which
> are PCI devices), but not for any attached namespaces.
> So when re-adding the NVMe PCI device via 'device_add' the NVMe
> controller is added, but all namespaces are missing.
> This patch adds device hotplug hooks for NVMe namespaces, such that one
> can call 'device_add nvme-ns' to (re-)attach the namespaces after
> the PCI NVMe device 'device_add nvme' hotplug call.
> 
> Fixes: e570768566 ("hw/block/nvme: support for shared namespace in subsystem")
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  capstone               |  2 +-

>  roms/SLOF              |  2 +-
>  roms/openbios          |  2 +-
>  roms/u-boot            |  2 +-
>  9 files changed, 93 insertions(+), 20 deletions(-)
> 
> diff --git a/capstone b/capstone
> index f8b1b83301..22ead3e0bf 160000
> --- a/capstone
> +++ b/capstone
> @@ -1 +1 @@
> -Subproject commit f8b1b833015a4ae47110ed068e0deb7106ced66d
> +Subproject commit 22ead3e0bfdb87516656453336160e0a37b066bf

> index 33a7322de1..e18ddad851 160000
> --- a/roms/SLOF
> +++ b/roms/SLOF
> @@ -1 +1 @@
> -Subproject commit 33a7322de13e9dca4b38851a345a58d37e7a441d
> +Subproject commit e18ddad8516ff2cfe36ec130200318f7251aa78c
> diff --git a/roms/openbios b/roms/openbios
> index 4a0041107b..7f28286f5c 160000
> --- a/roms/openbios
> +++ b/roms/openbios
> @@ -1 +1 @@
> -Subproject commit 4a0041107b8ef77e0e8337bfcb5f8078887261a7
> +Subproject commit 7f28286f5cb1ca682e3ba0a8706d8884f12bc49e
> diff --git a/roms/u-boot b/roms/u-boot
> index b46dd116ce..d3689267f9 160000
> --- a/roms/u-boot
> +++ b/roms/u-boot
> @@ -1 +1 @@
> -Subproject commit b46dd116ce03e235f2a7d4843c6278e1da44b5e1
> +Subproject commit d3689267f92c5956e09cc7d1baa4700141662bff
> 

Submodule changes unlikely related.


