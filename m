Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE69143D64B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 00:09:46 +0200 (CEST)
Received: from localhost ([::1]:55368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfr7B-0004uX-V2
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 18:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfr5w-0003rb-FA
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:08:28 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfr5p-0000JW-I5
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:08:28 -0400
Received: by mail-pf1-x42c.google.com with SMTP id m14so4017959pfc.9
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 15:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7M5ISUz1OgLzqGLoAem9hRZdbIMCsNrSoMt0oHlBqbE=;
 b=OeRzyyChgBtUrXi3FnEZ2KjpJMSoKNhYr8pDTgvBgySfrmZewAI49wJvHllggGL6Od
 9xpAGPykHrYCY3ESMHKYC2ArdHEQXO09EYdfmCfeew33YJ+0eD5JVLYM3u0N7utElZhu
 tB8BiMwep1kgULeVMwIXqeiEE0SIVwEMdgqKTiaPowOKfK0sFbJ88fkQTM7c31bEVSiS
 QvUWEnu+yliVECPSFJPNBUvz9Fn7/h0Q+t9tPFgG2Aa0/ukXdRJjU59F2sfEHVXmBLMw
 63jo3RydcKz9YDOvbF0PcFmQMeoZ9CYd8qZgCNXq+XvTULvYJ2HFzCZD+MhMkSmw9noy
 fEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7M5ISUz1OgLzqGLoAem9hRZdbIMCsNrSoMt0oHlBqbE=;
 b=kRyzG83uhZ33ngeLUn2Cn0abEKSNWBGxyYm0OqFa4CDtkL4G5pyR1oBoQcSNGJOkwN
 /L+TQZI7E0gVZEu56grJkdHUfJLnNE9Hygy2vMQprFjWglGglCZ8MzjZgzpxWTJJADAb
 T/U9gxV0aWXST27EaMSB5YqMOZ+79xGLEXXBJaJSSq/fME4UfCl1+zrf2FR59VDat35E
 lR+DDH6XvTZe59rOgHdCTuXInWOHx0xLTqGu4Xju89eJxO5Pltagl9VQ7g3JPJ/efDWS
 5PxoaPQlM4QxT0of+U9DA7cs4WBOjtiev9/zUpJ55dBGLDlaGxfLnQI5tz1GrHMjKpea
 vsJg==
X-Gm-Message-State: AOAM532PC4MQfVObMYMofhy4P0mTXzPalS5xGDA+n6jZcTamX2t9v0jS
 wdA8NiHeVNFO53/UXTIifuFs7Q==
X-Google-Smtp-Source: ABdhPJxvrIRz1r0yvqccBMHMJ2UnHy7hGFOP3qIaMB4LUK9hGRLy5GdOc5dxB6U4NCeVc7UkxLBSCA==
X-Received: by 2002:aa7:8d0c:0:b0:47b:a99b:885b with SMTP id
 j12-20020aa78d0c000000b0047ba99b885bmr417939pfe.73.1635372496265; 
 Wed, 27 Oct 2021 15:08:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id mi3sm657420pjb.41.2021.10.27.15.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 15:08:15 -0700 (PDT)
Subject: Re: [PATCH v2 25/32] target/mips: Convert MSA COPY_U opcode to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-26-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <16d5d47e-f3fe-ad8d-6398-21bf184ce21d@linaro.org>
Date: Wed, 27 Oct 2021 15:08:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027180730.1551932-26-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> Convert the COPY_U opcode (Element Copy to GPR Unsigned) to
> decodetree.
> 
> Since the 'n' field is a constant value, use tcg_constant_i32()
> instead of a TCG temporary.
> 
> Reviewed-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v2: Add NULL_IF_TARGET_MIPS32() macro, use array of 4 functions
> ---
>   target/mips/tcg/msa.decode      |  1 +
>   target/mips/tcg/msa_translate.c | 66 ++++++++++++++++++++-------------
>   2 files changed, 41 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

