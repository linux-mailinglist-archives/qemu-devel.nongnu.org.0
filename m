Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A14B5595E3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:58:48 +0200 (CEST)
Received: from localhost ([::1]:38442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4f9K-0004zL-W0
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4exI-0006MP-RP
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:46:21 -0400
Received: from smtpout30.security-mail.net ([85.31.212.36]:23122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4exG-0008Ba-TT
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:46:20 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx301.security-mail.net (Postfix) with ESMTP id B275E24BD16D
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 10:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656060375;
 bh=+G/wbc5HugLNdFotwYpmZ2f3zkl3qiiPN5Vbv8p7ABY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=T/rB/NF03ouOw955Jxl+GhZ2EL5MrwGv+groqLb18PtLFGtY0nrP4EK/swjEfKmDr
 auBPUzjWVWw9Urn12iZA3c7nW4KQ174QOYF48tCMy3AaWP7s2mm6PpEEtAKPK7kWlS
 UDx024oc9Pzw+MMHnC2Xrc/6wV/Txhn+NRxkW1N8=
Received: from fx301 (localhost [127.0.0.1]) by fx301.security-mail.net
 (Postfix) with ESMTP id B7FEE24BD10B; Fri, 24 Jun 2022 10:46:14 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx301.security-mail.net (Postfix) with ESMTPS id 26E0C24BD0FA; Fri, 24 Jun
 2022 10:46:14 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 0C4E027E04FB; Fri, 24 Jun 2022
 10:46:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id E94C727E04FD; Fri, 24 Jun 2022 10:46:13 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 VkZz5JelWqFT; Fri, 24 Jun 2022 10:46:13 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id D061E27E04FB; Fri, 24 Jun 2022 10:46:13 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <ff4e.62b579d6.261c7.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu E94C727E04FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656060373;
 bh=9Qfl4IvpeaPsvmY0p5ayRALr6XPC7HDqe2MqXhpNpxk=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=Wof/iJJxZquJp0PNMEihVmZOGMunzzMCn8VomvIOuud3DIh5lohFg0e3rUPRCZcxC
 xjHa7k8ENOMyi3iDYCZZZ5Sjiy6ddp/A0eWdNUb9kqnD7Iy4BcfLVE5bj+VeZDxx2l
 loc39FaDqvtVJmGwg6bXX+Gz4i+ekaRkbTL9+X/A=
Date: Fri, 24 Jun 2022 10:46:13 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 42/53] semihosting: Pass CPUState to
 qemu_semihosting_console_inc
Message-ID: <20220624084613.GJ25499@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-43-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-43-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.36; envelope-from=lmichel@kalray.eu;
 helo=smtpout30.security-mail.net
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

On 13:45 Tue 07 Jun     , Richard Henderson wrote:
> We don't need CPUArchState, and we do want the CPUState of the
> thread performing the operation -- use this instead of current_cpu.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/console.h |  4 ++--
>  linux-user/semihost.c         |  2 +-
>  semihosting/arm-compat-semi.c |  2 +-
>  semihosting/console.c         | 12 ++++++------
>  4 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/include/semihosting/console.h b/include/semihosting/console.h
> index 4f6217bf10..27f8e9ae2e 100644
> --- a/include/semihosting/console.h
> +++ b/include/semihosting/console.h
> @@ -39,7 +39,7 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
>  
>  /**
>   * qemu_semihosting_console_inc:
> - * @env: CPUArchState
> + * @cs: CPUState
>   *
>   * Receive single character from debug console.  As this call may block
>   * if no data is available we suspend the CPU and will re-execute the
> @@ -50,7 +50,7 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
>   *
>   * Returns: character read OR cpu_loop_exit!
>   */
> -target_ulong qemu_semihosting_console_inc(CPUArchState *env);
> +target_ulong qemu_semihosting_console_inc(CPUState *cs);
>  
>  /**
>   * qemu_semihosting_log_out:
> diff --git a/linux-user/semihost.c b/linux-user/semihost.c
> index 17f074ac56..f14c6ae21d 100644
> --- a/linux-user/semihost.c
> +++ b/linux-user/semihost.c
> @@ -56,7 +56,7 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
>   * program is expecting more normal behaviour. This is slow but
>   * nothing using semihosting console reading is expecting to be fast.
>   */
> -target_ulong qemu_semihosting_console_inc(CPUArchState *env)
> +target_ulong qemu_semihosting_console_inc(CPUState *cs)
>  {
>      uint8_t c;
>      struct termios old_tio, new_tio;
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index f992b60b6b..e7de52d042 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -427,7 +427,7 @@ void do_common_semihosting(CPUState *cs)
>          break;
>  
>      case TARGET_SYS_READC:
> -        ret = qemu_semihosting_console_inc(env);
> +        ret = qemu_semihosting_console_inc(cs);
>          common_semi_set_ret(cs, ret);
>          break;
>  
> diff --git a/semihosting/console.c b/semihosting/console.c
> index 3dd0ac60e2..7b896fe43b 100644
> --- a/semihosting/console.c
> +++ b/semihosting/console.c
> @@ -144,17 +144,17 @@ static void console_read(void *opaque, const uint8_t *buf, int size)
>      c->sleeping_cpus = NULL;
>  }
>  
> -target_ulong qemu_semihosting_console_inc(CPUArchState *env)
> +target_ulong qemu_semihosting_console_inc(CPUState *cs)
>  {
>      uint8_t ch;
>      SemihostingConsole *c = &console;
> +
>      g_assert(qemu_mutex_iothread_locked());
> -    g_assert(current_cpu);
>      if (fifo8_is_empty(&c->fifo)) {
> -        c->sleeping_cpus = g_slist_prepend(c->sleeping_cpus, current_cpu);
> -        current_cpu->halted = 1;
> -        current_cpu->exception_index = EXCP_HALTED;
> -        cpu_loop_exit(current_cpu);
> +        c->sleeping_cpus = g_slist_prepend(c->sleeping_cpus, cs);
> +        cs->halted = 1;
> +        cs->exception_index = EXCP_HALTED;
> +        cpu_loop_exit(cs);
>          /* never returns */
>      }
>      ch = fifo8_pop(&c->fifo);
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=77cd.629fd666.e5059.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+42%2F53%5D+semihosting%3A+Pass+CPUState+to+qemu_semihosting_console_inc&verdict=C&c=f31b95a8de28ae0d1f01d90dfc034138189ae5d1
> 

-- 





