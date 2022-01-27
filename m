Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D910949EA64
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 19:32:11 +0100 (CET)
Received: from localhost ([::1]:35110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD9Z4-0006DE-EJ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 13:32:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nD9KW-0000fC-B0
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 13:17:10 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:44168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nD9KO-0006cs-CT
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 13:17:03 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 254237457EF;
 Thu, 27 Jan 2022 19:16:56 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0582C7456FE; Thu, 27 Jan 2022 19:16:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 03B787456E3;
 Thu, 27 Jan 2022 19:16:56 +0100 (CET)
Date: Thu, 27 Jan 2022 19:16:55 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Mouse pointer warping with gtk display
Message-ID: <15f521a3-712a-f8de-6994-bad6222681@eik.bme.hu>
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
Cc: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

We've found a problem with mouse pointer jumping around then constantly 
warping making it unusable which only seems to happen with the gtk 
display. Similar problem was reported with MacOS guests but now we could 
also reproduce with MorphOS on pegasos2 and thus confirm it's not a guest 
issue or hardware emulation problem but seems to be related to QEMU's gtk 
display. This can be reproduced as following (boot.img is the file from 
the root dir of the iso which is available from 
https://www.morphos-team.net/morphos-3.15.iso ):

qemu-system-ppc -M pegasos2 -cdrom morphos-3.15.iso -display sdl \
-L ../pc-bios -kernel boot.img -device ati-vga,romfile=""

This does not have this problem and mouse works but running with -display 
gtk has the mouse pointer issue making it unusable. It can be seemingly 
avoided with using -device ati-vga,romfile="",guest_hwcursor=true so I 
think problem is somewhere in mouse handling in ui/gtk.c with host side 
mouse pointer. The gd_motion_event() in that file has a big comment about 
warping mouse back to the middle near the end of the function which seems 
to ne what's happening and causing this as this does not appear in sdl.c 
that does not show the same issue but I don't understand what that code is 
trying to do.

It's a known problem that host mouse pointer can get out of sync with the 
guest which I think is because mouse acceleration on the host is not 
correctly taken into account when reporting mouse moves to the guest and 
this may try to correct that issue but it seems to cause more harm than 
good in some cases. Any idea what might be the problem and how to solve 
this? I wonder why nobody else is seeing this with other guests. (I'm not 
direcly interested in fixing it as I'm using sdl display but this makes it 
hard to use some guests for users whose distros make gtk backend the 
default which may actually be most people so it might be a good idea to 
improve this for them so I thought at least reporting the problem is 
useful.)

Regards,
BALATON Zoltan

