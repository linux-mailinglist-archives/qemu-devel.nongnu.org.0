Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C96A3497A4
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:11:26 +0100 (CET)
Received: from localhost ([::1]:44114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPTW1-0008Ez-4R
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPTMW-0001YJ-Ab
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:01:41 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:40586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPTMR-0003PV-R4
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:01:33 -0400
Received: by mail-oi1-x235.google.com with SMTP id i3so2808093oik.7
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 10:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pagxWLYGykzjlVdAleVSn9XBHMoNKN+23sfF5pH0hDQ=;
 b=N8032MS5j+ktQJWp+F0szS9Jt5+daM8Bzx0MaIq2JbllhpOC0grPtcxFqMrQuVKO3Z
 JXOiIC1HBgzDlly7maUkPFOlEktBRk4W5hb0aDu9joem5ROXNYdB0BpAKnvS2ulHL5GA
 FLmm8isiiiHms969UbJ5rMggKaJe+u8H9SVcE0c/ApJtiZ4RIHJ4GrRzHgpxau/YAwvV
 rzavlmM+Ktc1WNDDoa5Ua7q8LZNNyv79IHr5oXO6Gx3uczYy5WEps+jr9XibH+H8TC6g
 pnmBi69RLDlMHu+F1FEcjIIEIiRRhFQ7ClWZkKO+HYxOvOBIxNMeQWq8xOAS1ApzTLaQ
 bISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pagxWLYGykzjlVdAleVSn9XBHMoNKN+23sfF5pH0hDQ=;
 b=H8NwvX6iguo3kuaxsFMvM/meZoDxnNuBaBRFjF1Uc7wJqEaHDP25i7jj1CwYwtT/WP
 CLDcamtQ0/NnnBCGGHPOIsah3t/RoCYorVewy9VCEqqBEYIDW4IPiDJTIKtaMBKQ0fqF
 x86Nsuj7c4trTLzMg1F/EOQ3Duq1t24+T6UWqSG27QMaSd4unyHGZqaOPZv8VVo6qRnW
 iJa4Lp2sUMEnzDlRuWeFEOy5f6EN/zjFDPvrqzkp4iAywmSRaKFhbct0/3NNQ7f9QkJv
 ZlgR/NjAYy8VmX/ORwTHW48vgJgO1UY56BiKwFymZg0Cb6VQ82plCmUGq/eB++bHYFLf
 9IiQ==
X-Gm-Message-State: AOAM530eRR2flK8iwJ49nlUSLyxYLz3fOpfTjrMfdfinzyIpXhLvXpPm
 BUzajRrQZs/6X1Sg/0P8cP2yBw==
X-Google-Smtp-Source: ABdhPJw2/77w5XqWwGlVdPxt8hVYOt3vaM/+c6HO06Q1osSJwE7jDwKYgFncnaLx6c4s6nJr7nslog==
X-Received: by 2002:a05:6808:907:: with SMTP id
 w7mr6724114oih.148.1616691690461; 
 Thu, 25 Mar 2021 10:01:30 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id h9sm1346177ooi.22.2021.03.25.10.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 10:01:30 -0700 (PDT)
Subject: Re: [PATCH v2 for-6.0?] hw/pci-host/gpex: Don't fault for unmapped
 parts of MMIO and PIO windows
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210325163315.27724-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7eddd70f-3d78-f711-1044-209be206365c@linaro.org>
Date: Thu, 25 Mar 2021 11:01:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210325163315.27724-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-riscv@nongnu.org, Dmitry Vyukov <dvyukov@google.com>,
 Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 10:33 AM, Peter Maydell wrote:
> Currently the gpex PCI controller implements no special behaviour for
> guest accesses to areas of the PIO and MMIO where it has not mapped
> any PCI devices, which means that for Arm you end up with a CPU
> exception due to a data abort.
> 
> Most host OSes expect "like an x86 PC" behaviour, where bad accesses
> like this return -1 for reads and ignore writes.  In the interests of
> not being surprising, make host CPU accesses to these windows behave
> as -1/discard where there's no mapped PCI device.
> 
> The old behaviour generally didn't cause any problems, because
> almost always the guest OS will map the PCI devices and then only
> access where it has mapped them. One corner case where you will see
> this kind of access is if Linux attempts to probe legacy ISA
> devices via a PIO window access. So far the only case where we've
> seen this has been via the syzkaller fuzzer.
> 
> Reported-by: Dmitry Vyukov<dvyukov@google.com>
> Fixes:https://bugs.launchpad.net/qemu/+bug/1918917
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> v1->v2 changes: put in the hw_compat machinery.
> 
> Still not sure if I want to put this in 6.0 or not.

I know what you mean.

> 
>   include/hw/pci-host/gpex.h |  4 +++
>   hw/core/machine.c          |  1 +
>   hw/pci-host/gpex.c         | 56 ++++++++++++++++++++++++++++++++++++--
>   3 files changed, 58 insertions(+), 3 deletions(-)

That said, the code looks fine, so,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

