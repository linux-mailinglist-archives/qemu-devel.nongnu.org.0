Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D181D2CDC49
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:23:07 +0100 (CET)
Received: from localhost ([::1]:57060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksJu-0005CH-UN
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kksCC-00072J-Ue
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:15:09 -0500
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:36569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kksC9-0000pb-9x
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:15:07 -0500
Received: by mail-oo1-xc42.google.com with SMTP id l20so689283oot.3
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 09:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hXx5nPk6f0nIshK1/z7rNnx3MUbK/8ladJ1lmi1aEHE=;
 b=U6PJxWj1QGUbxZIRp0BlZ7R0McGRuurWqKShKO8ibIfNSD8nSK0+w3VRezFy/OfnU7
 zKyk3OCiYOe+vt9EO1pKDqY5QiAGHIqDXD3mrhGMEnrleD/BqFLmDYlIFQr2fv3erDlj
 I05ccOWAptQtfwITxUKChl3jnLkz1ihUysfQ6ExQXVkjfnL1JSqoAMJKgU8AlvrKCEcb
 NrUrGDGTGvSq4a+cHD4C6sZDG4p8Fbi7qCbbLYqW3vC7U44pvk7+s6EbdHlyFUnWgyjL
 NAOqJiuv8BivNU6BSF7UPXBpyTwNeA6dPSk0rD54Q2o3uQaN4MvHfSjung67cQUKNR5v
 JWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hXx5nPk6f0nIshK1/z7rNnx3MUbK/8ladJ1lmi1aEHE=;
 b=Y/7FzpwsnviI6+YiyC1wBobfSmkpdFLvJF94wREjinlqUViRsjmyZdpTS6z5Y4P1oj
 BHl/l7rmkwcasQjcGjQpgNDqj2zawr4P8sVyrQaNgQDcgRRDtRxkR4u0R7qBFDllpbAJ
 UB9cqIo1yEaZ8XPBwBqajkpc2xAhOZ9YYUAm3Ironm/rVYxfwW2gXd60a/D4VC9M3B5P
 8buZ/uN5gLvh5uNcXuTciQXme6WW+7bv34R4NTJP0xAsoWppmjYsTrk60HpfySr+3GrY
 mstf49ojFatevy4QUupTxq6lGuP5pnMDmaIA7iJfkGE98qplidR5R1wO2rKO6cI1JKjp
 7paQ==
X-Gm-Message-State: AOAM533VzgOyHMZ2aVifrt4JJGlZ5QAYSP3S1Dt/Nuq6RtZ5B/0RNNZc
 hJobLTGNHcdptgBBI1dyvSpZuA==
X-Google-Smtp-Source: ABdhPJxnksoLRBZqWW7iNXzEWsoO52JG7O8CRmGa4cunrxEjx1v1+7B4wVXBxhIZLdsCmJYfuvzqjA==
X-Received: by 2002:a4a:cf08:: with SMTP id l8mr34254oos.29.1607015703995;
 Thu, 03 Dec 2020 09:15:03 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 11sm352188oty.65.2020.12.03.09.15.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 09:15:03 -0800 (PST)
Subject: Re: [PATCH 4/9] target/mips: Simplify MSA TCG logic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201202184415.1434484-1-f4bug@amsat.org>
 <20201202184415.1434484-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb9fb1cd-095b-51cd-9ec7-fd9f1dfb0e5c@linaro.org>
Date: Thu, 3 Dec 2020 11:14:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202184415.1434484-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc42.google.com
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
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 12:44 PM, Philippe Mathieu-Daudé wrote:
> Only decode MSA opcodes if MSA is present (implemented).
> 
> Now than check_msa_access() will only be called if MSA is
> present, the only way to have MIPS_HFLAG_MSA unset is if
> MSA is disabled (bit CP0C5_MSAEn cleared, see previous
> commit). Therefore we can remove the 'reserved instruction'
> exception.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


