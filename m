Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAB82E1C97
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 14:37:00 +0100 (CET)
Received: from localhost ([::1]:38024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks4K3-0006xa-A5
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 08:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ks4IW-000624-QP
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 08:35:24 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:14944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ks4IT-0002Xu-TG
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 08:35:24 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7C01E746552;
 Wed, 23 Dec 2020 14:35:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 35DB574646C; Wed, 23 Dec 2020 14:35:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 346FB746383;
 Wed, 23 Dec 2020 14:35:18 +0100 (CET)
Date: Wed, 23 Dec 2020 14:35:18 +0100 (CET)
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Problems with irq mapping in qemu v5.2
In-Reply-To: <d337ba4c-3cd2-eb1a-4867-5e93bf510e4d@roeck-us.net>
Message-ID: <4ed9333-ae6b-a36d-861e-6a4bc541a898@eik.bme.hu>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <5ef852ee-8a53-df9d-82f4-33a68c05f53a@ilande.co.uk>
 <5849da05-a063-cd56-7709-c4760c8aa71f@roeck-us.net>
 <e2a1818e-366d-8a58-ce-e3eacb6787d7@eik.bme.hu>
 <d337ba4c-3cd2-eb1a-4867-5e93bf510e4d@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 10%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Tue, 22 Dec 2020, Guenter Roeck wrote:
> On 12/22/20 2:57 PM, BALATON Zoltan wrote:
>
> [ ... ]
>
>> I've already forgot about the details but we have analysed it quite throughly back when the via ide changes were made. Here are some random pointers to threads that could have some info:
>> This was the final solution that was merged as the simplest that worked for all cases we've tried to fix:
>> https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg03977.html
>>
> This set of patches is in v5.2, yet I can still not instantiate an IDE drive, at least
> not with "-drive file=<filename>,if=ide". Is there some other means to instantiate
> an ide drive with the fuloong2e emulation ?
>
> For reference, here is my qemu command line:
>
> qemu-system-mips64el -M fulong2e \
>    -kernel vmlinux -no-reboot -m 256 \
>    -snapshot -drive file=rootfs.mipsel.ext3,format=raw,if=ide \
>    -vga none \
>    --append "root=/dev/sda console=ttyS0" \
>    -nographic -serial stdio -monitor none

This is what worked the last time we've tried:

https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg04086.html

and this was my understanding of the issues with this VIA IDE function of 
these integrated southbridge/superio chips and Linux's approach to them 
that may be relevant to debug this:

https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg00019.html

We've found that pegasos2 PPC board uses this "half-native" mode where 
IRQs are using ISA IRQs but not sure what the fuloong2e has. Linux did not 
seem to care as long as there's no mismatch between config bits and IRQ 
routing. Although we've also found some comments in Linux may be 
misleading:

https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg02349.html

For the command line I never know which of these work for which machines 
so I just avoid using -drive if=... If the machine has 4 IDE ports then 
-hda -hdb -cdrom usually works, otherwise the most verbose form should 
always work which is:

-drive if=none,id=cd,file=some.iso,format=raw \
-device ide-cd,drive=cd,bus=ide.1

and similar for HD image with ide-hd and bus=ide.0 or wherever you want to 
connect it.

Regards,
BALATON Zoltan

