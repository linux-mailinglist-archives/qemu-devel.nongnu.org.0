Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5428A4DC437
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 11:46:19 +0100 (CET)
Received: from localhost ([::1]:60350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUne6-0005n6-Ec
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 06:46:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierre@freepascal.org>)
 id 1nUnbD-00033v-PI
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:43:23 -0400
Received: from mail.freepascal.org ([178.33.235.90]:42444)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pierre@freepascal.org>) id 1nUnbB-0000wV-9f
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:43:19 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.freepascal.org (Postfix) with ESMTP id 9C7021802F8
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 10:43:14 +0000 (UTC)
Received: from mail.freepascal.org ([127.0.0.1])
 by localhost (idefixng.freepascal.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1YHZecdwC4vR for <qemu-devel@nongnu.org>;
 Thu, 17 Mar 2022 10:43:14 +0000 (UTC)
Received: from [192.168.50.107] (gw-ics.u-strasbg.fr [130.79.210.225])
 by mail.freepascal.org (Postfix) with ESMTPSA id 80BE11802F3
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 10:43:14 +0000 (UTC)
Message-ID: <fffcbadf-aa26-6e53-19b6-e3dcee825a55@freepascal.org>
Date: Thu, 17 Mar 2022 11:43:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 15/17] linux-user/strace: Fix print_syscall_err
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220316055840.727571-1-richard.henderson@linaro.org>
 <20220316055840.727571-16-richard.henderson@linaro.org>
From: Pierre Muller <pierre@freepascal.org>
In-Reply-To: <20220316055840.727571-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.33.235.90; envelope-from=pierre@freepascal.org;
 helo=mail.freepascal.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Pierre Muller <pierre@freepascal.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hello Richard,

   being mainly a Pascal programmer,
I always jump when I see such constructs:
   You change the type of the print_syscall_err parameter to abi_ulong,
with is an unsigned type as the name suggests,
and after you compare it to a signed constant -4096.

   This would never work in Pascal, but this is of course C code.

   Nevertheless, I tried:

muller@gcc140:~/pas/check$ cat ./test-unsigned-int.c
#include <stdio.h>

int test_is_error (unsigned int u)
{
   return (u > -4096);
}

int main ()
{
   unsigned int v;
   int error_count = 0;
   v = (unsigned int) - 3000;
   if (test_is_error(v) != 0)
     printf("v=-3000 accepted\n");
   else
     error_count++;
   v = (unsigned int) - 5000;
   if (test_is_error(v) == 0)
     printf("v=-5000 rejected\n");
   else
     error_count++;
   v = (unsigned int) 0xfffffff0;
   if (test_is_error(v) != 0)
     printf("v=%d accepted\n",v);
   else
     error_count++;
   if (test_is_error(0xffffff00) != 0)
     printf("v=%d accepted\n",0xffffff00);
   else
     error_count++;
   return error_count;
}


muller@gcc140:~/pas/check$ gcc  -W -o test-unsigned-int test-unsigned-int.c
test-unsigned-int.c: In function ‘test_is_error’:
test-unsigned-int.c:5:13: warning: comparison of integer expressions of different signedness: ‘unsigned int’ and ‘int’ [-Wsign-compare]
     5 |   return (u > -4096);
       |             ^

The results are OK (both for 32 and 64 bit executables),
but is there a cleaner way, which does not generate a warning, to write this?

Adding an explicit typecast to -4096 seems sufficient to silence that warning.


Pierre Muller


Le 16/03/2022 à 06:58, Richard Henderson a écrit :
> Errors are not all negative numbers, but only the top 4k.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/strace.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 2cdbf030ba..f235118fb6 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -684,12 +684,12 @@ print_ipc(void *cpu_env, const struct syscallname *name,
>    */
>   
>   static bool
> -print_syscall_err(abi_long ret)
> +print_syscall_err(abi_ulong ret)
>   {
>       const char *errstr;
>   
>       qemu_log(" = ");
> -    if (ret < 0) {
> +    if (ret > -4096) {
>           errstr = target_strerror(-ret);
>           if (errstr) {
>               qemu_log("-1 errno=%d (%s)", (int)-ret, errstr);

