Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2CD5FA43D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 21:35:42 +0200 (CEST)
Received: from localhost ([::1]:39912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohyYv-0000EA-9R
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 15:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohyT1-000344-QH
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 15:29:35 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohyT0-00061h-5F
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 15:29:35 -0400
Received: by mail-pf1-x433.google.com with SMTP id w2so11639112pfb.0
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 12:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XJViub0Fs80K9lov8W6LKzKGqNHr0tksangvTDT1fTA=;
 b=g5+SX1TFV/RF8PAd3MeVLnwdAtZxEco3u1/rRMbLj7rdQvp8+gDlPUwZBCbZMMpIM2
 eW9/PpkswVpyVTBGExs0O3j+qNl06PdUKfVAsqLN6+cJ4X6/WqToOVj3GJiMXtcHnSgU
 kWNwq2fvfbDPymwtRNzQJ1aAD3do6H8NABZxQqGi07ATnPvuNFkQTVKoY62SR4vcokEG
 L0k8zS/JJ9tifORoq8zSs1wUgYSOHQfrwHn3ZF3mThkmPk2yvXaEQP/3jAARAnIhWm/8
 GCo8qXulh7/muCSLmmRfP0PC9HpuUsFEA/BhqK0g78oan0OgfpvNpt4Idjc95Hm/OiOW
 N5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XJViub0Fs80K9lov8W6LKzKGqNHr0tksangvTDT1fTA=;
 b=tyKUcPXwgcIsBO4Yu3RuHkkp2azVjHe3E1mnd+9z+875gOE5LaTyCwXj9x/L6ej/AA
 g6+qonHZpoYsk6NB6I5xKMjN0JLtpfB3Rpi5IjVX/WGWvMBkJvmwFrhOgff7FGna0jVB
 cRLxbJRLSze6CilZx9p+LnMVTwD2o7v70FSqKHodFolC5yjkkpi/bWfChugi06crRrrI
 lZ5Vw3vETHSHq4/Hd3pgOwrJd521TQzERwonxXwoyoMQAu5vob0lOhX4CgNPgYr33E/+
 0r3b4E8K8vhtVbn+MCONzZzQ9LGgrW5miL9q0Sgzrtm1tYo28AujsjdHzGpf0fgB9aSn
 ecAw==
X-Gm-Message-State: ACrzQf0O69lJYk0BgXiCbXwkdXT5MXv10zXgqz5r2Vtc6ucr+Pho8rSs
 BFzJbhpyTFBBF0119BM+5lx7YA==
X-Google-Smtp-Source: AMsMyM7teFXJaH1fMCVezoc/XTp+3wD/L+P19Plk0AMGX2lF86hTbFLEMCXxqgSyF3/cS1B/t9MXuQ==
X-Received: by 2002:a63:2cd2:0:b0:41c:5901:67d8 with SMTP id
 s201-20020a632cd2000000b0041c590167d8mr17864214pgs.365.1665430172600; 
 Mon, 10 Oct 2022 12:29:32 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a17090a700200b001fd6066284dsm6476977pjk.6.2022.10.10.12.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 12:29:32 -0700 (PDT)
Message-ID: <14cc8777-af72-504c-a6f9-cb38470b0536@linaro.org>
Date: Mon, 10 Oct 2022 12:29:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 09/12] target/ppc: Use gvec to decode XVCPSGN[SD]P
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20221010191356.83659-1-lucas.araujo@eldorado.org.br>
 <20221010191356.83659-10-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221010191356.83659-10-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/22 12:13, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Moved XVCPSGNSP and XVCPSGNDP to decodetree and used gvec to translate
> them.
> 
> xvcpsgnsp:
> rept    loop    master             patch
> 8       12500   0,00561400         0,00537900 (-4.2%)
> 25      4000    0,00562100         0,00400000 (-28.8%)
> 100     1000    0,00696900         0,00416300 (-40.3%)
> 500     200     0,02211900         0,00840700 (-62.0%)
> 2500    40      0,09328600         0,02728300 (-70.8%)
> 8000    12      0,27295300         0,06867800 (-74.8%)
> 
> xvcpsgndp:
> rept    loop    master             patch
> 8       12500   0,00556300         0,00584200 (+5.0%)
> 25      4000    0,00482700         0,00431700 (-10.6%)
> 100     1000    0,00585800         0,00464400 (-20.7%)
> 500     200     0,01565300         0,00839700 (-46.4%)
> 2500    40      0,05766500         0,02430600 (-57.8%)
> 8000    12      0,19875300         0,07947100 (-60.0%)
> 
> Like the previous instructions there seemed to be a improvement on
> translation time.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |   2 +
>   target/ppc/translate/vsx-impl.c.inc | 109 ++++++++++++++--------------
>   target/ppc/translate/vsx-ops.c.inc  |   3 -
>   3 files changed, 55 insertions(+), 59 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

