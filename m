Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B4467D83C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 23:14:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLAUU-000173-VA; Thu, 26 Jan 2023 17:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pLAUS-00016m-Pv
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 17:13:04 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pLAUR-0002l1-11
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 17:13:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=swAACHCK5CNJOiDYtIsij/Zyru/im0bVttIJ1oRwVQc=; b=CUlGb2naZJQWJGDKF/tzZLRpi8
 oat+vZZWoRbf4EtRHiAnvrjcSpD5cj3GBZnSfP7yqqPWCg2EkVdhARu7sNGMPtZL9WgTnuDD3qA1m
 u/moU+1vr8B9xAwZskGkbKX2qS68zCg/9CbA9HkaVbN6/vniBF2fZVwJNqwjJTnqy2ZpqAWnh/V0r
 74GYsthLNgJ+z2YjDafl9SOJIp3jOPWvsBRc6+kLLo+kBHVUwvLPGEq6YpdJVbZvKmKamGTHecpjR
 fDO7we2LbRim8X4jTAQTfvRAuPKhtKOfpUuNfI7VY+A5BB0aQoIj5YvrcK32JMjRxvA0uQKyg3nBv
 1DoiLqgNsH2DxIcomitMKd7CeqgX9C0p5BNDykERzR2tzl6/7l1XBnACzK0xgCWatUx/82p+E4LwF
 AVl5DYugqertbDyV6dwUXJy1ULdIYeZMkxZ/j+mAqfjL9NTtchzgr1w3IKG0SbGa8lBMm+H3bKjcV
 CF4XucnA01ERG/OiNHg5XTLm1+SuCSByPuQ3WAe4cYVdU7UKzb9p5mRkLidP5qxdzeTIruA9XwrW9
 01PQRv78xZAsq3rlgNHWp0pPeT2UpVVERVhLZC7OBO8UT2xuQqOxeuBxtiPHdQtDPjjTFBiN5AdAW
 U7Qy7ppd7Zywymk2JrL6ydXTSmaQVv3IQXHWcrua8=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pLATt-000BDW-M8; Thu, 26 Jan 2023 22:12:33 +0000
Message-ID: <3326f36b-69f1-98ef-3721-bcee188a7905@ilande.co.uk>
Date: Thu, 26 Jan 2023 22:12:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20230126125234.3186042-1-laurent@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230126125234.3186042-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] m68k: fix 'bkpt' instruction in softmmu mode
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
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

On 26/01/2023 12:52, Laurent Vivier wrote:

> In linux-user mode, 'bkpt' generates an EXP_DEBUG exception to allow
> QEMU gdb server to intercept and manage the operation with an external
> debugger.
> 
> In softmmu mode, the instruction must generate an illegal instruction
> exception as it is on real hardware to be managed by the kernel.
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/146

Hi Laurent,

I think this should be https://gitlab.com/qemu-project/qemu/-/issues/1462?

> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   target/m68k/translate.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 18418312b14b..31178c3b1d17 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -2774,7 +2774,11 @@ DISAS_INSN(swap)
>   
>   DISAS_INSN(bkpt)
>   {
> +#if defined(CONFIG_SOFTMMU)
> +    gen_exception(s, s->base.pc_next, EXCP_ILLEGAL);
> +#else
>       gen_exception(s, s->base.pc_next, EXCP_DEBUG);
> +#endif
>   }
>   
>   DISAS_INSN(pea)


ATB,

Mark.

