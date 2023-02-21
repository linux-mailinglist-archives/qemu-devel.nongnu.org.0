Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C1169DE8F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:14:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQbE-0002sZ-B2; Tue, 21 Feb 2023 06:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUQbB-0002mO-Ld
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:14:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUQbA-0008KE-2x
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676978055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EbcLJgbiABfuVV/q11k5fi4fHDbLsY5amFgm8NW07fk=;
 b=KCurSJN0W01PaDauT8FBaTOfC6WPQtCkAYKckKbFyY+8NPTQiY8T75KF+oA3cU9RhJWsrJ
 0+Bg33dAvWA1io0w+4J45CCcKLgerIelaWRwRdXGTz6m78C7L2bvVX08s21Mm3zdTyJ4jr
 Wj6FTxOCTmr4KwNQQUqMPUFw/93Kvh4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-185-X08Mb8MBML21mF7vde-odA-1; Tue, 21 Feb 2023 06:14:14 -0500
X-MC-Unique: X08Mb8MBML21mF7vde-odA-1
Received: by mail-wr1-f70.google.com with SMTP id
 g6-20020adfa486000000b002c55ef1ec94so739637wrb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 03:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EbcLJgbiABfuVV/q11k5fi4fHDbLsY5amFgm8NW07fk=;
 b=rmmfSxc8wLOiQBT7J6plJLvX3afdql30bfb1qOHax4WIVzp6mW196jguCeVMAORaT1
 CzEpvbHSb58ruBBAfN1ZZ8sw6SjZoo4NNhetRTHKOFdPVsg2V+Rk/FnahTpB2QE/2y/S
 u23FOsUORGYyKdjsH3yc8lQEqgFBWA65FIp4ZyaOp3TEjhVGOUpZACu/WIi4zUcqx2zF
 4H3649qpQqxUn0toZobmzUsYX/2ursDKjZDSAlWX/ORKvS14DvXmB8TmIpByOrf/drDn
 DW+qPHxMQi5rIaUgg2quwLaiGQIIZYlvlNbws95uj65Eh0nzsuQVXAvHuJPcw7j9HfSN
 tBFg==
X-Gm-Message-State: AO0yUKUmohK8NGTFnFzK+kBONx66EYo7le3P2StkCSNnvNHAW5j9pI0q
 0Hvnmm4NU3TEXWkGsKTk+SERdEc6EXOpgnP5p0hOwWpkG7zIAoPaT+sl0D57Y5MyjKHyj0/xtur
 f4W2SInIfHsw1ge0=
X-Received: by 2002:a05:600c:714:b0:3e2:1368:e3a0 with SMTP id
 i20-20020a05600c071400b003e21368e3a0mr1083610wmn.18.1676978053107; 
 Tue, 21 Feb 2023 03:14:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/BZrLRMszyY8AYLNtHurrG7m64XkjTVXaHlbjLwJvb96KSLaYIdelcjsogWTdfsJrh0bjpPA==
X-Received: by 2002:a05:600c:714:b0:3e2:1368:e3a0 with SMTP id
 i20-20020a05600c071400b003e21368e3a0mr1083599wmn.18.1676978052863; 
 Tue, 21 Feb 2023 03:14:12 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c00c800b003e2243cfe15sm13980763wmm.39.2023.02.21.03.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 03:14:12 -0800 (PST)
Message-ID: <391fdaaa-4b77-b17f-0cc2-0d7bdcf065b5@redhat.com>
Date: Tue, 21 Feb 2023 12:14:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4] configure: Add 'mkdir build' check
Content-Language: en-US
To: Dinah Baum <dinahbaum123@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230221110631.4142-1-dinahbaum123@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221110631.4142-1-dinahbaum123@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/02/2023 12.06, Dinah Baum wrote:
> QEMU configure script goes into an infinite error printing loop
> when in read only directory due to 'build' dir never being created.
> 
> Checking if 'mkdir dir' succeeds prevents this error.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/321
> Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   configure | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index cf6db3d551..1ef3e7f77d 100755
> --- a/configure
> +++ b/configure
> @@ -31,7 +31,12 @@ then
>           fi
>       fi
>   
> -    mkdir build
> +    if ! mkdir build || ! touch $MARKER
> +    then
> +        echo "ERROR: Could not create ./build directory. Check the permissions on"
> +        echo "your source directory, or try doing an out-of-tree build."
> +        exit 1
> +    fi
>       touch $MARKER

Nit: I think the final "touch $MARKER" could now be removed, too, since the 
code either exits above, or runs the "|| ! touch $MARKER" part there already.

Anyway, it's just a nit, and maybe could also be fixed while picking up the 
patch, thus:

Reviewed-by: Thomas Huth <thuth@redhat.com>


