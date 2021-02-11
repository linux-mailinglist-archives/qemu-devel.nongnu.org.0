Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3192319530
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 22:35:43 +0100 (CET)
Received: from localhost ([::1]:38488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAJck-0008LP-PE
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 16:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAJai-0007pH-Bn
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:33:36 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:36689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAJag-0001im-20
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:33:36 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M8QNy-1lEjQX1QVk-004Qhj; Thu, 11 Feb 2021 22:33:05 +0100
Subject: Re: [PATCH 1/4] linux-user/mips64: Restore setup_frame() for o32 ABI
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <20201119161710.1985083-2-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <81fff916-4bc3-f321-e9dd-45a72136c036@vivier.eu>
Date: Thu, 11 Feb 2021 22:33:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201119161710.1985083-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:F30nLQs5Moi6SmT2IVvYj1+teRKVTfwWNLyK0mMxCtUinENAA55
 K9KApnAxnm9FWcB391m+FPL5MiYKNcQJpzEFAjVnD7M0vmiSJ0UiCs11c2jEWbdpoI9Vhqb
 pQfE2NaPVdzLloRHVBKrP8TA0yaeE9lpev56xyYCUU+GXl/YVJjl5gtVZTEbJgWJvszhZt7
 rxCdTseaIb402dntOVtMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EVQTiSTST5Q=:eifPqJDwPiEWDTBsURNXY/
 H9e2TpjGpqzPURK+r2ry9tvQ7ntNbkPv1VbuDm64m4Tm5aP5SFwi0wRqG0aUHWfs7DlJzgu3M
 ymULxR2johh8D1G66sK8qUqQuo4Cj8ENy+MFSlpgbxy/3CFF7BWo8lu+qAGQjSHaul72aavxL
 QvFnAAlOpEpPP8kTlKwy93d8j30vf/dogxeVZ1wOVeMrFiIgOs39Ot/zDU8up1MxwwvfvlL8Q
 +lPZfQAAuroSsOyuC4Nh2ZJ/FvPAMv/+1XWLyiWlspMqnzrTOl8lV/Lb0YFBRc7VvGbpcW7G5
 odnULjFHbOHhxDUEhgqdBYDPDZL5rDs02AM5wpOneBfvSd5TH6lb41ltfJ40vjEM0HYZi2asV
 LvWBWHgb/umOuQXXz0uSBitTvE6BHH5WdUXzQ6/QAGKlerVW8b+Ny6Yn7/71m
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.119,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/11/2020 à 17:17, Philippe Mathieu-Daudé a écrit :
> 64-bit MIPS targets lost setup_frame() during the refactor in commit
> 8949bef18b9. Restore it declaring TARGET_ARCH_HAS_SETUP_FRAME, to be
> able to build the o32 ABI target.
> 
> Fixes: 8949bef18b9 ("linux-user: move mips/mips64 signal.c parts to mips directory")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/mips64/target_signal.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
> index 799f7a668cd..f1f0ed7f706 100644
> --- a/linux-user/mips64/target_signal.h
> +++ b/linux-user/mips64/target_signal.h
> @@ -67,4 +67,8 @@ typedef struct target_sigaltstack {
>  #define TARGET_MINSIGSTKSZ    2048
>  #define TARGET_SIGSTKSZ       8192
>  
> +#if defined(TARGET_ABI_MIPSO32)
> +/* compare linux/arch/mips/kernel/signal.c:setup_frame() */
> +#define TARGET_ARCH_HAS_SETUP_FRAME
> +#endif
>  #endif /* MIPS64_TARGET_SIGNAL_H */
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


