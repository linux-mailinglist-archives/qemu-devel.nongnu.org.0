Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2B55B7671
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 18:26:59 +0200 (CEST)
Received: from localhost ([::1]:51314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY8kT-0002WD-OE
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 12:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oY8iJ-0000w7-3W
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 12:24:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oY8iH-0005E8-0E
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 12:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qIPsmZBtbr70cN5HKoxgGIPdHzj7/OiISA/nTA52kE4=; b=RzXkqMT+OvDWcY4qNX6afWnitK
 nA5lcH+TItM13IdQUEsSDZlWPmpuZw2kDpO1Dyo/nQmWd0LMtsjaJk2axGe0SCVg0mt9XGrHL8ihL
 u+OjT+SoEuVIMFRGPEF7nOmvlbV5a/qnqxrd2HGSQSDzKV/0ztYmtxba3yLSbHg3zfuc+3DM7xt86
 qFE+6hnGpeeGAFARnlt+T8pCfi4pWS47KheSxbexTg37z2aOXbuP9KCmK5nOT6H9Z5+35VzmmX69z
 /zqhknFkZ3RarsXVCsv1McXRJZo/SrlcXzxH937GtPbk2dkWV5mFd82YGGXJ1b1jfSiO+/FSMrdDJ
 BLAUe0hEyAOXBNbkwmqY09kNB5XIfaTYrzXbJw4TKC9l60eydl0N2oPHfAFq2+EmUW1ao+gQT6dtD
 Vzt/monHbC211Mdq2gxSfPbyXvfK4zzIoGTBMjkedqhmiYrKe7GEDaaKci/2ehNMfQNF8ljX9HBJL
 driv1+NPtvLSHZhKrsVi2wAOyMQX/EZLGwpW3NqjG/mDlQv15C+B8ahMKlmk2nvdTRBRthh+q/lkj
 wsqfmSXAk+3pYN0RANadoE1Mygn0h6y2FzfAr4nlICkGb1Khx5bH8stM+bdJ/+6423JumgD2THlov
 h+dzgydRl9YUFzfGKEUXRR5avQ8wjCJyLMs1TYhTc=;
Received: from [93.119.27.212] (helo=[172.16.15.173])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oY8gY-000Bro-Qw; Tue, 13 Sep 2022 17:22:58 +0100
Message-ID: <1fdc45f4-d445-07fe-2422-4e0374a4ede1@ilande.co.uk>
Date: Tue, 13 Sep 2022 17:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20220913142818.7802-1-richard.henderson@linaro.org>
 <20220913142818.7802-3-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220913142818.7802-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 93.119.27.212
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/2] target/m68k: Perform writback before modifying SR
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.628,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/2022 15:28, Richard Henderson wrote:

> Writes to SR may change security state, which may involve
> a swap of %ssp with %usp as reflected in %a7.  Finish the
> writeback of %sp@+ before swapping stack pointers.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1206
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 87044382c3..8506da0a0b 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -2285,9 +2285,9 @@ static void gen_set_sr_im(DisasContext *s, uint16_t val, int ccr_only)
>           tcg_gen_movi_i32(QREG_CC_N, val & CCF_N ? -1 : 0);
>           tcg_gen_movi_i32(QREG_CC_X, val & CCF_X ? 1 : 0);
>       } else {
> -        TCGv sr = tcg_const_i32(val);
> -        gen_helper_set_sr(cpu_env, sr);
> -        tcg_temp_free(sr);
> +        /* Must writeback before changing security state. */
> +        do_writebacks(s);
> +        gen_helper_set_sr(cpu_env, tcg_constant_i32(val));
>       }
>       set_cc_op(s, CC_OP_FLAGS);
>   }
> @@ -2297,6 +2297,8 @@ static void gen_set_sr(DisasContext *s, TCGv val, int ccr_only)
>       if (ccr_only) {
>           gen_helper_set_ccr(cpu_env, val);
>       } else {
> +        /* Must writeback before changing security state. */
> +        do_writebacks(s);
>           gen_helper_set_sr(cpu_env, val);
>       }
>       set_cc_op(s, CC_OP_FLAGS);

Thanks Richard! Subject needs s/writback/writeback/ but anyhow:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

