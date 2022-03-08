Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9F24D1FFB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:19:29 +0100 (CET)
Received: from localhost ([::1]:58308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReQi-0002eX-60
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:19:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nReGz-0001H2-0j
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:09:25 -0500
Received: from [2607:f8b0:4864:20::1036] (port=38621
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nReGx-0000wq-Gh
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:09:24 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so2897657pjb.3
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=y8plbK6rr5KyontNYkZrXSn3OOhHdMaxNicELFm5fVE=;
 b=I2ZQOWm7n7iMCMwwTRL41s8wfMsFr8kJ2WfhPo1Dh/XxrgloaWlfSWYZQZ2+NKbNrt
 f3NVgVj2bKEJhx0lgskKvQsaHyl7YT2TkI/7KbJHzzAsQaKbcpU0yNpyhbVfA6nfiouI
 uPE1gha0KxYbMhqlHD5yDUSXcPIzNgUn6/f7eYxkLIlBsCA4Lx8GJ8nlY5PV67JLlw2F
 LaykA/o2ENDHRHMsUIPTDy384+4a0Q79HNBKpL4Ak52k08SIvT5EjSgRSJGaCjm1P+0l
 8bcVaP6cN85Z23/T0B5mBCxUxKMFLiwP0bur6SRDZuaKYlh7Uy992rweyV2xvFrgwSRj
 A3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y8plbK6rr5KyontNYkZrXSn3OOhHdMaxNicELFm5fVE=;
 b=j69BLWeshEGhrrNjNky+YxoGiMJGF5SUqmiSVZlMduvfHHoi3E7JOFPI6wed79qAOd
 SBXmq/L+BU+EDnqL+IBorycdpT0241psy8fgrnmOWuxy33+cH8sLswIabW3AlNKYeRXL
 aOKFT24x9oB4bqXe+Ew9CPrHNUTY0+7OQd9/OIX0Id+xUb00Phok8BbzS2DeHEXeEkbM
 iAfLnpiO7LXIIOwqMG3cdiXVnAnnQy9ce4qiLRNv7QMI/bVFhMk0zwjCUUHbwinqYdLB
 BWVAZ4aYI2cGSNpj8X7wVKp5RENosxAVJ54Lb0BajiWQ+Fz1hewNiY4eplqOEEs4qDD8
 AheA==
X-Gm-Message-State: AOAM530x264Jz2+MKJRZokv0CZRuJMOBRMJyyG3seoPq7UTnGVmc/vXq
 ZA6UeY8qmT0tlzTRHdpBxlkrEA==
X-Google-Smtp-Source: ABdhPJwVJl9X4bzBAqjGiHbpIiSZnjpJtSx/TKhsp+b+H86CDMB82GmYdPy4d5VsScnryAvz/ImWug==
X-Received: by 2002:a17:902:e852:b0:151:f805:30fc with SMTP id
 t18-20020a170902e85200b00151f80530fcmr7614498plg.87.1646762961787; 
 Tue, 08 Mar 2022 10:09:21 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm20836524pfu.62.2022.03.08.10.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 10:09:21 -0800 (PST)
Message-ID: <989b2620-cfcc-52ca-d04c-200f66115e03@linaro.org>
Date: Tue, 8 Mar 2022 08:09:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/13] hw/mips/gt64xxx_pci: Fix PCI IRQ levels to be
 preserved during migration
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Bernhard Beschow <shentey@gmail.com>,
 qemu-devel@nongnu.org
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
 <20220307134353.1950-2-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220307134353.1950-2-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 03:43, Philippe Mathieu-Daudé wrote:
> From: Bernhard Beschow<shentey@gmail.com>
> 
> Based on commit e735b55a8c11dd455e31ccd4420e6c9485191d0c:
> 
>    piix_pci: eliminate PIIX3State::pci_irq_levels
> 
>    PIIX3State::pci_irq_levels are redundant which is already tracked by
>    PCIBus layer. So eliminate them.
> 
> The IRQ levels in the PCIBus layer are already preserved during
> migration. By reusing them and rather than having a redundant implementation
> the bug is avoided in the first place.
> 
> Suggested-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Bernhard Beschow<shentey@gmail.com>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> Message-Id:<20220217101924.15347-2-shentey@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/mips/gt64xxx_pci.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

