Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C93371FEB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:51:39 +0200 (CEST)
Received: from localhost ([::1]:34390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lddfO-0006RC-6J
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lddc6-00037y-Ps; Mon, 03 May 2021 14:48:18 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:36141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lddbp-0005kN-13; Mon, 03 May 2021 14:48:07 -0400
Received: from [192.168.100.1] ([82.142.20.222]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MtOOm-1lPxq818JS-00urLL; Mon, 03 May 2021 20:47:54 +0200
Subject: Re: [PATCH 2/2] linux-user: Fix erroneous conversion in
 copy_file_range
To: LemonBoy <thatlemon@gmail.com>, qemu-devel@nongnu.org
References: <20210503174159.54302-1-thatlemon@gmail.com>
 <20210503174159.54302-3-thatlemon@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <67e3e6c7-2d8e-ae00-193c-bf91ce1dcfb4@vivier.eu>
Date: Mon, 3 May 2021 20:47:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503174159.54302-3-thatlemon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LYDXZsHgd1gIZg5GO51+2TBZdehmoRwzShQKxMnGmzxfgfCgWwV
 838QDJZ1Ems5mm5Qd1CPrLu9v6bmyyvHKEeS2lHSgWjOgve4IyH1xAVkCyyerrsn9nz6WQD
 Tz5i+mENlKfsbqZVpo0ysd9Cv6J+w0Ldh/YdQ483u40VFh/cnc21I1zqMEApoU8YQlxnCD+
 JcMLr4Pm+iul69Jg3Jvog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dmTdxFNMAUE=:gY4N+YrLXbS0U5xmS9Y6XJ
 agnS9a/i3CJcicU6KBVVwXXgW7Ijz/GOgPLOOXJTSvxiiqMVbG49N2XtLK+kXNsB8KWcU9X2W
 fTCAxkjw010/kEzSz2lo31Xod71GR3Mlmnc4CPTzCTQR1lwwzQiqTJeQGqbd0KpYEb0A0koSE
 1pEOTxrkxIVcxlcQKAkWATL3RYyna5EXPeVrHGI/69gOifxwq8nBt934poyuO/qpDaqWZ6dsf
 4UG3DeNuVLt5sLqN+pFcio35FCrI2LGP5bEt4xjH4glSxPZT20tulKxOG11drjPEJyiXBgTNT
 Jcv21a2HNw1dhr8fulgAbqeJNu28+F9ORdfioZ4XMhpEuh0+AfZZesRtIOyGdbh4jIA82LdC5
 6I7EYrUNasNAZBCEaU9XEfscLE2MZ4QTF1vsNu7IDoOrXIcUxPOA3cS0lkRm4ta6uRGyU+n+g
 0UhE2bqroNbOq2zoY4Yw3IUjG+vavRbgmctS/YRLOAuWrJVxqT4Y9zZbhHt9tIaG1ypiwBOLy
 I04iqMfSVU9isstjuszmRw=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/05/2021 à 19:41, LemonBoy a écrit :
> From: Giuseppe Musacchio <thatlemon@gmail.com>
> 
> The implicit cast from abi_long to size_t may introduce an intermediate
> unwanted sign-extension of the value for 32bit targets running on 64bit
> hosts.
> 
> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> ---
>  linux-user/syscall.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 95d79ddc43..c425dfa278 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -13245,8 +13245,9 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>                  }
>                  poutoff = &outoff;
>              }
> +            /* Do not sign-extend the count parameter. */
>              ret = get_errno(safe_copy_file_range(arg1, pinoff, arg3, poutoff,
> -                                                 arg5, arg6));
> +                                                 (abi_ulong)arg5, arg6));
>              if (!is_error(ret) && ret > 0) {
>                  if (arg2) {
>                      if (put_user_u64(inoff, arg2)) {
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

