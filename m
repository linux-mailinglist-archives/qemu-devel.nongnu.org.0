Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE9443613B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 14:18:03 +0200 (CEST)
Received: from localhost ([::1]:40860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdX1F-0008SQ-3x
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 08:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mdWw9-0005k6-Gr
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:12:45 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:31937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mdWw6-0003QB-Cc
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:12:44 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 835F5746399;
 Thu, 21 Oct 2021 14:12:37 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6510F746333; Thu, 21 Oct 2021 14:12:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 608117462D3;
 Thu, 21 Oct 2021 14:12:37 +0200 (CEST)
Date: Thu, 21 Oct 2021 14:12:37 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Looking for advise on debugging a non-boot kernel on
 qemu-system-sh4
In-Reply-To: <4882e4cc-6754-1c8a-a8ae-a2ceeca115fb@physik.fu-berlin.de>
Message-ID: <e11d3ee1-2a25-7633-babd-d45f36b04c5b@eik.bme.hu>
References: <4882e4cc-6754-1c8a-a8ae-a2ceeca115fb@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Thu, 21 Oct 2021, John Paul Adrian Glaubitz wrote:
> I'm regularly building debian-installer packages for Debian's unofficial ports
> which includes sh4 among others. The kernel package and therefore the installer
> package contains a kernel for the SH7751R machine which is emulated by QEMU when
> choosing the "r2d" type.
>
> Unfortunately, I have not yet been able to boot a current kernel on qemu-system-sh4,
> the screen remains blank and there are no error messages. Booting an older 2.6 kernel
> works just fine.
>
> I'm using qemu-system-sh4 as follows:
>
> $ qemu-system-sh4 -M r2d -kernel vmlinuz-2.6.32-5-sh7751r -initrd initrd.gz -hda debian.img \
>  -append "root=/dev/sda1 console=tty0 noiotrap"
>
> The old 2.6 kernel from [1] boots fine while the current 5.14.x kernel from [2] does
> not produce any output.
>
> Can anyone enlighten me what I might be missing?

Adding -d in_asm shows it seems to loop early in the kernel but not sure 
where. Maybe try to compare addresses with System.map to find out where 
it's getting stuck (but System.map was not included in your installer 
image). Also if it works on earlier kernel you might try to bisect which 
kernel commit caused the problem. Maybe knowing that helps to tell where 
to look further.

Regards,
BALATON Zoltan

