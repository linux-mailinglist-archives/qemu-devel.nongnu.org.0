Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1144C10B7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:55:14 +0100 (CET)
Received: from localhost ([::1]:46716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMpIe-0004pM-Sp
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:55:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1nMpFD-0002xx-0f
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:51:39 -0500
Received: from smtpout30.security-mail.net ([85.31.212.36]:47124
 helo=fx302.security-mail.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1nMpFA-0003I8-Lv
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:51:38 -0500
Received: from localhost (localhost [127.0.0.1])
 by fx302.security-mail.net (Postfix) with ESMTP id 0D8BB3D3B187
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 11:51:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1645613490;
 bh=SNSx/s1gZqDrMkVSetzsKTcb0+S0TGFDd//qYF7vOGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=0UKPrbKKRaGs+zEpAo90jih4rOSYnS6M33TgPNoZHV0UN4rUI3VQ74A871rWMudCJ
 NOvW4NS8hBU92Q44wJRJ+yZ56AWkGyVOgCFviA7s6vs5tdXxB/0kB3nXZRRIkiy8+g
 mMZfS9dfGdg2Ix6h6V7gwTjb+NAF9lYp4pFdRkGE=
Received: from fx302 (localhost [127.0.0.1]) by fx302.security-mail.net
 (Postfix) with ESMTP id 9201A3D3B11F; Wed, 23 Feb 2022 11:51:29 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx302.security-mail.net (Postfix) with ESMTPS id 1C09E3D3B1C6; Wed, 23 Feb
 2022 11:51:29 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id F0FC527E0411; Wed, 23 Feb 2022
 11:51:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id D7EF327E0412; Wed, 23 Feb 2022 11:51:28 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 0SSi6koDpJXE; Wed, 23 Feb 2022 11:51:28 +0100 (CET)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id BC9CF27E0411; Wed, 23 Feb 2022 11:51:28 +0100
 (CET)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <3b4c.621611b1.1b4e6.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu D7EF327E0412
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1645613488;
 bh=Qk7UOYBn1MYEQFx2H2BxoloQAGiCWECusGATpD9Sang=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=gLD4UG1apwhMHlXFqtt7KrarS7VSyL6VLnsjnf2AQmVpPt7AFZjxim4Bzc7qhlTY0
 cEjZ8/t5IP5WVRbNeA8uWQm9oC5RLQcuzaZcFuKVdfwXRigsgSXlbDRqAaaSmWMDtO
 huhtVkrV+L8tb8wNQPrpKbTwdKt0Y2b7n5gt6cPY=
Date: Wed, 23 Feb 2022 11:51:28 +0100
From: Luc Michel <lmichel@kalray.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?b?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] accel/tcg/cpu-exec: fix precise single-stepping after
 interrupt
Message-ID: <20220223105128.GA9918@ws2101.lin.mbt.kalray.eu>
References: <20220214132656.11397-1-lmichel@kalray.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214132656.11397-1-lmichel@kalray.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.36; envelope-from=lmichel@kalray.eu;
 helo=fx302.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 14:26 Mon 14 Feb     , Luc Michel wrote:
> In some cases, cpu->exit_request can be false after handling the
> interrupt, leading to another TB being executed instead of returning
> to the main loop.
> 
> Fix this by returning true unconditionally when in single-step mode.
> 
> Fixes: ba3c35d9c4026361fd380b269dc6def9510b7166
> 
> Signed-off-by: Luc Michel <lmichel@kalray.eu>

Hi Richard, did you have time to have a look at this patch?
Thanks,
 
Luc

> ---
> Coming back on this issue I worked on with Richard in 2020. The issue is
> that when debugging the guest with GDB, the first instruction of the IRQ
> handler is missed by GDB (it's still executed though).
> 
> It happened to me again in TCG RR mode (but not in MTTCG). It seems that
> cpu->exit_request can be false in RR mode when returning from
> cc->tcg_ops->cpu_exec_interrupt, leading to cpu_handle_interrupt
> returning false and the next TB being executed, instead of the EXCP_DEBUG
> being handled.
> ---
>  accel/tcg/cpu-exec.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 8b4cd6c59d..74d7f83f34 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -796,13 +796,17 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
>                  /*
>                   * After processing the interrupt, ensure an EXCP_DEBUG is
>                   * raised when single-stepping so that GDB doesn't miss the
>                   * next instruction.
>                   */
> -                cpu->exception_index =
> -                    (cpu->singlestep_enabled ? EXCP_DEBUG : -1);
> -                *last_tb = NULL;
> +                if (unlikely(cpu->singlestep_enabled)) {
> +                    cpu->exception_index = EXCP_DEBUG;
> +                    return true;
> +                } else {
> +                    cpu->exception_index = -1;
> +                    *last_tb = NULL;
> +                }
>              }
>              /* The target hook may have updated the 'cpu->interrupt_request';
>               * reload the 'interrupt_request' value */
>              interrupt_request = cpu->interrupt_request;
>          }
> -- 
> 2.17.1
> 

-- 





