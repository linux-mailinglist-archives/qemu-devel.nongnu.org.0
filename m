Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4F947573A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:02:21 +0100 (CET)
Received: from localhost ([::1]:47618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxS3A-0002Wj-Ma
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:02:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRex-0002ac-Bh
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:37:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRev-00080s-Ha
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:37:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AS1vkeJQIrXY9ktktNfMLUDEWW3rjnM68xZL51wo7aI=;
 b=Lo2P5/aLz2f7HExlvBMrq8i+wqwaBDigfBvG5RM5E2JQ/EQnWzkBqYQ1GSmc3+yM2g62Qr
 WTxbgD7icmLBaoKk27L34ZE+bo3XDt1pGtNB7z0bvRTZc2kJHM5uV9jz+AcVcWAhHSfrxF
 MhJoS0XGnoTXKhOy1m84cdCspRGjWN0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-2A4VzhUmNealukyKrDZmWw-1; Wed, 15 Dec 2021 05:37:14 -0500
X-MC-Unique: 2A4VzhUmNealukyKrDZmWw-1
Received: by mail-wr1-f72.google.com with SMTP id
 k11-20020adfc70b000000b001a2333d9406so149005wrg.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AS1vkeJQIrXY9ktktNfMLUDEWW3rjnM68xZL51wo7aI=;
 b=GzrOQn+hhl+C7mFHgLzWdLcCCbPoeax/DsgkwUK7DsMM3e/8uAJAJT35Oj0sP9CrX4
 dRadBMBfYDg9nkdGQzeCk64z2BL+X6zLOpfZ+RUGEHu0NWuUVEWOiNFHXolgRg3seuYv
 RQwhGrMC5MY9zxMufccrOBSBTDdbabMuxdM/2DxerAkjLy59R50IsRk7UWCsKIog+wv7
 wuIgM8Pb4tjzikk4BZSwpP1T5YGsqj4b9Tyks56yob66a3aBX2DnjH6K2mOko+F/zIiH
 5/AFgNrwjATY4+/aXoV5Hrk9aqgYh8gbBTwkg4Liv2P2kgRvLB4WyYeygzO190eMlrBd
 AoFw==
X-Gm-Message-State: AOAM533cM6B4zvi028w9iqIGDLQcTy+dTpS7jrxGWpzfcgTzPmfiJ1Q0
 KYf5FVlpHf3pa/edHLSAKn7Ne5jrqAfwXJuQ15KBh9DK60NDitCruAUmBfVoudGqbrGfPKplreh
 NYyhp3RPhmx063RtmZQQkRQ9T0eE7mCib/5IhvcLyWyGTys5vHD8yfCE4GVgcrPKe
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr3745173wrq.120.1639564633336; 
 Wed, 15 Dec 2021 02:37:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAysMXf48bGMeip4D4YoKGsBdqy0TmJTqn1LSMxMxK/+lSrf8mPseWEc2mai3njcJyyvAyCw==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr3745156wrq.120.1639564633169; 
 Wed, 15 Dec 2021 02:37:13 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m21sm1598832wrb.2.2021.12.15.02.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:37:12 -0800 (PST)
Message-ID: <07ab7f18-bff7-7d54-188e-92b6d7bdf01b@redhat.com>
Date: Wed, 15 Dec 2021 11:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-7.0] hw/net/rocker: Remove unused definitions
To: qemu-devel@nongnu.org
References: <20211116193915.2792721-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211116193915.2792721-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping for review?

On 11/16/21 20:39, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/net/rocker/rocker.h | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/hw/net/rocker/rocker.h b/hw/net/rocker/rocker.h
> index 412fa44d017..d22bbd2bf80 100644
> --- a/hw/net/rocker/rocker.h
> +++ b/hw/net/rocker/rocker.h
> @@ -36,13 +36,8 @@ static inline GCC_FMT_ATTR(1, 2) int DPRINTF(const char *fmt, ...)
>  }
>  #endif
>  
> -#define __le16 uint16_t
> -#define __le32 uint32_t
> -#define __le64 uint64_t
> -
>  #define __be16 uint16_t
>  #define __be32 uint32_t
> -#define __be64 uint64_t
>  
>  static inline bool ipv4_addr_is_multicast(__be32 addr)
>  {
> 


