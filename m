Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76985B3F3B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 18:49:58 +0200 (CEST)
Received: from localhost ([::1]:37288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9uCL-0007r6-I8
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 12:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36634)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <olivier.dion@polymtl.ca>) id 1i9tMW-0007tU-Av
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 11:56:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <olivier.dion@polymtl.ca>) id 1i9tMU-00046O-Rq
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 11:56:23 -0400
Received: from smtp.polymtl.ca ([132.207.4.11]:49303)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <olivier.dion@polymtl.ca>)
 id 1i9tMU-00044K-JC
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 11:56:22 -0400
Received: from clara.localdomain (modemcable059.101-200-24.mc.videotron.ca
 [24.200.101.59]) (authenticated bits=0)
 by smtp.polymtl.ca (8.14.7/8.14.7) with ESMTP id x8GFtwgX006121
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT); 
 Mon, 16 Sep 2019 11:56:11 -0400
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.polymtl.ca x8GFtwgX006121
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polymtl.ca;
 s=default; t=1568649372;
 bh=AT5byEvtCNJhRMNU93MOcBepM91pfAWW9NbxwvrahRQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qOaghfLL104z4K7vz7vUkxpGf25Emc7n4aUsBDicExT/kRyglq25Oi6jG5o/0LSCj
 VdqdmT+5plw8DvyaHKtrcRjdmZJ9x5pOHzUKoQLayt8VgtYK5EOve6cYj8htfZXkya
 brjZy8OYuY+MPi9dIGxlXrkEQP+6e5UgM35K/QzI=
From: Olivier Dion <olivier.dion@polymtl.ca>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 11:55:44 -0400
Message-Id: <20190916155545.29928-1-olivier.dion@polymtl.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190807135458.32440-1-dion@linutronix.de>
References: <20190807135458.32440-1-dion@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Poly-FromMTA: (modemcable059.101-200-24.mc.videotron.ca [24.200.101.59]) at
 Mon, 16 Sep 2019 15:55:58 +0000
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 132.207.4.11
Subject: [Qemu-devel] [PATCH v2 0/1] Handle /proc/self/exe in execve
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
Cc: Olivier Dion <olivier.dion@polymtl.ca>, john.ogness@linutronix.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Changes from v1

  - Introduce the patch as a bug fix, rather than a security fix
  - Use do_openat and safe_execveat instead of copying exec_path
  - Extensive test case example
  
* Test case

  I will present a short program that demonstrated the bug, i.e. what
  is the expected behavior and what really happens.  Then, I will
  explain how this patch fixes this bug.

** The program

   -------------------------------------------------------------------
   #include <errno.h>
   #include <string.h>
   #include <unistd.h>


   static char *ARG0 = "STOP";
   static char *ARG1 = "-this-is-not-an-option";


   int main(int argc, char *argv[], char *envp[])
   {
           (void)argc;
           if (0 == strcmp(argv[0], ARG0))
                   return 0;
           argv[0] = ARG0;
           argv[1] = ARG1;
           execve("/proc/self/exe", 
                  (char **const)argv,
                  (char **const)envp);
           return errno;
   }
   -------------------------------------------------------------------

   Note that in every cases, this program should be run with at least
   one argument, so that argv[1] points to something.

*** Expected behavior

   This program when run normally, i.e. without an emulator or with
   this patch applied, will run two times.  The first time, it will
   change its argv[0] and argv[1] and recursively call itself.  The
   second time, it will stop at the string comparaison between argv[0]
   and the sentinel ARG0, returning 0.  Thus, we expect the program to
   finish with error code 0 and nothing is printed to stdout&stderr.

*** What really happens

   When emulated by qemu-user, this program will fail to call itself
   recursively and will instead call qemu-user.  This is where ARG1
   becomes useful.  It's indeed set to an option that is not supported
   by qemu-user, and thus we expected two things

       1) A message will be printed to stdout&|stderr
       2) A error code different from 0 will be returned

   For example, I get the following output with error code 1
   -------------------------------------------------------------------
   qemu: unknown option 'this-is-not-an-option'
   -------------------------------------------------------------------

*** Automated testing

    The following is a quick bash script that demonstrates how to use
    this test case.  I suppose here that qemu-user is the correct
    emulator for the arch of the compiled program a.out.
    ------------------------------------------------------------------
    #!/bin/bash
    out=$(qemu-user ./a.out foo)
    ret=0
    if [[ $out != "" || $? != 0 ]]; then
        ret=1
    fi
    exit $ret
    ------------------------------------------------------------------

* Fixing the bug

   This patch introduces the use of safe_execveat instead of
   safe_execve for the emulation of execve.  By using the do_openat
   function, we ensure that the executable file descriptor is really
   the one the user wants.


Olivier Dion (1):
  Handle /proc/self/exe in syscall execve

 linux-user/syscall.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

-- 
2.23.0


