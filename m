Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAD6535325
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 20:10:29 +0200 (CEST)
Received: from localhost ([::1]:43926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuHwK-00073A-2B
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 14:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nuHtc-0005Kg-R9
 for qemu-devel@nongnu.org; Thu, 26 May 2022 14:07:41 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nuHtW-0007b8-TD
 for qemu-devel@nongnu.org; Thu, 26 May 2022 14:07:37 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 88EC81F8D0;
 Thu, 26 May 2022 18:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653588398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gJTq8ML6Iubrvt5Lq2MiUoNUTIK1I+dL9uooKyeJaUE=;
 b=dA91QGFMak+8DEa1QC7wi7Pw+kbJUV57h0/f4L2XOgcOmBIbV2A8fUulmIrTlqHYJsCWd0
 wecr7i32QX7eQ00M3Uoiaq68uhnEfLo2gFblOy0nOmMA7URGOoY4xvOSquMw+UUlBzL2rp
 sZ7XVQ8t/WsdkVVfzghB+JQk998rDVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653588398;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gJTq8ML6Iubrvt5Lq2MiUoNUTIK1I+dL9uooKyeJaUE=;
 b=zlvd50bU76FX367Sx1QtBva4JLsJ8i+GmT5uxSoNCAMbQlXE0qzURCax13G2N2KO+M6na0
 Al/iNvrLYzFDYMBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 58D6513AE3;
 Thu, 26 May 2022 18:06:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id g0nOE67Bj2JvRQAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 26 May 2022 18:06:38 +0000
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, Alex Bennee
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Subject: make -j check failing on master, interesting valgrind errors on
 qos-test vhost-user-blk-test/basic
Message-ID: <6dad6efd-7cb4-d1e0-d5f1-dbe35f69e545@suse.de>
Date: Thu, 26 May 2022 20:06:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi all,

I am seeing intermittent failures of make -j check on master.

I am using gcc 7.5.0, make 4.2.1, meson 0.61.4, ninja-1.10.0

I tried these two configurations:

$ ../configure

$ ../configure --disable-tcg --enable-kvm

and the errors seem to appear in both cases, saltuarily, triggering in different test paths:

$ make -j
$ make -j check

545/581 ERROR:../tests/qtest/qos-test.c:189:subprocess_run_one_test: child process (/i386/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess [100495]) failed unexpectedly ERROR
545/581 qemu:qtest+qtest-i386 / qtest-i386/qos-test                                        ERROR          20.74s   killed by signal 6 SIGABRT
>>> G_TEST_DBUS_DAEMON=/vm_images/gehc/git/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon MALLOC_PERTURB_=140 QTEST_QEMU_BINARY=./qemu-system-i386 /vm_images/gehc/git/qemu/build/tests/qtest/qos-test --tap -k
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
**
ERROR:../tests/qtest/qos-test.c:189:subprocess_run_one_test: child process (/i386/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess [100495]) failed unexpectedly
(test program exited with status code -6)


or 


▶ 208/218 ERROR:../tests/qtest/qos-test.c:189:subprocess_run_one_test: child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/reconnect/subprocess [3995]) failed unexpectedly ERROR         
208/218 qemu:qtest+qtest-x86_64 / qtest-x86_64/qos-test                        ERROR          14.19s   killed by signal 6 SIGABRT
>>> G_TEST_DBUS_DAEMON=/vm_images/gehc/git/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-x86_64 MALLOC_PERTURB_=248 QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon /vm_images/gehc/git/qemu/build/tests/qtest/qos-test --tap -k
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
**
ERROR:../tests/qtest/qos-test.c:189:subprocess_run_one_test: child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/reconnect/subprocess [3995]) failed unexpectedly

(test program exited with status code -6)
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――



I ran the tests manually a few times directly with:

$ G_TEST_DBUS_DAEMON=/vm_images/gehc/git/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-x86_64 MALLOC_PERTURB_=248 QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon /vm_images/gehc/git/qemu/build/tests/qtest/qos-test --tap -k

and I get (saltuarily again):

# Start of vhost-user tests
# GLib-DEBUG: posix_spawn avoided (workdir specified) (fd close requested) 
ok 62 /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/migrate
# GLib-DEBUG: posix_spawn avoided (workdir specified) (fd close requested) 
# child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/reconnect/subprocess [15058]) exit status: 1 (error)
# child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/reconnect/subprocess [15058]) stdout: ""
# child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/reconnect/subprocess [15058]) stderr: "qemu-system-x86_64: -chardev socket,id=chr-reconnect,path=/tmp/vhost-test-qvwhvM/reconnect.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-qvwhvM/reconnect.sock,server=on\nqemu-system-x86_64: Failed to set msg fds.\nqemu-system-x86_64: vhost VQ 0 ring restore failed: -22: Invalid argument (22)\nqemu-system-x86_64: Failed to set msg fds.\nqemu-system-x86_64: vhost VQ 1 ring restore failed: -22: Invalid argument (22)\n**\nERROR:../tests/qtest/vhost-user-test.c:810:wait_for_rings_started: assertion failed (ctpop64(s->rings) == count): (1 == 2)\n"
**
ERROR:../tests/qtest/qos-test.c:189:subprocess_run_one_test: child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/reconnect/subprocess [15058]) failed unexpectedly
Bail out! ERROR:../tests/qtest/qos-test.c:189:subprocess_run_one_test: child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/reconnect/subprocess [15058]) failed unexpectedly
Aborted (core dumped)


gdb -core, bt:

#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:51
#1  0x00007f193e9abadf in __GI_abort () at abort.c:100
#2  0x00007f193faf2165 in g_assertion_message (domain=domain@entry=0x0, file=file@entry=0x560e358c3c16 "../tests/qtest/qos-test.c", 
    line=line@entry=189, func=func@entry=0x560e358c3d50 <__func__.30035> "subprocess_run_one_test", 
    message=message@entry=0x560e35f82400 "child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/reconnect/subprocess [18063]) failed unexpectedly") at ../glib/gtestutils.c:2913
#3  0x00007f193faf2b9a in g_test_trap_assertions (domain=0x0, file=0x560e358c3c16 "../tests/qtest/qos-test.c", line=189, 
    func=0x560e358c3d50 <__func__.30035> "subprocess_run_one_test", assertion_flags=<optimized out>, pattern=<optimized out>)
    at ../glib/gtestutils.c:3673
#4  0x00007f193faf1a66 in test_case_run (tc=0x560e35f6ead0) at ../glib/gtestutils.c:2632
#5  g_test_run_suite_internal (suite=suite@entry=0x560e35faae00, path=path@entry=0x0) at ../glib/gtestutils.c:2720
#6  0x00007f193faf197b in g_test_run_suite_internal (suite=suite@entry=0x560e35fa9c00, path=path@entry=0x0) at ../glib/gtestutils.c:2732
#7  0x00007f193faf197b in g_test_run_suite_internal (suite=suite@entry=0x560e35fa9ec0, path=path@entry=0x0) at ../glib/gtestutils.c:2732
#8  0x00007f193faf197b in g_test_run_suite_internal (suite=suite@entry=0x560e35fa85a0, path=path@entry=0x0) at ../glib/gtestutils.c:2732
#9  0x00007f193faf197b in g_test_run_suite_internal (suite=suite@entry=0x560e35fa7100, path=path@entry=0x0) at ../glib/gtestutils.c:2732
#10 0x00007f193faf197b in g_test_run_suite_internal (suite=suite@entry=0x560e35fa7140, path=path@entry=0x0) at ../glib/gtestutils.c:2732
#11 0x00007f193faf197b in g_test_run_suite_internal (suite=suite@entry=0x560e35fa7160, path=path@entry=0x0) at ../glib/gtestutils.c:2732
#12 0x00007f193faf197b in g_test_run_suite_internal (suite=suite@entry=0x560e35fa7080, path=path@entry=0x0) at ../glib/gtestutils.c:2732
#13 0x00007f193faf197b in g_test_run_suite_internal (suite=suite@entry=0x560e35fa7180, path=path@entry=0x0) at ../glib/gtestutils.c:2732
#14 0x00007f193faf197b in g_test_run_suite_internal (suite=suite@entry=0x560e35f26640, path=path@entry=0x0) at ../glib/gtestutils.c:2732
#15 0x00007f193faf1f22 in g_test_run_suite (suite=0x560e35f26640) at ../glib/gtestutils.c:2807
#16 0x00007f193faf1f41 in g_test_run () at ../glib/gtestutils.c:2042
#17 0x0000560e358191e9 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../tests/qtest/qos-test.c:338

I tried to valgrind a bit the qos-test itself and I got an interesting result for vhost-user-blk-test/basic.
I guess some memory corruption in a preceding test could make tests that follow fail?

Here:

# starting vhost-user backend: exec ./storage-daemon/qemu-storage-daemon --blockdev driver=file,node-name=disk0,filename=qtest.OkpNv2 --export type=vhost-user-blk,id=disk0,addr.type=fd,addr.str=3,node-name=disk0,writable=on,num-queues=1 
# starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-23786.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-23786.qmp,id=char0 -mon chardev=char0,mode=control -display none -M pc  -device vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem -m 256M -chardev socket,id=char1,path=/tmp/qtest-23786-sock.RAqTFy  -accel qtest
==23786== Use of uninitialised value of size 8
==23786==    at 0x5EFEE01: _itoa_word (_itoa.c:180)
==23786==    by 0x5F02740: vfprintf (vfprintf.c:1642)
==23786==    by 0x5FBA8FE: __vsprintf_chk (vsprintf_chk.c:83)
==23786==    by 0x5FBA829: __sprintf_chk (sprintf_chk.c:31)
==23786==    by 0x140A25: sprintf (stdio2.h:33)
==23786==    by 0x140A25: qtest_memwrite (libqtest.c:1067)
==23786==    by 0x13642F: virtio_blk_request (vhost-user-blk-test.c:90)
==23786==    by 0x13714D: test_invalid_discard_write_zeroes (vhost-user-blk-test.c:123)
==23786==    by 0x1380CB: test_basic (vhost-user-blk-test.c:357)
==23786==    by 0x1380CB: basic (vhost-user-blk-test.c:452)
==23786==    by 0x121837: run_one_test (qos-test.c:182)
==23786==    by 0x4EBAA65: test_case_run (gtestutils.c:2632)
==23786==    by 0x4EBAA65: g_test_run_suite_internal (gtestutils.c:2720)
==23786==    by 0x4EBA97A: g_test_run_suite_internal (gtestutils.c:2732)
==23786==    by 0x4EBA97A: g_test_run_suite_internal (gtestutils.c:2732)
==23786==  Uninitialised value was created by a stack allocation
==23786==    at 0x1370B0: test_invalid_discard_write_zeroes (vhost-user-blk-test.c:102)
==23786== 
==23786== Conditional jump or move depends on uninitialised value(s)
==23786==    at 0x5EFEE08: _itoa_word (_itoa.c:180)
==23786==    by 0x5F02740: vfprintf (vfprintf.c:1642)
==23786==    by 0x5FBA8FE: __vsprintf_chk (vsprintf_chk.c:83)
==23786==    by 0x5FBA829: __sprintf_chk (sprintf_chk.c:31)
==23786==    by 0x140A25: sprintf (stdio2.h:33)
==23786==    by 0x140A25: qtest_memwrite (libqtest.c:1067)
==23786==    by 0x13642F: virtio_blk_request (vhost-user-blk-test.c:90)
==23786==    by 0x13714D: test_invalid_discard_write_zeroes (vhost-user-blk-test.c:123)
==23786==    by 0x1380CB: test_basic (vhost-user-blk-test.c:357)
==23786==    by 0x1380CB: basic (vhost-user-blk-test.c:452)
==23786==    by 0x121837: run_one_test (qos-test.c:182)
==23786==    by 0x4EBAA65: test_case_run (gtestutils.c:2632)
==23786==    by 0x4EBAA65: g_test_run_suite_internal (gtestutils.c:2720)
==23786==    by 0x4EBA97A: g_test_run_suite_internal (gtestutils.c:2732)
==23786==    by 0x4EBA97A: g_test_run_suite_internal (gtestutils.c:2732)
==23786==  Uninitialised value was created by a stack allocation
==23786==    at 0x1370B0: test_invalid_discard_write_zeroes (vhost-user-blk-test.c:102)
==23786== 
==23786== Conditional jump or move depends on uninitialised value(s)
==23786==    at 0x5F027F8: vfprintf (vfprintf.c:1642)
==23786==    by 0x5FBA8FE: __vsprintf_chk (vsprintf_chk.c:83)
==23786==    by 0x5FBA829: __sprintf_chk (sprintf_chk.c:31)
==23786==    by 0x140A25: sprintf (stdio2.h:33)
==23786==    by 0x140A25: qtest_memwrite (libqtest.c:1067)
==23786==    by 0x13642F: virtio_blk_request (vhost-user-blk-test.c:90)
==23786==    by 0x13714D: test_invalid_discard_write_zeroes (vhost-user-blk-test.c:123)
==23786==    by 0x1380CB: test_basic (vhost-user-blk-test.c:357)
==23786==    by 0x1380CB: basic (vhost-user-blk-test.c:452)
==23786==    by 0x121837: run_one_test (qos-test.c:182)
==23786==    by 0x4EBAA65: test_case_run (gtestutils.c:2632)
==23786==    by 0x4EBAA65: g_test_run_suite_internal (gtestutils.c:2720)
==23786==    by 0x4EBA97A: g_test_run_suite_internal (gtestutils.c:2732)
==23786==    by 0x4EBA97A: g_test_run_suite_internal (gtestutils.c:2732)
==23786==    by 0x4EBA97A: g_test_run_suite_internal (gtestutils.c:2732)
==23786==  Uninitialised value was created by a stack allocation
==23786==    at 0x1370B0: test_invalid_discard_write_zeroes (vhost-user-blk-test.c:102)
==23786== 
==23786== Conditional jump or move depends on uninitialised value(s)
==23786==    at 0x5F0324C: vfprintf (vfprintf.c:1642)
==23786==    by 0x5FBA8FE: __vsprintf_chk (vsprintf_chk.c:83)
==23786==    by 0x5FBA829: __sprintf_chk (sprintf_chk.c:31)
==23786==    by 0x140A25: sprintf (stdio2.h:33)
==23786==    by 0x140A25: qtest_memwrite (libqtest.c:1067)
==23786==    by 0x13642F: virtio_blk_request (vhost-user-blk-test.c:90)
==23786==    by 0x13714D: test_invalid_discard_write_zeroes (vhost-user-blk-test.c:123)
==23786==    by 0x1380CB: test_basic (vhost-user-blk-test.c:357)
==23786==    by 0x1380CB: basic (vhost-user-blk-test.c:452)
==23786==    by 0x121837: run_one_test (qos-test.c:182)
==23786==    by 0x4EBAA65: test_case_run (gtestutils.c:2632)
==23786==    by 0x4EBAA65: g_test_run_suite_internal (gtestutils.c:2720)
==23786==    by 0x4EBA97A: g_test_run_suite_internal (gtestutils.c:2732)
==23786==    by 0x4EBA97A: g_test_run_suite_internal (gtestutils.c:2732)
==23786==    by 0x4EBA97A: g_test_run_suite_internal (gtestutils.c:2732)
==23786==  Uninitialised value was created by a stack allocation
==23786==    at 0x1370B0: test_invalid_discard_write_zeroes (vhost-user-blk-test.c:102)
==23786== 


Ciao,

Claudio


