Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B7B3CEC34
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:11:09 +0200 (CEST)
Received: from localhost ([::1]:53856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZbY-0006Iw-PW
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5ZYO-0001Hc-Tb
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:07:53 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5ZYJ-0001YY-Gu
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:07:52 -0400
Received: by mail-pl1-x62b.google.com with SMTP id y3so5843771plp.4
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 13:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DEpLiJK/MzJfYWHQWGA2HJVbKXbkr6Ogxfet6ch06iI=;
 b=oAfvxuRSH8KraiHk+9L+YTgoNMi560g8UqIQ/eu0XnTF9VQKN7P2osr47YmsSuashC
 GAjvYe1okjF4VLduwmAEthj2R6mXCHaLzVqs4CzfVcYWh0Nr2s1sUvIwDePpXVpTtnv+
 iUhg5z7PDQAXbIykxE5tr0EWK3U8vfIifnBxAs7HZB2eTtZOzx7PkoqhQFhpiAlcaYTH
 2MQPVYhl60megaOp+NuUDuDfnek/1+EzatiFRzEoAiZ5vUtzA8CWA8AVFCs1uFUTPSww
 9n8yDmIQ1emay3u3dFBFJ+nAExfI7fp/a51yfG6+6Ip6nhckJ4VRzHcGd7GdvWma/sUa
 axDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DEpLiJK/MzJfYWHQWGA2HJVbKXbkr6Ogxfet6ch06iI=;
 b=nWoPxeg/ZaVmkJU5pyCB+yDD0ZTq7B/pP1Duej6WUR+cOe7iv5y8rOrKgDInFl+THH
 0uO0IgH2xzQVPcMd9YZQg+oyVjKmGnpUb/4VsJSOUuCbXJop1jgBSu+/k/+OMkvjeezx
 wgUkLcHpOvSB0Vd3ZlBF+sj+bSVH2izBXGhpxlOd1GeAD3ABGE2QmSyNMdW3SDuR2tqr
 3jSymjNAi+/Bz+R+aKJ6b6tKs62gX6mi6sA+KL4UQKX65NhEoDNKwLTNFROpoYXcv7A6
 uPfCixHUO/7QheWwqBcYAvD2OZKxDlYMDxyGd6iCj3Dj2T3OA+CjMTG+rHp7gYLnGEGv
 Tu1w==
X-Gm-Message-State: AOAM530iujhIbCpn0VR1JEHOB5/CruPjO/ScqroI9AQRH6LK50y68Nx7
 +2yvqzHTx3O1LZqWuWw8UhC9UQ==
X-Google-Smtp-Source: ABdhPJzqMNo4LCcaZoKvXemTFXkO8D1Dne4r1xZIbiTKhr945GiniQNRF75hAb21SItPKiA3mceE5g==
X-Received: by 2002:a17:90b:1645:: with SMTP id
 il5mr25666718pjb.113.1626725265619; 
 Mon, 19 Jul 2021 13:07:45 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id t10sm23041210pgv.52.2021.07.19.13.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 13:07:45 -0700 (PDT)
Subject: Re: [PATCH] target/ppc: Ease L=0 requirement on cmp/cmpi/cmpl/cmpli
 for ppc32
To: David Gibson <david@gibson.dropbear.id.au>, matheus.ferst@eldorado.org.br
References: <20210715122950.2366428-1-matheus.ferst@eldorado.org.br>
 <YPTmoCh2z2VXzc7O@yekko>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <edea2a69-7e5d-6544-d560-295c05e74b32@linaro.org>
Date: Mon, 19 Jul 2021 10:07:42 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPTmoCh2z2VXzc7O@yekko>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/21 4:42 PM, David Gibson wrote:
> Given it's a behavioural change, I'm disinclined to squeeze this in
> for qemu-6.1, but I'll consider it for 6.2.  Richard, any thoughts?

The behavioral change happened in 6.1, and this is (partially) reverting that change. 
With this patch, the new behaviour reverts to (1) raising an exception for e500* and (2) 
otherwise, logging a guest error.

It should go in, IMO.


r~

