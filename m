Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6440676B9B
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 09:26:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJVfS-0000NG-SB; Sun, 22 Jan 2023 03:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJVfN-0000Mf-US
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 03:25:30 -0500
Received: from mail.xen0n.name ([115.28.160.31] helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJVfL-0004FR-50
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 03:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1674375917; bh=EmjwhJjolxcblqF/U7zimQxJwYA5oN2A5znuYJlG6XY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mbjLkAvfYboRqQD8VkFn4fIaw1t9ZTWXIQgE+vQNzSsmztVGsWmLmIUiKItyR9agz
 6+TNFUiIj2EzYsqqrfD6k4cDCKahmHeP+Qw2GpGRBaFxflguq/HwEJNSClK3r0lbGo
 YfAebIdjmN7HnqyWj8wRsBE5TxQ+PFY+GD28OvgI=
Received: from [192.168.9.172] (unknown [101.88.135.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id D03C660199;
 Sun, 22 Jan 2023 16:25:17 +0800 (CST)
Message-ID: <e6663c5d-1888-09d3-3e6b-a9c17ee63101@xen0n.name>
Date: Sun, 22 Jan 2023 16:22:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101
 Firefox/111.0 Thunderbird/111.0a1
Subject: Re: [PATCH v2 09/10] tcg/loongarch64: Use tcg_pcrel_diff in
 tcg_out_ldst
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: git@xen0n.name
References: <20230118011123.392823-1-richard.henderson@linaro.org>
 <20230118011123.392823-10-richard.henderson@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20230118011123.392823-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/18/23 09:11, Richard Henderson wrote:
> Take the w^x split into account when computing the
> pc-relative distance to an absolute pointer.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
> index 29d75c80eb..d6926bdb83 100644
> --- a/tcg/loongarch64/tcg-target.c.inc
> +++ b/tcg/loongarch64/tcg-target.c.inc
> @@ -702,7 +702,7 @@ static void tcg_out_ldst(TCGContext *s, LoongArchInsn opc, TCGReg data,
>       intptr_t imm12 = sextreg(offset, 0, 12);
>   
>       if (offset != imm12) {
> -        intptr_t diff = offset - (uintptr_t)s->code_ptr;
> +        intptr_t diff = tcg_pcrel_diff(s, (void *)offset);
>   
>           if (addr == TCG_REG_ZERO && diff == (int32_t)diff) {
>               imm12 = sextreg(diff, 0, 12);

Reviewed-by: WANG Xuerui <git@xen0n.name>

Thanks for the catch!


