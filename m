Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00CF5E8D3B
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 16:15:01 +0200 (CEST)
Received: from localhost ([::1]:42548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc5vo-0004LC-VV
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 10:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc5uF-0002j6-Ka
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:13:23 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:45819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc5uD-0008LA-Ts
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:13:23 -0400
Received: by mail-qv1-xf32.google.com with SMTP id mi14so1695345qvb.12
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 07:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=i9DCxgYmvFrMnc6M5feg2o8yi/L5IXyztJzrpU017po=;
 b=ur5PI/1Ec+2mwjkWteaM+90R2jeAjA+kKqJ0xEqFHcE0EZMrq28LbOCygX4yNKxRAb
 gISmSGW2/jcPOIFH+5i3tnY0WVmqTQrpOIzDNw4uihbn9hvHkWJH09KvOIu3/co57hJV
 MwEzly5EeqCjsZigLFXBk+jGRwuUne4P9vy4tC8VDkbR4fZ3N57H1kUBN7tlNXDd/XZJ
 GAzAxuL4EPbvrc6WSt/175cGEfBrpKDYC9QKTZ01TvK6c1VhspXC5a+gIpqXrWWCn0iI
 iKE3LjTE1kdThV7KELf8MAnZmLVdrprX72MUFl2EwAOismctXDpkl9Hd0zBO43cGDY97
 AhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=i9DCxgYmvFrMnc6M5feg2o8yi/L5IXyztJzrpU017po=;
 b=k0FctOq6PQm/mgxJgMYxdnbg1dgyv+sga7x6zaA3Mu3WCI+0UISw2onErFdiyhKEPv
 w1JyST0RcEdSLktjI98d1bmNupeGicUNG8otaVCX6spBJ2WCBf+KpLn9mP+/Qp1xAdLO
 epgBB/c7wNiDKF/PeWlQajty7b5kl+OfK/63ARnFsBAtkL/byQrTY4ER3tVCcQOcE7Ow
 fZKxeOycl5DxuDaZgHrVMFxY6pnWvllhD71qdgPw0DvJpderDDltQPrFl/2skHNdb8Mi
 UdaKG6M82OuZiKJ7H2PIPRMtzAwa7gEAdQCCJQuVw8gyRMQGjIlZwBAlbjCvPl25pDcb
 MhRA==
X-Gm-Message-State: ACrzQf2bTUZC2+QraGwjIqmHYk5DYnrcYS+Wwu4B2NGPceWZzIXXXaGb
 qmw84XUEWSiKrEc2z7fDCSVvHQ==
X-Google-Smtp-Source: AMsMyM6fX7Ocs/psOHMSkj1YN3oRDosUF7h4zGEcQa32Jr+AIYi0lU1NcYerqY2xbDwwC6pQY4crpQ==
X-Received: by 2002:ad4:5966:0:b0:4ad:7832:a8ec with SMTP id
 eq6-20020ad45966000000b004ad7832a8ecmr11046529qvb.82.1664028800929; 
 Sat, 24 Sep 2022 07:13:20 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:880d:1e7d:befa:a019:1dbe?
 ([2605:ef80:80b2:880d:1e7d:befa:a019:1dbe])
 by smtp.gmail.com with ESMTPSA id
 de4-20020a05620a370400b006bbb07ebd83sm8158497qkb.108.2022.09.24.07.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 07:13:20 -0700 (PDT)
Message-ID: <6b476837-fb61-6883-aeaf-d9a3c2ae5ee7@linaro.org>
Date: Sat, 24 Sep 2022 14:13:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/12] target/ppc: Move VMH[R]ADDSHS instruction to
 decodetree
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
 <20220923214754.217819-3-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923214754.217819-3-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/22 21:47, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> This patch moves VMHADDSHS and VMHRADDSHS to decodetree I couldn't find
> a satisfactory implementation with TCG inline.
> 
> vmhaddshs:
> rept    loop    master             patch
> 8       12500   0,02983400         0,02648500 (-11.2%)
> 25      4000    0,02946000         0,02518000 (-14.5%)
> 100     1000    0,03104300         0,02638000 (-15.0%)
> 500     200     0,04002000         0,03502500 (-12.5%)
> 2500    40      0,08090100         0,07562200 (-6.5%)
> 8000    12      0,19242600         0,18626800 (-3.2%)
> 
> vmhraddshs:
> rept    loop    master             patch
> 8       12500   0,03078600         0,02851000 (-7.4%)
> 25      4000    0,02793200         0,02746900 (-1.7%)
> 100     1000    0,02886000         0,02839900 (-1.6%)
> 500     200     0,03714700         0,03799200 (+2.3%)
> 2500    40      0,07948000         0,07852200 (-1.2%)
> 8000    12      0,19049800         0,18813900 (-1.2%)
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/helper.h                 | 4 ++--
>   target/ppc/insn32.decode            | 2 ++
>   target/ppc/int_helper.c             | 4 ++--
>   target/ppc/translate/vmx-impl.c.inc | 5 +++--
>   target/ppc/translate/vmx-ops.c.inc  | 1 -
>   5 files changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

