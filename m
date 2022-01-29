Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F5D4A317F
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 20:17:29 +0100 (CET)
Received: from localhost ([::1]:42482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDtE0-0007zn-CW
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 14:17:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <belyshev@depni.sinp.msu.ru>)
 id 1nDtA9-000787-9p; Sat, 29 Jan 2022 14:13:29 -0500
Received: from depni-mx.sinp.msu.ru ([213.131.7.21]:49565)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <belyshev@depni.sinp.msu.ru>)
 id 1nDtA6-0006SE-QQ; Sat, 29 Jan 2022 14:13:28 -0500
Received: from spider (unknown [176.195.59.180])
 by depni-mx.sinp.msu.ru (Postfix) with ESMTPSA id 25E7E1BF4B3;
 Sat, 29 Jan 2022 22:13:31 +0300 (MSK)
From: Serge Belyshev <belyshev@depni.sinp.msu.ru>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user/syscall: Do not ignore info.si_pid == 0 in
 waitid()
References: <8735len4jt.fsf@depni.sinp.msu.ru>
 <fb4f4efd-0676-51a9-dd01-50643dec1278@vivier.eu>
Date: Sat, 29 Jan 2022 22:13:13 +0300
In-Reply-To: <fb4f4efd-0676-51a9-dd01-50643dec1278@vivier.eu> (Laurent
 Vivier's message of "Thu, 27 Jan 2022 14:18:56 +0100")
Message-ID: <87mtjel5iu.fsf@depni.sinp.msu.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: none client-ip=213.131.7.21;
 envelope-from=belyshev@depni.sinp.msu.ru; helo=depni-mx.sinp.msu.ru
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <laurent@vivier.eu> writes:

> ...
>
> According to wait(2), it sounds a little bit more complicated than that.
>
>        If WNOHANG was specified in options and there were no children in a waitable state, then
>        waitid() returns 0 immediately and the state of the siginfo_t  structure  pointed  to  by
>        infop  depends  on  the  implementation.   To (portably) distinguish this case from that
>        where a child was in a waitable state, zero out the si_pid field before the call and check
>        for a nonzero value in this field after the call returns.
>
>        POSIX.1-2008  Technical  Corrigendum  1 (2013) adds the requirement that when WNOHANG is
>        specified in options and there were no children in a waitable state, then waitid() should
>        zero out the si_pid and si_signo fields of the structure.  On Linux and other implementations
>        that adhere to this requirement, it is not necessary to zero out the si_pid field before
>        calling waitid().  However, not all implementations follow the POSIX.1  specification  on
>        this point.
>

In glibc waitpid is implemented using wait4, and on systems where wait4
is not available (e.g. riscv32), wait4 is implemented via waitid and the
implementation expects that info.si_pid is cleared when appropriate:

(from https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/wait4.c#l58 )

  siginfo_t infop;
  ...
  SYSCALL_CANCEL (waitid, idtype, pid, &infop, options, usage)
  ...
  return infop.si_pid;

so I think it is safe to follow glibc here and rely on the kernel to clear
pid/signo and other fields and just to remove the "info.si_pid != 0" check.


> Perhaps the best approach would be to copy the caller target siginfo
> to the host one, call host waitpid(), remove the "info.si_pid != 0"
> and copy back the host siginfo to target one?

Not sure what would be the gain in this case, as linux clears siginfo fiels
since the very first implementation of waitid in 2.6.9:

https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/tree/kernel/exit.c?h=v2.6.9#n1354

	/*
	 * For a WNOHANG return, clear out all the fields
	 * we would set so the user can easily tell the
	 * difference.
	 */

