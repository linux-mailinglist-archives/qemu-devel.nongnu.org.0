Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAC55E8D4C
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 16:24:37 +0200 (CEST)
Received: from localhost ([::1]:53642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc656-0004MR-AU
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 10:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc60G-00063Z-FN
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:19:37 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:43590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc60B-0000fE-Ar
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:19:36 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id s13so1714584qvq.10
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 07:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ofHQdSTr4wKzMpzm+Y9fjbEibmEKpfXKPiC78fq+n3s=;
 b=P797J4Oti2uikbLOxoJ1u6WNaMHyA+I5xon+/aL3kPj2+xwLKsnNZJJrMelntSQaBv
 CQlKbEmfrZzcrUdcpyPvjNPhDMjIbroSFG0UMot9VzP5IXZq9T3qoGedeDzkQc9hmeKk
 lJjeN7SQzDh11xnGGZQSo3JpB9LugXSrnV2wiHo2cduTqa5zWG3EnX/wCGpvbejW3D+Y
 FCnZ4y++hZ2Qp8VIc92MrGfnKBEDMJrR6rJVItpT2A8ji6llsE9XmAH9i03d/K5TMQ63
 XI6CqMcHmuyHkxLQtiJVhYHVFT2O4aFuCN+y0QwANMXm4wurC/xN1WModZR1aa9xGvsI
 0qDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ofHQdSTr4wKzMpzm+Y9fjbEibmEKpfXKPiC78fq+n3s=;
 b=DOfmp+Z5PkkTlqdqGZwAKEyBFQ3K38AIW64tG2w3TN4HFxbcm+5xsI3/zTbE4f2/a4
 JRerIOy6mBq5T1NxJFUYtMydKykbbvNvqIkxClGOM+xa7oCtZa15KGRjePZtHp7Hc3Fj
 wKpqy6tnLnoUXU/jJPGQVlCgBAueBh4GnUM+bHankfiXiw1AnnZHmhWCmA4nS7ATaKuF
 F6U6NsxW1BK6V0KMZcqSC7988qalIueWGE9HIV1LsWAQwCyVQU2J5ex9fnENfIHfcpXJ
 tq0tuza3qNVh72tvlcah1WeofM/0jGLKznONT0NG7cO/j48W2aMkGkHzlFlVoh0JU7/V
 AVMw==
X-Gm-Message-State: ACrzQf2GTWAzLxLMjYUXUUNK2jMdgfBqj1qTqL2jq68B6Z7u7fyckLsf
 5VcLS34VmxG+9x9RhrtDRjKrew==
X-Google-Smtp-Source: AMsMyM4Bd6T1Y9BI0tCFhfkQXyBuLoArAFa9OorX24qu7FIftzC5nT1Z0yLeS4YE2EfZ53FJelsF5Q==
X-Received: by 2002:ad4:5282:0:b0:4a9:b75a:e33a with SMTP id
 v2-20020ad45282000000b004a9b75ae33amr10874048qvr.67.1664029170512; 
 Sat, 24 Sep 2022 07:19:30 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:880d:1e7d:befa:a019:1dbe?
 ([2605:ef80:80b2:880d:1e7d:befa:a019:1dbe])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05620a254500b006b98315c6fbsm8562261qko.1.2022.09.24.07.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 07:19:30 -0700 (PDT)
Message-ID: <74f66aa7-6eba-0458-0127-c12b6abae733@linaro.org>
Date: Sat, 24 Sep 2022 14:19:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/12] target/ppc: Move VNEG[WD] to decodtree and use gvec
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
 <20220923214754.217819-5-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923214754.217819-5-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
> Moved the instructions VNEGW and VNEGD to decodetree and used gvec to
> decode it.
> 
> vnegw:
> rept    loop    master             patch
> 8       12500   0,01053200         0,00548400 (-47.9%)
> 25      4000    0,01030500         0,00390000 (-62.2%)
> 100     1000    0,01096300         0,00395400 (-63.9%)
> 500     200     0,01472000         0,00712300 (-51.6%)
> 2500    40      0,03809000         0,02147700 (-43.6%)
> 8000    12      0,09957100         0,06202100 (-37.7%)
> 
> vnegd:
> rept    loop    master             patch
> 8       12500   0,00594600         0,00543800 (-8.5%)
> 25      4000    0,00575200         0,00396400 (-31.1%)
> 100     1000    0,00676100         0,00394800 (-41.6%)
> 500     200     0,01149300         0,00709400 (-38.3%)
> 2500    40      0,03441500         0,02169600 (-37.0%)
> 8000    12      0,09516900         0,06337000 (-33.4%)
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  2 --
>   target/ppc/insn32.decode            |  3 +++
>   target/ppc/int_helper.c             | 12 ------------
>   target/ppc/translate/vmx-impl.c.inc | 15 +++++++++++++--
>   target/ppc/translate/vmx-ops.c.inc  |  2 --
>   5 files changed, 16 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

