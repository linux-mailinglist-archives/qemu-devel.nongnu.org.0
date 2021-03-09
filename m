Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCA7332FCF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:22:51 +0100 (CET)
Received: from localhost ([::1]:59906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJisU-0004vQ-DU
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJiHL-0004Ll-5l
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:44:27 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:52397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJiHJ-00072o-1q
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:44:26 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MsqIi-1ldJb30jTE-00tGiv; Tue, 09 Mar 2021 20:44:21 +0100
Subject: Re: [PATCH v3] target/m68k: implement rtr instruction
To: qemu-devel@nongnu.org
References: <20210307212552.523552-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <cb19b0e4-e43e-e8a5-5f20-fc1559d741c7@vivier.eu>
Date: Tue, 9 Mar 2021 20:44:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210307212552.523552-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YBWNOpT00AD8vWZfjYzZkesxZ60qEX6ZNd1hr3xRPhY80UqrX86
 bJI/YcEbGAJwR1grF56/hkRkrNBNMO65KN/wi+C67rYpnMjE9Jpogzi+LN06TVCQNgebPVK
 +cbR6YA4Fjxa92tKBx1/5DFCnuC94b0uRafpuMlUCoh4+yCzXvxqeAbxBiBu718ZLWQtcPM
 NW6NKsdv9X4Pwz98JCO3w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:W6Jt2b1zUis=:9MPhJSahjZCHjTMU+nSWcF
 vJwIfCsEyriLmr07U/9xOkJV4XFvGA2E8gMjQaFu5/Nl+7zPlt1XEpqzHbEGsCVILC1dWmk9G
 U3bzwFKjt5wpCB6gotR1UqZDjiXvqi6PbCgQj04XuuS8uYLdDXObtaOyXCaVU3XcILM0glrCe
 RhRrCn4v0r/CbP1GpnLpYnqOBc+73aWImw8VG8D7PihkBxYkH01VB5/IQVv3mpWPXLoNTaQCl
 ARPbQlKX30lRkIJeIFSXtc7xPYNjqMQ69F30bNG19GxdYIaDalzXJ24scrOEC8SBEX8uQktSZ
 l4hvy68wQh3NXLkLluzrV3z28XBpULLpIzeie0O6/6WtafmZYY+42nEJ57/aIv2x9UbHtg1kD
 QVexHfQwqMGaDVDj4W/TehHhhGQIWvIS27V/xFKvCpeB0FrhMYKB2ykjii43lNmIcpNQr1qdB
 ngj2e3geyQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/03/2021 à 22:25, Laurent Vivier a écrit :
> This is needed to boot MacOS ROM.
> 
> Pull the condition code and the program counter from the stack.
> 
> Operation:
> 
>     (SP) -> CCR
>     SP + 2 -> SP
>     (SP) -> PC
>     SP + 4 -> SP
> 
> This operation is not privileged.
> 
> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
> 
> Notes:
>     v3: put loads before state writeback
>     
>     v2: update comment
>         SP + 4 -> SP
> 
>  target/m68k/translate.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index ac936ebe8f14..200018ae6a63 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -2969,6 +2969,25 @@ DISAS_INSN(rtd)
>      gen_jmp(s, tmp);
>  }
>  
> +DISAS_INSN(rtr)
> +{
> +    TCGv tmp;
> +    TCGv ccr;
> +    TCGv sp;
> +
> +    sp = tcg_temp_new();
> +    ccr = gen_load(s, OS_WORD, QREG_SP, 0, IS_USER(s));
> +    tcg_gen_addi_i32(sp, QREG_SP, 2);
> +    tmp = gen_load(s, OS_LONG, sp, 0, IS_USER(s));
> +    tcg_gen_addi_i32(QREG_SP, sp, 4);
> +    tcg_temp_free(sp);
> +
> +    gen_set_sr(s, ccr, true);
> +    tcg_temp_free(ccr);
> +
> +    gen_jmp(s, tmp);
> +}
> +
>  DISAS_INSN(rts)
>  {
>      TCGv tmp;
> @@ -6015,6 +6034,7 @@ void register_m68k_insns (CPUM68KState *env)
>      BASE(nop,       4e71, ffff);
>      INSN(rtd,       4e74, ffff, RTD);
>      BASE(rts,       4e75, ffff);
> +    INSN(rtr,       4e77, ffff, M68000);
>      BASE(jump,      4e80, ffc0);
>      BASE(jump,      4ec0, ffc0);
>      INSN(addsubq,   5000, f080, M68000);
> 

Applied to my m68k-for-6.0 branch

Thanks,
Laurent

