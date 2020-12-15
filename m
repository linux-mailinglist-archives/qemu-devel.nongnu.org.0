Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 566662DB717
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:25:04 +0100 (CET)
Received: from localhost ([::1]:42112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJgl-0007YD-9h
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:25:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJZj-0007IZ-3s
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:17:47 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJZh-0007S0-1J
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:17:46 -0500
Received: by mail-oi1-x241.google.com with SMTP id s2so25296555oij.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=is4tGvn1o1bqaWL/+p/iBKnhVDzDVqnbsJgyI3YJwcQ=;
 b=OMK4zMew/2i5KWpyEpvC3t7WhLib1buia6/v7Y17bcM4OCdCjXxGQGrL5iJzZQ1Bbt
 rwmcYlIklPZF4wyB70kn4uI2br6SIp6ZgcyED24xtUXXl9BF0Hf/XkSUbir3V13y4X7I
 qvbWg9Y1pFaNNUijj+DLtldb4U0yed9ct3cZgNGxki4qLBS7L4h4Z1mi5lIr59nDBGJQ
 x2Ruso9djdx7Svc6M/0+Q6CMzAH4XS+L4xWByc74a+mGfvpvl9qPKUshJn9gRRNFplj7
 xbtV781mmhv7WB2S1VBXHWspGVCfKro+j8pMppvrRx2wtsp9qbMjBwe+zFRiKtNBTFP9
 F/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=is4tGvn1o1bqaWL/+p/iBKnhVDzDVqnbsJgyI3YJwcQ=;
 b=dBiqYRv1w1t32CDKgtsNJttdy1N10ctkrvmXD+jQjuv0aPGgWlXG3pw6Wrh/03y/Ti
 fBD0vydazBQS255mIM8Por8uQpUvA9Uf4+DV3ogSZ9D85RGGSMOD1RVsBv9wOdXEzvRT
 +0iGI7H+uYElAJutoifIkNjqrMdZ5AhO+QU09DQ4reDglM0Ja8r7i375ret2grgDJMVP
 jhSo+tQlmhPqb/GaLz/aCpkiougOgvz+w/5N03eYVa2JA7nGPDcfxruL0n0d2NxyT6ji
 3y5P6gfd5jfHvcqVMbwOZs1udEo5XaGYMCtgzrZAvDxI75SxeGtkHq+tggfb0gNNPPxw
 NCIg==
X-Gm-Message-State: AOAM531/wqOeDNEPk5OhI/pHluQTiPkJYEa4h8tu23r1lojLzHN6YCg4
 YQG/zyw5l9wsNjgf+NpYzf5aIw==
X-Google-Smtp-Source: ABdhPJxgqmo7wq5zNRH1N61gyNPhcLl6an2GjcTTK4VuEfX+uNL3sThu2gPEa5F+hCgB9YelZyg73A==
X-Received: by 2002:aca:cd8d:: with SMTP id d135mr619707oig.143.1608074263991; 
 Tue, 15 Dec 2020 15:17:43 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o21sm2140otj.1.2020.12.15.15.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 15:17:43 -0800 (PST)
Subject: Re: [PATCH v2 21/24] target/mips: Extract LSA/DLSA translation
 generators
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-22-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f66367ac-e06f-8caa-6d57-ac20c327f0ec@linaro.org>
Date: Tue, 15 Dec 2020 17:17:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215225757.764263-22-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 4:57 PM, Philippe Mathieu-Daudé wrote:
> Extract gen_lsa() from translate.c and explode it as
> gen_LSA() and gen_DLSA().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h            |  6 ++++
>  target/mips/translate.c            | 35 +++-----------------
>  target/mips/translate_addr_const.c | 52 ++++++++++++++++++++++++++++++
>  target/mips/meson.build            |  1 +
>  4 files changed, 63 insertions(+), 31 deletions(-)
>  create mode 100644 target/mips/translate_addr_const.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

