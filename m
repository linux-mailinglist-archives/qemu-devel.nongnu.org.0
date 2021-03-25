Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734C5349AB8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 20:56:58 +0100 (CET)
Received: from localhost ([::1]:51158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPW6D-0006os-FM
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 15:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lPW5G-0006NW-Dd; Thu, 25 Mar 2021 15:55:58 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:40669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lPW5E-0008UX-HU; Thu, 25 Mar 2021 15:55:58 -0400
Received: from [192.168.100.1] ([82.142.25.162]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M3DFj-1lMULQ120D-003ZhO; Thu, 25 Mar 2021 20:55:49 +0100
Subject: Re: [PATCH v3] linux-user/s390x: Use the guest pointer for the
 sigreturn stub
To: Andreas Krebbel <krebbel@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210324185128.63971-1-krebbel@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2b8d52a8-b72a-c968-f61a-2e6288ace4ad@vivier.eu>
Date: Thu, 25 Mar 2021 20:55:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324185128.63971-1-krebbel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9LVyhgsCZTnIhijhXObvZPTlVDuGE2vKTG6N0kbtZhlQBwFID/M
 0UBp5EJdSKof3wAfEwJcwPomJAuVbZfIHE2BFXuSlIKNgI0HdAvKo1m5B6rYg7cuIrF4U4i
 UQ/j0ZK+w7EbKzRiWGOIAckespSwTfh8q1dknijpjWJPYbZIgxbVGVgECDuqregui2QaRBH
 b5bPCa248gdsT0F/QI6Ag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WVKcN2rUZbA=:1acBVG5ZFgHFQRdm8ofdwT
 JuJVVl5FRvMCFowjQbpm2xcGg2D7ngpAfObwreTLCoO9fFhOjtVmMw4t0YlUvpnroh5dxSf79
 Fdvqi5kLtpN89RBn8bZ//kn9GR7Kv0f3QBKp5Rg5dv2l27SXuCc+rmW90+PJ0j57oPM/rWHZQ
 ljskOgchHDI5svdu9mRlwmq2DEc0x9rFMb755NqDlhAqsb7U+ICHaRgUcKZpZrqrzMyX1HGe4
 9lY52p4MC7IEkteblHO7JnRzZLXYDMqo9Mmq/Ed1GNxVriyCetBhvloIujPyKLAXhqvT6tTIx
 uTCOZpP/QhALLQ/1uY9of7e+N3G7j/8HpHYy/iSjSpHBNUHTFXH3gd9apnZItgfF/Atoxumcv
 +8LOXaMLR1NCTFN3aszWm5yaqvciCzjiyL1mVUQ8bHFPfEVt2O54GYC1gR2kayQ4DcdGXSGEO
 SC6hRFLZM9WxUEbO4tXTgc0hShTb39gaQ1oNCx0ybDCvUWvgPvhd
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/03/2021 à 19:51, Andreas Krebbel a écrit :
> When setting up the pointer for the sigreturn stub in the return
> address register (r14) we currently use the host frame address instead
> of the guest frame address.
> 
> Note: This only caused problems if Qemu has been built with
> --disable-pie (as it is in distros nowadays). Otherwise guest_base
> defaults to 0 hiding the actual problem.
> 
> Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
> ---
>  linux-user/s390x/signal.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index ecfa2a14a9..7107c5fb53 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -211,9 +211,10 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>      /* Set up to return from userspace.  If provided, use a stub
>         already in userspace.  */
>      if (ka->sa_flags & TARGET_SA_RESTORER) {
> -        env->regs[14] = (unsigned long) ka->sa_restorer | PSW_ADDR_AMODE;
> +        env->regs[14] = ka->sa_restorer | PSW_ADDR_AMODE;
>      } else {
> -        env->regs[14] = (unsigned long) frame->retcode | PSW_ADDR_AMODE;
> +        env->regs[14] = (frame_addr + offsetof(typeof(*frame), retcode))
> +                        | PSW_ADDR_AMODE;
>          __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
>                     (uint16_t *)(frame->retcode));
>      }
> 

Applied to my linux-user-for-6.0 branch

Thanks,
Laurent

