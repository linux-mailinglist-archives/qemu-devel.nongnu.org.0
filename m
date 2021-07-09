Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138A83C205B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:59:50 +0200 (CEST)
Received: from localhost ([::1]:33456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1lQK-0003RK-VN
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1lPA-0002Ym-Di
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:58:36 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:58347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1lP8-0003wx-AM
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:58:36 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MkYHO-1lJP1k48uU-00m69B; Fri, 09 Jul 2021 09:58:31 +0200
Subject: Re: [PATCH] fd-trans: Fix race condition on reallocation of the
 translation table.
To: Owen Anderson <oanderso@google.com>
References: <20210701221255.107976-1-oanderso@google.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a5285163-230f-a50f-663b-820b673b9467@vivier.eu>
Date: Fri, 9 Jul 2021 09:58:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701221255.107976-1-oanderso@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5oStar7QDo3VkuhVlqzg4lMKyxRAHjj9V27Y3wq7u5YAnQlAZyy
 hf9f4QfmYNrMc4Lcbg6sSKRYKoQzymmZ5TT5KRBvhTFfWCta6T3AqBywcmeoJ6UKLROmRsC
 /Y8ycbg/N8797BTdFqM59U7DF7EyjE42D/zcE42gWHVWzz8/N+USQVAXQngXkxK6YIEoXKp
 KrRE1QAMR78Jj1GER1+pA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FlxknZ/j1PI=:IAdzes7DGcrgRB6b4WhWet
 T5GP0xzDmCqsUYVoJgy7qpPxcHJlMKhuQIptrPT8xLSi8prRBui/HQRRJgUHzEE+A6fB6Hc18
 cSt6tUCiYVtTbcSASlv/E7YjMi11t7LKPosnwrnJBm4r4qyknfkSnR+Ztc79VJSvRysWZS1Pk
 L8KY02bePAUQA+9FMUYLS0PkADVwIznCqJQnz3zD0xb2cvwTcINBLkhXov4utBLT2IrhmIusR
 INc4zkjpc53/OQa1vNJd+qJQDWJbU50rC7fDxlUwgpu1PrJrJ7ZU72c7CGeh5ulGMxZsDURuM
 /l+MwkkuR9eQ1nGLW/b82b3J1khFkontgthMK2BmV7JDEUQobhXuwxiuEAzlzbrlTxsUiMkAh
 zmXxZ2Uh3k12yW2gkFfHeFndhhqABxuakL4yo0FQ51D9ZgH9Qbowfjv5gTC3Co/EfU1FFVj4L
 RVZqnWtkSgtY84lhnhBm3jskoozDqBswmFkB0kUmecS6SRwXfel9BdecTYdfRd8veBBTNljlk
 GRqBMEYW8TSXnPS6ZrqdVa9cKB7j5V6xyp+DQjTU6p7tYqjWBtRc2+VVNnc9pzR9SQC5BrWP4
 DtRjLQkMPlCChcVkfaXG8EtNlxTSjpeg22YOfVlgshKeoDwazdI8LW5jSG6GtD3w2vc1DMgsp
 RMDQmtjCc2Mt83pzE/1/5JecuDMgQVDxJTYQzv33Pg7cd5Z7jaqqMHA+mKuQugfg0XZcEUg69
 D/0LLjNHue7cG8L1yVfQ+PR6qEhrUKRTDUgmz7uLXsI2IAW+FqxeYJxyWDk7hN1R+Ph2QffNE
 nN0oTX2gCBq+PLPVCsIY7BJHhfonTbD8sI+K80oMpQiNJmOB3WhSsqWvySjmdHZFkieeMqg
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/07/2021 à 00:12, Owen Anderson a écrit :
> The mapping from file-descriptors to translator functions is not guarded
> on realloc which may cause invalid function pointers to be read from a
> previously deallocated mapping.
> 
> Signed-off-by: Owen Anderson <oanderso@google.com>
> ---
>  linux-user/fd-trans.c |  1 +
>  linux-user/fd-trans.h | 55 +++++++++++++++++++++++++++++++++++++------
>  linux-user/main.c     |  3 +++
>  3 files changed, 52 insertions(+), 7 deletions(-)
> 
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index 23adaca836..86b6f484d3 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -267,6 +267,7 @@ enum {
>  };
>  
>  TargetFdTrans **target_fd_trans;
> +QemuMutex target_fd_trans_lock;
>  unsigned int target_fd_max;
>  
>  static void tswap_nlmsghdr(struct nlmsghdr *nlh)
> diff --git a/linux-user/fd-trans.h b/linux-user/fd-trans.h
> index a3fcdaabc7..1b9fa2041c 100644
> --- a/linux-user/fd-trans.h
> +++ b/linux-user/fd-trans.h
> @@ -16,6 +16,8 @@
>  #ifndef FD_TRANS_H
>  #define FD_TRANS_H
>  
> +#include "qemu/lockable.h"
> +
>  typedef abi_long (*TargetFdDataFunc)(void *, size_t);
>  typedef abi_long (*TargetFdAddrFunc)(void *, abi_ulong, socklen_t);
>  typedef struct TargetFdTrans {
> @@ -25,12 +27,23 @@ typedef struct TargetFdTrans {
>  } TargetFdTrans;
>  
>  extern TargetFdTrans **target_fd_trans;
> +extern QemuMutex target_fd_trans_lock;
>  
>  extern unsigned int target_fd_max;
>  
> +static inline void fd_trans_init(void)
> +{
> +    qemu_mutex_init(&target_fd_trans_lock);
> +}
> +
>  static inline TargetFdDataFunc fd_trans_target_to_host_data(int fd)
>  {
> -    if (fd >= 0 && fd < target_fd_max && target_fd_trans[fd]) {
> +    if (fd < 0) {
> +        return NULL;
> +    }
> +
> +    QEMU_LOCK_GUARD(&target_fd_trans_lock);
> +    if (fd < target_fd_max && target_fd_trans[fd]) {
>          return target_fd_trans[fd]->target_to_host_data;
>      }
>      return NULL;
> @@ -38,7 +51,12 @@ static inline TargetFdDataFunc fd_trans_target_to_host_data(int fd)
>  
>  static inline TargetFdDataFunc fd_trans_host_to_target_data(int fd)
>  {
> -    if (fd >= 0 && fd < target_fd_max && target_fd_trans[fd]) {
> +    if (fd < 0) {
> +        return NULL;
> +    }
> +
> +    QEMU_LOCK_GUARD(&target_fd_trans_lock);
> +    if (fd < target_fd_max && target_fd_trans[fd]) {
>          return target_fd_trans[fd]->host_to_target_data;
>      }
>      return NULL;
> @@ -46,13 +64,19 @@ static inline TargetFdDataFunc fd_trans_host_to_target_data(int fd)
>  
>  static inline TargetFdAddrFunc fd_trans_target_to_host_addr(int fd)
>  {
> -    if (fd >= 0 && fd < target_fd_max && target_fd_trans[fd]) {
> +    if (fd < 0) {
> +        return NULL;
> +    }
> +
> +    QEMU_LOCK_GUARD(&target_fd_trans_lock);
> +    if (fd < target_fd_max && target_fd_trans[fd]) {
>          return target_fd_trans[fd]->target_to_host_addr;
>      }
>      return NULL;
>  }
>  
> -static inline void fd_trans_register(int fd, TargetFdTrans *trans)
> +static inline void internal_fd_trans_register_unsafe(int fd,
> +                                                     TargetFdTrans *trans)
>  {
>      unsigned int oldmax;
>  
> @@ -67,18 +91,35 @@ static inline void fd_trans_register(int fd, TargetFdTrans *trans)
>      target_fd_trans[fd] = trans;
>  }
>  
> -static inline void fd_trans_unregister(int fd)
> +static inline void fd_trans_register(int fd, TargetFdTrans *trans)
> +{
> +    QEMU_LOCK_GUARD(&target_fd_trans_lock);
> +    internal_fd_trans_register_unsafe(fd, trans);
> +}
> +
> +static inline void internal_fd_trans_unregister_unsafe(int fd)
>  {
>      if (fd >= 0 && fd < target_fd_max) {
>          target_fd_trans[fd] = NULL;
>      }
>  }
>  
> +static inline void fd_trans_unregister(int fd)
> +{
> +    if (fd < 0) {
> +        return;
> +    }
> +
> +    QEMU_LOCK_GUARD(&target_fd_trans_lock);
> +    internal_fd_trans_unregister_unsafe(fd);
> +}
> +
>  static inline void fd_trans_dup(int oldfd, int newfd)
>  {
> -    fd_trans_unregister(newfd);
> +    QEMU_LOCK_GUARD(&target_fd_trans_lock);
> +    internal_fd_trans_unregister_unsafe(newfd);
>      if (oldfd < target_fd_max && target_fd_trans[oldfd]) {
> -        fd_trans_register(newfd, target_fd_trans[oldfd]);
> +        internal_fd_trans_register_unsafe(newfd, target_fd_trans[oldfd]);
>      }
>  }
>  
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 2fb3a366a6..37ed50d98e 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -48,6 +48,7 @@
>  #include "target_elf.h"
>  #include "cpu_loop-common.h"
>  #include "crypto/init.h"
> +#include "fd-trans.h"
>  
>  #ifndef AT_FLAGS_PRESERVE_ARGV0
>  #define AT_FLAGS_PRESERVE_ARGV0_BIT 0
> @@ -829,6 +830,8 @@ int main(int argc, char **argv, char **envp)
>      cpu->opaque = ts;
>      task_settid(ts);
>  
> +    fd_trans_init();
> +
>      ret = loader_exec(execfd, exec_path, target_argv, target_environ, regs,
>          info, &bprm);
>      if (ret != 0) {
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

