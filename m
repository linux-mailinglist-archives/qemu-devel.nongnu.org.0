Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C8B301485
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 11:31:46 +0100 (CET)
Received: from localhost ([::1]:47894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3GCn-0001jw-7Q
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 05:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1l3GBI-00015y-3d; Sat, 23 Jan 2021 05:30:12 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:43648
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1l3GBG-0006Mw-Kj; Sat, 23 Jan 2021 05:30:11 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 3219FDA1481;
 Sat, 23 Jan 2021 11:30:08 +0100 (CET)
Subject: Re: [PATCH] tcg/tci: Restrict tci_write_reg16() to 64-bit hosts
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210123094107.2340222-1-f4bug@amsat.org>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <5450690d-bda6-4ea8-4e4e-006db464dbda@weilnetz.de>
Date: Sat, 23 Jan 2021 11:30:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210123094107.2340222-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.221,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.01.21 um 10:41 schrieb Philippe Mathieu-Daudé:

> Restrict tci_write_reg16() to 64-bit hosts to fix on 32-bit ones:
>
>    [520/1115] Compiling C object libqemu-arm-linux-user.fa.p/tcg_tci.c.o
>    FAILED: libqemu-arm-linux-user.fa.p/tcg_tci.c.o
>    tcg/tci.c:132:1: error: 'tci_write_reg16' defined but not used [-Werror=unused-function]
>     tci_write_reg16(tcg_target_ulong *regs, TCGReg index, uint16_t value)
>     ^~~~~~~~~~~~~~~
>
> Fixes: 2f160e0f979 ("tci: Add implementation for INDEX_op_ld16u_i64")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tcg/tci.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tcg/tci.c b/tcg/tci.c
> index 2311aa7d3ab..3fc82d3c79d 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -128,11 +128,13 @@ static void tci_write_reg8(tcg_target_ulong *regs, TCGReg index, uint8_t value)
>       tci_write_reg(regs, index, value);
>   }
>   
> +#if TCG_TARGET_REG_BITS == 64
>   static void
>   tci_write_reg16(tcg_target_ulong *regs, TCGReg index, uint16_t value)
>   {
>       tci_write_reg(regs, index, value);
>   }
> +#endif
>   
>   static void
>   tci_write_reg32(tcg_target_ulong *regs, TCGReg index, uint32_t value)


Thanks for fixing this. This could optionally be applied via qemu-trivial.

Reviewed-by: Stefan Weil <sw@weilnetz.de>



