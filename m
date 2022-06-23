Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2BF5573BC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 09:18:31 +0200 (CEST)
Received: from localhost ([::1]:45498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4H6j-0004iA-PD
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 03:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4H5F-00041l-12
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 03:16:57 -0400
Received: from smtpout30.security-mail.net ([85.31.212.34]:54167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4H5C-0001QB-D5
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 03:16:56 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx304.security-mail.net (Postfix) with ESMTP id DE0A3628C7
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 09:16:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655968609;
 bh=dgwmjKDMGy1CQmp+g/3Ly7W1BOQjJ6L+d+CAaTvF35g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=4r6LGK1XaNnDUfhlBKrrNvBtR3VSBA88xy+muAypxpzDaHCP5D50yXal/3rX04yLK
 ZRNvcUfgveMBg+kfX5ODBlScQ6vmCCaSK8LSgL8stOdrogxlhI2QRQLrCVz9eNzffr
 75rpEqIZdUL5osmqS8/JJ9anbpz9lZL4vKpv+Obs=
Received: from fx304 (localhost [127.0.0.1]) by fx304.security-mail.net
 (Postfix) with ESMTP id 31E21628BC; Thu, 23 Jun 2022 09:16:46 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx304.security-mail.net (Postfix) with ESMTPS id 9490F62815; Thu, 23 Jun
 2022 09:16:45 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 7273A27E04F3; Thu, 23 Jun 2022
 09:16:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 57ACC27E04EF; Thu, 23 Jun 2022 09:16:45 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 otGbyOYm21iy; Thu, 23 Jun 2022 09:16:45 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 384D227E04CD; Thu, 23 Jun 2022 09:16:45 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <3a9b.62b4135d.9405c.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 57ACC27E04EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655968605;
 bh=EezAvu70wegqdTdE47oftajkVB2BV9+eIlh4X7JxD/U=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=h3jwz6TO3rawopbijVZnEFULMo3TeI50wJO/KJtXMcDpnEL5Sl1ddUnMCZJn0qOPl
 5xSZWkzE1vKt+sYw1jXT38sfsPMMdJUsoK8PzTd7XnCLHn+fARI9CbJShnsA6Hqsa1
 lEECpKlCz/jnQsWz0RjwLD1G8igTozkjkVM9gx7o=
Date: Thu, 23 Jun 2022 09:16:44 +0200
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
Subject: Re: [PATCH v2 2/7] semihosting: add the semihosting_exit_request
 function
Message-ID: <20220623071644.GA31252@ws2101.lin.mbt.kalray.eu>
References: <20220621125916.25257-1-lmichel@kalray.eu>
 <20220621125916.25257-3-lmichel@kalray.eu>
 <CAFEAcA-Z=rYWnpceM-Ojvi2QoxkmZzSZqnjKgH1WFdwCDi9O3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFEAcA-Z=rYWnpceM-Ojvi2QoxkmZzSZqnjKgH1WFdwCDi9O3A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.34; envelope-from=lmichel@kalray.eu;
 helo=smtpout30.security-mail.net
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

On 20:09 Wed 22 Jun     , Peter Maydell wrote:
> On Tue, 21 Jun 2022 at 13:59, Luc Michel <lmichel@kalray.eu> wrote:
> >
> > Add the semihosting_exit_request function to be used by targets when
> > handling an `exit' semihosted syscall. This function calls gdb_exit to
> > close existing GDB connections, and qemu_system_shutdown_request with
> > the new `guest-semi-exit' exit reason. It sets the QEMU exit status
> > given by the exit syscall parameter. Finally it stops the CPU to prevent
> > further execution, and exit the CPU loop as the syscall caller expects
> > this syscall to not return.
> >
> > This function is meant to be used in place of a raw exit() call when
> > handling semihosted `exit' syscalls. Such a call is not safe because
> > it does not allow other CPU threads to exit properly, leading to e.g.
> > at_exit callbacks being called while other CPUs still run. This can lead
> > to strange bugs, especially in plugins with a registered at_exit function.
> 
> This is mixing up two things:
>  (1) fixing bugs with the plugin code when code (semihosting or
>      otherwise) calls exit()
>  (2) reporting to the monitor when the guest exits because it
>      asked to via semihosting
> 
> I remain unconvinced that this series is actually fixing (1),
> I think it's just working around the most common cause of it.
> For (2), maybe we want it, but that should I think be a
> separate patchset with justification of why it's useful to
> tell the monitor about it. I think on balance it probably
> is a good idea, but I disagree about (1) and would like to
> see these two things not tangled up in the same series.

OK. I'll rework this once Richard's semihosting cleanup series is
merged.

thanks.

Luc

> 
> thanks
> -- PMM
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=11a39.62b36915.466b.0&r=lmichel%40kalray.eu&s=peter.maydell%40linaro.org&o=Re%3A+%5BPATCH+v2+2%2F7%5D+semihosting%3A+add+the+semihosting_exit_request+function&verdict=C&c=b75eec0eae9b68db747812558b665a75218eca91
> 

-- 





