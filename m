Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795C16586E0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 22:03:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAdYH-0006RC-MT; Wed, 28 Dec 2022 16:01:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pAdYE-0006Qe-2e
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 16:01:27 -0500
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pAdY8-0004Gm-Sd
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 16:01:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1672261275; bh=klPCC1oQxh/8DQKChs9Q39TbYRGuQxenw3UuuKrqbzg=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
 b=BkxY4vWLvnNmSk8J2u8FtIYguByKXpzRHPGmV/AzOMD2xefwsNJtgIlOljRTUrVNc
 QzrI3Kusm13tAbntjJ290hyTCA5G3TBA1KzMwv4nWO3TLVPg3MYZoFk5POByNIzUM2
 sHS7rwynGVLgn1nYHnFw1qd/5aY7wR58f6YvCxtni9D+vsNsf+UWjaNU5sGMz/K2PS
 ft3PA7FRFI3MfGRrUqrXeuDhlykIAtVFZYdmoTO2boQcZ5kczsLAkR18LnRkikHbSt
 5QTsgwkEuU5LXIRkPEmA0nGp5I7S0+Lo39No+yNdd/4L9jZECf1lWT89mxFpdt05oQ
 okPOzYcnrxh4w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.184.137]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzb8-1pK1EX0sdO-00QxBZ; Wed, 28
 Dec 2022 22:01:15 +0100
Message-ID: <3ce79ab4-c8c8-e5e5-94e3-07d02f8d2c6d@gmx.de>
Date: Wed, 28 Dec 2022 22:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] linux-user: Fix /proc/cpuinfo output for sparc and hppa
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <Y5juEOgG2Jnad1j9@p100>
Content-Language: en-US
In-Reply-To: <Y5juEOgG2Jnad1j9@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0XMcdsTpkP8lHPbfEgDDZ+1YzHcdbT/QEDhh5FHB+T1sDT5Ozts
 qx2atAQSV1pc9EBjVqqij/TYAWCGw5fVaK2dfbSPeDwJ/XWjyw8Rofxm0LTF3TSXfC3iolk
 FsecpOEfkxZJzmWz6Gn1/of7OGj+YsYZv/7vm6mGaLizwOKvzCMUhDR8VKTgOCYuz6rONQA
 MGqn4FQqjOd4LI8fJVAUg==
UI-OutboundReport: notjunk:1;M01:P0:6jwEe9e4bgI=;mWE39brlpKmHeIVis3epZHXfsKA
 SsAVO/KBpKnMf2ID0g8dW4hgC7ap/CsOWb+klNPFWZpiVbSK9ij60bfy9zR2pmW/tqOfOo+L+
 3QtsOJZvmQmgyJIZd2sBU1PJYyyKUWJINdE96j/bAM0c25YdyH5mkXAm09A6XF1/EBqT0ckOl
 51JpIihQE/SYE1yvAa6biIJsn0ruHcoP1kTEeb2DjijWNAe6Yewp+3DQdlh/CU+vRp7qz5kvK
 wWnR5AIayB9iQSzfyBVOVJeAK9/Gc4ImaxetKflV8iHrcIdInDEg57I8sdOtXncMjAXaNyHUN
 odLvOVRV8ci5OuSWJ+Z9OoEoN4AyZNq15N7TFmiiO8qY7ScHYM0XSpManbpxKsi2pwWCctCRz
 BOjnL420OL9kZo9l7dUmQYoLhxtzC7gMCKOMTlnqAlMX8wSgU4lBK4T0xtndBCkNa3h5jN3ax
 66LgTriWimyJ02dYAAFQub1MgewiNdmzzR+GGJCbMYKOeHrby0HUxfsbVfDmbYB8vKglZOaaV
 9NPoKfQn3VjMo9PeJqjQ0q/R0kxXFL7TFEnfitfYTUkFIIavpqroRzr3X9PtGL5e7M/+C5T2Q
 hFiVJuMEcBcBa/4TwGOn3t2/JEnjPD9MIxx/pzZ/fmJD0JjNcjGbX3ZgLb1Fe2mrpseUlZZ/v
 QW/ZaVrXlvF7KlZsnrz8+SdbettM2uhhKzO89DDnMPOGN4STodWmkQydwzu/caOV/XTLCapPX
 cV10/o4JOUX1Ju7PxF2wZpzlSf8SPOo3Cf9hb1Fq82uH6tpFnjToV1DErvcBzwo6yNIfkYACR
 C68MANSKWXgb9Om4Ey0iQaLJhb5cwuur5SoJshs3EeBussHHooavMYfbSK9/lePRx9brSkdw4
 oavC6B4PVaHYzQDxlkH2J3sHOJkIm+eP0YYwsOuvW5wvelBCZHbPiukLjrZhKGVFzF90+KgwW
 40mzagajeRoVvYpCVrpCoKJmX+Q=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 12/13/22 22:26, Helge Deller wrote:
> The sparc and hppa architectures provide an own output for the emulated
> /proc/cpuinfo file.
>
> Some userspace applications count (even if that's not the recommended
> way) the number of lines which start with "processor:" and assume that
> this number then reflects the number of online CPUs. Since those 3
> architectures don't provide any such line, applications may assume "0"
> CPUs.  One such issue can be seen in debian bug report:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1024653
>
> Avoid such issues by adding a "processor:" line for each of the online
> CPUs.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> ---
> v2:
> - drop m68k part (based on feedback from Laurent Vivier <laurent@vivier.=
eu>)
> - change commit message
>
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 9e2c0a18fc..d58e9b8d10 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8299,7 +8299,13 @@ static int open_net_route(CPUArchState *cpu_env, =
int fd)
>   #if defined(TARGET_SPARC)
>   static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>   {
> -    dprintf(fd, "type\t\t: sun4u\n");
> +    int i, num_cpus;
> +
> +    num_cpus =3D sysconf(_SC_NPROCESSORS_ONLN);
> +    for (i =3D 0; i < num_cpus; i++) {
> +        dprintf(fd, "%sprocessor\t: %d\n", (i > 0) ? "\n":"", i);

it turned out, that the procps tools expect the /proc/cpuinfo file
to have a trailing \n at the end of the file.
So, I'll respin this patch and send a v3 version to replace this
conditional \n-output.

Same applies for the hppa arch.....


> +        dprintf(fd, "type\t\t: sun4u\n");
> +    }
>       return 0;
>   }
>   #endif
> @@ -8307,11 +8313,17 @@ static int open_cpuinfo(CPUArchState *cpu_env, i=
nt fd)
>   #if defined(TARGET_HPPA)
>   static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>   {
> -    dprintf(fd, "cpu family\t: PA-RISC 1.1e\n");
> -    dprintf(fd, "cpu\t\t: PA7300LC (PCX-L2)\n");
> -    dprintf(fd, "capabilities\t: os32\n");
> -    dprintf(fd, "model\t\t: 9000/778/B160L\n");
> -    dprintf(fd, "model name\t: Merlin L2 160 QEMU (9000/778/B160L)\n");
> +    int i, num_cpus;
> +
> +    num_cpus =3D sysconf(_SC_NPROCESSORS_ONLN);
> +    for (i =3D 0; i < num_cpus; i++) {
> +        dprintf(fd, "%sprocessor\t: %d\n", (i > 0) ? "\n":"", i);

^^  here.

Helge

> +        dprintf(fd, "cpu family\t: PA-RISC 1.1e\n");
> +        dprintf(fd, "cpu\t\t: PA7300LC (PCX-L2)\n");
> +        dprintf(fd, "capabilities\t: os32\n");
> +        dprintf(fd, "model\t\t: 9000/778/B160L - "
> +                    "Merlin L2 160 QEMU (9000/778/B160L)\n");
> +    }
>       return 0;
>   }
>   #endif


