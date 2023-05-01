Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85666F333E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:56:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVrk-0006Iu-CG; Mon, 01 May 2023 11:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVri-0006Ig-Iz
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:55:02 -0400
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVrg-0001jH-J6
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:55:02 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mnq4Q-1qd1201XY2-00pNUw; Mon, 01 May 2023 17:54:58 +0200
Message-ID: <911ff422-2d59-89a5-9c75-0f7bc68d61ea@vivier.eu>
Date: Mon, 1 May 2023 17:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/2] linux-user: Don't require PROT_READ for mincore
Content-Language: fr
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>, qemu-devel@nongnu.org
References: <20230422100314.1650-1-thomas@t-8ch.de>
 <20230422100314.1650-3-thomas@t-8ch.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230422100314.1650-3-thomas@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zncQ488RHRdBNhs+50cpLwQNvwouW4Mc1h1rkhOpdQ3TAVPt+UG
 QKn+4vVvZO4d5ruvyqXJasjMm0g0NC90+iUxACiyYLArYfdAyWm/sLTEp1ETQbheKpk0W1x
 4WiZeBvhPKTIDFWtC9zAYSkcaBC+gq4Mk/neEPOrAjchWy6Z7vJI12QEeKWtFnrgRZHYuLV
 YNOVuX0lSuXiHXYlAo8Mw==
UI-OutboundReport: notjunk:1;M01:P0:uuQ4agY1y3A=;3FNda017eVCrSs3mB02AEDvUnEt
 ARMSnIDw9WtyyeYAQfUW+j22jqDoMte4G4OdRIt1EDzF1kyVo4IposvGGEYrWd/F+2xi9Pf4E
 6rnbf+dlnihjc3F1igV7pnjrGSN91u4wahrSBds1Rqy8DU00MRamOMhVC4FOfpYF8c8NKbThj
 F1dx++GE7k/ylH0KiWhksL36EnhFsln7miTWf2265J7t+HS7lCacFRe3+4ls29vhgcmMiJtcR
 gvn07NWkZsAVjF5zRZVSzS66sLzQ8odV/f+cgq++XI4Cbp8+G74J+bPLj048mkT6+A0stokPa
 cDZ6hTo9hCtnrXSztUkBOEe9Oo+Bw2zt7sVpDGAQfM4ucHHIUxw1p07lqYyTOS0iJT0+cdRHi
 h5SeyAnFaLfi99wzDytnDUoUBdWIcPbA8ZkU+U84BlykiSUP7S6K+hJXBBGMPP8AJX2i+JfsO
 znLA8cWJP8Y1+To+h4Obnsx2Sw/b51CIJE1cHM4w9u3pCHz8w1wPyDmqK2/VvOyP+B8K71Mrz
 t/u45qo3r4Dj7mf/aRhnXPYc1olqTAUz46SPOJ3BHiMfPAyFgePSSih/VYZ9Rp8tPBC+5yrjk
 vR/a3J+4IIfzaJ2HbWMESlcsNjgt1iBxNTOsG86qLEwkxYVjpE2WWlZ+VXDy0AX5JxnZgx7/F
 rfbOIH42n/Gg9Kzk2J4NltjUZbLRmkDFy8VdJaItag==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 22/04/2023 à 12:03, Thomas Weißschuh a écrit :
> The kernel does not require PROT_READ for addresses passed to mincore.
> For example the fincore(1) tool from util-linux uses PROT_NONE and
> currently does not work under qemu-user.
> 
> Example (with fincore(1) from util-linux 2.38):
> 
> $ fincore /proc/self/exe
> RES PAGES  SIZE FILE
> 24K     6 22.1K /proc/self/exe
> 
> $ qemu-x86_64 /usr/bin/fincore /proc/self/exe
> fincore: failed to do mincore: /proc/self/exe: Cannot allocate memory
> 
> With this patch:
> 
> $ ./build/qemu-x86_64 /usr/bin/fincore /proc/self/exe
> RES PAGES  SIZE FILE
> 24K     6 22.1K /proc/self/exe
> 
> Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
> ---
>   linux-user/syscall.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 69f740ff98c8..5ec848b459f7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -11897,7 +11897,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>   #ifdef TARGET_NR_mincore
>       case TARGET_NR_mincore:
>           {
> -            void *a = lock_user(VERIFY_READ, arg1, arg2, 0);
> +            void *a = lock_user(VERIFY_NONE, arg1, arg2, 0);
>               if (!a) {
>                   return -TARGET_ENOMEM;
>               }

Applied to my linux-user-for-8.1 branch.

Thanks,
Laurent

