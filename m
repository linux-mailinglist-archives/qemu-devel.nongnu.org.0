Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D516936B5C6
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 17:28:37 +0200 (CEST)
Received: from localhost ([::1]:49506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb3A4-00015z-Vo
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 11:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lb38g-0000YU-7M
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:27:10 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:11611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lb38V-0002kn-Nq
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:27:09 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7D607746358;
 Mon, 26 Apr 2021 17:26:54 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 625DB74634B; Mon, 26 Apr 2021 17:26:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6103A746353;
 Mon, 26 Apr 2021 17:26:54 +0200 (CEST)
Date: Mon, 26 Apr 2021 17:26:54 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: X on old (non-x86) Linux guests
In-Reply-To: <YIaPdjz7PpvwVPP/@work-vm>
Message-ID: <925db5d2-f3f7-96cb-4549-8880408f018@eik.bme.hu>
References: <YIaPdjz7PpvwVPP/@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: Andrew Randrianasulu <randrianasulu@gmail.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Mon, 26 Apr 2021, Dr. David Alan Gilbert wrote:
>  Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting
> under QEMU which was pretty neat.  But I failed to find a succesful
> combination to get X working; has anyone any suggestions?

Adding Andrew who has experimented with old X framebuffer so he may 
remember something more but that was on x86.

>  That distro was from around 2000; the challenge is since we don't have
> VESA on non-x86, we can't change mode that way, so generic XF86_SVGA
> doesn't want to play with any of the devices.
>
>  I also tried the ati device, but the accelerated mach64 driver
> didn't recognise that ID.

The ati-vga partially emulates an ATI Rage128 Pro so it won't work with 
mach64 driver that is older and while functionally similar has different 
registers. You probably need to load aty128fb and then set a mode with 
fbset then may need to edit X conf but I forgot which option was neded, 
something about UseFb or similar so it won't try to change mode itself but 
use the already set Linux FB because otherwise it did not detect the card 
properly but I don'r remember the details so may be wrong. Also some 2D 
accel is emulated so may work without disabling it but I think has some 
bugs so it may have glitches.

>  Has anyone found any combo that works?
> I suspect using one of the existing devices, lying about PCI ID, and
> then turning off all accelerations might have a chance but I've not got
> that far.

Changing the PCI ID may not help as these ATI chips have different 
registers so only compatible with the right drivers. I've tried to use 
current ati-vga with a Mac ROM that expects mach64 but it did not work.

It may help to add -trace enable="ati*" and maybe also enable some debug 
defines in ati_int.h to see if it accesses the card at all but with the 
right driver that works with Rage128Pro it should produce some picture at 
least in fb console and we could run X with it on x86 before.

More info on ati-vga is here: 
https://osdn.net/projects/qmiga/wiki/SubprojectAti

By the way, last time I've experimented with it I've found that mouse 
pointer getting out of sync and jumping around is probably a result of 
mouse acceleration on the host is not taken into account when tracking 
guest pointer position. Is that possible and is there a way to fix it?

Regards,
BALATON Zoltan

