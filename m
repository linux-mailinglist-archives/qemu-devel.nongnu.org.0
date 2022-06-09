Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28418545545
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:04:25 +0200 (CEST)
Received: from localhost ([::1]:59688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzOOG-0007YF-1E
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1nzOM0-0005YE-H9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:02:04 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1nzOLv-00041z-NI
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:02:02 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 69687C60912;
 Thu,  9 Jun 2022 22:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1654804914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JZmLYN566UYEZCxfKrSrMeSnX0LH7q50GE5RQUQHJ4Q=;
 b=f2vvqaqvnb2pmxx8Y+TxMocYfBPfLmVqyWJ4sfzW5H28gUrUdggiSZJXcPFswsgDR7Os8a
 y3oiMyp2oQOkbIRWn83tq9qA1SSK6NUPu1KjgqYJrzJQqMdAaJJjxzU8xYTPgI/rGgCej7
 94Fy+6CViMOre71aa6nXPTU5/+12dACI/+/2/DcdGnRQmoBP4L38NRiRsE/AdYImxklPbW
 IiRVr/t+iTBFuQ5KLbqWAqCSpymO6AhjSkdg5QhHgqlRh7CmKJzGShRGHzSr4BevqzniVH
 V1bXhkEHFhvkID3ZOWwY1w8eWO8oKtfmHNqWlxE44FzlVJm0dTzKYENkKMu0jg==
Date: Thu, 9 Jun 2022 22:01:54 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH 1/2] gdbstub: Don't use GDB syscalls if no GDB is attached
Message-ID: <YqJRAjU8WjPuIdGi@michell-laptop.localdomain>
References: <20220526190053.521505-1-peter.maydell@linaro.org>
 <20220526190053.521505-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526190053.521505-2-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20:00 Thu 26 May     , Peter Maydell wrote:
> In two places in gdbstub.c we look at gdbserver_state.init to decide
> whether we're going to do a semihosting syscall via the gdb remote
> protocol:
>  * when setting up, if the user didn't explicitly select either
>    native semihosting or gdb semihosting, we autoselect, with the
>    intended behaviour "use gdb if gdb is connected"
>  * when the semihosting layer attempts to do a syscall via gdb, we
>    silently ignore it if the gdbstub wasn't actually set up
> 
> However, if the user's commandline sets up the gdbstub but tells QEMU
> to start rather than waiting for a GDB to connect (eg using '-s' but
> not '-S'), then we will have gdbserver_state.init true but no actual
> connection; an attempt to use gdb syscalls will then crash because we
> try to use gdbserver_state.c_cpu when it hasn't been set up:
> 
> #0  0x00007ffff6803ba8 in qemu_cpu_kick (cpu=0x0) at ../../softmmu/cpus.c:457
> #1  0x00007ffff6c03913 in gdb_do_syscallv (cb=0x7ffff6c19944 <common_semi_cb>,
>     fmt=0x7ffff7573b7e "", va=0x7ffff56294c0) at ../../gdbstub.c:2946
> #2  0x00007ffff6c19c3a in common_semi_gdb_syscall (cs=0x7ffff83fe060,
>     cb=0x7ffff6c19944 <common_semi_cb>, fmt=0x7ffff7573b75 "isatty,%x")
>     at ../../semihosting/arm-compat-semi.c:494
> #3  0x00007ffff6c1a064 in gdb_isattyfn (cs=0x7ffff83fe060, gf=0x7ffff86a3690)
>     at ../../semihosting/arm-compat-semi.c:636
> #4  0x00007ffff6c1b20f in do_common_semihosting (cs=0x7ffff83fe060)
>     at ../../semihosting/arm-compat-semi.c:967
> #5  0x00007ffff693a037 in handle_semihosting (cs=0x7ffff83fe060)
>     at ../../target/arm/helper.c:10316
> 
> You can probably also get into this state via some odd
> corner cases involving connecting a GDB and then telling it
> to detach from all the vCPUs.
> 
> Abstract out the test into a new gdb_attached() function
> which returns true only if there's actually a GDB connected
> to the debug stub and attached to at least one vCPU.
> 
> Reported-by: Liviu Ionescu <ilg@livius.net>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
> Silently doing nothing in gdb_do_syscallv(), never calling the
> callback function, is kind of dodgy.  But it's what the code is doing
> already, and besides it's not clear what we should do if the user
> specifically says "semihosting calls via the gdb stub" and then
> doesn't connect gdb...
> ---
>  gdbstub.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index a3ff8702cef..88a34c8f522 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -443,6 +443,15 @@ static int get_char(void)
>  }
>  #endif
>  
> +/*
> + * Return true if there is a GDB currently connected to the stub
> + * and attached to a CPU
> + */
> +static bool gdb_attached(void)
> +{
> +    return gdbserver_state.init && gdbserver_state.c_cpu;
> +}
> +
>  static enum {
>      GDB_SYS_UNKNOWN,
>      GDB_SYS_ENABLED,
> @@ -464,8 +473,7 @@ int use_gdb_syscalls(void)
>      /* -semihosting-config target=auto */
>      /* On the first call check if gdb is connected and remember. */
>      if (gdb_syscall_mode == GDB_SYS_UNKNOWN) {
> -        gdb_syscall_mode = gdbserver_state.init ?
> -            GDB_SYS_ENABLED : GDB_SYS_DISABLED;
> +        gdb_syscall_mode = gdb_attached() ? GDB_SYS_ENABLED : GDB_SYS_DISABLED;
>      }
>      return gdb_syscall_mode == GDB_SYS_ENABLED;
>  }
> @@ -2886,7 +2894,7 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
>      target_ulong addr;
>      uint64_t i64;
>  
> -    if (!gdbserver_state.init) {
> +    if (!gdb_attached()) {
>          return;
>      }
>  
> -- 
> 2.25.1
> 
> 

-- 
+---------------------+--------------------------+
| Luc MICHEL          | TIMA Lab / SLS Team      |
|                     | Phone: +33 4 76 57 43 34 |
+---------------------+--------------------------+

