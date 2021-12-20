Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEED47B3A7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:24:06 +0100 (CET)
Received: from localhost ([::1]:33124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOGT-0005vi-CH
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:24:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzOAl-0002xd-LB
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 14:18:11 -0500
Received: from [2607:f8b0:4864:20::434] (port=36376
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzOAk-0000nM-2D
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 14:18:11 -0500
Received: by mail-pf1-x434.google.com with SMTP id v13so9587779pfi.3
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 11:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9ZOnYaaaJn3eTuIXiBiZ94cEcaTpqLUYq9W/J3rXctk=;
 b=iCip90Fr0hpKPKojLsef57CvGoOmXahOptnaRUaIv0BbuyHm4KfY0r76Zpvv4zK5fd
 Fmh+JdGDHsIBgXE0L7femyx7jCNU+CZzsttUNkGes/+ljSd2lf8YsHKpqbIttZyYQpSV
 lYndypoF0rJDMAxa8vEb/Es3CwihsFHzvrq+tjxtsMbUp2ZqdyMA/5ioRN2yaWG4LQWU
 BzyjNjDxCSbkePcTfMVkWP2aYLVVzKN5DZ+CyIzJp3NxvFgyf9SoDa51+fIhy1sbDmht
 v/FVrHA8Vcr7B5d0gaA6D8+U4RZxQTF/xC/8shWbihzPzU2uKpl/LHbLTfKaOlWbqWVR
 MuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9ZOnYaaaJn3eTuIXiBiZ94cEcaTpqLUYq9W/J3rXctk=;
 b=yFO1zszwJOnd+GKAk10xr2uzGroOUSnYYhQDrwJzsfU3STucmU5v+YnMyxdCRVOdoI
 5jiBkSWyfzgjU4rWHcERNubNRyVfeKHR71G1QdBQ4cdaSxJ+vYUVqX7rofop+awGlhmt
 O2Jt0FLG5Lfg35gFFsaQVD5n9FJq03hMZc8dU15Qf31AS0a8bfCSIJwOoKGGuSh5Uhl4
 dJnoKZl3C01QL+tycE8kMKGzWqM2g2GHrXxyQXtOHl1vL3pjjcIY5oAc8xqn4/xTI+aE
 DS2l7OujZxKSMqDgvi5ygOH3d/9vr1CwhLe3cpCYS0GTPgp3aMVGap4NkUg8x6aHZxQu
 1Rpg==
X-Gm-Message-State: AOAM5317lWEGcpDtZJK4khLo9s8H7lXbwsQFUVomGWNMRJWazxO2n1+l
 bOWMukYPeiojPd3kfpcFPCsgTQ==
X-Google-Smtp-Source: ABdhPJzQ4Xk18wC/pUpf2MmfgO1+g+Dqo25RSvS9V3Y6mQPj76dKxGfgVxjq3rHWJ0ppZdSz3z2omA==
X-Received: by 2002:a62:8f51:0:b0:4bb:9d8:86cf with SMTP id
 n78-20020a628f51000000b004bb09d886cfmr1238004pfd.55.1640027886249; 
 Mon, 20 Dec 2021 11:18:06 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id w15sm148906pjq.24.2021.12.20.11.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 11:18:05 -0800 (PST)
Subject: Re: [PATCH] tests/tcg/ppc64le: remove INT128 requirement to run
 non_signalling_xscv
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211216140951.1183987-1-matheus.ferst@eldorado.org.br>
 <2e386a1a-17cd-1c04-4eab-480ecbae059f@linaro.org>
 <493cf62e-2a80-08b4-1d0b-72b222a0bbd8@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d220766e-9022-8a59-79d5-33a889c49c02@linaro.org>
Date: Mon, 20 Dec 2021 11:18:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <493cf62e-2a80-08b4-1d0b-72b222a0bbd8@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, danielhb413@gmail.com, groug@kaod.org,
 f4bug@amsat.org, clg@kaod.org, alex.bennee@linaro.org, aurelien@aurel32.net,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 4:18 AM, Matheus K. Ferst wrote:
> I'd like to avoid mtvsrdd/mfvsrld because they were introduced in PowerISA v3.0, and 
> xscvspdpn/xscvdpspn are from v2.07.

Fair enough, I suppose.

> How about
> 
> asm("mtvsrd 0, %2\n\t"
>      "mtvsrd 1, %3\n\t"
>      "xxmrghd 0, 0, 1\n\t"
>      INSN " 0, 0\n\t"
>      "mfvsrd %0, 0\n\t"
>      "xxswapd 0, 0\n\t"
>      "mfvsrd %1, 0\n\t"
>      : "=r" (th), "=r" (tl)
>      : "r" (bh), "r" (bl)
>      : "vs0", "vs1");
> 
> ?

Looks good.


r~

