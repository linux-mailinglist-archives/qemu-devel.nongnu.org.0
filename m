Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5E247C9C0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 00:34:02 +0100 (CET)
Received: from localhost ([::1]:45278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzods-0003ZQ-Vu
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 18:34:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzocF-0002f8-EC
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:32:19 -0500
Received: from [2607:f8b0:4864:20::1032] (port=34765
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzocD-0000SH-VZ
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:32:19 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 v13-20020a17090a088d00b001b0e3a74cf7so2941552pjc.1
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 15:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BR9cabiHfhbudbBMF+UJEMKA9VAb5ZFN5i1/rNj0Dv0=;
 b=ieG4eRy0XltpnV7uaqm7MnY1YJo2KYdgPFveSebAl8EeuFNnc8LzdRPoK01bQKwy/D
 FhIiCAwfztjTTAZn194P/OmBYeaRn/PcWAU5WcVdmZ3dE3ewFYTFrG/fVNqZTaRJKmGa
 KiVx3kqkmV0wwVYwKu9nvhCynckpzn/Cp81vMbcQ2G0VlX52Zesguxtgymtz+c8cBuZZ
 amo1AjSP+4zK2kkIjR4vfTYo5Y1++2HPva1gO1lQe1xs7MzowJVamENuUBmEtYOOz1ca
 flZYsIgYwWvqTiVxpWvxmAaGHNGb5ds8APfyCOT1Q6OJYChQ+KwWr1P/o16fJJHj6/+B
 k2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BR9cabiHfhbudbBMF+UJEMKA9VAb5ZFN5i1/rNj0Dv0=;
 b=OnZeeghmEgwP1TesMPqd39/3YMxW54qNY6VhCqgB9oMapXNixBJFOM/YXt+TvQ8coP
 DTbyLvmNWKQPusSmIZ+ve5nCYRjXkGTRsIIp0YN5mxOz+MVuXcOoAbinOy7j0L1kE1yK
 k3mr3vT5nW/n2ZSH+l20GcpnOsVTLDSUYo8M1YTZJyvMV5TK278ERlywuh0oJJnGMwPq
 nkEl+kgIw7I1AIcdExFAGgqEy3kudPq9oZ9q9r1QWxrP9l3bm+sDNQE1rhE0HAYd4i9S
 HCCd88qzo26K27yrYkEk4av2tw3I+waKSrQ5yfpNcfqS8fP1v7fbvMoW5UQszQySpHy3
 6hdg==
X-Gm-Message-State: AOAM532lOknJkYYx+3a2VDEvTAZqp2PH3C0bT/ZAZW/7QfrHARP+c+7C
 2OMtsGnxLpRSq9Vr0mHj3O7MDQ==
X-Google-Smtp-Source: ABdhPJwCNg6dzjlSXRu7c7tCDX/cLN4BmysEsjGf4VBBgAf0dhXN7mexcSZfLO8BHR+YyvTEk7Dbjw==
X-Received: by 2002:a17:90a:4607:: with SMTP id
 w7mr543835pjg.131.1640129536582; 
 Tue, 21 Dec 2021 15:32:16 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id r13sm155335pga.29.2021.12.21.15.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 15:32:16 -0800 (PST)
Subject: Re: [RFC v2 01/12] target/ppc: powerpc_excp: Set alternate SRRs
 directly
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
 <20211220181903.3456898-2-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3447057-2030-a0a7-fe4f-2f41f0e32d93@linaro.org>
Date: Tue, 21 Dec 2021 15:32:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211220181903.3456898-2-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 10:18 AM, Fabiano Rosas wrote:
> There are currently only two interrupts that use alternate SRRs, so
> let them write to them directly during the setup code.
> 
> No functional change intented.
> 
> Signed-off-by: Fabiano Rosas<farosas@linux.ibm.com>
> ---
>   target/ppc/excp_helper.c | 23 ++++++++---------------
>   1 file changed, 8 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

