Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F21658B0E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:33:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pApAW-0005sn-PA; Thu, 29 Dec 2022 04:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApAM-0005ou-Jk
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:25:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApAK-0003JY-1T
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:25:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672305931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LS9SnCsnYiUXhdkQYS57KQRxVNV/woDwjmkD+43TfhU=;
 b=TMOTJAu6KuHFyCT9P38rhBBnokdhTGp9Zx2baeKaq9SwE0YxBDKI7yazRHd0SHM5I1ZtMd
 jLiemvADiNkApJtcYwryyHy8ptteJXWaSLtGv3ia+9MnXNPviPY3fGciV+qXvD46tqWqro
 pHyEZ8/4QczGJRHY1n+gh5RROXD0188=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-136-khiRAwUMPOCgS3sJtLT1wA-1; Thu, 29 Dec 2022 04:25:26 -0500
X-MC-Unique: khiRAwUMPOCgS3sJtLT1wA-1
Received: by mail-wr1-f71.google.com with SMTP id
 k11-20020adfb34b000000b0027811695ca6so1193488wrd.16
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 01:25:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LS9SnCsnYiUXhdkQYS57KQRxVNV/woDwjmkD+43TfhU=;
 b=wMpSRc+RAArmVH+ENf+dpFE70kfnY5nc1pCh4Xt3+kRTTexwLiwy5MvIZdMKcPm5s2
 gwIhnHtF2uBohxzWbijoFBMNF67LrKyRvTENeoQyiA3qAsy4W70gGDwbUIhDo76+yRNn
 qhpv8All31IyLZkiRiD7qJME6C5+JKxv43MnI2uf1rgNckOTEMpyMn5TytSSA8IH3Y0N
 t2ZmxDAvkzGS35Uqq9MyrxpN4BxQK2KCU6O+sgdDbfq7tqRH8lupTd9A+5HFdWPShch/
 3lk6oa42IfBcs+xHx/MJCH2sGIaCITiH8D15Mo3/3UyYfJHMckm9X1IJRI/UX1hyP5/8
 zvAg==
X-Gm-Message-State: AFqh2kpgej8VaZ/GtwB1r0SBRl9yPppyrQvyRMCXyTu0QdYfvHKUcHgK
 +zfcXYlSQ46z+SPN0AIFfzK5wM6VPsyilYGXd6usk7QbatKyluF7Z3iX5wXP3ZcBjLhYM4Eakez
 L905kRNyYcAYpoeo=
X-Received: by 2002:a05:600c:5114:b0:3d2:5e4e:6fa with SMTP id
 o20-20020a05600c511400b003d25e4e06famr20353913wms.34.1672305925715; 
 Thu, 29 Dec 2022 01:25:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtmqEq7FHE/FGGBfken7qigBSrBx62PxZdPBQ34GtbxkU+MeAsuWr8UUQPrnB1mYh2FkrZGFg==
X-Received: by 2002:a05:600c:5114:b0:3d2:5e4e:6fa with SMTP id
 o20-20020a05600c511400b003d25e4e06famr20353905wms.34.1672305925497; 
 Thu, 29 Dec 2022 01:25:25 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 fc7-20020a05600c524700b003a3442f1229sm32208651wmb.29.2022.12.29.01.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 01:25:24 -0800 (PST)
Message-ID: <1a5769c9-e713-b238-4378-6224969f959f@redhat.com>
Date: Thu, 29 Dec 2022 10:25:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 4/5] target/s390x/tcg/misc_helper: Remove unused
 "memory.h" include
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221217152454.96388-1-philmd@linaro.org>
 <20221217152454.96388-5-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221217152454.96388-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/12/2022 16.24, Philippe Mathieu-Daudé wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/s390x/tcg/misc_helper.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
> index 71388a7119..576157b1f3 100644
> --- a/target/s390x/tcg/misc_helper.c
> +++ b/target/s390x/tcg/misc_helper.c
> @@ -23,7 +23,6 @@
>   #include "qemu/main-loop.h"
>   #include "cpu.h"
>   #include "s390x-internal.h"
> -#include "exec/memory.h"
>   #include "qemu/host-utils.h"
>   #include "exec/helper-proto.h"
>   #include "qemu/timer.h"

Reviewed-by: Thomas Huth <thuth@redhat.com>


