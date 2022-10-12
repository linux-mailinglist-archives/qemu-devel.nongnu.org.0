Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC755FBEF8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 03:50:52 +0200 (CEST)
Received: from localhost ([::1]:60218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiQtW-0000s7-Pn
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 21:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1oiQrW-0007rx-94
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 21:48:46 -0400
Received: from home.keithp.com ([63.227.221.253]:48828 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1oiQrT-0004KF-Ff
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 21:48:45 -0400
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 5B80B3F3356C;
 Tue, 11 Oct 2022 18:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1665539318; bh=eFZMhKkrcllFx5sLF11CieeuGI5ctPTSqX14gamfDAM=;
 h=From:To:Cc:Subject:Date:From;
 b=QOPS5sb8bGUeSALDVCbrP2BpmbulGZRgycNCKiEwQg2msGQP/e2RttUrVHzvvPWa0
 nKrP8j7ibRj/lTzcwA44QcBT4iqrmahiF+PfqUgOlbCaofEO9Mr7Adpw+edG8GkP9B
 QzXWa4bNt9NGymvB91neerFg/zwY/dbLI+R0dRoyVz5TT3EKJk/Alf1Q7cEKVP1evn
 vfOC0ykpz7Y5LDDwkqcRQmFbIZjgc/htnXZQiAlbP0bzaGYkbjdXWvO11oQ0C1vSaj
 Ot7dGmV8jCYpIxPIo+OQr+keB8RdGtxtFhUeiHnmUw2HpjhiHA5EMcnSmfg1pHrQRH
 g77aF8PJhu1YA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id TuTDpNHI0heJ; Tue, 11 Oct 2022 18:48:37 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [192.168.11.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 3C5A23F3356A;
 Tue, 11 Oct 2022 18:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1665539317; bh=eFZMhKkrcllFx5sLF11CieeuGI5ctPTSqX14gamfDAM=;
 h=From:To:Cc:Subject:Date:From;
 b=eKsAIXzHNRxzfzVVnSTA2SqWaPObcQMU/Pl9R1/uOk3jYmw+3W1G9fg11GyTe0KxD
 6gL4ck4nE83G9Qq3rvAdXFtHTLpaK4TWs9U9Z66yUbEo/fO/tlF1JQsN+YFb75/TOw
 gJf1LcmapZBrEJQqmGUzG8QIMTgxkpZPTbf6vcRCxxu2zxtrMWFgce1gH9X+VWATbu
 ffeFR1zvcWYko0G2SFwpPe37CVbIo4EtKWQhM1uokRl1vV0GJNp16NCPILkz8CM/Qq
 majMGJEuMvhOYnn9nqs/QbfNkz24eA1zub8GI2sU+FDGnuefW8cLhOCUlpfhOjBov8
 JMWXwPrs+/ztQ==
Received: by keithp.com (Postfix, from userid 1000)
 id 028FD1E601C1; Tue, 11 Oct 2022 18:48:37 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Keith Packard <keithp@keithp.com>
Subject: [PATCH] semihosting: Write back semihosting data before completion
 callback
Date: Tue, 11 Oct 2022 18:48:22 -0700
Message-Id: <20221012014822.1242170-1-keithp@keithp.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Keith Packard <keithp@keithp.com>
From:  Keith Packard via <qemu-devel@nongnu.org>

'lock_user' allocates a host buffer to shadow a target buffer,
'unlock_user' copies that host buffer back to the target and frees the
host memory. If the completion function uses the target buffer, it
must be called after unlock_user to ensure the data are present.

This caused the arm-compatible TARGET_SYS_READC to fail as the
completion function, common_semi_readc_cb, pulled data from the target
buffer which would not have been gotten the console data.

I decided to fix all instances of this pattern instead of just the
console_read function to make things consistent and potentially fix
bugs in other cases.

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 semihosting/syscalls.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 508a0ad88c..78ba97d7ab 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -321,11 +321,11 @@ static void host_read(CPUState *cs, gdb_syscall_complete_cb complete,
         ret = read(gf->hostfd, ptr, len);
     } while (ret == -1 && errno == EINTR);
     if (ret == -1) {
-        complete(cs, -1, errno);
         unlock_user(ptr, buf, 0);
+        complete(cs, -1, errno);
     } else {
-        complete(cs, ret, 0);
         unlock_user(ptr, buf, ret);
+        complete(cs, ret, 0);
     }
 }
 
@@ -341,8 +341,8 @@ static void host_write(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
     ret = write(gf->hostfd, ptr, len);
-    complete(cs, ret, ret == -1 ? errno : 0);
     unlock_user(ptr, buf, 0);
+    complete(cs, ret, ret == -1 ? errno : 0);
 }
 
 static void host_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -428,8 +428,8 @@ static void host_stat(CPUState *cs, gdb_syscall_complete_cb complete,
             ret = -1;
         }
     }
-    complete(cs, ret, err);
     unlock_user(name, fname, 0);
+    complete(cs, ret, err);
 }
 
 static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -446,8 +446,8 @@ static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     ret = remove(p);
-    complete(cs, ret, ret ? errno : 0);
     unlock_user(p, fname, 0);
+    complete(cs, ret, ret ? errno : 0);
 }
 
 static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -471,9 +471,9 @@ static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     ret = rename(ostr, nstr);
-    complete(cs, ret, ret ? errno : 0);
     unlock_user(ostr, oname, 0);
     unlock_user(nstr, nname, 0);
+    complete(cs, ret, ret ? errno : 0);
 }
 
 static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -490,8 +490,8 @@ static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     ret = system(p);
-    complete(cs, ret, ret == -1 ? errno : 0);
     unlock_user(p, cmd, 0);
+    complete(cs, ret, ret == -1 ? errno : 0);
 }
 
 static void host_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -556,8 +556,8 @@ static void staticfile_read(CPUState *cs, gdb_syscall_complete_cb complete,
     }
     memcpy(ptr, gf->staticfile.data + gf->staticfile.off, len);
     gf->staticfile.off += len;
-    complete(cs, len, 0);
     unlock_user(ptr, buf, len);
+    complete(cs, len, 0);
 }
 
 static void staticfile_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -610,8 +610,8 @@ static void console_read(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
     ret = qemu_semihosting_console_read(cs, ptr, len);
-    complete(cs, ret, 0);
     unlock_user(ptr, buf, ret);
+    complete(cs, ret, 0);
 }
 
 static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -626,8 +626,8 @@ static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
     ret = qemu_semihosting_console_write(ptr, len);
-    complete(cs, ret ? ret : -1, ret ? 0 : EIO);
     unlock_user(ptr, buf, 0);
+    complete(cs, ret ? ret : -1, ret ? 0 : EIO);
 }
 
 static void console_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
-- 
2.37.2


