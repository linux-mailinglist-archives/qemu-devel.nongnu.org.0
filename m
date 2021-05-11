Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05283379D9A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 05:21:00 +0200 (CEST)
Received: from localhost ([::1]:42912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgIx9-0001fe-5F
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 23:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgIvT-0000C6-Fn
 for qemu-devel@nongnu.org; Mon, 10 May 2021 23:19:15 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgIvS-0004V1-6L
 for qemu-devel@nongnu.org; Mon, 10 May 2021 23:19:15 -0400
Received: by mail-ed1-x52e.google.com with SMTP id j26so17440920edf.9
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 20:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+w6G5QDG/j9gr2Aj010ZQ1JbxtyWY+vgFvXxQ0zrllY=;
 b=UuIJ2LuswJvaez3DG2xOHBB8lEFgYh59G3u094BFG1KFg0QO0M1GapVJjf04kvlOwn
 QF9l0u/syyDapmOZ6S0SD1oRhbToJ31upNFNG2ZXFVIEL6+wO0fAO5DCAUMiqFz+JZxy
 FvBg/8vW23UplekDcR2OUWnVc64otbZKbrw2jod5A82O3dyiepvGnFdAnccAAH1QRF3Q
 MuCQ9oKVTrknQ5wYvCcm94Fpq1lu4TXPf2fW2PfAO7rb+1lqpMa9ap5SotZCgJh9Yj0h
 ZpnE+0GgLqHOHnWb5PnX+eTSQvmZB/T/O8VpercpKLwS6Od39z9NerT6uZ4BqTAl6ckg
 PpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+w6G5QDG/j9gr2Aj010ZQ1JbxtyWY+vgFvXxQ0zrllY=;
 b=g/SbjF5SS2v9xeJ2Q9wmU9GKcx4f9VG7Wz0sG0skx1tOrFu8rZFZnxaxjG/gslgosq
 pg4/8pJwEi9NkM587ExnahbAm7iqM2GNxcFwyLSJTB5wC3og7Lj1MLNsK0b4jCNiZXoU
 rPBq6qjyJf3JV5HOblt/Z4GLhB9scp1DkgE6h9bLei0DOZeOya8EdjkC1EHLKIFhnAYi
 jtR1gVN8SnTcADvvg0EBLyEk25KdKWxpU2USm21XDBukWvIEHwquQdbDZq7VLPwK3wKT
 ciH+CP4rvuUSKjyshNOuV7PXq7IdS+Fajz4r+0LR56dwhwGP9T7/3hhbBWK6LwhAkETp
 ss9Q==
X-Gm-Message-State: AOAM531fKz6em09t20nUBBaZDouB4pZwD1B/I5Az0mE7iEVshp9uOSPE
 HCXnDcu6CR5TFylOisyw204=
X-Google-Smtp-Source: ABdhPJzwrgv1g7wV4DzD/cLekYdkhRAGMQTFP5h1QW3T1kK1I/WFmP76cKSkTf+OPrQPoQbUwD2SXw==
X-Received: by 2002:aa7:cf07:: with SMTP id a7mr33268773edy.261.1620703152529; 
 Mon, 10 May 2021 20:19:12 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 20sm4867358ejm.72.2021.05.10.20.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 20:19:11 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Fix potential integer overflow (CID 1452921)
To: qemu-devel@nongnu.org
References: <20210505215119.1517465-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f16b73f0-3a01-8a36-49c7-748c223ebcf8@amsat.org>
Date: Tue, 11 May 2021 05:19:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505215119.1517465-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 11:51 PM, Philippe Mathieu-Daudé wrote:
> Use the BIT_ULL() macro to ensure we use 64-bit arithmetic.
> This fixes the following Coverity issue (OVERFLOW_BEFORE_WIDEN):
> 
>   CID 1452921:  Integer handling issues:
> 
>     Potentially overflowing expression "1 << w" with type "int"
>     (32 bits, signed) is evaluated using 32-bit arithmetic, and
>     then used in a context that expects an expression of type
>     "uint64_t" (64 bits, unsigned).
> 
> Fixes: 074cfcb4dae ("target/mips: Implement hardware page table walker")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tcg/sysemu/tlb_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, applied to mips-next.

