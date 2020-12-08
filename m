Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E8C2D3648
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:34:24 +0100 (CET)
Received: from localhost ([::1]:49582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlYt-0006mF-5R
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:34:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmkxn-0001Fo-4H
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:56:07 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmkxk-0000F3-KS
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:56:02 -0500
Received: by mail-oi1-x243.google.com with SMTP id d27so218495oic.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 13:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ykm1CW81/1yVrovVuyB6hv6LMEyheoG0djpb+ytEzLg=;
 b=CohF/Y9Hqo9Ac2AUx2gO8PT4OyUy6EF18fpcoa+n6NtdqI3jo5MHZ/1lUJSmqmI8jd
 /A+u55gO4pID1FLicSRys3f7cKZWFarcVoJz6/rLYiUwr+EwpiIzVmpSpc82FETxgn6N
 uqu3Z2cg0N8w3F2/JO/+Dz5tVG3RxkgH+EwP9gCLPWSjeLG8qCTfC0qWgv8FQG8R0uIB
 9a6qo1J9w/F/Wk52FXwvJh8TQ8LKL69QHxkl33CMEO6V/fqc69msV6Z54dEa7TGb1wQc
 lLBOdlJU9fyqu8n0q/DTNWI2lKM2P8m+gtK0KqL2sPDDFAYE5igIcw5WLj6BEgtwLf5W
 /eLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ykm1CW81/1yVrovVuyB6hv6LMEyheoG0djpb+ytEzLg=;
 b=HCwbPEE/r6PAC854F0FHQUchlOGw+nfgLhwa0LQ4gdhi7E4Y1ZSbm6AMRalDvV4San
 OJ8IjgRb9V0zmnsozoFJo02bXOdcq69QhhrIlyZGatEqa/GWHkaWq5bdR6v16SvWyyWq
 YBMLzaoCveXkwhZ+DuXT/jyTiCJKllAvoL4kL0UlWrMbTpeiyA5MOjXz/+pvPFxXImVB
 0LfqsaWJAbzqkAb7h1QR5cp68Qg7+p0jeYysz+USiXrK/MyyFUMijqBNUXeX7nc2K/bF
 e1sPJNtMpWhO3GJMuYfOnrm8QrX/WDdbsZhvhn9SHfy3MMmh/Cw6QRTrSZ1DmWg+MtkB
 53UA==
X-Gm-Message-State: AOAM530M/IXLcpi+sQ4j14jigiDW8H97DbglV03PnTqTG+ZKCDHTC/es
 idgoDLdz+FCf263WDPuwfFdeMA==
X-Google-Smtp-Source: ABdhPJwyiBxLWMbeoV6IkX5eBT3+OCDE8cmPzhVHxVRYy67mswfM9jpwzc/L0i0X7tmXoLgWUd5ULg==
X-Received: by 2002:aca:4e0a:: with SMTP id c10mr4493910oib.14.1607464559477; 
 Tue, 08 Dec 2020 13:55:59 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v8sm16120otp.10.2020.12.08.13.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 13:55:58 -0800 (PST)
Subject: Re: [PATCH 09/19] target/mips: Move mips_cpu_add_definition() from
 helper.c to cpu.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d2371ed-2904-622a-9a49-f96ec731b3b6@linaro.org>
Date: Tue, 8 Dec 2020 15:55:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
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
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/cpu.c    | 33 +++++++++++++++++++++++++++++++++
>  target/mips/helper.c | 33 ---------------------------------
>  2 files changed, 33 insertions(+), 33 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

