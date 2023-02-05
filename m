Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C537668B14D
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 20:11:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOkPL-0000U3-GM; Sun, 05 Feb 2023 14:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pOkPI-0000Tu-WA
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 14:10:33 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pOkPF-0005Yh-Iq
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 14:10:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2DD984004C
 for <qemu-devel@nongnu.org>; Sun,  5 Feb 2023 22:10:19 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id BA6FD9A
 for <qemu-devel@nongnu.org>; Sun,  5 Feb 2023 22:10:17 +0300 (MSK)
Message-ID: <3bae2f38-1f16-46a9-604c-7a0a3e141471@msgid.tls.msk.ru>
Date: Sun, 5 Feb 2023 22:10:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: qemu-img hangs on s390x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

There's a bug filed against qemu on debian, about qemu-img hanging on s390x.
While digging in, I discovered that the thing is broken there indeed, and it
is broken for a very long time, and it is interesting.

The reproducer is rather simple:

  qemu-img create -f qcow2 -o preallocation=metadata blank-disk-1s.qcow2 512

this hangs until interrupted, after writing 327680 bytes of output.
I haven't tried old versions, - 5.2 hangs for sure, as is 7.2 and apparently
all in-between. In particular, current debian sid (whole thing) and 2-years
old debian bullseye hangs equally.

But the thing is that it does not hang when creating file on a tmpfs, -
when the filesystem is tmpfs, it always works.

Also, a few times I were able to run the above qemu-img create successfully, -
maybe 2 out of 100 runs or so.

It looks like the problem has been there for a very long time, and it is
timing-dependent.

Comparing strace of the two runs, I see differences in most futex operations.
Here's the parent process:

...
  read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
  ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = 1 ([{fd=7, revents=POLLIN}])
-futex(0x2aa29af8bb4, FUTEX_WAKE_PRIVATE, 1) = 1
+futex(0x2aa03600bb4, FUTEX_WAKE_PRIVATE, 1) = 0
  read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
+futex(0x2aa03600bb0, FUTEX_WAKE_PRIVATE, 1) = 1
  ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = 1 ([{fd=7, revents=POLLIN}])
-futex(0x2aa29af8bb0, FUTEX_WAKE_PRIVATE, 1) = 1
+futex(0x2aa03600bb4, FUTEX_WAKE_PRIVATE, 1) = 0
  read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
  ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = 1 ([{fd=7, revents=POLLIN}])
-futex(0x2aa29af8bb4, FUTEX_WAKE_PRIVATE, 1) = 1
+futex(0x2aa03600bb0, FUTEX_WAKE_PRIVATE, 1) = 0
  read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
  ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = 1 ([{fd=7, revents=POLLIN}])
-futex(0x2aa29af8bb0, FUTEX_WAKE_PRIVATE, 1) = 1
+futex(0x2aa03600bb4, FUTEX_WAKE_PRIVATE, 1) = 0
  read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
  ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = 1 ([{fd=7, revents=POLLIN}])
-futex(0x2aa29af8bb4, FUTEX_WAKE_PRIVATE, 1) = 0
+futex(0x2aa03600bb0, FUTEX_WAKE_PRIVATE, 1) = 1
  read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
-ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? ERESTARTNOHAND (To be restarted if no handler)
-ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? ERESTARTNOHAND (To be restarted if no handler)
-ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? ERESTARTNOHAND (To be restarted if no handler)
-ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? ERESTARTNOHAND (To be restarted if no handler)
-ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? ERESTARTNOHAND (To be restarted if no handler)
-ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? ERESTARTNOHAND (To be restarted if no handler)
-ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? ERESTARTNOHAND (To be restarted if no handler)
-ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? ERESTARTNOHAND (To be restarted if no handler)
-ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? ERESTARTNOHAND (To be restarted if no handler)
-ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? ERESTARTNOHAND (To be restarted if no handler)
-ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? ERESTARTNOHAND (To be restarted if no handler)
-ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? ERESTARTNOHAND (To be restarted if no handler)
-ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? ERESTARTNOHAND (To be restarted if no handler)
-ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? ERESTARTNOHAND (To be restarted if no handler)
  ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = 1 ([{fd=7, revents=POLLIN}])
---- SIGINT {si_signo=SIGINT, si_code=SI_KERNEL} ---
-+++ killed by SIGINT +++
+futex(0x2aa03600bb4, FUTEX_WAKE_PRIVATE, 1) = 0
+read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
+ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = 1 ([{fd=7, revents=POLLIN}])
+futex(0x2aa03600bb0, FUTEX_WAKE_PRIVATE, 1) = 0
+read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
...

(I've hit Ctrl+C after quite some time).

I'll take another look at this tomorrow. But if someone knows
what's going on there, please tell me :)  The situation is quite
interesting, - is it possible we missed such a serious issue somehow?

Thanks,

/mjt

