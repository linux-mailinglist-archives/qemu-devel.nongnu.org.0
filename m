Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395D72BC1C0
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 20:46:07 +0100 (CET)
Received: from localhost ([::1]:52588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgYph-00061o-OJ
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 14:46:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYo7-0005Rr-QJ
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:44:27 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:46973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYo5-0004n0-VQ
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:44:27 -0500
Received: by mail-pg1-x543.google.com with SMTP id w4so10425225pgg.13
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 11:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kgxaqACAh6pyH9fnOTikkNJUSCcbxxhfYwlvYQ2CkEg=;
 b=K4OcP/zkbKcWCFvb4LnkY2od7J5jlB60WLxWplEDEvhFSUi3vjdM9oU/ihVFnzaKOb
 zIXJbfNbKMw9uITB77OZQR50huznVYn8J0PEA71cu0WlhD1OgahMafW6Qr0zLYmR+1Ys
 87jtZ4t9O4+JVP30K4+C9WCGdARi0iVVwI3CLowXXfljyar0IhSCIRGBa7+RGmQPoLEO
 w2xzFHGTPK1rbYHUF67piTKUz1INbdkbTc0Z90bjDcl9jJw0NQ/4HL/a4kLtUdRPnMiq
 KNY9kviqyrGqOckpUoFnbNsr+YoCiewClgkQA9PRzjmFHaUc3Emlg64c4VtcMCXJ06XQ
 ciIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kgxaqACAh6pyH9fnOTikkNJUSCcbxxhfYwlvYQ2CkEg=;
 b=Z2ndySTUkPsopicOBlXfP4oXgJ+WrUFInXnjG6YBIAb7+h99Z546cAoabrQDUa1iv7
 6l2n6EE3ki3XQbcfon/gyE4z84p68XufqvTXp+f3eEfJ2Eruhx1OiBGccYCg2AqZo6EJ
 CfK808JFQLxtynJTZvJIpQLAdRkcQnLPf68GZrOuZp8Y6j/zikK/6r29P8rSivaGayuD
 2BnnDWX9ncT5vnazI3fRd3Z9EycHT/iEXKuSbON2KAFJqBgpkJx5fEnxrrD+xJTjYmpO
 9gAM5fHwVR5DG5+LWEqyWOi6WA5MlvH0P3L+mp0clRMZV35TbXmEAAI0DFj+/L9iA3EG
 JcjA==
X-Gm-Message-State: AOAM530eUmKOpD1dFMbeuk7otl1wZDpEnY6AO0mth2gRZM2cN3C5r4j+
 4VwMG06Jl+DoLhNsWo8tQcTYZA==
X-Google-Smtp-Source: ABdhPJy/uZm7ywxtUHPLAU3lktNDWksB4SHPOEj9T5waLJvMskhgdsVHpni8oUF3OOAHaaBeFA1s9g==
X-Received: by 2002:a05:6a00:c:b029:18b:eae3:bff0 with SMTP id
 h12-20020a056a00000cb029018beae3bff0mr18953624pfk.9.1605987864189; 
 Sat, 21 Nov 2020 11:44:24 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id me12sm2375209pjb.12.2020.11.21.11.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 11:44:23 -0800 (PST)
Subject: Re: [PATCH 02/26] target/mips: Extract MSA helpers to
 mod-mips-msa_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7053b4b2-b51c-ab6a-91ba-d019843112d1@linaro.org>
Date: Sat, 21 Nov 2020 11:44:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> MSA means 'MIPS SIMD Architecture' and is defined as a Module by MIPS.
> Rename msa_helper.c as mod-mips-msa_helper.c, merge other MSA helpers
> from op_helper.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  .../{msa_helper.c => mod-mips-msa_helper.c}   | 392 +++++++++++++++++
>  target/mips/op_helper.c                       | 393 ------------------
>  target/mips/meson.build                       |   3 +-
>  3 files changed, 394 insertions(+), 394 deletions(-)
>  rename target/mips/{msa_helper.c => mod-mips-msa_helper.c} (94%)

Do we really need "mips" in the filename, given that it's implied by the directory?

Maybe perform the rename and the op_helper.c move in different patches?


r~

