Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E97552473
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:14:54 +0200 (CEST)
Received: from localhost ([::1]:47190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3MrN-0003jL-1N
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3MlQ-0007mi-BM
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:08:44 -0400
Received: from smtpout140.security-mail.net ([85.31.212.143]:21613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3MlM-00052R-RP
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:08:42 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id D26B512FC6B
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 21:08:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655752116;
 bh=4j6h5RN4ZuPsCtxoq7fu+wCwTtButAjUAV/tfNzzHtc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=x1sUrgrTXzBcR65dY/dA4bHZ+2KL0H6LbvrjKa44fmGVZTnESkPPtup9MFzJoFemX
 5ohu7X+mOxDiTvKoidUCXyxsQii+HPEStcA//Y1nvcTr3jXVb6zYnKVLRAxgIRC6c6
 1CdT43DerTMPA6RGhk0A3VZjl2ylBWsh2WP0wr5A=
Received: from fx403 (localhost [127.0.0.1]) by fx403.security-mail.net
 (Postfix) with ESMTP id 431BA12FC6A; Mon, 20 Jun 2022 21:08:36 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx403.security-mail.net (Postfix) with ESMTPS id A76F612FC65; Mon, 20 Jun
 2022 21:08:35 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 8AEF627E04D6; Mon, 20 Jun 2022
 21:08:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 72ABB27E04B5; Mon, 20 Jun 2022 21:08:35 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 optY_swwzyfN; Mon, 20 Jun 2022 21:08:35 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 5481A27E04D6; Mon, 20 Jun 2022 21:08:35 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <5a94.62b0c5b3.a64cb.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 72ABB27E04B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655752115;
 bh=vuKVnQ8Q69XZwLhI/APx8t0KeXw1ob51BlKuXE92cr0=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=U/qbrR8q5wtss9Hp0jBKislSvsBg9q2tyqPKszGT+dpvx61AIkt5bnfVKu9DcQMIk
 +MBYOzfprDJT+hMaxzz0HllcUyXgmkrm1YURYHrfAo9znsKRMXQUhffejHG4AfuYkx
 T+CRN/pvStZknY9IKpeACX/VNgXK8dVmEp7bsdsA=
Date: Mon, 20 Jun 2022 21:08:34 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/7] semihosting: proper QEMU exit on semihosted exit
 syscall
Message-ID: <20220620190834.GA16887@ws2101.lin.mbt.kalray.eu>
References: <20220620142426.15040-1-lmichel@kalray.eu>
 <f7375667-4dc3-17f5-987e-a7d3339c6c00@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7375667-4dc3-17f5-987e-a7d3339c6c00@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.143; envelope-from=lmichel@kalray.eu;
 helo=smtpout140.security-mail.net
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

On 08:59 Mon 20 Jun     , Richard Henderson wrote:
> On 6/20/22 07:24, Luc Michel wrote:
> > Hi,
> > 
> > This series implements a clean way for semihosted exit syscalls to
> > terminate QEMU with a given return code.
> > 
> > Until now, exit syscalls implementations consisted in calling exit()
> > with the wanted return code. The problem with this approach is that
> > other CPUs are not properly stopped, leading to possible crashes in
> > MTTCG mode, especially when at_exit callbacks have been registered. This
> > can be the case e.g., when plugins are in use. Plugins can register
> > at_exit callbacks. Those will be called on the CPU thread the exit
> > syscall is comming from, while other CPUs can continue to run and thus
> > call other plugin callbacks.
> > 
> > The semihosting_exit_request function provides a mean to cleanly
> > terminate QEMU. It introduces an new exit reason
> > (SHUTDOWN_CAUSE_GUEST_SEMI_EXIT) used in this case. The CPU is stopped
> > and returns to the main CPU loop so that no more instruction get
> > executed (the semihosting_exit_request is declared G_NORETURN).
> > 
> > All targets are converted to use this new function.
> 
> Did you test a complete build?  At a glance I would guess that
> arm-linux-user will no longer link because qemu_set/get_exit_status is
> missing.

You are right I forgot to test build *-linux-user. There is a
compilation issue because I forgot "static inline" on the
semihosting_exit_request function on the CONFIG_USER_ONLY side. I'll fix
that in v2.

qemu_set/get_exit_status is fine though as it is only called from
softmmu-only code (and declared in sysemu/sysemu.h).

thanks,
Luc

> 
> 
> r~
> 
> > 
> > Thanks,
> > Luc
> > 
> > Luc Michel (7):
> >    softmmu: add qemu_[set|get]_exit_status functions
> >    semihosting: add the semihosting_exit_request function
> >    semihosting/arm-compat-semi: use semihosting_exit_request
> >    target/m68k: use semihosting_exit_request on semihosted exit syscall
> >    target/mips: use semihosting_exit_request on semihosted exit syscall
> >    target/nios2: use semihosting_exit_request on semihosted exit syscall
> >    target/xtensa: use semihosting_exit_request on semihosted exit syscall
> > 
> >   qapi/run-state.json                |  4 +++-
> >   include/semihosting/semihost.h     |  4 ++++
> >   include/sysemu/sysemu.h            |  2 ++
> >   semihosting/arm-compat-semi.c      |  3 +--
> >   semihosting/config.c               | 17 +++++++++++++++++
> >   softmmu/main.c                     |  2 +-
> >   softmmu/runstate.c                 | 11 +++++++++++
> >   target/m68k/m68k-semi.c            |  4 ++--
> >   target/mips/tcg/sysemu/mips-semi.c |  2 +-
> >   target/nios2/nios2-semi.c          |  4 ++--
> >   target/xtensa/xtensa-semi.c        |  2 +-
> >   11 files changed, 45 insertions(+), 10 deletions(-)
> > 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=bb16.62b09954.79e61.0&r=lmichel%40kalray.eu&s=richard.henderson%40linaro.org&o=Re%3A+%5BPATCH+0%2F7%5D+semihosting%3A+proper+QEMU+exit+on+semihosted+exit+syscall&verdict=C&c=d52db680df8df28629e4a26f18787c389730fd78
> 

-- 





