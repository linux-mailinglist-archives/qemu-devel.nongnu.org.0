Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2492D4476
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:36:21 +0100 (CET)
Received: from localhost ([::1]:46216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0Zo-00021L-LK
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0O1-0004MJ-1I
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:24:09 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0Nq-0001le-VA
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:24:08 -0500
Received: by mail-oi1-x243.google.com with SMTP id k2so1836006oic.13
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vZdWJAcV41vdG3ksKO9Zry/LiS54zDvD5zWjOEGt7W8=;
 b=yoqJ3I4ti0eQlkXnhFkXZfjuYspKtstbetSEil0d7O3NBhZtAvcVvsxI+EzVf52N3g
 HwMnfBa49dHvXzhvWTrLQcFuO1TijZi4snisi0E+Cfa4zMmIMGdSx1oEI5OlMOPS/G5R
 bxQpKs6Ma/krw7Jr0OFGYbTAnBhYTQks9gB+jUWX1Bp1P/6inkAva04rywHyjyvRDkYO
 b3yx0jd7RhampcocnqcmwY8jJBcfc9HwNdANqNcskLJUWNgiNA5QW/uFqv3iL/4bRCDD
 wrwK/+zKx9p5gza6w1eZhz0tcfwUVQfZnFImSg3QUgSUnQxnOPRKf0J//NTtoJN6skgm
 QpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vZdWJAcV41vdG3ksKO9Zry/LiS54zDvD5zWjOEGt7W8=;
 b=VMPr/jJ4u7U/pZALrYRLOG86f/711iVLsULKHe8ekGF+RRs6e6ZzqLyUzFQohVIlyy
 /AcIHAk5//Sa29X/wPPfvFcHukEvpoQs7CClXjXUR70j/oZPehmUCXT4G9AQ47vim9VX
 x63pav4DpOX4hv0Wbj1Y+FeryrLcm+wulKCu3OMqK5g+qA6krjFBAV58MYTccGC9nhEG
 gChzh76IA8B+gvj56JxDPCtK5e1uAq5Qqm6+GtJrz9IAV3YuT5kHYtRbgals1ppIp77b
 8rt1wAQbUgM2IWbCbUVMIoMxutsaj0P3XiatN/F3NsQOhs97oysqzf6yXFRk4o7LSn4r
 7OHw==
X-Gm-Message-State: AOAM5308/9blASirDtO0ef9b7kc7PhQ4cxWimf0pLBFi7EGMJ9kI/ly2
 7swxmdLxIJJL+qnvi2x9qy4zxg==
X-Google-Smtp-Source: ABdhPJxbMIhK8L2wEHMl3z2ubAVPsHApxhWLx1OnmbPK3MghlD04APBYGz8jBmxu+erGGpUu9Vpk1A==
X-Received: by 2002:aca:bd0b:: with SMTP id n11mr1823182oif.11.1607523837769; 
 Wed, 09 Dec 2020 06:23:57 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s189sm335312oia.7.2020.12.09.06.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:23:57 -0800 (PST)
Subject: Re: [PATCH 07/13] target/mips: Convert Rel6 COP1X opcode to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208203704.243704-1-f4bug@amsat.org>
 <20201208203704.243704-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac1ab228-8e45-daa6-0570-ca85c415eb2e@linaro.org>
Date: Wed, 9 Dec 2020 08:23:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208203704.243704-8-f4bug@amsat.org>
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 2:36 PM, Philippe Mathieu-Daudé wrote:
> COP1x opcode has been removed from the Release 6.
> Add a single decodetree entry for it, triggering
> Reserved Instruction if ever used.
> 
> Remove unreachable check_insn_opc_removed() call.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/isa-mips32r6.decode | 2 ++
>  target/mips/translate.c         | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

