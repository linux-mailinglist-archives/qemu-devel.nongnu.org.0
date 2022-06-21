Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8385533C8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:38:34 +0200 (CEST)
Received: from localhost ([::1]:47676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3e5R-00077O-8q
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3e2w-0004lF-AZ
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:35:58 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:46273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3e2u-0003A0-KB
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:35:58 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N7xml-1nYy8g3dMR-014xfC; Tue, 21 Jun 2022 15:35:22 +0200
Message-ID: <5290985a-426d-09ad-5ba6-484cc343d300@vivier.eu>
Date: Tue, 21 Jun 2022 15:35:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 5/7] target/mips: use semihosting_exit_request on
 semihosted exit syscall
Content-Language: fr
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20220621125916.25257-1-lmichel@kalray.eu>
 <20220621125916.25257-6-lmichel@kalray.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220621125916.25257-6-lmichel@kalray.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:H8OZSm930imy9zVoNwO01gYl2iQysaqzSzp3SoGB2kceDJw7gIZ
 3nJ0JmOsp3EhOdGLwP2SOM2h9+1YTPJtedUX0IQc6W2/qFhicwCJGz26TdGV/RjXVO6uiiC
 mnvhrO1NVRvojZFpYXnrq7KhiLxWUFkrPYPIp6hpdBmuZo4wPwu/qIV96h3w4NwiLtWXE4b
 hMicEpAcQMTzLQTC3kJkg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:R0qzEm48q44=:Zm/LcKyfADQ04suT1QzP02
 gAEwbdpJZWD6SzKYj6zqZwWPXLm1O/sQGJ0OPC8kwPimmd8olSiZyqdhqAR42dOlsU6UVFJHK
 PpHiQkrmc29exRDGm3Rt6vcCfaqo3mdKoYgpuCawYBKjRp973EFhgHZByn/wCYcD4PqiEIHGe
 Wf9uZN8NM+/tWLLxbKhNN73DVk9fl55VKAJqkVv7zmVXF8sw2eraQxWswSmtbkFOdnnGsu0LT
 jkIEZVx/nbC0WoDkonrmoxkeP32eh5NkT632YSLDvWaTiy1LPAkpo+L520/jTrT/U/8ek2z+e
 gCWTP6AHjTB4xYa0vjNdPFVqw07KnKu5G6rRWbBRz/PcJopgmNyb+8fupbwF8c5avuOzY67pV
 R0hF9W9vSmsUOuhovgeWz+kfzCRVaFPjFPQRm20Y1rc+e96nvJVzVflq+sPpp5f4noYwOeGsv
 iviyIF2P4zJetlb8lPyGrEYOFd/Kpgp6SD7cqUtLaWO0x2kWRvhROyfQx4v6yFTnQ4EBvwJch
 MAXYTDVRw8spf10yMq0UVUg2Z4bjXmPTvfNZXAbbpaft26Qr/ReKngRwqBX059pRj4OKQBwLF
 eHphtc6vQSZD7WNfHTDShQrrkTmJxxdUhyB2kL8Ok6cyIa49C+Q8+Pj7Vd1L8ZJYHD2v2gMXL
 n4gfc6nwx0mE/VLQ87F7BLYEIAKjWXnlfIDwk4xajMVs3jFfTKjX8dxwh6UXug/PjfNIX2hYD
 w00wjt+lEfMdh6fbx5/YKzB76bJ41pf79pBUTA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/06/2022 à 14:59, Luc Michel a écrit :
> Use the new semihosting_exit_request instead of a call to exit when
> handling a semihosted exit syscall.
> 
> Signed-off-by: Luc Michel <lmichel@kalray.eu>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
> index b4a383ae90..94be486925 100644
> --- a/target/mips/tcg/sysemu/mips-semi.c
> +++ b/target/mips/tcg/sysemu/mips-semi.c
> @@ -245,11 +245,11 @@ void helper_do_semihosting(CPUMIPSState *env)
>       char *p, *p2;
>   
>       switch (op) {
>       case UHI_exit:
>           qemu_log("UHI(%d): exit(%d)\n", op, (int)gpr[4]);
> -        exit(gpr[4]);
> +        semihosting_exit_request(gpr[4]);
>       case UHI_open:
>           GET_TARGET_STRING(p, gpr[4]);
>           if (!strcmp("/dev/stdin", p)) {
>               gpr[2] = 0;
>           } else if (!strcmp("/dev/stdout", p)) {


Reviewed-by: Laurent Vivier <laurent@vivier.eu>

