Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAA64C01CF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:08:09 +0100 (CET)
Received: from localhost ([::1]:49640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMaW8-0007gB-6m
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:08:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMaTo-00061a-IN
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:05:44 -0500
Received: from [2607:f8b0:4864:20::42e] (port=41614
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMaTm-0002GN-Kb
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:05:44 -0500
Received: by mail-pf1-x42e.google.com with SMTP id p8so13022271pfh.8
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ysmBqJ4Sd9O+2mc/eVOFQhdrp2zPys+ue5nVXio098o=;
 b=eFuQkxcCJ+adMa4bb29EGX0cZCV6F74RXz2ErMfPIlPpIiRQitKD4l18hPKDGyK7iU
 Z94S69Ii+cf/JlS0+nzaZ1LZJHwfpEkhvYNYNyo2FV//ChVk51qCPBhVJn1JnsheCBDg
 zLCApjjiOXOEby2tKg9ne+55QL5VwbfLHj+CRW7PnPpEs8PgJ9JGxFZWmaxCKMo7gG1P
 6VWU+weLj/pd8msp7ZWBvmFJQ1cacA5HhAJxtWAA1m/16T8Pf+KRdiaUsBBsunbzkz/Q
 6Zt+zqNEyqlPuyMCm3tliRwGk05ft7n43vYVcwleI4mYDB5okQUvZUEIMZfeWgb0aNpV
 g9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ysmBqJ4Sd9O+2mc/eVOFQhdrp2zPys+ue5nVXio098o=;
 b=f8t64qa7Gp7ZPM43brrqx8I5DkUAuh2yOsVH5hnqnlza/JcKUX/ajLW+N2aoHXiD7m
 U8p3zYrVbJ6HRa/Bs5dhyjOdNrGDX4AfdfE3FAxd6WbOOzOcqTT8Mbkp6qaQTeDylfyn
 5BQkMgtpT+lT5kfCJjAr6wADOksa3nAcu4VxGEAA+ZUDkNqWHa8nl0q1mDWs0VgRo4so
 P/RXAfhDXjYNtKA+0+0vbeVQHyPPOkzlnrYimKU+BqQOHKlZNxoZMCF9tIhM1ZXoFxBN
 PfLv1RmLRc7WHD17eWn/knGELqSBffS9RHuVEIko3BKczLyff8IBBoqwm/5GuVpHmx4A
 38zQ==
X-Gm-Message-State: AOAM533jvk87BsY8PfAFRPuIuZV/1bpowaD8SavB1rTZd0foQSGMRM2o
 6mvcBRgucX/Dn0YPFEvbSMgr/w==
X-Google-Smtp-Source: ABdhPJxJxyxmHn7fHliqjuP/DBOA0kh2PzlQj4381AhJ+FUCsRLNgtFmAElv80M9h4Hr63XJzbXoog==
X-Received: by 2002:a63:4c8:0:b0:374:3423:64fb with SMTP id
 191-20020a6304c8000000b00374342364fbmr10041329pge.474.1645556741295; 
 Tue, 22 Feb 2022 11:05:41 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 q93-20020a17090a4fe600b001b9ba2a1dc3sm264062pjh.25.2022.02.22.11.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 11:05:40 -0800 (PST)
Message-ID: <123a96ce-42eb-bbae-8503-46dd15b157dd@linaro.org>
Date: Tue, 22 Feb 2022 09:05:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 11/47] target/ppc: Implement Vector Compare Equal
 Quadword
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-12-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-12-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vcmpequq: Vector Compare Equal Quadword
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v4:
>   - Branchless implementation (rth)
> ---
>   target/ppc/insn32.decode            |  1 +
>   target/ppc/translate/vmx-impl.c.inc | 36 +++++++++++++++++++++++++++++
>   2 files changed, 37 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

