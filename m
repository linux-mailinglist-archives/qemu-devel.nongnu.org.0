Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C837A36C163
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 10:58:51 +0200 (CEST)
Received: from localhost ([::1]:38640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJYQ-0004bu-TD
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 04:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbJVX-0002fI-3i
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:55:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:43126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbJVO-00016b-Mk
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:55:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lbJVM-0000Hy-8O
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 08:55:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 223C92E815B
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 08:55:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Apr 2021 08:45:47 -0000
From: Wind Li <1926246@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: nightwend
X-Launchpad-Bug-Reporter: Wind Li (nightwend)
X-Launchpad-Bug-Modifier: Wind Li (nightwend)
References: <161950107824.17271.5936509317690090363.malonedeb@chaenomeles.canonical.com>
Message-Id: <161951314717.4719.489219171575884785.malone@gac.canonical.com>
Subject: [Bug 1926246] Re: chrome based apps can not be run under qemu user
 mode
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: 4beae8acf0f290096f682a945d028b9b29a52350
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1926246 <1926246@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu patch:  =

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 95d79ddc43..227d9b1b0e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8537,7 +8537,7 @@ static abi_long do_syscall1(void *cpu_env, int num, a=
bi_long arg1,
              * before the execve completes and makes it the other
              * program's problem.
              */
-            ret =3D get_errno(safe_execve(p, argp, envp));
+            ret =3D get_errno(safe_execve(is_proc_myself(p, "exe") ? exec_=
path : p, argp, envp));
             unlock_user(p, arg1, 0);
 =

             goto execve_end;

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926246

Title:
  chrome based apps can not be run under qemu user mode

Status in QEMU:
  New

Bug description:
  chrome uses /proc/self/exe to fork render process.
  Here a simple code to reproduce the issue. It's output parent then child =
but failed with qemu: unknown option 'type=3Drenderer'.

  Maybe we can modify exec syscall to replace /proc/self/exe to the real
  path.

  //gcc -o self self.c =

  #include <stdio.h>
  #include <sys/types.h>
  #include <unistd.h>
  int main(int argc, char** argv) {
    if(argc=3D=3D1){
      printf ("parent\n");
  	if ( fork() =3D=3D 0 )
      {
          return execl("/proc/self/exe","/proc/self/exe", "--type=3Drendere=
r",NULL);
      }
    } else {
      printf ("child\n");
    }
    return 0;
  }

  similar reports:
  https://github.com/AppImage/AppImageKit/issues/965  =

  https://github.com/golang/go/issues/42080  =


  Workardound:
  compile chrome or your chrome based app with a patch to content/common/ch=
ild_process_host_impl.cc:GetChildPath, get the realpath of /proc/self/exe:  =


  diff --git a/content/common/child_process_host_impl.cc b/content/common/c=
hild_process_host_impl.cc
  index bc78aba80ac8..9fab74d3bae8 100644
  --- a/content/common/child_process_host_impl.cc
  +++ b/content/common/child_process_host_impl.cc
  @@ -60,8 +60,12 @@ base::FilePath ChildProcessHost::GetChildPath(int flag=
s) {
   #if defined(OS_LINUX)
     // Use /proc/self/exe rather than our known binary path so updates
     // can't swap out the binary from underneath us.
  -  if (child_path.empty() && flags & CHILD_ALLOW_SELF)
  -    child_path =3D base::FilePath(base::kProcSelfExe);
  +  if (child_path.empty() && flags & CHILD_ALLOW_SELF) {
  +    if (!ReadSymbolicLink(base::FilePath(base::kProcSelfExe), &child_pat=
h)) {
  +      NOTREACHED() << "Unable to resolve " << base::kProcSelfExe << ".";
  +      child_path =3D base::FilePath(base::kProcSelfExe);
  +    }
  +  }
   #endif

     // On most platforms, the child executable is the same as the
  current

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926246/+subscriptions

