Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F3431AD14
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 17:24:47 +0100 (CET)
Received: from localhost ([::1]:55028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAxiv-00067y-0m
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 11:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAxhY-0005du-Gn
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:23:20 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:38401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAxhW-0003yy-5c
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:23:20 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M2fQ9-1lBE983Se7-0049DW; Sat, 13 Feb 2021 17:23:05 +0100
Subject: Re: [PATCH v2] linux-user: fix O_NONBLOCK usage for hppa target
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20210201220551.GA8015@ls3530.fritz.box>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <67de0810-fa99-c07a-4b42-95bb15edd5df@vivier.eu>
Date: Sat, 13 Feb 2021 17:23:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210201220551.GA8015@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/Nj50iWWCbdtipEecflpBorKRDQrWaamp6PlCtO7trvE3sabpLz
 Xp6DEalQ+/SjSydDG99oJo2mNsPStPq3DqPFmQYiXvHE2yclPpvn/p+Tl1c9DnnX28yK7uZ
 R9jPzqEnVAAG+7QrKzLFNoaNo7L6x+ORLqzeFZEx8Ue5afXj6UClSdAX0d2scd8W/DM8jvS
 Ohc1JMJ6i4nlBMIYknlfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0ElcWW8Ah6c=:yvuVUSlIFRRNpukFQ4CmRV
 ZBB7q1X+b10ZqMUYTB8/F79ajC6zyi0rpr9oS1sVoPGTX1EeOXJgWhyadPKyIfBYsKQ7B8OpN
 akaI5K6VwEltELxc5C69ShOmlxZz+ZZX7h4P4r5/OJHbd04kZC63iWJRa9PoQ/aCSVAELA8hq
 h3mA99/7n2boe0r8L1NnKKdfSzScqPgtPNXbaEOfee2tnLm9gDu8X01xVavaihnpcD/3Ds6xf
 nDRSPbkHBeduh7YiBXkQrFOOsD15t0X2tbUBAEbh7hOCPLnI91JVNxp+/oGYRBkg0HIJyEIZp
 +bmtzl08opWvH/xl2Jw2yojCu+sRajyxl9hp+OQTI0UoNPf5EkEz6bstNLEctNMJSDss8JhDk
 uZGYPPMLMgfH/t8F1XxO+2RtrHBGrl29KLeJSfBdQcHR+AxeDL0UsCotEK+tL
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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

Le 01/02/2021 à 23:05, Helge Deller a écrit :
> Historically the parisc linux port tried to be compatible with HP-UX
> userspace and as such defined the O_NONBLOCK constant to 0200004 to
> emulate separate NDELAY & NONBLOCK values.
> 
> Since parisc was the only Linux platform which had two bits set, this
> produced various userspace issues. Finally it was decided to drop the
> (never completed) HP-UX compatibilty, which is why O_NONBLOCK was
> changed upstream to only have one bit set in future with this commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75ae04206a4d0e4f541c1d692b7febd1c0fdb814
> 
> This patch simply adjusts the value for qemu-user too.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> ---
> 
> diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcntl.h
> index bd966a59b8..08e3a4fcb0 100644
> --- a/linux-user/hppa/target_fcntl.h
> +++ b/linux-user/hppa/target_fcntl.h
> @@ -8,7 +8,7 @@
>  #ifndef HPPA_TARGET_FCNTL_H
>  #define HPPA_TARGET_FCNTL_H
> 
> -#define TARGET_O_NONBLOCK    000200004 /* HPUX has separate NDELAY & NONBLOCK */
> +#define TARGET_O_NONBLOCK    000200000
>  #define TARGET_O_APPEND      000000010
>  #define TARGET_O_CREAT       000000400 /* not fcntl */
>  #define TARGET_O_EXCL        000002000 /* not fcntl */
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

