Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAFA3144BE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:16:39 +0100 (CET)
Received: from localhost ([::1]:35966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ghq-0003XU-JC
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9FRh-0007Vs-Nt
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:55:53 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9FRU-00055s-77
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:55:53 -0500
Received: by mail-pl1-x629.google.com with SMTP id s15so8642826plr.9
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 14:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZdGGrAtZVLla4GELYj0h5AVplpCzZFevF2hgLtzP6LY=;
 b=ZpwsljxYvthOfCR5MJy6eoSXitdnTNlX+jEDTpFfpVm3ieF/SIU++/qDYpHt6fuG0S
 TK58cz/c5llqFRAn0bwyvYA0vq1KR5LE5oY8+C3p3Qib5oO0Zu01EcoXqH7ABly8oxgm
 xSDRX89J9XX2UnMGlvgM3Y5RoAFMXwLeDmKm8h0XHCL2QP5YphqmrqVrnNYGs8HlHOlB
 BoUnlv9KxdygrldK6C3/O9Z5vV2eWOQ2nGI9CcYmD0ZkLXckYMyPzs68oMxhc96HUG1E
 uWPzEhYutTgnGCicasjInikDjpf/ii5IR9WCN/A2gUCIgiW//xFng8gkapU7aGnG6HWW
 5sMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZdGGrAtZVLla4GELYj0h5AVplpCzZFevF2hgLtzP6LY=;
 b=aNt5stl9m3XVN8uKNC72YEO+7m4+zauucneEkZBNDrCW5r1JbokYbdXxpS8QuLQo18
 Ll4k5r3sZzoqP+sFQYlSzFiaPIpNUvN6UwcciM2fjbXLnIkE1GqocI6afPCfqWekTHUn
 e6lCDXXKwstgWxHEfN50cnkOdaPasGNMfTju5s10j+FFAeGYVPihDbC1FC9NsDAgTt8n
 VH6xHUmm+Q9E9BI/YN0zpqnM73ZjzwSkdfxMNOV5V7FVA9VLLyzOiCGdUbUIXpDw1ogS
 iYZaACd4IsEn2I6bqCC7Os90pxl6nUftFsrpt9mPRvZ7MNIgXroamrhUDQA8cHq7DGAu
 yOCg==
X-Gm-Message-State: AOAM532hkFGDd1LO8XeqBSMCbx4Frqulz57LThxv+Puyty91IHdT1Dqb
 khIHGhVCqvMopcWZIYDfyOWzzl2g5ayuGw==
X-Google-Smtp-Source: ABdhPJyK7UhKhy7XSNiiClAwV0kdBUsQrjxeQ3O7BPIgd8njRJ/ZD3WsYX8rrnhXDsydAl/FhC7aFw==
X-Received: by 2002:a17:90b:2312:: with SMTP id
 mt18mr1060830pjb.81.1612824936034; 
 Mon, 08 Feb 2021 14:55:36 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 me5sm303280pjb.19.2021.02.08.14.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 14:55:35 -0800 (PST)
Subject: Re: [PATCH v2 63/93] tcg/tci: Use ffi for calls
To: Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-64-richard.henderson@linaro.org>
 <9d107cb2-ee8c-2a89-e004-9996a647a060@weilnetz.de>
 <9f552075-1783-dc8b-f338-23e12a138ffd@linaro.org>
 <CAFEAcA9TtuWaFo3cg_Qhxkg8gRqBNBkuHkSAJ-Lbxzbp23iR+w@mail.gmail.com>
 <69d3bc09-aeb8-6a40-157e-bf0dc19c0035@linaro.org>
 <CAFEAcA_=DZTRNvQsqT4dki1GTyAhL0RmhPoHG+OBw=W0yct0sg@mail.gmail.com>
 <2a61b461-c460-3b25-edd8-30e52b2eb578@redhat.com>
 <02ea197e-7ad0-0d85-78d7-c58f4aeceddc@weilnetz.de>
 <61a56eac-8afc-fa52-1681-21607b5294fd@linaro.org>
 <9f4e07d9-be5c-8bf4-f54a-424a844e8e7e@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4ad3bbc7-20ef-974c-668e-260dfb81ee8b@linaro.org>
Date: Mon, 8 Feb 2021 14:55:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9f4e07d9-be5c-8bf4-f54a-424a844e8e7e@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 11:04 AM, Stefan Weil wrote:
> 
> Am 08.02.21 um 18:39 schrieb Richard Henderson:
>> On 2/8/21 5:07 AM, Stefan Weil wrote:
>>> Richard, this commit is also the one which breaks qemu-system-i386 on sparc64
>>> for me:
>> You'll have to give me more details than that, because qemu-system-i386 works
>> for me on a niagara5 w/ debian sid.
> 
> 
> I am testing on a similar Debian system (debian-ports unstable), but with a
> Niagara3 cpu:
> 
> Linux gcc102.fsffrance.org 5.10.0-3-sparc64-smp #1 SMP Debian 5.10.12-1
> (2021-01-30) sparc64 GNU/Linux
> 
> gcc (Debian 10.2.1-6) 10.2.1 20210110
> 
> $ cat /proc/cpuinfo
> cpu        : UltraSparc T3 (Niagara3)
> fpu        : UltraSparc T3 integrated FPU
> pmu        : niagara3
> prom        : OBP 4.34.6.c 2017/03/22 13:55
> type        : sun4v
> ncpus probed    : 256
> ncpus active    : 256
> D$ parity tl1    : 0
> I$ parity tl1    : 0
> cpucaps        :
> flush,stbar,swap,muldiv,v9,blkinit,n2,mul32,div32,v8plus,popc,vis,vis2,ASIBlkInit,fmaf,vis3,hpc
> 

Ok, I've reproduced something on a T3 (gcc102.fsffrance.org).
Running the same code side-by-side vs the T5, I get different results.

I'll see if I can track down the difference, since they're both running the
same base os.


r~

