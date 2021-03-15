Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD2633C831
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 22:08:53 +0100 (CET)
Received: from localhost ([::1]:54606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLuSK-0001Mz-TG
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 17:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lLuQp-0000UT-EH
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:07:19 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:49055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lLuQn-0005Fo-Fm
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:07:19 -0400
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MWSJJ-1lESk52JPn-00Xwtt; Mon, 15 Mar 2021 22:07:14 +0100
Subject: Re: [PATCH] linux-user: Use signed lengths in uaccess.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210315204004.2025219-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c8a434a8-9f88-99cf-a136-6099626b2477@vivier.eu>
Date: Mon, 15 Mar 2021 22:07:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315204004.2025219-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7rDF2UPNs1ozlGnqcWLsQneUwn3gL5d9KcJjssbR8uWanRAH10c
 n92268kJWTj46QWoOFLNRlCVYnPILe4FFbZjMJ4wE84NwmeTe50RAiV8v/F//nq6mCHG1rN
 GgJeUXXntA4DKKmGSYlH5j/knjqyIqYXwzb1+eigW3DZu+KyRRUJ+FOmIe79kls7y6zWkd/
 FcVaC4XSDQOvqcbRjFMoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OevRQa/SPsM=:wCA+6NR/K0L7UadrTEkhY1
 bsjr+SLtlZpHfmbWyXVHQ8xqO5f70GbZVYSeHgjW5shj0CBV1xbFl4XKwh0PtAGyl+Vi0HGnB
 VyRzZRYgRXfMNtbr+4QxQ7kE0WP0hUfJlc8fuLKjgnmg3pnasvj1lbLqQvzbGYqXAIPTfmBxB
 UEsxaTAxs4E1BY/CGsLbygJzUni+ANAAwnrJVwUJAoTA58cebeYVl6fC+UapVul6N2tfmggjX
 bGXNXSX/WTLNoN8UMuaIEIqOHBozTzytOxxTAlhBGJkt2jQpbs05AO4LcMYkfwm422c1Qacg2
 lwqUrS/g6db3rZHxgG4zlhwxW6/wFvs1PGL604QR2vH6AqeqYH5JfdxQwMVWnwkUDQUTb3w5X
 8jUlSsNkqkpsHnDmqz3IYNLG9vGtQWc7/6vKwv+U08/3+tWGm9wN6ttDV8bcW9NgSdTAndSZU
 pzj2/fGeEA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/03/2021 à 21:40, Richard Henderson a écrit :
> Partially revert 09f679b62dff, but only for the length arguments.
> Instead of reverting to long, use ssize_t.  Reinstate the > 0 check
> in unlock_user.
> 
> Fixes: 09f679b62dff
> Reported-by: Coverity (CID 1446711)
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/qemu.h    | 15 +++++++++------
>  linux-user/uaccess.c | 12 ++++++------
>  2 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 52c981710b..74e06e7121 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -627,8 +627,8 @@ static inline bool access_ok(CPUState *cpu, int type,
>   * buffers between the target and host.  These internally perform
>   * locking/unlocking of the memory.
>   */
> -int copy_from_user(void *hptr, abi_ulong gaddr, size_t len);
> -int copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
> +int copy_from_user(void *hptr, abi_ulong gaddr, ssize_t len);
> +int copy_to_user(abi_ulong gaddr, void *hptr, ssize_t len);
>  
>  /* Functions for accessing guest memory.  The tget and tput functions
>     read/write single values, byteswapping as necessary.  The lock_user function
> @@ -638,16 +638,19 @@ int copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
>  
>  /* Lock an area of guest memory into the host.  If copy is true then the
>     host area will have the same contents as the guest.  */
> -void *lock_user(int type, abi_ulong guest_addr, size_t len, bool copy);
> +void *lock_user(int type, abi_ulong guest_addr, ssize_t len, bool copy);
>  
>  /* Unlock an area of guest memory.  The first LEN bytes must be
>     flushed back to guest memory. host_ptr = NULL is explicitly
>     allowed and does nothing. */
>  #ifndef DEBUG_REMAP
> -static inline void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len)
> -{ }
> +static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
> +                               ssize_t len)
> +{
> +    /* no-op */
> +}
>  #else
> -void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
> +void unlock_user(void *host_ptr, abi_ulong guest_addr, ssize_t len);
>  #endif
>  
>  /* Return the length of a string in target memory or -TARGET_EFAULT if
> diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
> index c696913016..82b833b8f1 100644
> --- a/linux-user/uaccess.c
> +++ b/linux-user/uaccess.c
> @@ -4,7 +4,7 @@
>  
>  #include "qemu.h"
>  
> -void *lock_user(int type, abi_ulong guest_addr, size_t len, bool copy)
> +void *lock_user(int type, abi_ulong guest_addr, ssize_t len, bool copy)
>  {
>      void *host_addr;
>  
> @@ -24,7 +24,7 @@ void *lock_user(int type, abi_ulong guest_addr, size_t len, bool copy)
>  }
>  
>  #ifdef DEBUG_REMAP
> -void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len);
> +void unlock_user(void *host_ptr, abi_ulong guest_addr, ssize_t len);

The semicolon has been added by 687ca797893c ("linux-user: Move lock_user et al out of line")
perhaps it's time to remove it?

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

