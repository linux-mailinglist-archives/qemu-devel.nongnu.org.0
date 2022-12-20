Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D6065175E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 01:51:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Qqr-0005sq-82; Mon, 19 Dec 2022 19:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Qqp-0005sP-MN
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:51:23 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Qqn-0003g2-Rw
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:51:23 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so10551894pjm.2
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 16:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mdVKW2eXkypnOYnXGykzIxtX/gCaEucfoPNkDA5+8Pw=;
 b=rcWbeOc4nVVzU/K/pfgiHlNtTR5jb61wOqPDpcpeKTUGFztGLWDe/ka5ZbiZBIsT+4
 3k4rrR9551n137RiM4osyxRlSsqdhEnBlFjRMcjT/9Y1+h3afxOklNcYsbQsWsP4IRUt
 CKwaGDgQvtiwb8/eDLETPWfkhHShGgI/G+agvJfh9OwajGpYxczFKw7vvHf1mJV6dMYX
 SiQXN3HcMK2etTAK7tK8o3CoWWoBN95Ig9aiLoBoxxKa87IUuWqZ1aLCFpl2lacCAflD
 H5tK4b9JXYydie6UbFY53lQIbXcoQTn8Ej8o8p7HR5wWvP+6SpWATzc4g3AfB2ZOtmhy
 rn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mdVKW2eXkypnOYnXGykzIxtX/gCaEucfoPNkDA5+8Pw=;
 b=AzmFUA5HG00h13HFFsi33z198Kp1LpkmviuS/ktRumHhcnCry7rcYbu0NTRGADP0G5
 3vZOqES1uZiLihBClDHNYHqwgTmSjPIIacY2wwbw5SrXGbIGybBccxPeYeKSy2xUvf5g
 UWljE3/sbUSqWK59UMb/M0y50lpqgLKpFifJ58ts5SO9VgKWJnsj9oxioPFJZNmq4e27
 TCmpcWsHtPjKf2gSfioEfA9cYHi3V5eRCaB/oflkD7Tfk2iOH17Or+Q0xuZxGu79zjbH
 rRgCgeCDzFGMMvDEuWW1HHQNWme3QZ8FH3jc3TDQdB8lIYf6sngaQRiJEpkJ4tuqkZeO
 tUtA==
X-Gm-Message-State: ANoB5plmaCiGgNFZM18f/laCPuc4XRKV7xY5sbTPuVnvqaXEAwgN0ZWc
 4DkpgyyOUkvll7gdBa28hVq2Zw==
X-Google-Smtp-Source: AA0mqf4TOj9nsi4JyL/MFfWH9Yk50zAMctGEvkdy4kacK5Bhj6LRboBPaxjI8/LFR9wtgNrNDoCM8w==
X-Received: by 2002:a17:903:24b:b0:189:62fd:140e with SMTP id
 j11-20020a170903024b00b0018962fd140emr49176107plh.29.1671497479460; 
 Mon, 19 Dec 2022 16:51:19 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a170903124500b00186ae20e8dcsm7782501plh.271.2022.12.19.16.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 16:51:18 -0800 (PST)
Message-ID: <c1842e72-b680-6eed-a132-cee796c1e7df@linaro.org>
Date: Mon, 19 Dec 2022 16:51:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 3/7] hw/mips/gt64xxx_pci: Manage endian bits with
 the RegisterField API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20221209151533.69516-1-philmd@linaro.org>
 <20221209151533.69516-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221209151533.69516-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/9/22 07:15, Philippe Mathieu-Daudé wrote:
>       /* CPU Configuration */
> -#if TARGET_BIG_ENDIAN
>       s->regs[GT_CPU]           = 0x00000000;
> -#else
> -    s->regs[GT_CPU]           = 0x00001000;
> -#endif
> +    s->regs[GT_CPU] = FIELD_DP32(s->regs[GT_CPU], GT_CPU, Endianess, cpu_le);

Missing set to zero before deposit.
Though I wonder if

     = cpu_le ? R_GT_CPU_Endianness_MASK : 0

might be easier?

> -#if TARGET_BIG_ENDIAN
>       s->regs[GT_PCI0_CMD]      = 0x00000000;
> -#else
> -    s->regs[GT_PCI0_CMD]      = 0x00010001;
> -#endif
> +    s->regs[GT_PCI0_CMD] = FIELD_DP32(s->regs[GT_PCI0_CMD],
> +                                              GT_PCI0_CMD, MByteSwap, cpu_le);
> +    s->regs[GT_PCI0_CMD] = FIELD_DP32(s->regs[GT_PCI0_CMD],
> +                                              GT_PCI0_CMD, SByteSwap, cpu_le);

This one at least has the zero, but it might as well use the masks like above.

> -#if TARGET_BIG_ENDIAN
>       s->regs[GT_PCI1_CMD]      = 0x00000000;
> -#else
> -    s->regs[GT_PCI1_CMD]      = 0x00010001;
> -#endif
> +    s->regs[GT_PCI1_CMD] = FIELD_DP32(s->regs[GT_PCI1_CMD],
> +                                              GT_PCI1_CMD, MByteSwap, cpu_le);
> +    s->regs[GT_PCI1_CMD] = FIELD_DP32(s->regs[GT_PCI1_CMD],
> +                                              GT_PCI1_CMD, SByteSwap, cpu_le);

Likewise.

r~


