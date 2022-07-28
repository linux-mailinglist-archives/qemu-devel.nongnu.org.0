Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC4E5838CD
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 08:33:13 +0200 (CEST)
Received: from localhost ([::1]:47296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGx56-0008TN-OT
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 02:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGww0-0002Lj-G4
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:23:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGwvy-0002Wb-C8
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658989425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r9f9dsGiU6YoR8zHBL32kZ+yOVMsee4d2ttxhqldkuQ=;
 b=OoGQkUmnNapQhJlsCdoVy/tZoJSCuhyhLPk+HLVMiqFbjS8wxJXMS8pgl5Z1V/wS9yg0tx
 3b+R/ZN2vq7vFjocddnV5AhyZGWeM7aC0QrikuYtJMOoAJdJdqDKXnnGaX9VVlMXgRBB0v
 5Sh3HnzKPUgWCoG3wycNN8e4d71NHMY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-Idz77bXwNvSfQZsr57-tJw-1; Thu, 28 Jul 2022 02:23:43 -0400
X-MC-Unique: Idz77bXwNvSfQZsr57-tJw-1
Received: by mail-pl1-f198.google.com with SMTP id
 b17-20020a170903229100b0016d3e892112so697396plh.6
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 23:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r9f9dsGiU6YoR8zHBL32kZ+yOVMsee4d2ttxhqldkuQ=;
 b=5uiZAIP0X1c38c7XHKvLbvGsm9SwBotLv47RMCGFs06L68TeGjIdNFoqa7Cochf0K7
 MuUrYUkMK2Gwhwxu9HgltFn1D5c2UonrElng2Y6ztl/R7E2j5gG3X7+JLHryGRqhn9qZ
 uhP8LRL6ErEtqW+sAjoz8sxEonMhBJOq2UKqaLIhA+Smoe8jEL/tB50sCJlcBfSKqwAG
 1vwxh4t5pIND16lYa5Nn3HBr5PZscbGl8Zt/Lf8yBC41HLkbxa0vwwHpuAwYA8B6j9Kf
 zEh6uTiVgbWwSXLvxC62pLqelJtIRVUYQ2lGpROz/t4jCC81NND9bUjGuu7OwQfR7TZo
 eSAw==
X-Gm-Message-State: AJIora8KTac2B3nYArVKFDUdV+ihyVIVRMb5hPJvscet6FggwE2/1an4
 XYRVtqupDdkiDzyecbVfLqC8fCHOgvWWwQ5dyLQD/4K/miQbyEa/TjtUPJk+5sVm/AumHw3/3xL
 lUoZW9x0lX6f1UwY=
X-Received: by 2002:a17:90b:3b82:b0:1f0:73e1:8426 with SMTP id
 pc2-20020a17090b3b8200b001f073e18426mr8439185pjb.209.1658989422797; 
 Wed, 27 Jul 2022 23:23:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tpCvnK197EzZcmxqyLlLvegqeB+CJ2CrdeEnRjeG8VPAPhs9WKTgAalblErRaCiGmC+9uREg==
X-Received: by 2002:a17:90b:3b82:b0:1f0:73e1:8426 with SMTP id
 pc2-20020a17090b3b8200b001f073e18426mr8439162pjb.209.1658989422514; 
 Wed, 27 Jul 2022 23:23:42 -0700 (PDT)
Received: from [10.72.12.154] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 x68-20020a626347000000b0052c89540659sm15229pfb.189.2022.07.27.23.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 23:23:41 -0700 (PDT)
Message-ID: <d8e9a065-d300-51d1-513f-d766f83abf77@redhat.com>
Date: Thu, 28 Jul 2022 14:23:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3 08/21] hw/virtio: handle un-configured shutdown in
 virtio-pci
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
 <20220726192150.2435175-9-alex.bennee@linaro.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220726192150.2435175-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/7/27 03:21, Alex Bennée 写道:
> The assert() protecting against leakage is a little aggressive and
> causes needless crashes if a device is shutdown without having been
> configured. In this case no descriptors are lost because none have
> been assigned.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/virtio/virtio-pci.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 45327f0b31..5ce61f9b45 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -996,9 +996,14 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>   
>       nvqs = MIN(nvqs, VIRTIO_QUEUE_MAX);
>   
> -    /* When deassigning, pass a consistent nvqs value
> -     * to avoid leaking notifiers.
> +    /*
> +     * When deassigning, pass a consistent nvqs value to avoid leaking
> +     * notifiers. But first check we've actually been configured, exit
> +     * early if we haven't.
>        */
> +    if (!assign && !proxy->nvqs_with_notifiers) {
> +        return 0;
> +    }


I think the logic is the caller is in charge of tracking whether the 
vhost device is started so it can avoid calling this function?

Thanks


>       assert(assign || nvqs == proxy->nvqs_with_notifiers);
>   
>       proxy->nvqs_with_notifiers = nvqs;


