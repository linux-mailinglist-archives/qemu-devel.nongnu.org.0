Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D11C47D85F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:48:43 +0100 (CET)
Received: from localhost ([::1]:49710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n08XR-0002cU-LZ
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:48:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n08We-0001vZ-Fz
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:47:52 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:58137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n08Wc-0004tH-OG
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:47:52 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MBBCI-1nBhls2DGg-00ChnZ; Wed, 22 Dec 2021 21:47:46 +0100
Message-ID: <c00aa20c-676f-7ad0-5381-88858a75d57c@vivier.eu>
Date: Wed, 22 Dec 2021 21:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/6] linux-user: Split out do_prctl and subroutines
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211220214135.189157-1-richard.henderson@linaro.org>
 <20211220214135.189157-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211220214135.189157-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wRoCqKR7oRwkytJZaoRd6BOcSDcwIvNO8SH85p39q4FrsMSzO9b
 BMBuCMiGcwWTWG15KZcgHSaFC8cQkpyq9B5snU17LHwsY+Qk0toThpmORjQPUYT3sCOaC2X
 WNCobxLv9nGba/QcuQmiwYdL+j70PMGv1ShWZuCQO6dcaLqTUE1vOxWV0ilRfOO3QVLnTp9
 PdNiJfjhqwxXNl5bxcLDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5jLF6RLiTTk=:pUfoGEkFTUBTCYbyQzJWtg
 a8/VJMaeaJVVxFVWW3+r3+AbQeRPT66H8onOspGaBDoor2YtEeLJPAbQVQA1TH3H+lCiNkktD
 BHOUO4RDS3nNCiiwzGPAt4iMNm9y4H7Pl5wm9KE+fVAfMZJy2gBEeYh1tv7NIwlN1yvbpI391
 Z5vfi70IMSwANaw9Gy2SwTUts6snOTC3znZzKtl/R3QvHaMpmQoEYCL0u8mB4hPsg5bAWJ9N9
 K4xAK+Vl1LKlwNIeA/iQuD5aRn/T+raR80cPzm9j7J16QLYyqdK6+dr2iJpv3MDOFUG5vh1W0
 eBAlfQ8xT50jGbh5w525ivpr9IFazUX3Z9Rm6xCP4Rz9gSzV/ow291Td9TotZ+3l1mFMZ7T5I
 qoiweS/uRgjToIYwh7cBn5CF/UMKW2wByt3PL3Jw3OEiveY0l/Ikr7jE4G2kXjka1IE2Opele
 QZnkm/w7idGHqKG6OnPh3cFI6vpl1t3m7SoKWsI2oXffE40kBzeE4mJDB7zpNYe8eciRStk7S
 ARWY6V1UOE+yvcdBp9mIfMYkNncQbPZbvOky5ys+lB02fMw8sdu1Xuv/rDEqpDJSq/Y++484t
 EoRHGmV9fDfmrT4A+uJORl0L4l/zsb/YNjCG+c/6N+Bq9Hh29zh33ZvhgcvyAVfeMi+xKGeax
 bc0V431BwiQuYfPlq7zppKI1cgT7pHzbnT98oZh7MsV8lJvJdWYPvsGiORaRcazS0fOc=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.694,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/12/2021 à 22:41, Richard Henderson a écrit :
> Since the prctl constants are supposed to be generic, supply
> any that are not provided by the host.
> 
> Split out subroutines for PR_GET_FP_MODE, PR_SET_FP_MODE,
> PR_GET_VL, PR_SET_VL, PR_RESET_KEYS, PR_SET_TAGGED_ADDR_CTRL,
> PR_GET_TAGGED_ADDR_CTRL.  Return EINVAL for guests that do
> not support these options rather than pass them on to the host.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/aarch64/target_prctl.h    | 160 ++++++++++
>   linux-user/aarch64/target_syscall.h  |  23 --
>   linux-user/alpha/target_prctl.h      |   1 +
>   linux-user/arm/target_prctl.h        |   1 +
>   linux-user/cris/target_prctl.h       |   1 +
>   linux-user/hexagon/target_prctl.h    |   1 +
>   linux-user/hppa/target_prctl.h       |   1 +
>   linux-user/i386/target_prctl.h       |   1 +
>   linux-user/m68k/target_prctl.h       |   1 +
>   linux-user/microblaze/target_prctl.h |   1 +
>   linux-user/mips/target_prctl.h       |  88 ++++++
>   linux-user/mips/target_syscall.h     |   6 -
>   linux-user/mips64/target_prctl.h     |   1 +
>   linux-user/mips64/target_syscall.h   |   6 -
>   linux-user/nios2/target_prctl.h      |   1 +
>   linux-user/openrisc/target_prctl.h   |   1 +
>   linux-user/ppc/target_prctl.h        |   1 +
>   linux-user/riscv/target_prctl.h      |   1 +
>   linux-user/s390x/target_prctl.h      |   1 +
>   linux-user/sh4/target_prctl.h        |   1 +
>   linux-user/sparc/target_prctl.h      |   1 +
>   linux-user/x86_64/target_prctl.h     |   1 +
>   linux-user/xtensa/target_prctl.h     |   1 +
>   linux-user/syscall.c                 | 433 +++++++++------------------
>   24 files changed, 414 insertions(+), 320 deletions(-)
>   create mode 100644 linux-user/aarch64/target_prctl.h
>   create mode 100644 linux-user/alpha/target_prctl.h
>   create mode 100644 linux-user/arm/target_prctl.h
>   create mode 100644 linux-user/cris/target_prctl.h
>   create mode 100644 linux-user/hexagon/target_prctl.h
>   create mode 100644 linux-user/hppa/target_prctl.h
>   create mode 100644 linux-user/i386/target_prctl.h
>   create mode 100644 linux-user/m68k/target_prctl.h
>   create mode 100644 linux-user/microblaze/target_prctl.h
>   create mode 100644 linux-user/mips/target_prctl.h
>   create mode 100644 linux-user/mips64/target_prctl.h
>   create mode 100644 linux-user/nios2/target_prctl.h
>   create mode 100644 linux-user/openrisc/target_prctl.h
>   create mode 100644 linux-user/ppc/target_prctl.h
>   create mode 100644 linux-user/riscv/target_prctl.h
>   create mode 100644 linux-user/s390x/target_prctl.h
>   create mode 100644 linux-user/sh4/target_prctl.h
>   create mode 100644 linux-user/sparc/target_prctl.h
>   create mode 100644 linux-user/x86_64/target_prctl.h
>   create mode 100644 linux-user/xtensa/target_prctl.h
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


