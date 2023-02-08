Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB0B68EC30
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:52:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPh7Z-0006ji-Ig; Wed, 08 Feb 2023 04:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPh7X-0006jD-36
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:52:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPh7V-0006Lb-JU
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675849924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JzL3frmR6RoX3zMUonRRbVRcAnSnWvxoFRwA3IbUUhM=;
 b=gG3Yzn8ydWUJUIsRAoaNE38qoIWsQKeFRQkVdLOYrpm2+42ZmnYh+fRd4TATDqkWdSEAMd
 arTEykaSy8RTFIVJJTdqbjUhE9qkKpCFxXYFWpuCFSwDkzqYCFzsbaIpDCwuMO6CdAqnnk
 UsAOKvMiUnKuK5LBVLcqcCLbgMrb35Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-255-x8COXM0yMt2OZnGi92-pDA-1; Wed, 08 Feb 2023 04:52:03 -0500
X-MC-Unique: x8COXM0yMt2OZnGi92-pDA-1
Received: by mail-wm1-f70.google.com with SMTP id
 s11-20020a05600c384b00b003dffc7343c3so4375684wmr.0
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 01:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JzL3frmR6RoX3zMUonRRbVRcAnSnWvxoFRwA3IbUUhM=;
 b=rHJRh4muPb/fzxmrQS0vbGivC1kz+fpt1aPNq7pi50PqcINqZ+12V1Aa0gbm6kEja4
 XZWbYbygGOoaPTb5OksKNN54NViGynBRtpO8NbHNPNYgtkaPgi7+Vo2rzDAXhXf6l3M7
 CunfrvlcbObGUx31f48yCnwNTtRPWSMcgvjx3BzZesfFbFgqdiv6yNxzLUru8YVSACkp
 t9wl9T+RcGXBO2MJJmp9s4ZV6deXJSTGg6WDDy7ZmKt8i1aKsnflTi3PB60U/9BDqhvY
 B8zf4VFz0cXx51M+zA7BClMLKOEO1tXrzrz5J8tppAe/LomRD+1chgdQb57FDSSGeoMG
 NS9A==
X-Gm-Message-State: AO0yUKX6cW1VkmTVO7H8Yvwv0qk2LK/tszgiMqVewJdXcW0Wpt7s8MZk
 y2Id/vzeDFsqYKn8VR2axS/rLXb9cFi4wiu/D6V2yy+4rkl+hV1c4VQynShB2bSCwENYXGowueP
 Q0C1p+K1x0KwmSqE=
X-Received: by 2002:a5d:4d01:0:b0:2c3:f021:da55 with SMTP id
 z1-20020a5d4d01000000b002c3f021da55mr5701583wrt.28.1675849922470; 
 Wed, 08 Feb 2023 01:52:02 -0800 (PST)
X-Google-Smtp-Source: AK7set/5WMbaLClqWYjipgZHNarJ1v4MKZ9YvSmj3zuOAuPlPX6Y8dAOa54/CqE6jzKA08Iry2wNrA==
X-Received: by 2002:a5d:4d01:0:b0:2c3:f021:da55 with SMTP id
 z1-20020a5d4d01000000b002c3f021da55mr5701566wrt.28.1675849922306; 
 Wed, 08 Feb 2023 01:52:02 -0800 (PST)
Received: from redhat.com ([2.52.156.127]) by smtp.gmail.com with ESMTPSA id
 n4-20020a7bc5c4000000b003dfe57f6f61sm1400853wmk.33.2023.02.08.01.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 01:52:01 -0800 (PST)
Date: Wed, 8 Feb 2023 04:51:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, philmd@linaro.org, armbru@redhat.com,
 thuth@redhat.com, maobibo@loongson.cn, yangxiaojuan@loongson.cn
Subject: Re: [PATCH v1 2/2] loongarch: Add smbios command line option.
Message-ID: <20230208045151-mutt-send-email-mst@kernel.org>
References: <20230208094133.2945979-1-gaosong@loongson.cn>
 <20230208094133.2945979-2-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208094133.2945979-2-gaosong@loongson.cn>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, Feb 08, 2023 at 05:41:33PM +0800, Song Gao wrote:
> LoongArch has enabled CONFIG_SMBIOS, but didn't enable CLI '-smbios'.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 88e93c6103..2aa6709466 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2592,7 +2592,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>      "                specify SMBIOS type 17 fields\n"
>      "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pcidev=str]\n"
>      "                specify SMBIOS type 41 fields\n",
> -    QEMU_ARCH_I386 | QEMU_ARCH_ARM)
> +    QEMU_ARCH_I386 | QEMU_ARCH_ARM | QEMU_ARCH_LOONGARCH)
>  SRST
>  ``-smbios file=binary``
>      Load SMBIOS entry from binary file.
> -- 
> 2.31.1


