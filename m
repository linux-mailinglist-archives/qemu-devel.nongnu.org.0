Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469D15533E9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:43:43 +0200 (CEST)
Received: from localhost ([::1]:60156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3eAQ-0007Ao-76
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3e53-00004u-Ui
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:38:09 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:53727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3e51-0003UY-LP
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:38:08 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M91Tq-1o0v3M3hV0-0069lj; Tue, 21 Jun 2022 15:37:39 +0200
Message-ID: <d0d03b11-bcf9-46c7-0aaf-47ddb0909764@vivier.eu>
Date: Tue, 21 Jun 2022 15:37:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 4/7] target/m68k: use semihosting_exit_request on
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
 <20220621125916.25257-5-lmichel@kalray.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220621125916.25257-5-lmichel@kalray.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YXlJvO6xsaXWvxJ/g/H7/qTvN9n0P0VxCf9vl1zaFx53OhykIAg
 FDmULU2Qv8rnrWyB6LT6RCdOADoQtkpW9pXzZEWmPj9B/UPZNI48ugubvg4/fGPaDn0qPN0
 QmcQuABHoJbI9zwQ0Y4swJYbxCygnRpfqhJkDX5sXkeMRdSM7pEKjMiAbaxqgMNJGUgwZh1
 yVKi+m35o3MHvurz0gXkg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p8976kyJIqA=:/MrMMfEftzsC6mqBX34oGy
 yDC2/kx+JjCYyp/jf+X16VT+h1Z3HrhVDTPbrQd8Xtl/4gieAI0INuXRsjgcWsdxM19/pktBT
 ZSull0T18T+VCF9oaanFQLPWbeSdBjTYTm7Vy//g8gF/j286vu9N2jbVYEzS7jUWcNGkCv/7Z
 SdPZc6StoIa2NhDNypESyByycCRrQRZYX8fGx8MY0LQO0U3NAJcAtUtKOOcDtFCA9cI71Yj8P
 SrrKWkJ5tIes3MTCpJGq7WApByEwEiVRchwbIEb5ZeGKBVKV6P9eguytvRZf3hTTikdhyT6yS
 6jULLk/UUkX4n5wHBVmmWf9eDnoxmdNdbiLcCuR6tbn9b4IOFFyOgXWPGQ5MS8NHXOlK0uIvL
 7qMwhhVjhxLuYjCPG+0+fpruvItBNLX1veSvgOLnPPVsJctnRAF6dhM4wAJ5KFpgcVhIXyNGk
 R2D3e3sdMqllwTKpkj3HOt9IM9M8t55Zvx25OVLq6qKMOqx2cW0RXHCwCZJqd7w4POnwN4QKt
 1EcnI+Z+HSRXmKPMutZ7gmnd7jRQaR4T32m0dzi82b5dMYpnhL3dNm3diRToIba61MKtN7EHZ
 mrX7lzjflygc7HkZZG+z1skQv4ZD6qp5Xtm2odg1gky+99MXz+AVFLHafiPT+jwLCRXGr7c8b
 yliPbCZBh40tnus2PuhrPW9+9/qyUNs9WwRwu3Rg01aypbYo9PsjQ9Jjn6mX5Ph8x6UcI8+r2
 y0htJiGqgzQ4lGYlFKrc2CCkGnjbp++44shm2g==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
>   target/m68k/m68k-semi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


