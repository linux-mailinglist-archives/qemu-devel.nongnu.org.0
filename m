Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F9330A361
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 09:36:17 +0100 (CET)
Received: from localhost ([::1]:52664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Ugy-0004Js-Bb
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 03:36:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6Ufj-000399-HN
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 03:34:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6Ufh-0005Ht-AD
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 03:34:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612168496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gm47NOdsiA8w3zVE9sHPDHTLG06a6IG1aKDU8XTax/o=;
 b=CcKvkYvXJgkXd3PNB8s3cUhU6b8XZ1AwpJ8zylAtAe2zu1ywmxAPm/XWsd604Q4/19NlpO
 G3BlhI2XbtEb18n+s7YJqoMzsf93EAFMf690hp1dxxkYcCY43spQnqv3k8pMh+Zw4GUAen
 b8pF0k3+jjEb7eKvM3TogEPigFMB/yU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-2vo2C-GdPbOJpOzQqlGmtg-1; Mon, 01 Feb 2021 03:34:52 -0500
X-MC-Unique: 2vo2C-GdPbOJpOzQqlGmtg-1
Received: by mail-ed1-f69.google.com with SMTP id f4so7564997eds.5
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 00:34:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gm47NOdsiA8w3zVE9sHPDHTLG06a6IG1aKDU8XTax/o=;
 b=oJ2rh94JtannusJfmENPMyI3U0Ri9YGyWA6U7qiwYAvyqMrkq4uhoTWNdQoUJ2RGYP
 5skcc3Gdywm13ji8+pvd2dsZcmoZfrOrvbgA7unWfz16EBrWwisrqQ0IO5Vrh73iXczJ
 qfJ/ck1Ph9x8Q5g8QOO2z7+akw8bn8AFeYyQbBM2sXyB8jEyvoGf/Rat58t7Iq4NLRDw
 c7Q1iwMOhw2+9fdcJpOd88XdpsXYcpHt5fBMyybeE842PI5nEQ/16flfntm5SXSk/NCw
 v9tviaEP3mg34Am23XnKJDbt1Amg7mjSl5alr8k9mb3DQeWJkABWEnTOAViWRymzZlbS
 MUIg==
X-Gm-Message-State: AOAM5312gZmms3Au1CWB7yjvrbymXokZ6XYNalYCbMQPn/xEAs6bGE7k
 p0ZH9OrTh+sBKsFPjUDjMuocuchR2CqY0D3L4FbUxrvCvrZtzzfaIvQCaSPUzwy+VJVDpHIgrk9
 5yZoig+MRaymV0bA=
X-Received: by 2002:a05:6402:35c2:: with SMTP id
 z2mr17435955edc.34.1612168491491; 
 Mon, 01 Feb 2021 00:34:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyZ391Du2eae4AAvhEk4ICQIr9fen9gbN1LB/IKhx59RWxvtv3goadRgPEg3msphjMcEQPQg==
X-Received: by 2002:a05:6402:35c2:: with SMTP id
 z2mr17435937edc.34.1612168491260; 
 Mon, 01 Feb 2021 00:34:51 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s3sm7441126ejn.47.2021.02.01.00.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 00:34:50 -0800 (PST)
Subject: Re: [PATCH v2 4/4] hw/xen: Have Xen machines select 9pfs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210131141810.293186-1-f4bug@amsat.org>
 <20210131141810.293186-5-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <565bf0dd-a5de-352e-eec7-68b862ed09e4@redhat.com>
Date: Mon, 1 Feb 2021 09:34:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210131141810.293186-5-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/01/21 15:18, Philippe Mathieu-Daudé wrote:
> 9pfs is not an accelerator feature but a machine one,
> move the selection on the machine Kconfig (in hw/).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   accel/Kconfig       | 1 -
>   hw/i386/xen/Kconfig | 1 +
>   hw/xen/Kconfig      | 1 +
>   3 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/Kconfig b/accel/Kconfig
> index 461104c7715..b9e9a2d35b0 100644
> --- a/accel/Kconfig
> +++ b/accel/Kconfig
> @@ -15,4 +15,3 @@ config KVM
>   
>   config XEN
>       bool
> -    select FSDEV_9P if VIRTFS
> diff --git a/hw/i386/xen/Kconfig b/hw/i386/xen/Kconfig
> index ad9d774b9ea..4affd842f28 100644
> --- a/hw/i386/xen/Kconfig
> +++ b/hw/i386/xen/Kconfig
> @@ -3,3 +3,4 @@ config XEN_FV
>       default y if XEN
>       depends on XEN
>       select I440FX
> +    select FSDEV_9P if VIRTFS
> diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
> index 0b8427d6bd1..825277969fa 100644
> --- a/hw/xen/Kconfig
> +++ b/hw/xen/Kconfig
> @@ -5,3 +5,4 @@ config XEN_PV
>       select PCI
>       select USB
>       select IDE_PIIX
> +    select FSDEV_9P if VIRTFS
> 

I think you can compile without FSDEV_9P selected?  If so, this should 
be "imply".

If on the other hand you cannot, and that is because of some other file 
brought in by CONFIG_XEN, this patch shouldn't be there.

I can queue the series once you resolve this doubt.

Paolo


