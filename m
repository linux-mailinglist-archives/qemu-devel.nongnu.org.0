Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F084CE04F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 23:41:57 +0100 (CET)
Received: from localhost ([::1]:36450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQGcW-00070o-EW
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 17:41:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGYj-0001OP-2j
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:38:05 -0500
Received: from [2607:f8b0:4864:20::102e] (port=54948
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGYh-00085e-M3
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:38:00 -0500
Received: by mail-pj1-x102e.google.com with SMTP id b8so8457991pjb.4
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 14:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3Cxy8ur3lmOu7geyT/aw4GlTSK+z28m6hmNhPVp4hWc=;
 b=bsL+ySLkcQZ3fcoml/Adoozf4WrqSeiLYlksA3s6zXPSJNmbdZD75Vq095peTW/hSk
 /qrlDBBDl4Yc9lyTjtbFKae1wqqanv6Z0utSWNuL9GRFir7CHJav2pZoHu5K751nrjbn
 ANPJkv7G7cFZg3+PHoSmqiQ1mSspV28Uu1x+hdDwqjQWNpgzocNiM9xzvzs3r/7pwr9s
 p9gUnXC9wHadqyODoCRClcs4AQkVG0Rx9lcQ3tNUTDHtsVeyVvDhYYsdClZsgUFEPJcW
 BZz2eM3TOYKjaGYn0xLALo9bDkTvxV4MAEOXUjQY3QdxqM7Z/aLhH4nwN8L2EF3icbry
 mHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3Cxy8ur3lmOu7geyT/aw4GlTSK+z28m6hmNhPVp4hWc=;
 b=bb+b/VE0iLHGBj4xD3sGUH6Y562guefe7cEtYSwe+l+HY3VZCkilLRdbxLNO1jlD+W
 6Juc8ZlA01xQJ1YJXiwjtao5yAoiZ54iY7uAyqzilcUonbTFi4ccn79p08JUdFO2K3Xy
 nXeLBMzHGuFAe+DHE7JQAUPlFHSJZWo1d3CsttknU7ds/ONyUAv3DCOxu0v0oN19fqU6
 kEFizdf4xsHzxFeJz1BFjghUYJ+cQLfJRVPBVxA+baCauONd/3njJQwwEYnUXpX84/Nr
 Q6PytikgX3OjVh+BaZ3cDJVIyM94YkmRc0FCukp1a7hiTGnx3l5tRob8IqWGWg/Gey89
 JdsA==
X-Gm-Message-State: AOAM531z6yk4COK5yZXotOW5jFXWMZFoMfGlVMYZYThQ8xtVjUUAfJwA
 gFJWr9Vza/pE0N1p6Oerc1r8bA==
X-Google-Smtp-Source: ABdhPJzPrraB6/rFTviF0NAUt27IWuOAesLuekyrrEQMvYqmrIi44FxgcZNi3xWwHyLWycJM9gGzkA==
X-Received: by 2002:a17:90a:67c3:b0:1bc:9cdf:1ee9 with SMTP id
 g3-20020a17090a67c300b001bc9cdf1ee9mr809861pjm.203.1646433468795; 
 Fri, 04 Mar 2022 14:37:48 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 pc3-20020a17090b3b8300b001bf08e36972sm6400039pjb.40.2022.03.04.14.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 14:37:48 -0800 (PST)
Message-ID: <60322120-5cca-7ada-8ab0-3830f7a9daf8@linaro.org>
Date: Fri, 4 Mar 2022 12:37:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/7] target/ppc: use andc in vrlqmi
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
 <20220304175156.2012315-5-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220304175156.2012315-5-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 07:51, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Fixes: 7e5947df6e94 ("target/ppc: implement vrlqmi")
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/translate/vmx-impl.c.inc | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

