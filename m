Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7243744D41A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:31:15 +0100 (CET)
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6QM-0006b4-Jb
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:31:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml6Ns-0003Fd-Vw
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:28:43 -0500
Received: from [2a00:1450:4864:20::432] (port=42912
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml6Nr-0004st-3g
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:28:40 -0500
Received: by mail-wr1-x432.google.com with SMTP id c4so8662220wrd.9
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 01:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lC4vv1iLxT4Fr75B85rlAyd2oXyT5gwW0cf9pR1AQP0=;
 b=zGg3Spp7Akq4ciCtYV35HNXXjWBb7ouXm9gpMg+0aBBfCH4Stdh7Yr1LTTvot5DM3L
 8BUO8vALs/J5KyW/cIOwz3MqFQumGbW3w63Yi/z/DmdkxZFDrhgmnhvUfzwUf9bT4RRl
 gk7OOv/8edAfAE24IVtFRnzt9DwHkhTKEGGFYk/9k/Y7kbD5x62Nf1tvZsjSbhLbBojy
 e+brZS8fwDXDH91QmbTXZQa1Syuis9z54oOYnK9JKbj1RjV1KtkQ25rFaaIbKPRizSGM
 WDlIU9OTzcyX5rmzPM6a4KXqdog8wDxG18IXvZly0fzvsm4AEt4Xx4++YZlQykg82T10
 7ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lC4vv1iLxT4Fr75B85rlAyd2oXyT5gwW0cf9pR1AQP0=;
 b=fpaAI71A86VyWbjBkztQjNch2NGRgkJVB3MZSUsvBVa0wRtEzp4Ud+e4dlLa2SA98U
 vNMPAmcGwRMLcQjttotr/b8+EVN4SndMn1nyHTpKZxASSBBqUMrE4fMQsMgNJ4tLrUzn
 V0ATqNw8MgkOyoZOn4pXKz2BzDS/vI5y3LjJVPefSSgeiUPZqIuF4j87x0S3RJMcoGpL
 g0QfqBnLQuPOiryghX6QOelI7bcnXzwoYoaIPqtyhbDqhQV/7+q5np9zpLELfRI4oLRD
 k1ZajLurh2ixTlpvK1H9OfW9Tk6w3HpQgmsf7Pi46fH2b4QJ1Q1ZO5Pe4vr2xV3Q+ty1
 tVCA==
X-Gm-Message-State: AOAM532arFBS1kGGV7cD4Cd2iHY/XHj3yrxAFfVsQ9fsBFCrBZTV283O
 hFPo/ge6blaQO1ViwjADzPrIfg==
X-Google-Smtp-Source: ABdhPJwlX4LqAoi3Nw8qmuPWY/GBmef09fNVOIvCf2/8S7hjUm4EwoCZu3eDGqt7ZUHiZmXvfREyyw==
X-Received: by 2002:adf:cd89:: with SMTP id q9mr7027679wrj.205.1636622917510; 
 Thu, 11 Nov 2021 01:28:37 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id n32sm2106554wms.42.2021.11.11.01.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 01:28:37 -0800 (PST)
Subject: Re: [PATCH 1/3] target/ppc: Implement Vector Expand Mask
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211110185613.550946-1-matheus.ferst@eldorado.org.br>
 <20211110185613.550946-2-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <218bf7b3-ed74-8ac0-6d50-f916d686615e@linaro.org>
Date: Thu, 11 Nov 2021 10:28:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110185613.550946-2-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/10/21 7:56 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vexpandbm: Vector Expand Byte Mask
> vexpandhm: Vector Expand Halfword Mask
> vexpandwm: Vector Expand Word Mask
> vexpanddm: Vector Expand Doubleword Mask
> vexpandqm: Vector Expand Quadword Mask
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            | 11 ++++++++++
>   target/ppc/translate/vmx-impl.c.inc | 34 +++++++++++++++++++++++++++++
>   2 files changed, 45 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

