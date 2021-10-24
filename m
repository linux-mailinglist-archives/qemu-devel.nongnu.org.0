Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38AB438675
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 05:42:07 +0200 (CEST)
Received: from localhost ([::1]:57916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meUOc-000284-DU
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 23:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meUNC-0001Mp-2V
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 23:40:38 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:35708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meUNA-0004U2-2c
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 23:40:37 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so5024131pje.0
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 20:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8oXUYChzM2BxoTBp2yGg9fAJJP3eVk53NuX2wOkw5i4=;
 b=Xv2+x9fw7v1rJafjPOx3QujckxuaIdACjIi4isJ4LzikYFayJOoA2g4gr+FW7yPp6O
 bCclHdoPDLrhBfZ3zhAwQCxayZlpm3FnuaA4NV/tHVI0Fw8WwqOzx7Ri2g3Qp2iScvUA
 Utdz6KjlA2x4hVpWZkxAKK/WYxhnYyQPZnzkOWuk/LCmCd7PDFd02xDvg5keyr38IJnH
 W6vYNYfY4LuctsJ6yq/rdW9Hd7rDUJ7qcXCufMcAfZzkDr3T9+wsjL7k7ePnQcGb13dk
 7U6mRBctU6+M4Vcc3vh3IEaq+Ozglr+OsIdWQSxFrr2RhFFPoxeydGBgj2ajvNY2a2Ue
 sB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8oXUYChzM2BxoTBp2yGg9fAJJP3eVk53NuX2wOkw5i4=;
 b=zBCvWfmiWeUDOXPOJHt7slyxssw6gdncDku6MoeYQyiScokylRHdQB6UgoTRe+Pg1w
 8Ybn5/x2pwu93TA4lSP8q9xoeBIzKTMdGNkqvKUQ6oiLsDb1Q9Js2u+qVo40LaTYLRZ8
 IGKG6kYAyzmzVA+PTvEQc5fnDc6h7BAGWQ96G5QBFpYsuFDa0Tu3k3VRnwByyvjKplQX
 ShtRX++ayMrfIkgc0PlSy+gxmjkeVyIV87NfYeRYPElwtBxIMrEP4ctVOS1UR4xY/O7G
 UytuRHbCotOyBcCuC2pf+VxeMVQ7B3NOZEFbZAC38ynqSy3ygKCHDIizHAd2phkVjBdu
 mSpA==
X-Gm-Message-State: AOAM533bZ/1xwb70MsmxtdIfYAEouSNpld2O0S1cMMxHIwHH+O/8L5/1
 8+hoED5uwSrxSx3Y9I1WLEf6pw==
X-Google-Smtp-Source: ABdhPJwhPIKEH/O4LOoizp8w3I4R94whGBXSDkiYWZoQ1Fe7aLtXLOItzgA0vjWS1Lu/tsgh+J9VQQ==
X-Received: by 2002:a17:90b:228b:: with SMTP id
 kx11mr392289pjb.126.1635046834086; 
 Sat, 23 Oct 2021 20:40:34 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id f21sm7489557pfc.89.2021.10.23.20.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 20:40:33 -0700 (PDT)
Subject: Re: [PATCH 13/33] target/mips: Convert MSA SHF opcode to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <024a10c1-9b0e-5063-cb20-a04d26fa8a30@linaro.org>
Date: Sat, 23 Oct 2021 20:40:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> +    twd = tcg_const_i32(a->wd);
> +    tws = tcg_const_i32(a->ws);
> +    timm = tcg_const_i32(a->sa);

tcg_constant_i32.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

