Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A710302A6F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:39:10 +0100 (CET)
Received: from localhost ([::1]:34798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46lY-0000hi-IQ
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l46k3-0000Gn-Qq
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:37:35 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:45777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l46k0-0003Up-Pq
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:37:35 -0500
Received: by mail-pg1-x531.google.com with SMTP id v19so9503258pgj.12
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 10:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mVMxnpxOiav5lafAmaDYmcko+iG7QQyxP/91oWqdJwk=;
 b=BLXDBNrIuizywaR1u03VxhZ0g2Ov7d/qG6HCisv1gHSuxr3T73hCS5DBZhvtdf1tP0
 rl3lCeH1pnNakz2SRrLlVijCXLirtJAq/qTvKBzfFMtqonvb2oTLC9S6auoJugCu3ST6
 s8UP1yOKQ6TkKYERQKzxwotmB3V3brorAE1o4Rq0jfH6AcdPmY4vEFOCEwE8dkPWFT00
 oUycmH7VaxYNKaw52LOZrz89nXTljbm2H9A0pdglEeuNLNdaebd+AOQmpOabpBvlEKnZ
 jixSuWvfJjLf0l2iSh/LcOPBA63y+TUfmFjOHmd0L/EUZ5SjPJ7wzpQIV/M8WySDe/CW
 fQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mVMxnpxOiav5lafAmaDYmcko+iG7QQyxP/91oWqdJwk=;
 b=EW0qFx2Al3AeDmGIhgwWgSmNwpyMC509MzS87Qyv3LJl4XiPYk8GZos1q0Tzop+/Q0
 Gy3gI6sEgnpGs+4wwaJiU3AcG7JXdSNgSzoaeanLtwG8c2PFHbTrsXmhCDk1WTPGRac8
 DUPgp0tbVBAQX/HLoryPnuVjL/GNjdnGlLlS0wIXtuKHDmT44wNlJN2HsdWu7N56va4o
 JRjocDkC2voJJmTZgYZANYjk91JN3bm4JiHVp59t+QjiNUu9YtM2BsRu/jjIzavY1GYV
 NF414LIgv7mXJY4oDOerclXmBBWACCOEbrb4Htrj39KGcWmwV18TkghGkZWB91EfHj/s
 zCmA==
X-Gm-Message-State: AOAM533gCiEWB8YfTYqUPOpWlYV6M1wO4e7tO+HS5spx3GcA4xd5p3XY
 oCNYQ9w6PL7T5RmXmFr/Bcld9w==
X-Google-Smtp-Source: ABdhPJzxR3Z7ulb6Dhvwy+i2plsa2rBRsgK/on2WnBKEMF8v20TcAXX2sS5L37nkSzv0v/T+NFHyCA==
X-Received: by 2002:a62:d401:0:b029:1bd:4078:553b with SMTP id
 a1-20020a62d4010000b02901bd4078553bmr1755643pfh.21.1611599850772; 
 Mon, 25 Jan 2021 10:37:30 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id 6sm86504pjm.31.2021.01.25.10.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 10:37:30 -0800 (PST)
Subject: Re: [PATCH v2] target/mips: fetch code with translator_ld
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210125105818.2707067-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <79694200-43bf-5fce-120f-837f2daa17eb@linaro.org>
Date: Mon, 25 Jan 2021 08:37:26 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210125105818.2707067-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Emilio G . Cota" <cota@braap.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/21 12:58 AM, Philippe Mathieu-Daudé wrote:
> Similarly to commits ae82adc8e29..7f93879e444, use the
> translator_ld*() API introduced in commit 409c1a0bf0f
> to fetch the code on the MIPS target.
> 
> Reviewed-by: Jiaxun Yang  <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Restrict to translator path =)
> ---
>  target/mips/translate.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

