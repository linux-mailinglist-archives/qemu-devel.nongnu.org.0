Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9320F54A851
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:49:05 +0200 (CEST)
Received: from localhost ([::1]:45744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yUC-0008V6-N5
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o0yRx-0007Hn-Ft
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o0yRs-0005SK-KN
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655181999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EpgxkU/gw2Ci1kfrbO8CnNxvKo68E6J/4HcAcHl+a5w=;
 b=Z6E3dpcxM4XtpOGJHZGHLzXxKiB/WUpeZFdns9wJsWkS/71DedGcSckr2B9c1CpFkZEmig
 uBfQaN8YOOpTsLYnJf/QmGmkOLAr9TxQkygqwxLrvpayC4SXymd0gAFZQvjAx0KPdi/MZr
 2eTxg7gcg6RW99EFWNI1V37u7hRcBLQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-Kg2lBwxHMrKnDVVobNxd4Q-1; Tue, 14 Jun 2022 00:46:38 -0400
X-MC-Unique: Kg2lBwxHMrKnDVVobNxd4Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 j20-20020a05600c1c1400b0039c747a1e5aso4254079wms.9
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EpgxkU/gw2Ci1kfrbO8CnNxvKo68E6J/4HcAcHl+a5w=;
 b=pK+HeAzZFDOQbwJtA/QK/1M1OtaLTpBsVUPF7HF96LqesSjDB7wGq7/Zi0A9khdFZF
 yzT49wi/SgARIE3ulMQH3j0zroYKNZIOgd79IlEmrxeJcu88Xb9Y3WERr/C+mPHQF+oK
 vetrWL5VsMKoWzdoV1unf/W0xTIzxN9bCKID7KnVxD116afgppIgkzSy9GRSRknQbpNk
 LfPsgLgVxRQL5pi1mmTApxIouQr/oISoUz/o7JRilPf2n2AzAhlxGZxyj0FRM8CZNfY5
 Hw2sVs69mjQBu2OeofwGgFdh+KaksKazIjVaJKakZKnzMTMJ9+hxw51iK0dObE1dVlE/
 iCbA==
X-Gm-Message-State: AOAM532mSG6C4l5zP27ekfRztz6F0rZvxQEkegKTPfqHlgpuKGywYJE9
 JoQ3kTMMvavHUdR9bwWPmZB0c9a7NHl5wlthX032qE6nLoscrKy1rZcpT/RjmWnhF2BtCr5/7ro
 /nhKi79UcKtbkr8o=
X-Received: by 2002:a05:600c:1d19:b0:39c:4aee:fe3a with SMTP id
 l25-20020a05600c1d1900b0039c4aeefe3amr1989191wms.89.1655181997187; 
 Mon, 13 Jun 2022 21:46:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvP08+gEBqCAtiaPPTZ2kgXQANVValnN82v/i+3i60luFyW7vzlXJlPb/irRokI7ospX7lKQ==
X-Received: by 2002:a05:600c:1d19:b0:39c:4aee:fe3a with SMTP id
 l25-20020a05600c1d1900b0039c4aeefe3amr1989179wms.89.1655181996874; 
 Mon, 13 Jun 2022 21:46:36 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-75.web.vodafone.de.
 [109.42.114.75]) by smtp.gmail.com with ESMTPSA id
 a24-20020a1cf018000000b0039c64d0c4e8sm11471265wmb.45.2022.06.13.21.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 21:46:36 -0700 (PDT)
Message-ID: <fa6e9152-73a1-d6ca-269a-1b1513472aa8@redhat.com>
Date: Tue, 14 Jun 2022 06:46:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/5] tests/qemu-iotests: skip 108 when FUSE is not loaded
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220614015044.2501806-1-jsnow@redhat.com>
 <20220614015044.2501806-3-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220614015044.2501806-3-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 14/06/2022 03.50, John Snow wrote:
> In certain container environments we may not have FUSE at all, so skip
> the test in this circumstance too.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/108 | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
> index 9e923d6a59f..e401c5e9933 100755
> --- a/tests/qemu-iotests/108
> +++ b/tests/qemu-iotests/108
> @@ -60,6 +60,12 @@ if sudo -n losetup &>/dev/null; then
>   else
>       loopdev=false
>   
> +    # Check for fuse support in the host environment:
> +    lsmod | grep fuse &>/dev/null;

That doesn't work if fuse has been linked statically into the kernel. Would 
it make sense to test for /sys/fs/fuse instead?

(OTOH, we likely hardly won't run this on statically linked kernels anyway, 
so it might not matter too much)

> +    if [[ $? -ne 0 ]]; then

I'd prefer single "[" instead of "[[" ... but since we're requiring bash 
anyway, it likely doesn't matter.

> +        _notrun 'No Passwordless sudo nor FUSE kernel module'
> +    fi
> +
>       # QSD --export fuse will either yield "Parameter 'id' is missing"
>       # or "Invalid parameter 'fuse'", depending on whether there is
>       # FUSE support or not.

  Thomas


