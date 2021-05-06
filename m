Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FC0375B89
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:14:58 +0200 (CEST)
Received: from localhost ([::1]:60354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejSb-0002y8-N4
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lejBl-0005hC-CV
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:33 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lejBj-0005l0-9J
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:33 -0400
Received: by mail-pg1-x532.google.com with SMTP id i14so5380296pgk.5
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 11:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DJw9+vJKaSo/j6u1K7N9zKLXsYrNVxDNCbdbQRjMRWA=;
 b=iZPXZKJej9ocEQfuO8mO1jY9FyPWV3jy0GB/TOoJCjkQkoEjBVof+PYENMO2kZuFHO
 7eL3kY0Zz+Mfs0TEyemYdpQPr0UrUoNGcL2lFcpNyWw/DjRwR2ftSdR/y+e4ATEiwPw6
 v78q5DSxT7lpe+LfCqliQYfglTTP1jcBBDkMHiwB2MpTMBSRGvcMOwaJK+q1kV1wrzMl
 zZHrsvJSTcaCP3ipQIE3B/8kWiEageeOXcmkrG8K3Ltql49W2zCVQtBVrXmmpBHnJzgN
 Kezndm5EfAhc3w5zyaKOSPk/9N+TrkFOTzmT5HEaT5fNsjuZ1J8LlpAGyWCMhz6rLQe1
 JSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DJw9+vJKaSo/j6u1K7N9zKLXsYrNVxDNCbdbQRjMRWA=;
 b=gp86ZCiAvHOP5VDs7NiLugLaXv5B6SeOm9teFGmcC2FMq41foi1X7bXk5jGr7CRuaB
 JKNl64sB5ktR4syTH32ha8A99xw+eBeZaS6FZrRiBIQqCBSV5II9imuxprNmvgrHOwyU
 aL1StbyfoNrxG1kA0Fl0om78rKfkOJaOxfRjggcO7+DwrIh8902GqAkVuyR8+cCQxeWp
 NP3mdji4HGSXaa67BWRlk5csWGLbCcfKWaKqrrn8A6w6ItNqEXjRO85hTwzllVYPByxR
 PKMmgFuoGlf2gzcj6W/eDBldKai4DaxsFJIpAUZJrJ9hZ38lmaBIy/RwH9jD+opYr0Kc
 BK7A==
X-Gm-Message-State: AOAM531UaeNeqZzpNQj0GJ1fW4im2N+D2k7uaMy5O0gQ1TG6mVSKMIbD
 IRrimJmvVhd91aUMkLi31eyZew==
X-Google-Smtp-Source: ABdhPJyMcUhq+5WEqoc3mAocnc7zbbLu36sawXO9ejfS4/JzNSiwB/QdtXzZR6N9gq8HaBcCFqPkYA==
X-Received: by 2002:a62:4c3:0:b029:27c:892f:8e22 with SMTP id
 186-20020a6204c30000b029027c892f8e22mr6331256pfe.6.1620327449731; 
 Thu, 06 May 2021 11:57:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id cv24sm2832924pjb.7.2021.05.06.11.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 11:57:29 -0700 (PDT)
Subject: Re: [PATCH v5 2/4] target/ppc: move SPR R/W callbacks to translate.c
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210505155310.62710-1-bruno.larsen@eldorado.org.br>
 <20210505155310.62710-3-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <199d04bd-26b1-e6b5-06db-1e28074bbeb7@linaro.org>
Date: Thu, 6 May 2021 11:57:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505155310.62710-3-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 8:53 AM, Bruno Larsen (billionai) wrote:
> +/* SPR READ/RITE CALLBACKS */

Missed the spelling fix reported against v4.
And my r-b tags.


r~

