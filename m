Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D58E2FF4CB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:41:10 +0100 (CET)
Received: from localhost ([::1]:52258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fpN-0003XB-07
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2fhM-0002Ii-S4
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:32:52 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:34358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2fhJ-0007jm-C6
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:32:52 -0500
Received: by mail-pf1-x42d.google.com with SMTP id m6so2145883pfk.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DkMSsilNniynjBDnkv9UocWCWGl82Fm5D+HNgrlYEsY=;
 b=yn6V8p/ne5hgSvAl03WIB7Jh/QY40KRnxpE3pI7PLSfESUQ7UUb1zPrqGi4dwc3S9S
 gO+agT2rPLgb1+J7ZQQNQHuZ5mFfded161P/5joxhZ8xLQ0gLmZeo/LWhBY5UgGj5FqT
 AKvxpXNF0MzQ0ARDFK9vV6HY09RRcaWcV/I69K1u6bc9HyGVwAppLNyi7eGfKaIkGYsV
 /VsHM7dHUTKYBTSur1yENeDAmqzWwwr3bnwkUGeypmH+k60PZsE9FPtegRrzhZyFPzV4
 6MmENYrqUtVnkkayuUDekkdxS8uGGINHQ3LFXBNY6J5nTLFUXOdXi7NpS8Eyhd2tzZJn
 gL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DkMSsilNniynjBDnkv9UocWCWGl82Fm5D+HNgrlYEsY=;
 b=BwHUHydLj1T486ce4InKEvMQfG9kSm3RdDOU+68213oLFii6Ou0K9DH6VWNB8sL3tl
 CgXrPxu8Kwfv2trYdfibu+/Mr3GGBs+w08H9+dIkJCXbbD5ER/y10bk/GRZiydxQL1Lx
 c8kXJubCvSNOtPFsVqguZzHrb49tFXEYEyGmd6/pq3VwHTrIiNjpsClRttj54MGIsw/S
 xH5/oT4dpRU4VHFIv6ilTYmSJoxl8q0xQ1jxZx3AxZ1Cr1/IBrYi6feps1jVt7DSlEAy
 YgrtICRmuVPXwhHrBEvKiwpMpOLHSTevX0AyeomGbCkzinvmCOjgkyW00HNqXFQt+lW/
 Bgog==
X-Gm-Message-State: AOAM531IbNn8k4a9y5D0TZ1G8S9WvEEBldkPMVPtZ3ClJOujuGb6GHbj
 7LeJzuyEBSyMp8Igh24qTxIVLg==
X-Google-Smtp-Source: ABdhPJw/aesH/Cdnn3yCj55lsMCc+lvCNimdTTpWApMds+vkR8K8isej6Cm27l1R9rxa4BUTMPFi5w==
X-Received: by 2002:aa7:87d2:0:b029:1a5:43da:b93c with SMTP id
 i18-20020aa787d20000b02901a543dab93cmr1007038pfo.6.1611257567363; 
 Thu, 21 Jan 2021 11:32:47 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id 192sm6310408pfv.209.2021.01.21.11.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 11:32:46 -0800 (PST)
Subject: Re: [RFC v4 08/16] target/riscv: add gen_shifti() and gen_shiftiw()
 helper functions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210113071350.24852-1-frank.chang@sifive.com>
 <20210113071350.24852-9-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <99142a70-0e32-98e9-2788-8a7805b268fb@linaro.org>
Date: Thu, 21 Jan 2021 09:32:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210113071350.24852-9-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 9:13 PM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Add gen_shifti() and gen_shiftiw() helper functions to reuse the same
> interfaces for immediate shift instructions.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 54 ++-----------------------
>  target/riscv/translate.c                | 43 ++++++++++++++++++++
>  2 files changed, 47 insertions(+), 50 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

