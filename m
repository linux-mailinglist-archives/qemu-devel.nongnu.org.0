Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19C14A7768
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 19:01:28 +0100 (CET)
Received: from localhost ([::1]:46084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFJwb-0004iU-PS
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 13:01:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFIvM-0002Ly-MP; Wed, 02 Feb 2022 11:56:04 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:35895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFIv7-0000VD-Ms; Wed, 02 Feb 2022 11:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ULtCxNs//n9ZMEmRCIvPLZBHi9Bdb8xa3sonQ72zdN8=; b=NmSHqc6TFdqY7e5vHJjwkEfTHY
 HqQ9OakAshbbl4wYO6t/UGNS3zfq1jcE00chCXD40mrxB/wbN1/EI+n/FKpzO7PnmRtw6NFi3NodO
 rw3LZ10epXOxd161tzFq6774PPpCzvl80KkCcfpxmZSM1Oc2i0TUlvb5lyyRoA6426ISmMY2lAGHG
 xO3HUq98/4HrwyxGOnLjfr+YMAK4UJeg43HTGujmccs9UBZyzTDZIBoRml/sed1h84okU1HfS5slE
 FYGKlpn94DvJ4yZDLJOo2fb6h2AkqvKrT4x9Ye+7GfZ9ZgWIi2zb1AcyJhmaaoxunt2wQMYbRov5e
 X/6raADvqDa+nuXwb2fIDNKw5D0Y1TMRHZIM8fzJDgznmITox4VJw0PXQvaQ/GJ54d6/flKXAe3hX
 jfjO1Jv/8eV4ZsYECj2waqCgm9qJZKKNZ9MKH2UBcjU92hzIDP26yAKtou6mYl07eno2cwwbLGRPN
 JM/K6L+IDtzgFIne4l2FQBh1m07Y9jeQkWN+VErcomXIjT9XkAD3HmWpMJzBD1oAhAgPl8OAZHJ+e
 GKxgjwOOQ5JzTr3zwpYw85by4Yw671sj/jsD1YrJJ7lE4I1PmezPtrDgLH/PjpKltjQSNYMEp7Gym
 pe9Yfh1WPoXY+7DyxBEtdxul01xhbj1PBcJtHK1ls=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Greg Kurz <groug@kaod.org>,
 qemu-stable@nongnu.org, ldv@altlinux.org
Subject: Re: [PATCH v2] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Date: Wed, 02 Feb 2022 17:55:45 +0100
Message-ID: <2369945.Qq089p3Et8@silver>
In-Reply-To: <20220128223326.927132-1-vt@altlinux.org>
References: <20220128223326.927132-1-vt@altlinux.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 28. Januar 2022 23:33:26 CET Vitaly Chikunov wrote:
> `struct dirent' returned from readdir(3) could be shorter than
> `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> into unallocated page causing SIGSEGV. Example stack trace:
> 
>  #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64 +
> 0x497eed) #1  0x00005555559ec2e9 v9fs_readdir (/usr/bin/qemu-system-x86_64
> + 0x4982e9) #2  0x0000555555eb7983 coroutine_trampoline
> (/usr/bin/qemu-system-x86_64 + 0x963983) #3  0x00007ffff73e0be0 n/a (n/a +
> 0x0)
> 
> While fixing, provide a helper for any future `struct dirent' cloning.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> Cc: qemu-stable@nongnu.org
> Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> ---
> Tested on x86-64 Linux.

I was too optimistic. Looks like this needs more work. With this patch applied
the 9p test cases [1] are crashing now:

$ gdb --args tests/qtest/qos-test -m slow
...
# Start of flush tests
ok 50 /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/flush/success
ok 51 /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/flush/ignored
# End of flush tests
# Start of readdir tests
Broken pipe

Thread 1 "qos-test" received signal SIGABRT, Aborted.
__GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
50      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
(gdb) bt
#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
#1  0x00007ffff7b7d537 in __GI_abort () at abort.c:79
#2  0x00005555555ba495 in qtest_client_socket_recv_line (s=0x5555557663c0) at ../tests/qtest/libqtest.c:503
#3  0x00005555555ba5b3 in qtest_rsp_args (s=0x5555557663c0, expected_args=2) at ../tests/qtest/libqtest.c:523
#4  0x00005555555bbdb4 in qtest_clock_rsp (s=0x5555557663c0) at ../tests/qtest/libqtest.c:970
#5  0x00005555555bbe55 in qtest_clock_step (s=0x5555557663c0, step=100) at ../tests/qtest/libqtest.c:985
#6  0x00005555555cdc21 in qvirtio_wait_used_elem (qts=0x5555557663c0, d=0x555555779b48, vq=0x5555557b0480, desc_idx=8, len=0x0, timeout_us=10000000)
    at ../tests/qtest/libqos/virtio.c:220
#7  0x00005555555ae79f in v9fs_req_wait_for_reply (req=0x5555557899a0, len=0x0) at ../tests/qtest/virtio-9p-test.c:278
#8  0x00005555555b03bf in fs_readdir (obj=0x555555779bb0, data=0x0, t_alloc=0x5555557448b8) at ../tests/qtest/virtio-9p-test.c:851
#9  0x00005555555990c4 in run_one_test (arg=0x5555557ac600) at ../tests/qtest/qos-test.c:182
#10 0x00007ffff7f02b9e in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#11 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#12 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#13 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#14 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#15 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#16 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#17 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#18 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#19 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#20 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#21 0x00007ffff7f0308a in g_test_run_suite () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#22 0x00007ffff7f030a1 in g_test_run () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#23 0x00005555555995a3 in main (argc=1, argv=0x7fffffffe508, envp=0x7fffffffe528) at ../tests/qtest/qos-test.c:338
(gdb)

[1] https://wiki.qemu.org/Documentation/9p#Test_Cases

Best regards,
Christian Schoenebeck




