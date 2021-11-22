Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5AA459193
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 16:44:36 +0100 (CET)
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpBUg-0000S2-TW
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 10:44:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mpBTe-00083w-KY
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:43:30 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:50095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mpBTb-0006lS-V5
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:43:30 -0500
Received: from [192.168.100.1] ([82.142.2.234]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MWAf4-1n8RJm48d8-00XgP1; Mon, 22 Nov 2021 16:43:25 +0100
Message-ID: <38b341b4-1aae-91b5-9f4c-aa451a6f4157@vivier.eu>
Date: Mon, 22 Nov 2021 16:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-6.2 0/2] linux-user: Create a common
 rewind_if_in_safe_syscall
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>
References: <20211122131200.229286-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211122131200.229286-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4VB16JN39WrPShxNcFI41fxdjKY9Z2IlWHxjTjS6P4LbaSKkrzs
 iiviJUd6dYJPfo/L2wLstF3JwsHsu8x36oaJulAeR/w9IJzTZkb2CgP9DKo4qTN6X5snxWp
 L5fH2ZtrcZ+T72H1eL3QBrpozomnNUcK5JCRk62DlZCJUC5kUINW27tghlSfQEk6pcwgGla
 1olPS8IHWym9ZjosYyO4A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YCaMkajbaA4=:QtK0EyVm9+tXCtPRGAmmvE
 yuU1YjbY3EpmDB86LN1Q0mULXVlpHqN+rDV0bewBfg1D9TOgBNkA5ZJKTY4QAjMQfoaOYG4eq
 qpdt6GOkxS6lEJHtRrPD6WWaCRqO5An/yudmD4f0AC2//4Re1Mq4gS8LZy5FC7iDilqlbkwrx
 vnqaXS/SAIhxFc0lpCycn2IoY9baHuYvAvJuQD7KhTFYyWCkSGhdVhv9Y5Ihytg/IVB2Lcvnq
 t4WnVW3qIjr9USu3gfHVUYlLKSAxpXEzuWxcgOU+XoExWRk7JSALb3+0Y0iC6IHU/rjqve4Pu
 Q+AjGYPboIFtErMKR76vr/nUnemLYTVp1fYdKkILQn3m/r6f+he9+awKdcbFX3ohxsgSzk6Nf
 FGWbMK44Uu5wjjWnM8ONiFZXhR+mrX5SY3Ogr1GKr9wfQn3LP8JKCmQ3G2EPwNZNGfnhR1Q1G
 3IK/M/vjn4mM2ZyPNKQ2A+9kUM9iFiBxMiBWc+sNx1oF0pknkIEjggBHhdZvbYsnWUFVqFcIb
 t3BsIgQ1OWTf8ZSIHQAzLfxc8KMHRnRnChdb7BR5Q5MAs4S1xwASBiUcyuPJCZwXwULtnZEsT
 6361m1Y3tT0N79hDOIB+TzHmuLErP8h3sPOCmEY8IutjEfpjdeC7qWcFpCydqpM6bV1J06Zm4
 rZkOcrILeKH3EFQ88SeLqbL+ZpDxOVCYTy94JU3KQgzf9cDN/Fuecs0SyeBtoazp03ag=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: raj.khem@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Le 22/11/2021 à 14:11, Richard Henderson a écrit :
> This is a re-packaging of two of Warner's patches that
> fix a build issue on aarch64 using musl:
> 
> https://lore.kernel.org/qemu-devel/20211108194230.1836262-1-raj.khem@gmail.com/
> 
> 
> r~
> 
> 
> Warner Losh (2):
>    linux-user: Add host_signal_set_pc to set pc in mcontext
>    linux-user/signal.c: Create a common rewind_if_in_safe_syscall
> 
>   linux-user/host/aarch64/host-signal.h |  5 +++++
>   linux-user/host/aarch64/hostdep.h     | 20 --------------------
>   linux-user/host/alpha/host-signal.h   |  5 +++++
>   linux-user/host/arm/host-signal.h     |  5 +++++
>   linux-user/host/arm/hostdep.h         | 20 --------------------
>   linux-user/host/i386/host-signal.h    |  5 +++++
>   linux-user/host/i386/hostdep.h        | 20 --------------------
>   linux-user/host/mips/host-signal.h    |  5 +++++
>   linux-user/host/ppc/host-signal.h     |  5 +++++
>   linux-user/host/ppc64/hostdep.h       | 20 --------------------
>   linux-user/host/riscv/host-signal.h   |  5 +++++
>   linux-user/host/riscv/hostdep.h       | 20 --------------------
>   linux-user/host/s390/host-signal.h    |  5 +++++
>   linux-user/host/s390x/hostdep.h       | 20 --------------------
>   linux-user/host/sparc/host-signal.h   |  9 +++++++++
>   linux-user/host/x86_64/host-signal.h  |  5 +++++
>   linux-user/host/x86_64/hostdep.h      | 20 --------------------
>   linux-user/safe-syscall.h             |  3 +++
>   linux-user/signal.c                   | 15 ++++++++++++---
>   19 files changed, 69 insertions(+), 143 deletions(-)
> 

Richard, will you take this series via one of your branches or do you want I send a linux-user pull 
request for it?

Thanks,
Laurent

