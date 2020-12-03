Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16AE2CDC44
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:19:33 +0100 (CET)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksGS-0001hU-Rp
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kks6K-00009I-LO
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:09:04 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:36273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kks6I-0006t6-N7
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:09:04 -0500
Received: by mail-oi1-x244.google.com with SMTP id x16so2935994oic.3
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 09:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lUXhP2BLApSFe26Hqd8EPuBUDi8Kp9hGIASjSzt0ujM=;
 b=WIKcLd/OiCXi1vc0o3Fe2Li3FepJ7ZKtQgR4d0dFtqc67lDREOzGds0LbFGalFU9CA
 8hx0djUwjzb+qoojTmHoTP6GW/UmLJ1hZY/BTk/kzHuqIaOOBjTAh1vN54yAWe9ZTzlb
 6keAafoxWthce6o/2EFaafhEK9usdNpFlUyLJ0iKlmXt4lmg5Sv66w/6e1IORXxGlV+L
 V7i1BD56Gzf3HEOdHvROnuwXOia5jNSawn037PnoPQH1Gqe4h+Ql6zzAqdZXARz7MMv3
 WkbvqeMcd2kaYBTdn0pH7S9RDfT8ZiUxoN7USFWO11vISKsLxTTXypxMOcGGEJlQUzfM
 uCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lUXhP2BLApSFe26Hqd8EPuBUDi8Kp9hGIASjSzt0ujM=;
 b=BxlgmbsLWxAfqxyVH8thTJmiUZzyG7M/WkkMJuKwW5kCOTk19XlldQqTaBt0pzTiYJ
 aeuz+6QwaJboDj5HAX4T7KJiS7cCTMc6B7Tf6LKDb0qb/MJJbgmxXJs4VBMWAJkzfnzS
 4kZzaOYw8UNnuRIKxKVV/LDfPy6Um0dsnkYra9K1df6oRXM5Kn4ocGmVX6or9RfFmxFE
 htOOX3MkwRPPYzeJtsO/Hx4wsCkEEiaVlEjtDJPOx61OceZJ2Arwlc+UZJ97XmHiazQV
 aiAxCEucWbxEBDiYY/finBa+vkcwJpHFIw2IYo/RZ8lnikqbFN68wBOsobYW6MA4NifY
 eC2Q==
X-Gm-Message-State: AOAM5307UELOb5FHVId7euXIlF+Hg4tkZeG0xgoco9vUc6CsvY12eBJ3
 48oL+GKCyYosRGW7XSM+tTC7Rg==
X-Google-Smtp-Source: ABdhPJzd87IgBEvNamtifDm/ZyjgyBN03fsigayNL610Fj0QqkozKvKAs43FU8o4x4JF8jDVlc6kCA==
X-Received: by 2002:aca:dec2:: with SMTP id v185mr103992oig.6.1607015341193;
 Thu, 03 Dec 2020 09:09:01 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id q3sm446639oij.27.2020.12.03.09.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 09:09:00 -0800 (PST)
Subject: Re: [PATCH 1/9] target/mips: Introduce ase_msa_available() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201202184415.1434484-1-f4bug@amsat.org>
 <20201202184415.1434484-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b4cbe312-8dc8-d3e4-e5d2-8fe50f52e3fb@linaro.org>
Date: Thu, 3 Dec 2020 11:08:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202184415.1434484-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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
> Instead of accessing CP0_Config3 directly and checking
> the 'MSA Present' bit, introduce an explicit helper,
> making the code easier to read.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/internal.h  |  6 ++++++
>  target/mips/kvm.c       | 12 ++++++------
>  target/mips/translate.c |  8 +++-----
>  3 files changed, 15 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

