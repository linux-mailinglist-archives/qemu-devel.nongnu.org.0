Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3453BE1DF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 06:18:57 +0200 (CEST)
Received: from localhost ([::1]:45728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0z1U-0004RG-Fo
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 00:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0z0V-0003mj-RG
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:17:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0z0S-0002jk-86
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625631470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mW5bZ2z5Hm1oHMzVanUO0s4qblJMCHVgf3tkmU7Pf2Y=;
 b=XWYgVrYIPi2A/LI0zkLvgLCeG7R6TiYiSdce6K/EL1wjXy9EMMVI9uBA/gOAQ+efmj92Ia
 q6KwNoSpwz47PN9F//9D46sRovq2CMn6WGEvm2LgTbwts7zttZROwFNOQxGqAfJPyayo9M
 RCOGq3JdMymr5EfMXwtlEdp9WhqYRqw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-jf1eWsmePSCBersQ8cFYEQ-1; Wed, 07 Jul 2021 00:17:38 -0400
X-MC-Unique: jf1eWsmePSCBersQ8cFYEQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m40-20020a05600c3b28b02901f42375a73fso397814wms.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 21:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mW5bZ2z5Hm1oHMzVanUO0s4qblJMCHVgf3tkmU7Pf2Y=;
 b=UgTAK+U1tNc+bYIqm7bXv6NgL9Sw/a/o6CEGm1y/7WzN65E2Bg3ypcTNcqZtPLXiFu
 WHfTIS1N0ck4O2bpghMbKn9fxKUEgQzSPxrFij2bO1je8Dr8jrkj2l2v5JM+QBpYXjjh
 zoX1po1BpGM/qk7StrUkOv7lDYOSLqsmbYwAw5V7ycmHjFrzxkSRiTRJVEfZKwhA00Bg
 LcrjgGAtyA7PXHVcjL70iDmHLKMzj8B3YWJR54XfnkTPZnJkuLotxOT7sUQKC95HGp2l
 /SjaXrP91czPfRgjqxdznkPjr0b/jFU2aTZSbclCzwNt3OMbATn1lOabVdOzNzaEI6tw
 aorw==
X-Gm-Message-State: AOAM531CT2R9x2WHLhQJT2hqN4G3NrZCUAMu1yiX6wlshgfOr/L8Q/7g
 t5AGsWH09MGDtHm0mjJvr8stFYIjUmDw9+G1vjWY5eOGA2R6VwPi/jouq/jUo1NSN5D6szdl+tZ
 JCaY2nxrkoc5zCfo=
X-Received: by 2002:a5d:6611:: with SMTP id n17mr25543276wru.269.1625631457597; 
 Tue, 06 Jul 2021 21:17:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj4XmZtSr5J86XZoWHW1LV6WuWZ4WXssO29Xm4jxSawuLpoLCxk4pt63+OSJdYZ0lIY9Z3oQ==
X-Received: by 2002:a5d:6611:: with SMTP id n17mr25543247wru.269.1625631457341; 
 Tue, 06 Jul 2021 21:17:37 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ead.dip0.t-ipconnect.de.
 [217.87.94.173])
 by smtp.gmail.com with ESMTPSA id s8sm17523879wmh.36.2021.07.06.21.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 21:17:36 -0700 (PDT)
Subject: Re: [PATCH v1 29/39] configure: don't allow plugins to be enabled for
 a non-TCG build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210706145817.24109-1-alex.bennee@linaro.org>
 <20210706145817.24109-30-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <aadd241a-aa62-aea9-b1c3-4fc622d12e84@redhat.com>
Date: Wed, 7 Jul 2021 06:17:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706145817.24109-30-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/07/2021 16.58, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 650d9c0735..44a487e090 100755
> --- a/configure
> +++ b/configure
> @@ -1098,6 +1098,7 @@ for opt do
>     --enable-cap-ng) cap_ng="enabled"
>     ;;
>     --disable-tcg) tcg="disabled"
> +                 plugins="no"
>     ;;
>     --enable-tcg) tcg="enabled"
>     ;;
> @@ -1509,7 +1510,11 @@ for opt do
>     ;;
>     --disable-xkbcommon) xkbcommon="disabled"
>     ;;
> -  --enable-plugins) plugins="yes"
> +  --enable-plugins) if test "$tcg" = "enabled"; then
> +                        plugins="yes"
> +                    else
> +                        error_exit "Can't enable plugins on non-TCG builds"
> +                    fi

That's the wrong spot for checking. While it works fine with:

  .../configure --disable-tcg --enable-plugins

it fails to bail out with:

  .../configure --enable-plugins --disable-tcg

You should do such checks after all options have been parsed.

  Thomas


