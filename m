Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0063431B0F4
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 16:34:10 +0100 (CET)
Received: from localhost ([::1]:34878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBJPV-0000Vq-92
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 10:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lBJHo-00075f-CA
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 10:26:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lBJHm-0002yj-3G
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 10:26:12 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E5F95403D8
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 18:25:57 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 81454DE
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 18:25:58 +0300 (MSK)
To: qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: RFC: linux-user: preserving argv[0] of the original binary in context
 of binfmt-misc
Message-ID: <27dfe8eb-adce-8db4-f28b-c42858b086db@msgid.tls.msk.ru>
Date: Sun, 14 Feb 2021 18:25:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Hi!

As known for a long time, qemu's linux-user, when invoked in context of binfmt-misc mechanism,
does not preserve the original argv[0] element, so some software which relies on argv[0] is
not functioning under qemu-user.  When run this way, argv[0] of the program being run under
qemu-user points to this qemu-user binary, instead of being what has been used to spawn the
original binary.

There's an interpreter flag in binfmt handling in recent kernels, P, or preserve, which meant
to pass 3 extra first arguments to the binfmt interpeter, - namely, the path to interpreter
itself, the argv[0] as used when spawning the original binary, and the actual path of the
said binary. But qemu-user/main does not handle this situation, - it should be prepared for
this unusual way of being invoked.

There are several hackish solutions exists on this theme used by downstreams, which introduces
a wrapper program especially for binfmt registration and nothing else, uses this P flag, and
uses -argv0 qemu-user argument to pass all the necessary information to qemu-user.

But these wrappers introduce a different issue: since the wrapper executes the qemu binary,
we can't use F binfmt-misc flag anymore without copying the qemu-user binary inside any
foreign chroot being used with it.

So the possible solution is to made qemu-user aware of this in-kernel binfmt mechanism,
which I implemented for Debian for now, as a guinea pig :)

Since the original problem is the proper handling of programs which depend on their own
name in argv[0], the proposed solution is also based on the program name, - this time
it is the name under which qemu-user binary is called.

I introduced a special name for qemu-user binaries to be used _only_ for binfmt registration.
This is, in my case, /usr/libexec/qemu-binfmt/foo-binfmt-P - where "foo" is the architecture
name, and "-binfmt-P" is the literal suffix. This name is just a (sym)link to /usr/bin/qemu-foo,
- just an alternative name for qemu-foo, nothing more.

And added a patch for linux-user/main.c which checks suffix of its argv[0], and if it ends
up on the literal "-binfmt-P", we assume we're being called from in-kernel binfmt-misc
subsystem with the P flag enabled, which means first 3 args are: our own name, the original
argv[0], and the intended binary's path, and the rest are the arguments for the binary to
run.

At first I thought it is a hackish approach, and mentioned that in a comment in the code,
but the more I think about it, the more I like it, and the more it makes sense.

Here's the patch I used in Debian (it is not intended for upstream for now), - for comments,
what do you think? At least it seems like a good step in the right direction, finally.. :)

And we have another issue still, in the same field. Some programs executes itself by using
/proc/self/exe. This does not work under linux-user too, since this link, again, points to
the qemu binary, not the original binary being run. But this is a different story.

Thanks,

/mjt

Subject: [PATCH, HACK]: linux-user: handle binfmt-misc P flag as a separate exe name
From: Michael Tokarev <mjt@tls.msk.ru>
Date: Sat, 13 Feb 2021 13:57:52 +0300

A hackish way to distinguish the case when qemu-user binary is executed
using in-kernel binfmt-misc subsystem with P flag (preserve argv).
We register binfmt interpreter under name /usr/libexec/qemu-binfmt/qemu-foo-binfmt-P
(which is just a symlink to ../../bin/qemu-foo), and if run like that,
qemu-user binary will "know" it should interpret argv[1] & argv[2]
in a special way.

diff --git a/linux-user/main.c b/linux-user/main.c
index 24d1eb73ad..5596dab9be 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -560,6 +560,27 @@ static int parse_args(int argc, char **argv)
          }
      }

+    /* HACK alert.
+     * when run as an interpreter using kernel's binfmt-misc mechanism,
+     * we have to know where are we (our own binary), where's the binary being run,
+     * and what it's argv[0] element.
+     * Only with the P interpreter flag kernel passes all 3 elements as first 3 argv[],
+     * but we can't distinguish if we were run with or without this P flag.
+     * So we register a special name with binfmt-misc system, a name which ends up
+     * in "-binfmt-P", and if our argv[0] ends up with that, we assume we were run
+     * from kernel's binfmt with P flag and our first 3 args are from kernel.
+     */
+    if (strlen(argv[0]) > sizeof("binfmt-P") &&
+        strcmp(argv[0] + strlen(argv[0]) - sizeof("binfmt-P"), "-binfmt-P") == 0) {
+        if (argc < 3) {
+            (void) fprintf(stderr, "qemu: %s has to be run using kernel binfmt-misc subsystem\n", argv[0]);
+            exit(EXIT_FAILURE);
+        }
+        handle_arg_argv0(argv[1]);
+        exec_path = argv[2];
+        return 2;
+    }
+
      optind = 1;
      for (;;) {
          if (optind >= argc) {

