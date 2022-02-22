Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A684C058D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 00:50:20 +0100 (CET)
Received: from localhost ([::1]:40986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMevD-0007PE-Qm
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 18:50:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMetG-0006WC-R7
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 18:48:18 -0500
Received: from [2607:f8b0:4864:20::1032] (port=43886
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMetE-0004sN-0W
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 18:48:18 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 iq13-20020a17090afb4d00b001bc4437df2cso1093300pjb.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 15:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mXZ02MqhMAWk1cJgZJJPbeVj9Wi7KteYziG185g8Tzc=;
 b=AGdQ/3/289VIBq5pIGZ9aSNHD0+AJS/gJji0EjHtAnIh72TE+GrKIwiYQFPJFBCBog
 GMQ8Bic2Mh/xQ/5PSOqdP3onfK914NBg+E2DuOknp2mVmJtRvrgrEZC05Tb9gg7c0IM0
 MuhhY6n5pgk4HKpuvu5GTjk9fXFk3Tp/hiuZMqczKEm+hH58ajENtusriIwS4KWg3inX
 NWzsIYdjcaLvy1b83YSKNSVtqhdMBVZJ/0FeNZ8etSpArJF5zFmSR6eBezkVVcTOXBTt
 O49m8rz4p264uk7THtPBTtTDnv2MiRjndrmxYvaRjn50DuEIAs+uCPq8HsC8KjMRe94E
 eUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mXZ02MqhMAWk1cJgZJJPbeVj9Wi7KteYziG185g8Tzc=;
 b=IT3LmZ1iiyvg/VhT1M+1XKuN1GaqK1JHWc0w93WIGOVq9ZGZeGmiIL2GuyK67nI/ug
 RhV7azFGZ06m/5OcR5QRI8xknN6T/q4Jaiu6LNOIsMUW5EF/cOybi0Z16g0Cv+hagbj2
 13muHUHoipxc2IOkuvYNjRc2b51QfyoNFk28KSF3K4Kmw3VJTMOyum96ABGsHqRrzFz2
 saCghYF0Wh3OcZcaefrsq8jWRsEuLaUBxn5Tk/PEdZ9VDTilVxbfIuRgX1BmgXzuZlxq
 M1Tjac6EL546HP2qSVK1+xiU8bB8tA3xw3E4VmXqCg5ObpBBSkkWmEex8SpaYR0aoQOf
 brDA==
X-Gm-Message-State: AOAM531Wg2EQDzzOp9ed33DRaThXHGfJef84i56WJ5g7KnHaWnNdS7nx
 f1Gtp3T8YAZ0VMIYTIf9Z4uV1w==
X-Google-Smtp-Source: ABdhPJySI4PW+o/5OWdcMmbyeWZySRwNPvDxT85Yfgl0OqjWKPzL6qeBwfSK/N2AmonZcrdnpksrtQ==
X-Received: by 2002:a17:90b:228a:b0:1bc:7ca4:efaf with SMTP id
 kx10-20020a17090b228a00b001bc7ca4efafmr4271806pjb.245.1645573694771; 
 Tue, 22 Feb 2022 15:48:14 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f7sm14635768pfv.93.2022.02.22.15.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 15:48:14 -0800 (PST)
Message-ID: <ab9f3513-a9ff-110d-44d9-4989276c4661@linaro.org>
Date: Tue, 22 Feb 2022 13:48:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 33/47] target/ppc: Implement xxgenpcv[bhwd]m instruction
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-34-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-34-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> +#define XXGENPCV(NAME, SZ) \
> +void helper_##NAME(ppc_vsr_t *t, ppc_vsr_t *b, target_ulong imm)            \
> +{                                                                           \
> +    ppc_vsr_t tmp = { .u64 = { 0, 0 } };                                    \
> +                                                                            \
> +    switch (imm) {                                                          \

You should split the helper and not pass down imm.


r~

