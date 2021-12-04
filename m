Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711BB468656
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 17:51:58 +0100 (CET)
Received: from localhost ([::1]:54480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtYGT-0003md-3O
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 11:51:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mtYF3-00035v-Ov
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 11:50:29 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:54313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mtYF1-0007IC-Od
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 11:50:29 -0500
Received: from [192.168.100.1] ([82.142.19.82]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MxDck-1me3ew1hLU-00xcQX; Sat, 04 Dec 2021 17:50:22 +0100
Message-ID: <90bdacc6-c616-738f-2535-b6c625cf6b97@vivier.eu>
Date: Sat, 4 Dec 2021 17:50:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 07/15] target/m68k: Fix pc, c flag, and address
 argument for EXCP_DIV0
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211202204900.50973-1-richard.henderson@linaro.org>
 <20211202204900.50973-8-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211202204900.50973-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nxLfiWKSPXA6ucYi6OhShCmdExiPygP7U0vhztDQj8vXnW1LDjx
 XzXKAHwfuZZAQoz8P42lbxKSMp0IxYWz36dvf+4KHCeRqQ3OQw5l0avRcqV2xIloLs02HZp
 aLS/Htz8ltZMW0x91eRwjgzd4lseVE5X34Gz/liLMr5d4PJfPQaymx6hhZbVeJaQ1RKhBEv
 BK40GKRR/fMtPcwjlGePQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+xdREtKE8Dk=:dDsAHydc31CxYGCRdoiT/R
 nJXa0TxXURVHtNDoXq5vgb+AuqkDC4iHse4cvMYgejFmaac8rTD4uHeAyXjdgwsGE4zGJoTr5
 SKyRjHM306SzVrPJKVXgMC0Dsyd02WtvxTGKyptgsYZiUTAK2xFBB32ItWI/6lmAnDkXbsLLx
 nQAIQn96VweCDerfMe+W1WEkKe+YgHgoO4NjRAmbu+XCGLM7mhLJKkUAYm2h3jsJ/EoxR4Pmc
 iWerqNyg1CeyE/zbB5egMOPK6v/lMNN8FpO5C0jvININlVqoRNIaoTBngeYk1r0KckVAOA05l
 nqsbTis1jVBvQWLNy93uopjtlmGFDdW/rKPpOuVkWYfXa64ZQRxjgUgIyh2keK/fi5d65JLXM
 QuJt7HnZDLT4Zp1Z9ZQQylWPjM3ALpMaRVuJP18oqzRtcmZ7Ba5jxKwEreOuYdrVrWCldiRyy
 Z3DldaZDl+jgziRKLEbJG6xW23r8QcbUGKzKyTvkT5Rdl8TyXmTe9lYu6QM2/0qFRXWtnqMkf
 f7am2OTBVBNoS+dMsIsXFz5fgUpLPWgNgSswaYx+OxbYMIJvYIAeX8lHhxIuEn/DMZPX3UYUw
 /zepSijtJgarXEwOOCGbNdcivB18WgzKd+WmahW/EPIAnTymu0b1FI/1CFGrq3A+K9xhrmB1A
 fohIRJPC3O02GR/VWZXy6x+30ms7gkn/+F5/sdnNlQVua/cgHSh1unrQ9eHXcYoXd3Gk=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.011,
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

Le 02/12/2021 à 21:48, Richard Henderson a écrit :
> According to the M68040 Users Manual, section 8.4.3,
> Six word stack frame (format 2), Zero Div (and others)
> is supposed to record the next insn in PC and the
> address of the trapping instruction in ADDRESS.
> 
> While the N, Z and V flags are documented to be undefine on DIV0,
> the C flag is documented as always cleared.
> 
> Update helper_div* to take the instruction length as an argument
> and use raise_exception_format2.  Hoist the reset of the C flag
> above the division by zero check.
> 
> Update m68k_interrupt_all to pass mmu.ar to do_stack_frame.
> Update cpu_loop to pass mmu.ar to siginfo.si_addr, as the
> kernel does in trap_c().
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/helper.h       | 12 +++++-----
>   linux-user/m68k/cpu_loop.c |  2 +-
>   target/m68k/op_helper.c    | 48 +++++++++++++++++++++++---------------
>   target/m68k/translate.c    | 33 +++++++++++++-------------
>   4 files changed, 52 insertions(+), 43 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


