Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E01D381E51
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 12:55:13 +0200 (CEST)
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liEQR-0005p6-Jp
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 06:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1liEOv-00053i-Ts
 for qemu-devel@nongnu.org; Sun, 16 May 2021 06:53:37 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:53315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1liEOu-0005TF-1P
 for qemu-devel@nongnu.org; Sun, 16 May 2021 06:53:37 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MsYzD-1lTRXK0YPr-00u1yW; Sun, 16 May 2021 12:53:33 +0200
Subject: Re: [PATCH] linux-user/syscall: zero-init msghdr in
 do_sendrecvmsg_locked
To: Kenta Iwasaki <kenta@lithdew.net>, qemu-devel@nongnu.org
References: <20210516091536.1042693-1-kenta@lithdew.net>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <aee50099-14a8-1c6b-6142-a4363f75812d@vivier.eu>
Date: Sun, 16 May 2021 12:53:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210516091536.1042693-1-kenta@lithdew.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cAXxEZoyO+EntFS7/7cY6LxktuVWeFi9gLo729XCEhIoLaBJWfq
 mdyhMPmBSo4BNkNZJHrV8qmATCh/fDrVKrnzfYH5cY7np/aGGc5gRfTeqTkwqTofzKiNE+8
 IY8rTJk2udqDRrTOJbMqb+vCZLPKS3k35h0f3sjn7am5kCDESYWN1sQ4vHs0qrOlMcMps0y
 GCkVQZCgbJ0HCweCyh88Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TLPxza2qKTQ=:xS7o4qGhTJxJAB/D8AlLPu
 bvMYKPVL2PxHhVXlFnMY9dtPsy5mgiIzPo07SZJ+vD3VifnVKNpK1MXYS0CDluxin7ddSJ91v
 ARRHjuCVT2MrfJJP8gfODT/au88Ea5+euVRrj8NkkX6coieZIGGQFwhzdTNkTw7gcPsFez4wG
 xiSsT/wFlUhb87Uz/IfyfEBAl2NGiSIneWJpfAQiGExV6PFAVAqW6UTkCzimMwfaCtRZw56kI
 qX2nG50hxky1c2pkcb7JEreHmWRHjzUZlwuoHjOb9bzqT/3BoedGbripihxJAs6hWesfSki6L
 p7njsb1q9UXkP2gu2fZ2afaw37i04UBl42huLLh0RPUkwNw0NFSw8MqhVrIwJYb3Xs5+CfHLI
 Llepypu6h6svAC0zqFjNF78bUcqTmmGbRngB7W36GpzcmdBtgM0MkWb9BQUwUivXlMwPRGoGy
 fCEnEFDn4Fk0rAFNY8UBvtZX8vu3OpmRLksQx8vkVr8NiIq81N952W6uWrlyk4dsGxegqJxn6
 me95eUOmEmGxFxsA46Z+O4=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/05/2021 à 11:15, Kenta Iwasaki a écrit :
> The mixing of libc and kernel versions of the layout of the `msghdr`
> struct causes EMSGSIZE to be returned by sendmsg if the `msghdr` struct
> is not zero-initialized (such that padding bytes comprise of
> uninitialized memory).
> 
> Other parts of the QEMU codebase appear to zero-initialize the `msghdr`
> struct to workaround these struct layout issues, except for
> do_sendrecvmsg_locked in linux-user/syscall.c.
> 
> This patch zero-initializes the `msghdr` struct in
> do_sendrecvmsg_locked.
> 
> Signed-off-by: Kenta Iwasaki <kenta@lithdew.net>
> ---
>  linux-user/syscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 95d79ddc43..f60b7e04d5 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3337,7 +3337,7 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
>                                        int flags, int send)
>  {
>      abi_long ret, len;
> -    struct msghdr msg;
> +    struct msghdr msg = { 0 };
>      abi_ulong count;
>      struct iovec *vec;
>      abi_ulong target_vec;
> 

It seems do_sendrecvmsg_locked() initializes all the fields of the structure, I don't see why we
need to clear it before use.

Could you explain more?

Thanks,
Laurent

