Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54756F7EAA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 10:22:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puqhz-00020i-Ja; Fri, 05 May 2023 04:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puqhu-0001wu-NT
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:22:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puqht-0008VI-8u
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683274944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QSUdLPMHIhnIgxcZtnDpNYkVKuRV2hmZG+DFlwoFOXs=;
 b=Njq0q4qnVQVm5vYHQ2cuTvzf+3cp6oC6MIxHRCzuUHk+HygZcT6CWBCWW/IARx1ukAAwl2
 KCP3T/95bcrtsA8Tu8zjQmnWI+F7Uv92p/1k+V8PCCrpWBH091XslcMy/XO3rawYxZHBsN
 HtuUmYqlMVe6+D43IZnXPiGHj7OXFO4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-bq33cb3ZMr2OU3Fsx7fCIQ-1; Fri, 05 May 2023 04:22:23 -0400
X-MC-Unique: bq33cb3ZMr2OU3Fsx7fCIQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50bc1a01cffso1377874a12.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 01:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683274942; x=1685866942;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QSUdLPMHIhnIgxcZtnDpNYkVKuRV2hmZG+DFlwoFOXs=;
 b=RhdPH7D97Wbdpl340jasoHC3rpDG3httv1nOA7cSqFm0olAR9pE7iQx/D59yM6PyUL
 YTUd1EOuHCOUY5pJ/vtZ5+ZsbSGlPUOwWVWplytsWjnuc6jg1jcwKfceGop7u6qguyPx
 bvoh7cZXPDbn7ZrWyllEBwXUF7J/AOzsxutUQC/2zMUKf2RhTJ9qAmGaHKXGfiTw+CTF
 Lt6k1QGh8leiK5LQyMiwpQABHpAwu/tnGjfyzv5ziggwP512tBhAl1RYpzAyPiZzdoIM
 Tu7MG4anGpWSk13ZnplzUxuINkyX5+PRf9GMQjU6+jO1evzEmTooyMc/qJjTrrd2wVXz
 eY4A==
X-Gm-Message-State: AC+VfDxiU1SBppfdNbEdcgb1hBIOO3uG1vlYVQHq0HCGV3d7bkktZoQs
 I3tQYuUbmH8FvEpDxy5hpbrs6Od/p4C87o7kJfbyTGxuXOv8z9yzGQFPBRZCXzyu6spdqkUL/Ff
 XaioXxKhGqupW5XA=
X-Received: by 2002:aa7:d648:0:b0:50a:11ce:4d24 with SMTP id
 v8-20020aa7d648000000b0050a11ce4d24mr631022edr.15.1683274942310; 
 Fri, 05 May 2023 01:22:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Y1F+FpCQJl/Vwct3v0w/2Z0cvGxqgyvwRqK1A4Ez3dDNdk6psD9kTVm3GPrAEeGBuv6EKjw==
X-Received: by 2002:aa7:d648:0:b0:50a:11ce:4d24 with SMTP id
 v8-20020aa7d648000000b0050a11ce4d24mr631006edr.15.1683274941991; 
 Fri, 05 May 2023 01:22:21 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 r5-20020aa7d585000000b0050696c2d2f6sm2714177edq.88.2023.05.05.01.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 01:22:21 -0700 (PDT)
Message-ID: <060aee99-9b7b-ea86-cf74-8755ca416a0b@redhat.com>
Date: Fri, 5 May 2023 10:22:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] include/qemu/osdep.h: Bump _WIN32_WINNT to the Windows 8
 API
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Stefan Weil <sw@weilnetz.de>
References: <20230504081351.125140-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230504081351.125140-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/4/23 10:13, Thomas Huth wrote:
> Commit cf60ccc330 ("cutils: Introduce bundle mechanism") abandoned
> compatibility with Windows older than 8 - we should reflect this
> in our _WIN32_WINNT and set it to the value that corresponds to
> Windows 8.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/qemu/osdep.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 9eff0be95b..cc61b00ba9 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -75,7 +75,7 @@ QEMU_EXTERN_C int daemon(int, int);
>   #ifdef _WIN32
>   /* as defined in sdkddkver.h */
>   #ifndef _WIN32_WINNT
> -#define _WIN32_WINNT 0x0601 /* Windows 7 API (should be in sync with glib) */
> +#define _WIN32_WINNT 0x0602 /* Windows 8 API (should be >= the one from glib) */
>   #endif
>   /* reduces the number of implicitly included headers */
>   #ifndef WIN32_LEAN_AND_MEAN

Queued, thanks.

Paolo


