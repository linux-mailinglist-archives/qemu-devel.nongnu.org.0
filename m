Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BB54D8E43
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 21:32:11 +0100 (CET)
Received: from localhost ([::1]:59464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTrMQ-0003yO-PR
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 16:32:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom@tromey.com>) id 1nTrKs-0003Hc-H4
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 16:30:34 -0400
Received: from outbound-ss-761.bluehost.com ([74.220.211.250]:42822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom@tromey.com>) id 1nTrKp-0000nP-0m
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 16:30:32 -0400
Received: from cmgw15.mail.unifiedlayer.com (unknown [10.0.90.130])
 by progateway8.mail.pro1.eigbox.com (Postfix) with ESMTP id 3A355100421BF
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 20:30:18 +0000 (UTC)
Received: from box5379.bluehost.com ([162.241.216.53]) by cmsmtp with ESMTP
 id TrKbnWxrnkku4TrKbnol8p; Mon, 14 Mar 2022 20:30:18 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=B8N8bMhM c=1 sm=1 tr=0 ts=622fa5da
 a=ApxJNpeYhEAb1aAlGBBbmA==:117 a=ApxJNpeYhEAb1aAlGBBbmA==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=o8Y5sQTvuykA:10:nop_rcvd_month_year
 a=Qbun_eYptAEA:10:endurance_base64_authed_username_1 a=NEAV23lmAAAA:8
 a=Iy4eWUNy68nxGJFZNLAA:9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tromey.com; 
 s=default;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References
 :Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ax1Nkvdc+GtwAbkIac3p4hQ9N1rAZ61BJbRtf0a9OMI=; b=quNN+0bTe10CDqC3g7lKMY3U2p
 Vn3J1qVnjdm9VlxH7SlLslY2fE+MPhvGe9dQ5UhpXAV4Mph57ADBRB4T/Qq63dXMI64RziwJYJ4s1
 Xj2k1xER0N3w4vJ2iZuesHu9F;
Received: from 71-211-175-224.hlrn.qwest.net ([71.211.175.224]:40930
 helo=prentzel) by box5379.bluehost.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tom@tromey.com>)
 id 1nTrKb-002OVj-9D; Mon, 14 Mar 2022 14:30:17 -0600
From: Tom Tromey <tom@tromey.com>
To: Tom Tromey <tom@tromey.com>
Subject: Re: How to backtrace an separate stack?
References: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain>
 <87mti11yy9.fsf@tromey.com>
X-Attribution: Tom
Date: Mon, 14 Mar 2022 14:30:16 -0600
In-Reply-To: <87mti11yy9.fsf@tromey.com> (Tom Tromey's message of "Mon, 07 Mar
 2022 09:58:54 -0700")
Message-ID: <87r174gtuv.fsf@tromey.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5379.bluehost.com
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tromey.com
X-BWhitelist: no
X-Source-IP: 71.211.175.224
X-Source-L: No
X-Exim-ID: 1nTrKb-002OVj-9D
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 71-211-175-224.hlrn.qwest.net (prentzel)
 [71.211.175.224]:40930
X-Source-Auth: tom+tromey.com
X-Email-Count: 3
X-Source-Cap: ZWx5bnJvYmk7ZWx5bnJvYmk7Ym94NTM3OS5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
Received-SPF: pass client-ip=74.220.211.250; envelope-from=tom@tromey.com;
 helo=outbound-ss-761.bluehost.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: gdb@sourceware.org, pedro@palves.net, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tom> IMO this is just a longstanding hole in GDB.  Green threads exist,
Tom> so it would be good for GDB to have a way to inspect them.

I took a stab at implementing this recently.  It's still very rough but
it's good enough to discuss whether it's something I should try to
polish.

For testing the proof of concept, I used vireo, a simple user-space
thread setup based on makecontext.

https://github.com/geofft/vireo

I've appended the Python code that teaches gdb how to find vireo
threads.  It's incomplete, as in, if you re-'run', it will fail.

Here's what a session looks like:

    (gdb) cont
    Continuing.
    [New Vireo Thread 1]
    [New Vireo Thread 2]
    send 0 from 0 to 1

    Thread 1 "pingpong" hit Breakpoint 2, pingpong () at examples/pingpong.c:27
    27			int i = vireo_recv(&who);
    (gdb) info thread
      Id   Target Id                                    Frame 
    * 1    Thread 0x7ffff7cb2b80 (LWP 42208) "pingpong" pingpong () at examples/pingpong.c:27
      2    Vireo Thread 1 "pingpong"                    pingpong () at examples/pingpong.c:27
      3    Vireo Thread 2 "pingpong"                    pingpong () at examples/pingpong.c:27
    (gdb) thread 3
    [Switching to thread 3 (Vireo Thread 2)]
    #0  pingpong () at examples/pingpong.c:27
    27			int i = vireo_recv(&who);
    (gdb) bt
    #0  pingpong () at examples/pingpong.c:27
    #1  0x00007ffff7d329c0 in ?? () from /lib64/libc.so.6
    #2  0x00007ffff7fc20e0 in ?? () from /home/tromey/gdb/vireo/examples/../libvireo.so
    #3  0x0000000000000000 in ?? ()

I realize now, writing this, that the approach to underlying threads
should be improved.  These need to be tracked more actively, so that
breakpoint stops can report the corresponding green thread.  You can see
above that this isn't done.  Also I think the "Frame" info is wrong
right now.

Anyway, the basic idea is to let Python tell gdb about the existence of
green threads, and let gdb mostly treat them identically to OS threads.
Under the hood, things like 'continue' will use the underlying OS
thread.

You can play with this if you want.  It's on 'submit/green-threads' on
my github.  Be warned that I rebase a lot.

Some things to work out:

- Exactly how should the 'underlying thread' concept work?
  Hooking into the inferior's scheduler seems slow, and also
  like it could present a chicken/egg problem.
  Maybe it needs a "green thread provider" object so that on
  a stop we can query that to see if the green thread corresponding
  to an OS thread is already known.

- Do we need a special hook to stop unwinding per-green-thread.
  You may not want to allow unwinding through the scheduler.

Tom


import gdb

thread_map = {}

main_thread = None

# From glibc/sysdeps/unix/sysv/linux/x86/sys/ucontext.h
x8664_regs = [ 'r8', 'r9', 'r10', 'r11', 'r12', 'r13', 'r14',
               'r15', 'rdi', 'rsi', 'rbp', 'rbx', 'rdx', 'rax',
               'rcx', 'rsp', 'rip', 'efl', 'csgsfs', 'err',
               'trapno', 'oldmask', 'cr2' ]

def vireo_current():
    return int(gdb.parse_and_eval('curenv')) + 1

class VireoGreenThread:
    def __init__(self, tid):
        self.tid = tid

    def _get_state(self):
        return gdb.parse_and_eval('envs')[self.tid]['state']

    def fetch(self, reg):
        """Fetch REG from memory."""
        global x8664_regs
        global thread_map
        thread = thread[self.tid]
        state = self._get_state()
        gregs = state['uc_mcontext']['gregs']
        for i in range(0, len(x8664_regs)):
            if reg is None or reg == x8664_regs[i]:
                thread.write_register(x8664_regs[i], gregs[i])

    def store(self, reg):
        global x8664_regs
        global thread_map
        thread = thread[self.tid]
        state = self._get_state()
        gregs = state['uc_mcontext']['gregs']
        for i in range(0, len(x8664_regs)):
            if reg is None or reg == x8664_regs[i]:
                gregs[i] = thread.read_register(x8664_regs[i])

    def name(self):
        return "Vireo Thread " + str(self.tid)

    def underlying_thread(self):
        if vireo_current() == self.tid:
            global main_thread
            return main_thread
        return None

class VFinish(gdb.FinishBreakpoint):
    def stop(self):
        tid = int(self.return_value) + 1
        global thread_map
        thread_map[tid] = gdb.create_green_thread(tid, VireoGreenThread(tid))
        return False

class VCreate(gdb.Breakpoint):
    def stop(self):
        VFinish(gdb.newest_frame(), True)
        return False

class VExit(gdb.Breakpoint):
    def stop(self):
        global main_thread
        if main_thread is None:
            main_thread = gdb.selected_thread()
        global thread_map
        tid = vireo_current()
        if tid in thread_map:
            thread_map[tid].set_exited()
            del thread_map[tid]

VCreate('vireo_create', internal=True)
VExit('vireo_exit', internal=True)

