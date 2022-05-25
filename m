Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBB75345B3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 23:22:09 +0200 (CEST)
Received: from localhost ([::1]:49304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntySE-0005W5-5m
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 17:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntyQY-00046r-AW
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:20:22 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:33757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntyQW-00046L-KX
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:20:22 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N6t3Z-1nlw4M1qc3-018KMS; Wed, 25 May 2022 23:20:17 +0200
Message-ID: <6e08dfe8-71f0-9edd-df94-af2be4c75a95@vivier.eu>
Date: Wed, 25 May 2022 23:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 09/17] target/m68k: Fix stack frame for EXCP_ILLEGAL
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-10-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220430175342.370628-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0RXt8P6wp/gIK/l/A3S22F0f8/48QWnSMHmsHKzmBIpSjP8FrC0
 IBHMBBhb7qMLDBVK0vSvJuL1j1czq+O64uIKb8WSju0uIufD5IJvyiN8C54wEw/ylc15rP8
 TK2+uBPrfpMmE42aE7XVolqGXMJ1wu8v8bT+TLmyiIrGuRrlIzNc0msY6q31caCL8M5jiq0
 9giwO63Ll1y1PsaRYtn5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:n58vf1YA9lQ=:DG4mu2qth01McWSnRTl07j
 HEO3I7QtxIGWzezGmY/P1DOa1t1rqx6nW0lXd67ZooC8cWAKiJMjX0v/MRqs8y9KgZZAed7mY
 LfUVZ1djK0+SSm42YHtp8Km0wmkAVg3LqyTK9FPhYSBLkoqnNzSZFW6BpER8peEXkVkLwUj/L
 9MwQIhKg9o2EqbROgYVsPvp2ZT6Xo6y4w2fsVOXfEWbMOllQq1EpL8CNlI9QCGlonq8vxD0zZ
 /auL7LqJRzPIiSkh88NzY6ZsHtOEChqryiUQdKh1SCRvEpqlqe3bOmSkLo40qRatw2JOW0TYK
 6Dx6PIkGHmMfeexV708ljAAVOJpJ8C7o/dDbMglqu0XulR/tT1oC1Vqf+CV9BmwIqq0JAiDU5
 18vqHf1j6wm4YFPe5cRlw46d6ta2SJTU/ozIqS2XbxnBiRsgaaB7hHR8B6SzG+wgc+dNEVgrx
 fPD7Ffbf3RKRT0ScfMnpjr2H4JnAyBVcYI9ZqNVwSm6hkLJsPdqy7UcXgxz6P4HOwUyRA/5zc
 zY4GNIl5edzveKQsWXjN6Hbnrx4/DXyd2/kvAkMGns9mv4dFL6XDRmEUcr4ZCMMqAU9Z3LMeJ
 P0RalSnS/DpKhI3FX8CiSikPqcENDEyh4K5/0JkNK3Jn/WoPgnqz39TRrPo2Jh3UuHgl/RcOW
 T03YjwGPxnuvgigWpcvHkq154jT+1KniRv+duOuRGqCUQzTiBY/REUabZivV9V2wz6aOrOCGH
 B8IsPHaqsc+CC2QR3IFm30WRveVtUI5YxUuLUg==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 30/04/2022 à 19:53, Richard Henderson a écrit :
> According to the M68040 Users Manual, section 8.4.3, Four word

This is in section 8.4.1

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

> stack frame (format 0), includes Illegal Instruction.  Use the
> correct frame format, which does not use the ADDR argument.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/op_helper.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index 3cb71c9140..aa62158eb9 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -391,11 +391,14 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
>           }
>           break;
>   
> +    case EXCP_ILLEGAL:
> +        do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
> +        break;
> +
>       case EXCP_ADDRESS:
>           do_stack_frame(env, &sp, 2, oldsr, 0, env->pc);
>           break;
>   
> -    case EXCP_ILLEGAL:
>       case EXCP_TRAPCC:
>           /* FIXME: addr is not only env->pc */
>           do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);


