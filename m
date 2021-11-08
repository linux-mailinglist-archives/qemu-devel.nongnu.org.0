Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA8447D21
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:55:40 +0100 (CET)
Received: from localhost ([::1]:35580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk1NM-00040i-5a
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:55:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk1Lk-0003Cd-4y
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:54:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk1Li-0004tp-DE
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636365237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bo7Lj7rPpLgECkp7AY39DSwpgbqSVJWIZRAm3Bd7mVg=;
 b=fANKsj0sjh/XbhUXVXGx36TTtio4Bbog4SAJqZAS06hwlEn4TrC1Rgb+NsKQ/EpqfOl9r4
 HQGziEz7guNUodku17/+INZ05Jd2fZL15Y7ikKsqD9rYJ3vdSh2axvllOwLY7Bc0Px+IHF
 SrMA93otchWvE9uWu7qgegW3i0mBvJg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-CzNzUoUIOPaCLuL1JPayUw-1; Mon, 08 Nov 2021 04:53:56 -0500
X-MC-Unique: CzNzUoUIOPaCLuL1JPayUw-1
Received: by mail-wr1-f70.google.com with SMTP id
 z5-20020a5d6405000000b00182083d7d2aso3869320wru.13
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 01:53:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bo7Lj7rPpLgECkp7AY39DSwpgbqSVJWIZRAm3Bd7mVg=;
 b=AF9lG5pw7bEtKB3PyH8QW2pOKahMGMi2H7SXXQmo+t1a5hdYGqT4X+L0sMHAu/OgDM
 P43vcg8jk4ev/wgS8v2vDQ5wUyiKdOQgRcGZ6ZNpDVR7FsXD54eOk2PTb3DRXvgenO/F
 KC9KZ+C/gNeXeyi4eNm5Ftdy2fjik1KLAlJo1aQYDxmdW/hzpdg3OxKUyHbo+7n7zKCj
 nnxSjs6RUtj3GUuTcgekHTkldagQ1T2dnVXnZEoBfUeZARH9yCSILu+zuyrRk8+ini3q
 FeUnhBUgTPOm6H4zyrmKe+69YK5BhhssMIMfddooQi3GT7HIRre7hs5JlIDiuOzrpUg7
 bq0Q==
X-Gm-Message-State: AOAM533IYaqKr4NRqL+5PeR9H7A3vMYi2nVvog+W2ICfWsAgXr/6ZLWy
 8agKHPVPTrb5J2dO/BWkHhpBq2rObaPR0xsQTM/ChmS8Rh9JZcZ+5AakZ5mS+q7xBHvdmLsqoz4
 Q7PDoyEjNojjoHSA=
X-Received: by 2002:a05:600c:3b8f:: with SMTP id
 n15mr52234376wms.180.1636365235472; 
 Mon, 08 Nov 2021 01:53:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWLocBW25939tO/F6oQw1x3SsBWR5Y5Twt21XFzSoZ5NDJ6wFzRpksD6eDvYz9mdfe+q8CBA==
X-Received: by 2002:a05:600c:3b8f:: with SMTP id
 n15mr52234361wms.180.1636365235285; 
 Mon, 08 Nov 2021 01:53:55 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p13sm20506099wmi.0.2021.11.08.01.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 01:53:55 -0800 (PST)
Message-ID: <2a587f18-ac3f-0125-9685-b860b731c84d@redhat.com>
Date: Mon, 8 Nov 2021 10:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] vhost-user-scsi: fix Kconfig dependencies
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211108094705.554350-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211108094705.554350-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: felipe@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 10:47, Paolo Bonzini wrote:
> VIRTIO_PCI is a hard dependency for CONFIG_VHOST_USER_SCSI; if virtio-pci
> is not included, linking fails due to missing virtio_pci_types_register.
> Adjust the Kconfig dependencies.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/scsi/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/scsi/Kconfig b/hw/scsi/Kconfig
> index 77d397c949..f972680ffc 100644
> --- a/hw/scsi/Kconfig
> +++ b/hw/scsi/Kconfig
> @@ -50,6 +50,6 @@ config VIRTIO_SCSI
>  
>  config VHOST_USER_SCSI
>      bool
> +    default y
>      # Only PCI devices are provided for now
> -    default y if VIRTIO_PCI
> -    depends on VIRTIO && VHOST_USER && LINUX
> +    depends on VIRTIO_PCI && VHOST_USER && LINUX

But there is no PCI call there:

$ git grep pci hw/scsi/vhost*scsi*
$

Don't we want to add VHOST_USER_SCSI_PCI in
hw/virtio/Kconfig instead?


