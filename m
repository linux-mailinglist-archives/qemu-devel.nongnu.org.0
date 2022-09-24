Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155C5E8D39
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 16:13:39 +0200 (CEST)
Received: from localhost ([::1]:54876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc5uU-0002mX-4W
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 10:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc5rt-0001Ci-2I
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:10:58 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:37737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc5rq-00087V-Tf
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:10:56 -0400
Received: by mail-qt1-x829.google.com with SMTP id j10so1685027qtv.4
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 07:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=zW9qkHoq+NRwUygyy0sniiSLWznpixkjX5LZFUdAvIs=;
 b=KQ+ZKRr2HQFCtZRTPVjYAd5oJS5ObKP75Ku2zMFg35hPlSJI8ly2YEa2P08Y3ZoICH
 Ky6orklA/CnVEsv5+4F2TPH84SrxVe5+h8ldW6gGR/gaUixudCKMEbNobQkHV5css9Ip
 LAITcZGEvjOf/2rVNkn6yCFUM21fXSsqjEsUnsSY9mq+foEW0IbSRLmEKsovfWT+YdU6
 BFc7DCXxHmAUZaRDKarJQ6VZuLxzdDb0By+xEqGrKwICbjIe5nEUUWrjxKAaohrHqRm4
 FCo/slQzGQ+IkK1y3FlQMgBc6Q5skX512BpqJxVK+6rmoDJbLhzKpYSP5gNutcoW7AUz
 AhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zW9qkHoq+NRwUygyy0sniiSLWznpixkjX5LZFUdAvIs=;
 b=RN8er+7+7pbvtXp/hOTnWiRRlZscf3NIzvz9Im0RdOHTTcqdZ+CQjwp+Rh4bv8Yvn2
 J0zMCzn/pFPm2v/h02g0wpfuN5UhFHVhby2UC4ihW3GOgHQgdRRUeZgusMMDqxzcw8GM
 +UqdEdB52J0ELt4ECcP32Yr6u74L5/IsHDsqVkju68HCHr/AfwAHKg+0KTaujrA6igVE
 iOGxu4LbFZLy4DOPpmeIt4Lw/V/yrP5Gy3TFxRd14nt+i8Do1y1cj9qbraiNwi+/hlYs
 gSPX6/6SyCW/TKNgAYQBDNrlTim6no+p2k2IDywZv4Rz+r0sMg9577rorRS1KiEiMXZx
 YR+Q==
X-Gm-Message-State: ACrzQf3ubgxFxRAkmknm33U/8yk/VsgL9wX09Pqp5QuJtmuEIRqS0xxz
 PMTMT2wm/mHBkp3MANxl2ZqULQ==
X-Google-Smtp-Source: AMsMyM67EOcF3SGbBjnn5cH5TEmaZDPuF/mAO6Nd8JpgOeW3QeUOWmZ1iTAFkvPtEab378Rg1mBnxQ==
X-Received: by 2002:a05:622a:1652:b0:35b:a2dd:f0ad with SMTP id
 y18-20020a05622a165200b0035ba2ddf0admr11480381qtj.302.1664028649558; 
 Sat, 24 Sep 2022 07:10:49 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:880d:1e7d:befa:a019:1dbe?
 ([2605:ef80:80b2:880d:1e7d:befa:a019:1dbe])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a05620a414c00b006ce1bfbd603sm2489946qko.124.2022.09.24.07.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 07:10:48 -0700 (PDT)
Message-ID: <6c86d225-29a9-a9bf-dbe2-c1e5164be3cb@linaro.org>
Date: Sat, 24 Sep 2022 14:10:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/12] target/ppc: Moved VMLADDUHM to decodetree and use
 gvec
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
 <20220923214754.217819-2-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923214754.217819-2-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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
> This patch moves VMLADDUHM to decodetree a creates a gvec implementation
> using mul_vec and add_vec.
> 
> rept    loop    master             patch
> 8       12500   0,01810500         0,00903100 (-50.1%)
> 25      4000    0,01739400         0,00747700 (-57.0%)
> 100     1000    0,01843600         0,00901400 (-51.1%)
> 500     200     0,02574600         0,01971000 (-23.4%)
> 2500    40      0,05921600         0,07121800 (+20.3%)
> 8000    12      0,15326700         0,21725200 (+41.7%)
> 
> The significant difference in performance when REPT is low and LOOP is
> high I think is due to the fact that the new implementation has a higher
> translation time, as when using a helper only 5 TCGop are used but with
> the patch a total of 10 TCGop are needed (Power lacks a direct mul_vec
> equivalent so this instruction is implemented with the help of 5 others,
> vmuleu, vmulou, vmrgh, vmrgl and vpkum).
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  2 +-
>   target/ppc/insn32.decode            |  2 ++
>   target/ppc/int_helper.c             |  3 +-
>   target/ppc/translate.c              |  1 -
>   target/ppc/translate/vmx-impl.c.inc | 48 ++++++++++++++++++-----------
>   5 files changed, 35 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

