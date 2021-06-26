Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6793B4CE2
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 07:50:45 +0200 (CEST)
Received: from localhost ([::1]:56222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx1DI-00071M-Uk
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 01:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1C3-0006Bl-N7
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:49:27 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1C2-00036Y-Av
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:49:27 -0400
Received: by mail-pf1-x42f.google.com with SMTP id d12so1489095pfj.2
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 22:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fh30svWboENAGz5thc1SXLc2UAZ493/mU606sSTwUQA=;
 b=AHrFU+u1GxPKBXrjLD8DhjjG87uQT+ioTf1sDorDG01PLnEBQRgnBmNBBRVZ77KAFm
 D8eebmDs9cqyuior4MrIqNs2vMfwGRag5WepITd1FTGVACo0z4jqT1/amXUgsXjF5Cu4
 zexL99nNvFb0VRAi6SLaKi5uLKAEwEPXEZr84O1Lkr2afWgo2TSgDxjVoU/E/LHpah4H
 vEHXtTqYC08ksiQM3PdTblWyd7/Xdl3lVmokZfPDAHIH8xthJos4L5wOblEB+YBWPBmo
 df6l0uxePInAr1JX8wf5FuGYeUZghvnqUWbEkyGwwxOivbVbfWa+Xfp+MLnA5YWJs+kp
 L44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fh30svWboENAGz5thc1SXLc2UAZ493/mU606sSTwUQA=;
 b=MJkN0qMnbZjw1MZTFsJjIpegxp0haz+fCtO4I0XR9ENjZVtAucNHzymt5BfJN8K0Rl
 WsAZqTs3NtExNjLMs2GXSwNNz2yzhGy6EHVZQhsTkO/E5oiV03bvY3Sr07pn/f0o87b9
 RQR/UbPneBMaUez/7X7TmGwf1cpUzZZk4qHa0hmAXJjb4nOmsBCrYfekFmPTfaUhsctt
 7eDDDq0YmBaGfHM19LJeC6F56FubMAibvIAlzxcmJIj9mc+pxCicA6UFqmQcw2wdMqDr
 25tXn+90Hw7+Qjf8odD7z3/JMkR4ymTsW9dhauqTBLoAOLb0Fyfp7lA45DcIlHPc8M5I
 dcmw==
X-Gm-Message-State: AOAM531UIpFppTP/OPT3wn3e/0eUI+4nvTmplsUuw7zgOamntsbvF/rw
 +PDAE+jCj6vA3nQPteai727O6g==
X-Google-Smtp-Source: ABdhPJxIkU6ABYk1y9eXst1++c6e+n3ADV42QxZkkB/kNK/pjeUgFKmXCMLc0pGQ1yRp6Xg/H+1UNA==
X-Received: by 2002:a63:1453:: with SMTP id 19mr12831960pgu.270.1624686564582; 
 Fri, 25 Jun 2021 22:49:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s22sm7337480pfe.208.2021.06.25.22.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 22:49:24 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] target/ppc: change ppc_hash32_xlate to use mmu_idx
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210624202131.108255-1-bruno.larsen@eldorado.org.br>
 <20210624202131.108255-3-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8c3415c-f310-4d9e-cdc4-63bce652ef56@linaro.org>
Date: Fri, 25 Jun 2021 22:49:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624202131.108255-3-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org, clg@kaod.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 1:21 PM, Bruno Larsen (billionai) wrote:
> -static int ppc_hash32_pte_prot(PowerPCCPU *cpu,
> +static int ppc_hash32_pte_prot(PowerPCCPU *cpu, int mmu_idx,
>                                  target_ulong sr, ppc_hash_pte32_t pte)
>   {
> -    CPUPPCState *env = &cpu->env;
>       unsigned pp, key;

cpu argument is no longer used.

You seem to have missed the msr_pr uses in hash32_bat_size and hash32_bat_601_prot, which 
also do not use cpu with the mmu_idx replacement.	


r~

