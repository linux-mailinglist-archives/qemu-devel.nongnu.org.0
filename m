Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D94155200E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:12:39 +0200 (CEST)
Received: from localhost ([::1]:54062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3J4w-0004Zl-Cr
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3J38-000316-Ja
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:10:46 -0400
Received: from smtpout140.security-mail.net ([85.31.212.143]:58496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3J36-0008JC-CF
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:10:46 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id 2FD4E116FB7
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 17:10:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655737841;
 bh=n8z1QnEzU41TcCH6Pw6bYlVQDNAg/NCBm3ukt5GYJqI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=nEGZcWNKyCHD7Cx7nBpGqKHeElphzIQZGCX8h4r1AGEqIxxhAjbaNnuqyo4TrmtuH
 sLFxRIt8M3G1qeMRGBfu9DMvBcwyx0D15C6GsUx8/Q8xgycf4gfInN7NmtxF8Dz1lX
 Ar8G2Fn42jUS23HYhfqvbzX3QxLL19EKK5Lrn8e4=
Received: from fx403 (localhost [127.0.0.1]) by fx403.security-mail.net
 (Postfix) with ESMTP id 2908D116F89; Mon, 20 Jun 2022 17:10:39 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx403.security-mail.net (Postfix) with ESMTPS id 87B6B116F7A; Mon, 20 Jun
 2022 17:10:38 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 62B6927E04B5; Mon, 20 Jun 2022
 17:10:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 4772427E04D6; Mon, 20 Jun 2022 17:10:38 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 i_u8DkW2PGSj; Mon, 20 Jun 2022 17:10:38 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 2AAA727E04B5; Mon, 20 Jun 2022 17:10:38 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <17990.62b08dee.86cbd.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 4772427E04D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655737838;
 bh=j7it9fC6s7jGiN4T6wyBs/vOt6uQy52H6/9CGanBiO8=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=Kq5oo2ybUF8C7EBOkDVz6Ghkp5EFnB78nJONmXEb/XvdmXrNtGYtpeOz3t93Yztm9
 i25gs/XLOPqSuEsTUT9UrEMkzStWNko+M/Vvar2Yrsx6D6LzhN46s0uPF+YAIqS4/Q
 9lg86d8vSAFT9os1pZexY2Kivw+BlpnF4O8/zwow=
Date: Mon, 20 Jun 2022 17:10:37 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?b?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Alex =?utf-8?b?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno
 <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH 0/7] semihosting: proper QEMU exit on semihosted exit
 syscall
Message-ID: <20220620151037.GB4427@ws2101.lin.mbt.kalray.eu>
References: <20220620142426.15040-1-lmichel@kalray.eu>
 <CAFEAcA-++01L_S=G13AtMO9n4H0vvHZf3M68SOTAJ4sOzu9KGw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFEAcA-++01L_S=G13AtMO9n4H0vvHZf3M68SOTAJ4sOzu9KGw@mail.gmail.com>
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

On 15:35 Mon 20 Jun     , Peter Maydell wrote:
> On Mon, 20 Jun 2022 at 15:25, Luc Michel <lmichel@kalray.eu> wrote:
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
> 
> The other option would be to say "if you register an atexit
> callback in your plugin that's your problem to sort out" :-)
> There's lots of situations where code inside QEMU might just
> call exit(), not just this one. (Mostly these are "we detected
> an error and decided to just bail out" codepaths.)

Sorry I was a bit unclear. I meant plugins using the
qemu_plugin_register_atexit_cb() register function, not directly calling
atexit(). This function documentation stats:

"Plugins should be able to free all their resources at this point much like
after a reset/uninstall callback is called."

If other CPUs are still running, this is not possible. I guess it's
reasonable to assume CPUs have reached a quiescent state when those
callbacks are called.

> 
> Is there a situation where we get a crash that doesn't involve
> code in a plugin doing something odd?

I'm not sure... I always feel a bit uncomfortable calling exit() from
a CPU thread in the middle of a translation block :)
I guess if you're monitoring QEMU through a QMP connection, it's better
to have a proper exit reason than having the connection suddenly
dropped. I guess the semihosting mode is not that popular among QEMU
users so there are probably other corner cases I'm not aware about. 

Thanks,

Luc





