Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602D047A13A
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 16:57:25 +0100 (CET)
Received: from localhost ([::1]:41518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myyYu-0003qV-AU
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 10:57:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myyX7-00026N-Lv
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 10:55:35 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:59747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myyX5-0004PM-SN
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 10:55:33 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MtwMc-1me9I91ZcK-00uJL6; Sun, 19 Dec 2021 16:55:17 +0100
Message-ID: <87c9f71f-ed9d-03e4-9a0e-594b649525b5@vivier.eu>
Date: Sun, 19 Dec 2021 16:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] linux-user/signal: Map exit signals in SIGCHLD siginfo_t
Content-Language: fr
To: qemu-devel@nongnu.org
References: <81534fde7cdfc6acea4889d886fbefdd606630fb.1635019124.git.mschiffer@universe-factory.net>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <81534fde7cdfc6acea4889d886fbefdd606630fb.1635019124.git.mschiffer@universe-factory.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gTH7pc6Gt6fMjLsvhaiF/gEVb1clsh5UqB1j+llR+aos7ZnCih1
 Myp49c4bDGtB/f5rAT+VXN48CCv9uIU0gOUkW6Um4doYOWHa9avw8zS1hReqzYKMSErlPm3
 Hz7wv9zY0IthF5vcISRrXednHKdP410M99uLU+7FAH2ba46PnK++58plNJjXiczcmc6Lt88
 4FWoKcNH5PquBG2/uggoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:748EMlj/Uz0=:q+28O1UmWqQRNvpjNeLKwU
 GiWLhIDRqjBJ4dBux+U0aEDYB8igqv6gckKOJLvGOy3eFF+BR/iSdWM8bBYOhWAmPq8qgqYIN
 lZ4ds+JHsqgNprRYn7eBXr0saK4XJeIEAwaoVNYEaZfaVv9vw/9kq4+5Wos6OAmU75LITE5uY
 SgevVaPqJ6HYHgW+ZJNECeNrouAUap6EhcYlaLAoiTk4xmEQE51I9n0GLNGCzB8koYHr3Z+IZ
 scbzSK9ERZYTJaNakvLy1JxR2WyZaaKgDRFa4i5LrP58DW5hoMlW3S2rk+FcAY903mz7qdP6j
 lxAA7vjhsrw9Ak0RMRyKVeMALaOFqaKUQtH5XQvViCf7oxJEWLZrENlf87fUq1Ei3ZZdhZ8P3
 mCA5bmXULmnJTtIqFLgSwM1mrBhSlIaxpzdpwLiXsnitWT1D4ow+S81D91W8LFspw1SD7kXB7
 SkFVf2/3JBVV6RUKxbjg/cyM3bNrCf40YpjkFViqtel6bKVfB7feKNxlOr3r104KhY9yAODxT
 y+9G/guWi7GLYFp1AeB/VDu+iDheSkdDYQ9RIn9HzDres0JApP6uho3G9nrnqEqmwpCYhV8J/
 PMgQtTXLLwxDWpTAiDNoBxM3u/gS2/yPyM4WMzxHxC1z2RiiRIX+SgvXCUaZ3qBjUztv7pHaw
 lGFU+38SJxKMimQQrin7D5/MIkT4FLpNZhoTS1LAlj+6yBT6w9qhHjRfR5PB8JMqEfTU=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.563,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Andreas_K=2e_H=c3=bcttel?= <dilfridge@gentoo.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Matthias Schiffer <mschiffer@universe-factory.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC'ing Alistair and Andreas that were involved in original fix 1c3dfb506ea3 ("linux-user/signal: 
Decode waitid si_code")

Thanks,
Laurent

Le 23/10/2021 à 21:59, Matthias Schiffer a écrit :
> When converting a siginfo_t from waitid(), the interpretation of si_status
> depends on the value of si_code: For CLD_EXITED, it is an exit code and
> should be copied verbatim. For other codes, it is a signal number
> (possibly with additional high bits from ptrace) that should be mapped.
> 
> This code was previously changed in commit 1c3dfb506ea3
> ("linux-user/signal: Decode waitid si_code"), but the fix was
> incomplete.
> 
> Tested with the following test program:
> 
>      #include <stdio.h>
>      #include <stdlib.h>
>      #include <unistd.h>
>      #include <sys/wait.h>
> 
>      int main() {
>      	pid_t pid = fork();
>      	if (pid == 0) {
>      		exit(12);
>      	} else {
>      		siginfo_t siginfo = {};
>      		waitid(P_PID, pid, &siginfo, WEXITED);
>      		printf("Code: %d, status: %d\n", (int)siginfo.si_code, (int)siginfo.si_status);
>      	}
> 
>      	pid = fork();
>      	if (pid == 0) {
>      		raise(SIGUSR2);
>      	} else {
>      		siginfo_t siginfo = {};
>      		waitid(P_PID, pid, &siginfo, WEXITED);
>      		printf("Code: %d, status: %d\n", (int)siginfo.si_code, (int)siginfo.si_status);
>      	}
>      }
> 
> Output with an x86_64 host and mips64el target before 1c3dfb506ea3
> (incorrect: exit code 12 is translated like a signal):
> 
>      Code: 1, status: 17
>      Code: 2, status: 17
> 
> After 1c3dfb506ea3 (incorrect: signal number is not translated):
> 
>      Code: 1, status: 12
>      Code: 2, status: 12
> 
> With this patch:
> 
>      Code: 1, status: 12
>      Code: 2, status: 17
> 
> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
> ---
>   linux-user/signal.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 14d8fdfde152..8e3af98ec0a7 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -403,7 +403,12 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
>           case TARGET_SIGCHLD:
>               tinfo->_sifields._sigchld._pid = info->si_pid;
>               tinfo->_sifields._sigchld._uid = info->si_uid;
> -            tinfo->_sifields._sigchld._status = info->si_status;
> +            if (si_code == CLD_EXITED)
> +                tinfo->_sifields._sigchld._status = info->si_status;
> +            else
> +                tinfo->_sifields._sigchld._status
> +                    = host_to_target_signal(info->si_status & 0x7f)
> +                        | (info->si_status & ~0x7f);
>               tinfo->_sifields._sigchld._utime = info->si_utime;
>               tinfo->_sifields._sigchld._stime = info->si_stime;
>               si_type = QEMU_SI_CHLD;
> 


