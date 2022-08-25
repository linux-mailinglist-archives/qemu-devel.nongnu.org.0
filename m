Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62DC5A1006
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:11:41 +0200 (CEST)
Received: from localhost ([::1]:48760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRBi0-0001vr-B2
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBWo-0003y1-FY
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:00:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBWk-0001AX-Nk
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661428802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lEZP0bGHjKNtSJvZZJr33i7noymHaL34KBUi0tRrrbM=;
 b=L6LC+14uhUMg93ZuO0w/21QQ4h3BxgZGNMUy/QL19yRj9G1NwQIdrlUFc53nuW/no/B4Gf
 Y44N2for+UeO57p5rXT9ruIPq15i9uph2PHbfnJ26rIqdO/+Z3E/GB5qc/J3B9C8WFoLZ1
 Ezh6Bg8vNGm4jFG4liB0UF7sACFNxYI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-7IoN6WF5Np6dJgh5qsQr1Q-1; Thu, 25 Aug 2022 08:00:00 -0400
X-MC-Unique: 7IoN6WF5Np6dJgh5qsQr1Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 c22-20020adfa316000000b0022574c2dc1aso734945wrb.2
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 05:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=lEZP0bGHjKNtSJvZZJr33i7noymHaL34KBUi0tRrrbM=;
 b=JQ2qHSVZVzDXRM1NZad/xsvgGHgrsptBebSMfSTbkSepT1Ss27LNFrnk5ItZoloeVa
 Joz+A5jcD+mRGIxhMNIzrXhBelEAB7fwYZgAxv4D/y+voXCV35oBHozbEmy4Tdox6pBw
 Xab6Oz0GGYec2kgtRH3Gbe+3ZFLzADfdviM/r01TPjopCVin4xttciWSfgBh3b9jM2qp
 eRaaBZQH5Hc6eGunZ0ltI+iEWrw3SsNkFomcBSm7kBjr1wMTK5mvK/ca/8Qfl4hRwA0Q
 LxL/7oM4dhCxMnsY8JoqYz9M56y6vO3DTVpWm0dN66RzAXxnFCnjx8zr7CG6tVouTLDX
 VfoA==
X-Gm-Message-State: ACgBeo1w/l4PnembH71kzEUx4PMNl1FG3MOnI4MuyxrhOfFaP/4YneC6
 9Kh9PorcPB7FzWiKIPaDtFY6g5TWCKby6x8R/WEdi/0PI7XbOdHft3M30neAh48WrXWuc7LtNhg
 iTbnBjOftKV3V83M=
X-Received: by 2002:a05:600c:41ca:b0:3a6:6dd2:bdac with SMTP id
 t10-20020a05600c41ca00b003a66dd2bdacmr2117784wmh.168.1661428799692; 
 Thu, 25 Aug 2022 04:59:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6hgWTYnHC2T6wOLcehyh6h1QzfC52yu6z5u3h4xC5sjfDW9fi37vPzdox5yoTQ555wG6pU6Q==
X-Received: by 2002:a05:600c:41ca:b0:3a6:6dd2:bdac with SMTP id
 t10-20020a05600c41ca00b003a66dd2bdacmr2117778wmh.168.1661428799511; 
 Thu, 25 Aug 2022 04:59:59 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 bh19-20020a05600c3d1300b003a2f6367049sm5409197wmb.48.2022.08.25.04.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 04:59:59 -0700 (PDT)
Message-ID: <03bfc24f-bf84-7c46-06f5-81730f3a4e65@redhat.com>
Date: Thu, 25 Aug 2022 13:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 26/51] tests/qtest: libqtest: Move global_qtest definition
 back to libqtest.c
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-27-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-27-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 24/08/2022 11.40, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> Commit dd2107497275 ("tests/libqtest: Use libqtest-single.h in tests that require global_qtest")
> moved global_qtest to libqtest-single.h, by declaring global_qtest
> attribute to be common and weak.
> 
> This trick unfortunately does not work on Windows, and building
> qtest test cases results in multiple definition errors of the weak
> symbol global_qtest, as Windows PE does not have the concept of
> the so-called weak symbol like ELF in the *nix world.
> 
> Let's move the definition of global_qtest back to libqtest.c.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/libqtest-single.h | 2 +-
>   tests/qtest/libqtest.c        | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/libqtest-single.h b/tests/qtest/libqtest-single.h
> index 4e7d0ae1dc..3294985d7b 100644
> --- a/tests/qtest/libqtest-single.h
> +++ b/tests/qtest/libqtest-single.h
> @@ -13,7 +13,7 @@
>   
>   #include "libqtest.h"
>   
> -QTestState *global_qtest __attribute__((common, weak));
> +extern QTestState *global_qtest;
>   
>   /**
>    * qtest_start:
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 34744ace7c..909583dad3 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -65,6 +65,8 @@ struct QTestState
>       GList *pending_events;
>   };
>   
> +QTestState *global_qtest;
> +
>   static GHookList abrt_hooks;
>   static struct sigaction sigact_old;

I'm a little bit afraid that this could cause people to abuse global_qtest 
again in code that should be usable by multiple test instances. This was 
very painful to get rid off in the past...

Could you maybe use some #ifdef WIN32 here to keep the common+weak case on 
Linux and just declare it in libqtest.c on Windows?

  Thomas


