Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D08449EDE3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:58:38 +0100 (CET)
Received: from localhost ([::1]:40846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDCmr-0006c2-8l
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:58:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDCkV-0005n0-Be
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:56:11 -0500
Received: from [2001:738:2001:2001::2001] (port=42897 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDCkR-0005XR-5B
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:56:10 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B258E746D64;
 Thu, 27 Jan 2022 22:55:54 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 97BBE746381; Thu, 27 Jan 2022 22:55:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9629F746396;
 Thu, 27 Jan 2022 22:55:54 +0100 (CET)
Date: Thu, 27 Jan 2022 22:55:54 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: Mouse pointer warping with gtk display
In-Reply-To: <CABLmASH5K=mO0=k4oR76JS70a9L87rNzJu9OhtNR9dohzg5-jA@mail.gmail.com>
Message-ID: <4da9fc13-c6c3-f942-ee8c-5120b087515a@eik.bme.hu>
References: <15f521a3-712a-f8de-6994-bad6222681@eik.bme.hu>
 <CAJ+F1C+hwUJ5Zt9-bANNw8tpeeX4KyoRYk4g=qJNv3J-ji-LnA@mail.gmail.com>
 <CABLmASH5K=mO0=k4oR76JS70a9L87rNzJu9OhtNR9dohzg5-jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Thu, 27 Jan 2022, Howard Spoelstra wrote:
> While I can reproduce the issue you report when running morphos with gtk, I
> cannot currently reproduce with the Mac OS/OSX guests I tested on Linux
> host. Both mac99 (adb mouse and kbd) and mac99,via=pmu (usb mouse and kbd)
> keep the mouse inside the guest window with both sdl and gtk.

Interesting. I remember people seeing this with MacOS in the past but did 
some more testing now and indeed it does not seem to happen with MacOS and 
default VGA. But I could reproduce it with MorphOS on mac99.via=pmu and 
-device ati-vga but not with -vga none -device sm501 so maybe it's related 
to ati-vga then. (Booting MacOS with ati-vga to cross check is a bit 
complicated so I could not test that now and don't have a graphical Linux 
guest for mac99 either at the moment.)

I don't see how the display emulation can break mouse handling though. The 
ati-vga,guest_hwcursor=true option seems to help so it's something with 
host side mouse only. Maybe it's related to dpy_mouse_set() that we call 
when HW cursor regs are written but I have to check how this works in 
ati-vga because I've forgotten it by now. The strange thing is that the 
pointer seems to warp even when the mouse is not grabbed that I think 
should not happen but it just disappears when I click on the window and 
the mouse is grabbed. And it only happens with gtk, not with sdl. Some 
clues would still be welcome to get to the cause of this.

Regards,
BALATON Zoltan

