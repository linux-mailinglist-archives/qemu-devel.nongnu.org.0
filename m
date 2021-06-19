Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AA63ADB34
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:03:50 +0200 (CEST)
Received: from localhost ([::1]:44964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufJt-000065-6r
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lufIE-0006kp-Bg
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:02:06 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lufIC-0002Nv-RZ
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:02:06 -0400
Received: by mail-wr1-x436.google.com with SMTP id b3so4308939wrm.6
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cytb5+1HRbZg4OVpI/q9pnAO/VcDzrlijTLEPgeudek=;
 b=OKc1IA70cfSj1mPkZ/fuUhsxXyehc9g8fNFqQsdwrctdAvuesKeIw3ui8KtQpIHGsj
 OQzCZHjkxVaQv0Ggxe91tiuayKm+6kEgconx8QWbCGr/9j/hjOH/2JBsdFfkH3UXis5N
 f6HyUQfihoQiDFa1UkpA6PwyZOFe5MoCL53b84zYbqtNnqC+QgichSu5bG2vrPexB6LQ
 6JQmgqy001kxiXpa+QysKYHKyYcc5AMktfG4QOjTs6+khjhys5+NqNZpOiBd8z0Cuc6g
 jSW9ohWXO9/Rx98yKvP4FplK6d9xGCYiZad8TlaNDXpNGpL5xbIyJKYU+5Rh4E/golQz
 1pPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cytb5+1HRbZg4OVpI/q9pnAO/VcDzrlijTLEPgeudek=;
 b=PF5pRMO7ZrytqKXtkEmPXz18akjMn4zpReOFm2MNwM4OYNBu3ibxggPARpEq4tATnA
 MLioHpik5hxGkcA5XXO/VQo17GZEKFnR1ho8ZCImEWfUpBJeqXl78TxIUie09pX3RsRM
 U8VJLyXl4aFOpAXvmSP8qdW6KQHJvzSKv/zf3s3Dn+J43HS/rahx7vGRNcr0RRv149uL
 Fg8Wf7vcphrhq1jnoikdlnlrUkR9ydVvWz4jNNhf+Xi2wFjGgbbh+ZM4DUtTniB7jKLW
 Sxz0XYK6zCbNwzKGPRErDLzkcuiQaNLttf9VIqlr2WDLZQaE/JL9TxEYpP8qt7qXP61T
 BUDg==
X-Gm-Message-State: AOAM531orMQ4tXreZwstfcChDu/fkF1JzDAHvt8s4lD+a3/CK3GdKR8t
 Z2Zi67MEdqfcANdhomtA6g0=
X-Google-Smtp-Source: ABdhPJz5y5nup0qT+WaHpD08gNxpYIjqA/1ZCRvH6OaXqtZFNBrejZUBU42DR33lJPqHk4NgM/g9Rg==
X-Received: by 2002:a5d:4dc8:: with SMTP id f8mr4735698wru.168.1624125723395; 
 Sat, 19 Jun 2021 11:02:03 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h18sm12586486wrs.64.2021.06.19.11.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 11:02:02 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Fix TCG temporary leaks in
 gen_pool32a5_nanomips_insn()
To: qemu-devel@nongnu.org
References: <20210530094538.1275329-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ee116127-3c28-9c2d-dd4c-5c1777eb5549@amsat.org>
Date: Sat, 19 Jun 2021 20:02:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210530094538.1275329-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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

On 5/30/21 11:45 AM, Philippe Mathieu-Daudé wrote:
> Fix a pair of TCG temporary leak when translating nanoMIPS SHILO opcode.
> 
> Fixes: 3285a3e4445 ("target/mips: Add emulation of DSP ASE for nanoMIPS")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tcg/translate.c | 2 ++
>  1 file changed, 2 insertions(+)

Thanks, applied to mips-next.

