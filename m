Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688F16E7411
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 09:34:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp2Iw-0006IR-HD; Wed, 19 Apr 2023 03:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pp2Im-0006I0-EE
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 03:32:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pp2IY-0008Sp-Em
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 03:32:28 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A15C540126;
 Wed, 19 Apr 2023 10:32:00 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3728C219;
 Wed, 19 Apr 2023 10:32:00 +0300 (MSK)
Message-ID: <7f96ff38-2268-07d3-23a3-d46bf036b711@msgid.tls.msk.ru>
Date: Wed, 19 Apr 2023 10:32:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: get_relocated_path: the configured paths are not looked for?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hello!

Today I discovered an interesting issue here: I copied a system-installed
binary into another directory, in order to debug an unrelated issue. Just
to discover it does not work, being unable to find any modules or data
files.

Here's how the strace of typical qemu-system-i386 run looks like (the
relevant parts only):

access("/tmp/qemu-bundle", R_OK) = -1 ENOENT (No such file or directory)
access("/tmp/b/../lib/x86_64-linux-gnu/qemu/accel-tcg-i386.so", F_OK) = -1 ENOENT (No such file or directory)
access("/var/run/qemu/Debian_1_8.0~rc4+dfsg-3/accel-tcg-i386.so", F_OK) = -1 ENOENT (No such file or directory)

(the executable in this case is in /tmp, obviously).  And it fails with
error "fatal: could not load module for type 'tcg-accel-ops'".

This is despite the fact that qemu has been configured with proper --libdir
and other --foodir to point to actual dirs such as /usr/lib /usr/share etc.

Looking at the code I see this, in cutil.c:get_relocated_path() (simplified):

char *get_relocated_path(const char *dir)
{
     const char *bindir = CONFIG_BINDIR;
     const char *exec_dir = qemu_get_exec_dir();

     result = concat(exec_dir, "/qemu-bundle");
     if (access(result, R_OK) == 0) {  <== should be X_OK and should be dir, too!
         g_string_append(result, dir);
     } else if (!starts_with_prefix(dir) || !starts_with_prefix(bindir)) {
         g_string_assign(result, dir);
     } else {
         g_string_assign(result, exec_dir);
         .. search in  execdir and its parents ..
     }

This seems to be questionable.  And btw, even when running qemu from
the installed /usr/bin/ location, it does something weird:

access("/usr/bin/qemu-bundle", R_OK)    = -1 ENOENT (No such file or directory)
access("/usr/bin/../lib/x86_64-linux-gnu/qemu/accel-tcg-x86_64.so", F_OK) = 0
openat(AT_FDCWD, "/usr/bin/../lib/x86_64-linux-gnu/qemu/accel-tcg-x86_64.so", O_RDONLY|O_CLOEXEC) = 14

so it is not obvious why it skips the full path in this case (the 2nd
choice) and falls into the 3rd variant (search in execdir and parents).

Why it *ever* wants to search in parent dirs relative to executable
path? And why these !starts_with_prefix()?

BTW, the second starts_with_prefix(bindir) condition is just stupid, -
bindir is CONFIG_BINDIR (static), and start_with_prefix() checks for
CONFIG_PREFIX which is also static.

The whole this logic smells.. strange at best :)

How about this: if qemu-bundle exists, use qemu-bundle/dir, instead
use dir directly?  Why do we need all other conditions? Why do we
do different things depending on the place the executable is located?

In the past, qemu tried to look in pc-bios/ and other similar places, -
when run from the build dir.  But since it does not do this anymore,
we can just skip whole thing, no?

/mjt

