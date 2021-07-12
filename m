Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3193C6464
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:57:28 +0200 (CEST)
Received: from localhost ([::1]:44582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m323T-0004qw-5D
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3217-0002qw-P5
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:55:01 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:38545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3215-0002LN-76
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:55:01 -0400
Received: from [192.168.100.1] ([82.142.17.146]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MhFpq-1lYcwU32m2-00ePUG; Mon, 12 Jul 2021 21:54:56 +0200
Subject: Re: [PATCH] fd-trans: Fix race condition on reallocation of the
 translation table.
To: Owen Anderson <oanderso@google.com>
References: <20210701221255.107976-1-oanderso@google.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a1431e68-5a1d-7aca-3fad-214f45cb9474@vivier.eu>
Date: Mon, 12 Jul 2021 21:54:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701221255.107976-1-oanderso@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:o6v9AcH6yL23BQyStNZhghFUkWmIYyNZa9NIeUOc5Mz06opWooD
 LInTQHQM0Tp39IvQwb3VESB0pi8JmkTNqbQm6J7TTB6aAYJols7nvxEwZ4OSpKjUjqyTY2R
 DRFc3UBu3MYzVgGzm22F1Jg0RB8QfS8RqZxZvC7JcctR+QKHHbz9x1aUCf4w4gM2oSIDzYE
 7Ie0Kr95KkU20AKWIm09Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q+hobPqsCQw=:kKbvorT3a1KkuaZCgfK5kr
 aWInWWaSsF5CqiFEz4VFhwsFUuhbuAvaIgbvr8BaO1xx8IajxuL+SJfkXlsXH4oYlNZUk38cN
 vu25vRw41wuc6hqbqugMbsYGkIpJN3QtYvDvFL+qc63Qb76wTydMFgO9W6iw7OrWCD0nudaPr
 qJomyWt+TUpyMKnkJ6QRoyFQnX0OLYXhXJOREeq3OiF78LP4Le6BFIOai/yoefPOvyzebQr4T
 UvPcQtYg2uurK/Ai/U0hJcnCPhz9+ZgIqh+rSCwmYJNaG41GdRbOTei3dt3b1j39RhAn2dgLD
 U40kQaStQtWXnan7SeX5Nun7i+a4f2oi3aTzIZeImIWGt9GtDcAMtMdZONrLPRC0UGC5FzWZq
 SvoENQg0ZoONcLUQB5dOqX6Wgxhp0p6gT+ZlhrwQnO94uP4TTD/NgTp9ECRPXpjNBSloguM/5
 1zDST5mH1ZI3KtA9M8O76Ch8P8bcDGkt7eov3aKtSbUm8LpFaBZ+KOTG4HAvVwKP7wXxAe+Mb
 gEacF2XH6WZFwXnRLMk4mIHDclLbBWPCMYgCnbAqZjY3jFy+vePXiUhJe/o2Vi4hmWDuUTULq
 poq3wwNeH5JAOop98cSEGROS7MB+tQ8egYdgSFHDN7RZ0L9U7i+gmtccguM6IVV/iyP5zo8Fo
 92maqKk6IauNivsXhKWR3Xas6Gy6oA01jBaDzljqBgaP3HhpwqCgpha7dfmB/aOb1HvSkHgjo
 ZoML/UQpQHt0x/FBFKxk6BtOF20KkPLuXffHbIRjrLa0/d3TZvgEiX/A68nqB+dAAsmTF5Sr6
 769yX2sTueNhGZS+XurTHwRC4VOgGhwkzRlkaff7gHp7KA+xJUdVjceY6CypPrUW9HfI8gf
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.479,
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

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


