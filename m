Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B384F1E4E7C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 21:46:46 +0200 (CEST)
Received: from localhost ([::1]:41536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1je20j-0005Sj-B1
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 15:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1je1zD-0003hj-Bs
 for qemu-devel@nongnu.org; Wed, 27 May 2020 15:45:11 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:59490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1je1zB-0003g4-5Z
 for qemu-devel@nongnu.org; Wed, 27 May 2020 15:45:10 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E33137475FA;
 Wed, 27 May 2020 21:44:54 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BD35F746331; Wed, 27 May 2020 21:44:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BBFFD74633F;
 Wed, 27 May 2020 21:44:54 +0200 (CEST)
Date: Wed, 27 May 2020 21:44:54 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: USB pass-through problems
Message-ID: <alpine.BSF.2.22.395.2005272129480.93454@zero.eik.bme.hu>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 15:44:55
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I've seen a case when QEMU hangs with a passed through USB device. This is 
with -device usb-ehci and pass through with usb-host. This works until the 
attached USB device reboots (so likely it disconnects and reconnects) at 
which point QEMU hangs and need to be SIGKILL-ed to end (that's a bit hard 
to do with mouse and keyboard grabbed). I've got this stack trace:

#0  0x00007f23e7bd4949 in poll () at /lib64/libc.so.6
#1  0x00007f23e8bfa9a5 in  () at /lib64/libusb-1.0.so.0
#2  0x00007f23e8bfbb13 in libusb_handle_events_timeout_completed () at /lib64/libusb-1.0.so.0
#3  0x000055e09854b7da in usb_host_abort_xfers (s=0x55e09b036dd0) at hw/usb/host-libusb.c:963
#4  0x000055e09854b87a in usb_host_close (s=0x55e09b036dd0) at hw/usb/host-libusb.c:977
#5  0x000055e09854b92e in usb_host_nodev_bh (opaque=0x55e09b036dd0) at hw/usb/host-libusb.c:998
#6  0x000055e098757500 in aio_bh_call (bh=0x55e099ad9cc0) at util/async.c:136
#7  0x000055e09875760a in aio_bh_poll (ctx=0x55e0996c2620) at util/async.c:164
#8  0x000055e09875cb2a in aio_dispatch (ctx=0x55e0996c2620) at util/aio-posix.c:380
#9  0x000055e098757a3d in aio_ctx_dispatch (source=0x55e0996c2620, callback=0x0, user_data=0x0) at util/async.c:306
#10 0x00007f23e8c59665 in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
#11 0x000055e09875b0a9 in glib_pollfds_poll () at util/main-loop.c:219
#12 0x000055e09875b123 in os_host_main_loop_wait (timeout=0) at util/main-loop.c:242
#13 0x000055e09875b228 in main_loop_wait (nonblocking=0) at util/main-loop.c:518
#14 0x000055e0982c91f8 in qemu_main_loop () at softmmu/vl.c:1664
#15 0x000055e098162e7e in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at softmmu/main.c:49

so the problem may be in libusb but QEMU should not hang completely. The 
host is Linux with libusb 1.0.22.

Another problem I've seen with xhci is here: 
https://bugs.launchpad.net/qemu/+bug/1810000
but since the title does not clearly say it's a usb issue maybe you've 
missed that.

Regards,
BALATON Zoltan

