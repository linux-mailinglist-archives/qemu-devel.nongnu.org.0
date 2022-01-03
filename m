Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7573E483853
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 22:27:39 +0100 (CET)
Received: from localhost ([::1]:43506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Uri-0004ar-KP
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 16:27:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4Uqk-0003fE-JK
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 16:26:38 -0500
Received: from [2607:f8b0:4864:20::533] (port=40885
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4Uqj-0005a2-27
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 16:26:38 -0500
Received: by mail-pg1-x533.google.com with SMTP id l10so30995840pgm.7
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 13:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cnKm2WktUIAzquhV8+4+XDwjYyys4nwvHD1CfdvM5+k=;
 b=c9LHkOk/pIuP8OxsRxj9CUU30SK2FqTFIS0CB7vxk8nNNArQtALUqjPUw/aU0Q6KcR
 PZ/pPQoJ7lrsnjtRdc+WD91681F3zrMFVCEw8DhGHz6q2C5byXo9diFQxcopUVkpGlRI
 MiK/rzr33+MQpwD1s9MXBGggfeQMLxMmbFy0VByRwyNi4alZYErnbEMJsCALsnBNoPPA
 WgJmvtNu5IuTNUJpjfSn2yKpdzc09Enl+Cr4sRjzSLudUYnS9uHzZzh+xDovEJ2H639V
 pmVXUwiZbZz5Sloclm/rMqsbMksLV/C6darjgtJmcHmn4FI6Z17WPJzFwnRjzCa2pOm6
 ZwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cnKm2WktUIAzquhV8+4+XDwjYyys4nwvHD1CfdvM5+k=;
 b=h2q0yclM2SvDQumVZ1d0eDNvf1EbpKdkDpvtO4EEfZYXbfMUgytlkmkg07gsIN4iUO
 nZoSV1pgI7tGCIuqKZFkL9XhBqn5oycRMQ3tQ/QIoWTGgO4kB0ZK5dR4TuzpCY+a7FYg
 WqMJvC9unQPRu43JJu01X8JFBj9l5uXv27GZOwGQ/rYtkoxSHLCOe+tJeJihVq8w/jz8
 yodutvUO34JmqT+SZ3dpd7G6mfN1jXxfYP/egx3/I+9GakH6eKDNxSBJsbjgaqqwIucq
 AAEwKCNFP7zX2+EXR4ePnYtxbkmtZAoRAbsXLJa6BSYwvSwa3mmLSAL9GKIapQXje6lM
 fcWw==
X-Gm-Message-State: AOAM532OlBBdb/ApjRsOlE/QcqFwrd44miFZQ+2za6RUh5vRZX1Qy7v9
 X2TP71/EqA+EpvX1GOY2RB6icg==
X-Google-Smtp-Source: ABdhPJxxTUXIAqCXBg6ulP5N61CvdxEmT9aSBHDYoMVqpCnOMTvIOf43Iura47YRBvv8wiyDTXD5NQ==
X-Received: by 2002:aa7:9298:0:b0:4ba:7d3a:1742 with SMTP id
 j24-20020aa79298000000b004ba7d3a1742mr47663552pfa.62.1641245194860; 
 Mon, 03 Jan 2022 13:26:34 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id a3sm41319337pfv.47.2022.01.03.13.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 13:26:34 -0800 (PST)
Subject: Re: [PATCH v2 1/5] target/ppc: Cache per-pmc insn and cycle count
 settings
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220103185332.117878-1-danielhb413@gmail.com>
 <20220103185332.117878-2-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <63cf873f-6fc2-62a2-071e-dabfb30994e9@linaro.org>
Date: Mon, 3 Jan 2022 13:26:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220103185332.117878-2-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/22 10:53 AM, Daniel Henrique Barboza wrote:
> +    /* Composite status for PMC[1-5] enabled and counting insns or cycles. */
> +    uint8_t pmc_ins_cnt;
> +    uint8_t pmc_cyc_cnt;

I should have updated the comment to 1-6 when I added cyc_cnt.

> +        sel = extract64(mmcr1, MMCR1_PMC4EVT_EXTR, MMCR1_EVT_SIZE);
> +        ins_cnt |= ((sel == 0xfa) || (sel == 0x2)) << 4;

Ah, thanks for fixing my typo.


r~

