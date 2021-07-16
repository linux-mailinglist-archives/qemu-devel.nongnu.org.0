Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63C93CBAB9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 18:46:43 +0200 (CEST)
Received: from localhost ([::1]:60584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Qz4-00070l-B7
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 12:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qwz-0004du-NP
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:44:33 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qwy-0006SQ-8Y
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:44:33 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b12so5574588plh.10
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 09:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=RcV4rLuNkbviju7dg+ADGg3WyxdJ+JoU/srtBet1GI8=;
 b=U0eH0+yioLtK66J4lumaZ5Qhrq4lQT+BWFxzCU5K+kiyDTk9Q5l5c6cPKgLGfmGcu6
 gFDjUAk9i4RxrW/nqxB93mwp8hODVK9+POoWjAx+J6jHZW5OsWiXHF42aqz2+T8BdTc+
 o0XSIiofDSNY7G+Jsg28/0gh74Kykd5pnYibF5fvCHOiZ1ejcjfJqZWag7ym1XD051dZ
 WWD+6kaLeoQZQVEUAzyDPizxEKR8nhiYbYIBRsINMWBN24cEWXVwOSR1j5Fkyehe2nd9
 GW7QaDV7di5a57QfvyV4Or+uPo3XPyqEOx26e0L4QaDftjGUxyvaOZFGTnJGLQumBnn2
 iSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RcV4rLuNkbviju7dg+ADGg3WyxdJ+JoU/srtBet1GI8=;
 b=JPYpotvk/tKB3k4JpCmf4mCM3BwJ18uRne/ndHb7r33N3NRNRau+qDgiFXerGYCPEZ
 0I/T/AHSTephtfVFTl7xtFYNb3pHVLOox6bEXZXitAO3KEFryftcqzt62HrvGRYwEYUV
 xCii+KFxo3lTBuU3Xm9xbq1wz5nG9ZUj1KMTlYqd0EdeqpNTannbuD3hGionhBtac76V
 0mR5cUdf5voDCasovOS7TcThFLEHMzoLN3305N7r0lbIHPcWREx8IujwKPVCNuVbCWOy
 xIyuNhHOHs3QKLRPauCQgj9s/sH6mrPgrc2UbzL5Oo6jt96jHYWZ1rKreTxR7fgcCL7L
 36tQ==
X-Gm-Message-State: AOAM531Su0vdJUHF6nPhjJwZNQaAz5iTtkAQcajwMrX8YTU+6HmqCWL7
 ejtxEaMBQhkikAZwcr+Xqc8vBHax0QQ9tQ==
X-Google-Smtp-Source: ABdhPJzRJiwsOKyaIpv2ytc2gtn4tlo4KaL8gv4a6+F60sJ9MT8BpscdY/OZLXFF2CPvqdS6HNjuIw==
X-Received: by 2002:a17:90a:88f:: with SMTP id
 v15mr15753540pjc.150.1626453870651; 
 Fri, 16 Jul 2021 09:44:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z6sm12203969pjn.12.2021.07.16.09.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:44:30 -0700 (PDT)
Subject: Re: [PATCH for-6.2 08/34] target/arm: Fix VPT advance when ECI is
 non-zero
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <02981d66-72d6-c233-1a51-94743ac29fa1@linaro.org>
Date: Fri, 16 Jul 2021 09:44:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 6:37 AM, Peter Maydell wrote:
> We were not paying attention to the ECI state when advancing the VPT
> state.  Architecturally, VPT state advance happens for every beat
> (see the pseudocode VPTAdvance()), so on every beat the 4 bits of
> VPR.P0 corresponding to the current beat are inverted if required,
> and at the end of beats 1 and 3 the VPR MASK fields are updated.
> This means that if the ECI state says we should not be executing all
> 4 beats then we need to skip some of the updating of the VPR that we
> currently do in mve_advance_vpt().
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve_helper.c | 29 +++++++++++++++++++++++------
>   1 file changed, 23 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

