Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE197435E4D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 11:51:30 +0200 (CEST)
Received: from localhost ([::1]:41184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdUjS-0006ky-38
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 05:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1mdUhw-0005XV-N8
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:49:56 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:35689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1mdUht-0008Ud-62
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:49:56 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94)
 for qemu-devel@nongnu.org with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1mdUhV-0015Pc-2T; Thu, 21 Oct 2021 11:49:29 +0200
Received: from p57bd9c1a.dip0.t-ipconnect.de ([87.189.156.26]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.94)
 for qemu-devel@nongnu.org with esmtpsa (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1mdUhU-000Sd0-Kb; Thu, 21 Oct 2021 11:49:29 +0200
Message-ID: <4882e4cc-6754-1c8a-a8ae-a2ceeca115fb@physik.fu-berlin.de>
Date: Thu, 21 Oct 2021 11:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Looking for advise on debugging a non-boot kernel on qemu-system-sh4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.156.26
Received-SPF: pass client-ip=130.133.4.66;
 envelope-from=glaubitz@zedat.fu-berlin.de; helo=outpost1.zedat.fu-berlin.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello!

I'm regularly building debian-installer packages for Debian's unofficial ports
which includes sh4 among others. The kernel package and therefore the installer
package contains a kernel for the SH7751R machine which is emulated by QEMU when
choosing the "r2d" type.

Unfortunately, I have not yet been able to boot a current kernel on qemu-system-sh4,
the screen remains blank and there are no error messages. Booting an older 2.6 kernel
works just fine.

I'm using qemu-system-sh4 as follows:

$ qemu-system-sh4 -M r2d -kernel vmlinuz-2.6.32-5-sh7751r -initrd initrd.gz -hda debian.img \
  -append "root=/dev/sda1 console=tty0 noiotrap"

The old 2.6 kernel from [1] boots fine while the current 5.14.x kernel from [2] does
not produce any output.

Can anyone enlighten me what I might be missing?

Thanks,
Adrian

PS: Please CC me as I am subscribed without getting messages.

> [1] https://people.debian.org/~aurel32/qemu/sh4/
> [2] https://cdimage.debian.org/cdimage/ports/current-debian-installer/sh4/

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

