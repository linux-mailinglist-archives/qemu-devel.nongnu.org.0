Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6AE3D1FB1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 10:13:26 +0200 (CEST)
Received: from localhost ([::1]:56868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Tpd-0006H5-W8
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 04:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6ToU-0005Tm-O3
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:12:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6ToQ-00058M-HW
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626941529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xt6b5w36OTb+QRdHACBhKJBGQtre2lfSYF7zq4LWCno=;
 b=Hg9YHpeLR88zSxXH+HFCXVn06Egu5CoHxCxHvdfl1B20b6ltmE4Pp1+FZ3DwRN7bMjlsox
 HPqtrQfYNT4lvEyY4lJq28LRK3YiIAonDH715awJUpKq5wczIFeaBgEZAmHzzwE77X5Oou
 fYPN/y2zPNd6/m1PK56Rn3d2wrdY+Lc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-ZxqauoggN_26MJGY6s2Juw-1; Thu, 22 Jul 2021 04:12:07 -0400
X-MC-Unique: ZxqauoggN_26MJGY6s2Juw-1
Received: by mail-wr1-f71.google.com with SMTP id
 m9-20020a5d4a090000b029013e2b4a9d1eso2150831wrq.4
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 01:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xt6b5w36OTb+QRdHACBhKJBGQtre2lfSYF7zq4LWCno=;
 b=SJrp25P6uiHDh0e4fcD+tiZ6dZHPmkaDYc5tY0+Un/U2Tdm+ieG1aa6xXVssHt3Jhg
 fH9lhZkrA/QMKU+7eYKBFrXZDnvh/UJdRU/T98hKIXXGIWvyucq1CvW8z2sa0fcAUxeT
 oqvxhpUfhnBetjEYRcuP/9DsuooWti+XWiaK2L/KzAfdUQm/qg9Fx3Ak+jYO3rH8ZItO
 OtWw6QMrPKetsP2kr1mK59q+6B8XBM8ziqfxl8P+XxvmyJeSJpglJK+6FMR482XIv4NK
 BoEl+sQFF0IZ1bwtlfOU8/XqmHGtanI1luDQz6h5R4Q4prEDgEvXvxtz5bw2e7NOQFoq
 MrFw==
X-Gm-Message-State: AOAM5305DSmi+3VRfmm22wX/Eez6ZmbqvfE4RMVNotNlUefHyJg0KDQt
 VeOYyE9vJjA/roNf0kXkA0RydHRm7alTdicnLudcPe6mybwKsDkMpvQhTWWamCG/l4GqdDa2EB0
 XYc5G9/zOZSqkudc=
X-Received: by 2002:adf:ce10:: with SMTP id p16mr47450931wrn.205.1626941525254; 
 Thu, 22 Jul 2021 01:12:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmrHZ+aB3hXQBcMM550oy1J6rk47mPk9f7B16NP3hJmAgCzi6lCYckIBB6KZHozW6AxKlAdw==
X-Received: by 2002:adf:ce10:: with SMTP id p16mr47450888wrn.205.1626941524898; 
 Thu, 22 Jul 2021 01:12:04 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id d15sm29578306wri.39.2021.07.22.01.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 01:12:04 -0700 (PDT)
Subject: Re: master: make check buzzes forever in qos-test
To: Claudio Fontana <cfontana@suse.de>, qemu-devel <qemu-devel@nongnu.org>
References: <02de32d5-d6b3-aed9-19b1-24f3dbb65c3e@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6bdd5e12-ccf5-1b03-48d0-5efefcf27b0d@redhat.com>
Date: Thu, 22 Jul 2021 10:12:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <02de32d5-d6b3-aed9-19b1-24f3dbb65c3e@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Coiby Xu <Coiby.Xu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/21 9:49 AM, Claudio Fontana wrote:
> Hi all,
> 
> I see a strange effect on master, with 
> 
> cd build
> ../configure --enable-kvm --enable-debug --enable-tcg --target-list=x86_64-softmmu
> make -j
> 
> make -j check
> ...
> 
> Not run: 220 287
> Passed all 121 iotests
> [buzzes here]
> 
> 
> ps -a
>   PID TTY          TIME CMD
>  3609 pts/0    00:00:00 make
>  4196 pts/0    00:00:00 bash
>  4212 pts/0    00:00:00 qos-test
>  4215 pts/0    00:00:00 perl
>  9025 pts/0    00:00:00 qemu-storage-da
>  9027 pts/0    00:00:00 qemu-system-x86
> 11293 pts/3    00:00:00 ps
> 
> /proc/4196/cmdline:
> bash -o pipefail -c echo 'Running test qtest-x86_64/qos-test' && MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))} QTEST_QEMU_IMG=./qemu-img G_TEST_DBUS_DAEMON=/home/claudio/git/qemu-pristine/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_BINARY=./qemu-system-x86_64 QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon tests/qtest/qos-test --tap -k -m quick < /dev/null | ./scripts/tap-driver.pl --test-name="qtest-x86_64/qos-test" --show-failures-only
> gstack 4196
> #0  0x00007f66624e32ba in waitpid () from /lib64/libc.so.6
> #1  0x000056036f401bd6 in ?? ()
> #2  0x000056036f404416 in wait_for ()
> #3  0x000056036f3c8cf3 in execute_command_internal ()
> #4  0x000056036f3cb108 in ?? ()
> #5  0x000056036f375a83 in ?? ()
> #6  0x000056036f3c95a1 in execute_command ()
> #7  0x000056036f376484 in ?? ()
> #8  0x000056036f3ee706 in parse_and_execute ()
> #9  0x000056036f3f86f5 in ?? ()
> #10 0x000056036f3bd696 in main ()
> 
> /proc/4212/cmdline:
> tests/qtest/qos-test --tap -k -m quick
> gstack 4212
> 
> Thread 2 (Thread 0x7f247fe03700 (LWP 4886)):
> #0  0x00007f24818cf839 in syscall () from /lib64/libc.so.6
> #1  0x00005617895e6c85 in qemu_futex_wait (f=0x561789663398 <rcu_call_ready_event>, val=4294967295) at /home/claudio/git/qemu-pristine/qemu/include/qemu/futex.h:29
> #2  0x00005617895e6e4c in qemu_event_wait (ev=0x561789663398 <rcu_call_ready_event>) at ../util/qemu-thread-posix.c:480
> #3  0x00005617895c3824 in call_rcu_thread (opaque=0x0) at ../util/rcu.c:258
> #4  0x00005617895e7006 in qemu_thread_start (args=0x56178a168420) at ../util/qemu-thread-posix.c:541
> #5  0x00007f2481b9c4f9 in start_thread () from /lib64/libpthread.so.0
> #6  0x00007f24818d4fbf in clone () from /lib64/libc.so.6
> Thread 1 (Thread 0x7f24830ddf40 (LWP 4212)):
> #0  0x00007f2481ba5e88 in read () from /lib64/libpthread.so.0
> #1  0x00005617895494e8 in qtest_client_socket_recv_line (s=0x56178a1cde00) at ../tests/qtest/libqtest.c:494
> #2  0x0000561789549664 in qtest_rsp_args (s=0x56178a1cde00, expected_args=1) at ../tests/qtest/libqtest.c:521
> #3  0x00005617895499f4 in qtest_query_target_endianness (s=0x56178a1cde00) at ../tests/qtest/libqtest.c:570
> #4  0x0000561789548b72 in qtest_init_without_qmp_handshake (extra_args=0x56178a19e2f0 "-M pc  -device vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem -m 256M -chardev socket,id=char1,path=/tmp/qtest-4212-soc"...) at ../tests/qtest/libqtest.c:332
> #5  0x0000561789548ba1 in qtest_init (extra_args=0x56178a19e2f0 "-M pc  -device vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem -m 256M -chardev socket,id=char1,path=/tmp/qtest-4212-soc"...) at ../tests/qtest/libqtest.c:339
> #6  0x000056178952afb8 in qtest_start (args=0x56178a19e2f0 "-M pc  -device vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem -m 256M -chardev socket,id=char1,path=/tmp/qtest-4212-soc"...) at ../tests/qtest/libqtest-single.h:29
> #7  0x000056178952b33c in restart_qemu_or_continue (path=0x56178a19e2f0 "-M pc  -device vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem -m 256M -chardev socket,id=char1,path=/tmp/qtest-4212-soc"...) at ../tests/qtest/qos-test.c:105
> #8  0x000056178952b4a1 in run_one_test (arg=0x56178a1d7400) at ../tests/qtest/qos-test.c:178
> #9  0x00007f2482a3a826 in ?? () from /usr/lib64/libglib-2.0.so.0
> #10 0x00007f2482a3a73b in ?? () from /usr/lib64/libglib-2.0.so.0
> #11 0x00007f2482a3a73b in ?? () from /usr/lib64/libglib-2.0.so.0
> #12 0x00007f2482a3a73b in ?? () from /usr/lib64/libglib-2.0.so.0
> #13 0x00007f2482a3a73b in ?? () from /usr/lib64/libglib-2.0.so.0
> #14 0x00007f2482a3a73b in ?? () from /usr/lib64/libglib-2.0.so.0
> #15 0x00007f2482a3a73b in ?? () from /usr/lib64/libglib-2.0.so.0
> #16 0x00007f2482a3a73b in ?? () from /usr/lib64/libglib-2.0.so.0
> #17 0x00007f2482a3a73b in ?? () from /usr/lib64/libglib-2.0.so.0
> #18 0x00007f2482a3ace2 in g_test_run_suite () from /usr/lib64/libglib-2.0.so.0
> #19 0x00007f2482a3ad01 in g_test_run () from /usr/lib64/libglib-2.0.so.0
> #20 0x000056178952b9cb in main (argc=1, argv=0x7ffed7147028, envp=0x7ffed7147058) at ../tests/qtest/qos-test.c:338
> 
> /proc/4215/cmdline:
> perl ./scripts/tap-driver.pl --test-name=qtest-x86_64/qos-test --show-failures-only
> gstack 4215
> 
> #0  0x00007f411d4c8e51 in read () from /lib64/libpthread.so.0
> #1  0x000056173781a78d in PerlIOUnix_read ()
> #2  0x000056173781dbc8 in PerlIOBuf_fill ()
> #3  0x000056173781c2c8 in Perl_PerlIO_fill ()
> #4  0x000056173781dac0 in PerlIOBase_read ()
> #5  0x000056173781fa98 in PerlIO_getc ()
> #6  0x00005617377b5575 in Perl_sv_gets ()
> #7  0x00005617377929d8 in Perl_do_readline ()
> #8  0x000056173778d8e6 in Perl_runops_standard ()
> #9  0x000056173770e7d7 in perl_run ()
> #10 0x00005617376e5ef2 in main ()
> 
> /proc/9027/cmdline:
> ./qemu-system-x86_64 -qtest unix:/tmp/qtest-4212.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-4212.qmp,id=char0 -mon chardev=char0,mode=control -display none -M pc -device vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object memory-backend-memfd,id=mem,size=256M,share=on -M memory-backend=mem -m 256M -chardev socket,id=char1,path=/tmp/qtest-4212-sock.leKGw1 -accel qtest
> gstack 9027
> 
> Thread 4 (Thread 0x7fced5d8f700 (LWP 9055)):
> #0  0x00007fceeef55dcf in do_sigwait () at /lib64/libpthread.so.0
> #1  0x00007fceeef55e5d in sigwait () at /lib64/libpthread.so.0
> #2  0x000055ba630ed5b7 in dummy_cpu_thread_fn (arg=0x55ba64830600) at ../accel/dummy-cpus.c:46
> #3  0x000055ba63333c1a in qemu_thread_start (args=0x55ba6483d7a0) at ../util/qemu-thread-posix.c:541
> #4  0x00007fceeef4b4f9 in start_thread () at /lib64/libpthread.so.0
> #5  0x00007fceeec83fbf in clone () at /lib64/libc.so.6
> Thread 3 (Thread 0x7fced6772700 (LWP 9052)):
> #0  0x00007fceeec796db in poll () at /lib64/libc.so.6
> #1  0x00007fcef5455779 in  () at /usr/lib64/libglib-2.0.so.0
> #2  0x00007fcef5455ac2 in g_main_loop_run () at /usr/lib64/libglib-2.0.so.0
> #3  0x000055ba6319e03f in iothread_run (opaque=0x55ba64496be0) at ../iothread.c:73
> #4  0x000055ba63333c1a in qemu_thread_start (args=0x55ba6476f2f0) at ../util/qemu-thread-posix.c:541
> #5  0x00007fceeef4b4f9 in start_thread () at /lib64/libpthread.so.0
> #6  0x00007fceeec83fbf in clone () at /lib64/libc.so.6
> Thread 2 (Thread 0x7fced7074700 (LWP 9038)):
> #0  0x00007fceeef54c3d in __lll_lock_wait () at /lib64/libpthread.so.0
> #1  0x00007fceeef578a7 in __lll_lock_elision () at /lib64/libpthread.so.0
> #2  0x000055ba63332ffb in qemu_mutex_lock_impl (mutex=0x55ba63bb6600 <qemu_global_mutex>, file=0x55ba63772a1b "../util/rcu.c", line=266) at ../util/qemu-thread-posix.c:79
> #3  0x000055ba631094f1 in qemu_mutex_lock_iothread_impl (file=0x55ba63772a1b "../util/rcu.c", line=266) at ../softmmu/cpus.c:493
> #4  0x000055ba63303c92 in call_rcu_thread (opaque=0x0) at ../util/rcu.c:266
> #5  0x000055ba63333c1a in qemu_thread_start (args=0x55ba644ce520) at ../util/qemu-thread-posix.c:541
> #6  0x00007fceeef4b4f9 in start_thread () at /lib64/libpthread.so.0
> #7  0x00007fceeec83fbf in clone () at /lib64/libc.so.6
> Thread 1 (Thread 0x7fcef7bee140 (LWP 9027)):
> #0  0x00007fceeec796db in poll () at /lib64/libc.so.6
> #1  0x00007fcef5455779 in  () at /usr/lib64/libglib-2.0.so.0
> #2  0x00007fcef5455ac2 in g_main_loop_run () at /usr/lib64/libglib-2.0.so.0
> #3  0x000055ba62fffe2f in vhost_user_read (dev=0x55ba655b3330, msg=0x7fff63510230) at ../hw/virtio/vhost-user.c:402
> #4  0x000055ba63002512 in vhost_user_get_u64 (dev=0x55ba655b3330, request=1, u64=0x7fff63510518) at ../hw/virtio/vhost-user.c:1334
> #5  0x000055ba630025c7 in vhost_user_get_features (dev=0x55ba655b3330, features=0x7fff63510518) at ../hw/virtio/vhost-user.c:1356
> #6  0x000055ba63003b48 in vhost_user_backend_init (dev=0x55ba655b3330, opaque=0x55ba655b35b0, errp=0x7fff635106d0) at ../hw/virtio/vhost-user.c:1877
> #7  0x000055ba63037c2e in vhost_dev_init (hdev=0x55ba655b3330, opaque=0x55ba655b35b0, backend_type=VHOST_BACKEND_TYPE_USER, busyloop_timeout=0, errp=0x7fff635106d0) at ../hw/virtio/vhost.c:1302
> #8  0x000055ba630dca97 in vhost_user_blk_connect (dev=0x55ba655b30e0, errp=0x7fff635106d0) at ../hw/block/vhost-user-blk.c:339
> #9  0x000055ba630dcd86 in vhost_user_blk_realize_connect (s=0x55ba655b30e0, errp=0x7fff635106d0) at ../hw/block/vhost-user-blk.c:440
> #10 0x000055ba630dd195 in vhost_user_blk_device_realize (dev=0x55ba655b30e0, errp=0x7fff635106d0) at ../hw/block/vhost-user-blk.c:513
> #11 0x000055ba63026405 in virtio_device_realize (dev=0x55ba655b30e0, errp=0x7fff63510730) at ../hw/virtio/virtio.c:3659
> #12 0x000055ba631845f5 in device_set_realized (obj=0x55ba655b30e0, value=true, errp=0x7fff63510838) at ../hw/core/qdev.c:761
> #13 0x000055ba6316fed8 in property_set_bool (obj=0x55ba655b30e0, v=0x55ba655fed80, name=0x55ba634f3051 "realized", opaque=0x55ba6453a7e0, errp=0x7fff63510838) at ../qom/object.c:2257
> #14 0x000055ba6316dfe7 in object_property_set (obj=0x55ba655b30e0, name=0x55ba634f3051 "realized", v=0x55ba655fed80, errp=0x7fff635109b8) at ../qom/object.c:1402
> #15 0x000055ba6316ab20 in object_property_set_qobject (obj=0x55ba655b30e0, name=0x55ba634f3051 "realized", value=0x55ba655fecc0, errp=0x7fff635109b8) at ../qom/qom-qobject.c:28
> #16 0x000055ba6316e34d in object_property_set_bool (obj=0x55ba655b30e0, name=0x55ba634f3051 "realized", value=true, errp=0x7fff635109b8) at ../qom/object.c:1472
> #17 0x000055ba6318367b in qdev_realize (dev=0x55ba655b30e0, bus=0x55ba655b3058, errp=0x7fff635109b8) at ../hw/core/qdev.c:389
> #18 0x000055ba630332f7 in vhost_user_blk_pci_realize (vpci_dev=0x55ba655aae60, errp=0x7fff635109b8) at ../hw/virtio/vhost-user-blk-pci.c:66
> #19 0x000055ba62e0f8a0 in virtio_pci_realize (pci_dev=0x55ba655aae60, errp=0x7fff635109b8) at ../hw/virtio/virtio-pci.c:1907
> #20 0x000055ba62dd16ec in pci_qdev_realize (qdev=0x55ba655aae60, errp=0x7fff63510a70) at ../hw/pci/pci.c:2148
> #21 0x000055ba62e0fc44 in virtio_pci_dc_realize (qdev=0x55ba655aae60, errp=0x7fff63510a70) at ../hw/virtio/virtio-pci.c:1992
> #22 0x000055ba631845f5 in device_set_realized (obj=0x55ba655aae60, value=true, errp=0x7fff63510b78) at ../hw/core/qdev.c:761
> #23 0x000055ba6316fed8 in property_set_bool (obj=0x55ba655aae60, v=0x55ba655f86f0, name=0x55ba634f3051 "realized", opaque=0x55ba6453a7e0, errp=0x7fff63510b78) at ../qom/object.c:2257
> #24 0x000055ba6316dfe7 in object_property_set (obj=0x55ba655aae60, name=0x55ba634f3051 "realized", v=0x55ba655f86f0, errp=0x55ba63bba880 <error_fatal>) at ../qom/object.c:1402
> #25 0x000055ba6316ab20 in object_property_set_qobject (obj=0x55ba655aae60, name=0x55ba634f3051 "realized", value=0x55ba655f86b0, errp=0x55ba63bba880 <error_fatal>) at ../qom/qom-qobject.c:28
> #26 0x000055ba6316e34d in object_property_set_bool (obj=0x55ba655aae60, name=0x55ba634f3051 "realized", value=true, errp=0x55ba63bba880 <error_fatal>) at ../qom/object.c:1472
> #27 0x000055ba6318367b in qdev_realize (dev=0x55ba655aae60, bus=0x55ba649a5000, errp=0x55ba63bba880 <error_fatal>) at ../hw/core/qdev.c:389
> #28 0x000055ba62f0353b in qdev_device_add (opts=0x55ba645370e0, errp=0x55ba63bba880 <error_fatal>) at ../softmmu/qdev-monitor.c:673
> #29 0x000055ba62fe4aa2 in device_init_func (opaque=0x0, opts=0x55ba645370e0, errp=0x55ba63bba880 <error_fatal>) at ../softmmu/vl.c:1185
> #30 0x000055ba63311904 in qemu_opts_foreach (list=0x55ba63ad6280 <qemu_device_opts>, func=0x55ba62fe4a7b <device_init_func>, opaque=0x0, errp=0x55ba63bba880 <error_fatal>) at ../util/qemu-option.c:1135
> #31 0x000055ba62fe82e2 in qemu_create_cli_devices () at ../softmmu/vl.c:2624
> #32 0x000055ba62fe8406 in qmp_x_exit_preconfig (errp=0x55ba63bba880 <error_fatal>) at ../softmmu/vl.c:2672
> #33 0x000055ba62feaa89 in qemu_init (argc=25, argv=0x7fff63511008, envp=0x7fff635110d8) at ../softmmu/vl.c:3692
> #34 0x000055ba62bf0ae2 in main (argc=25, argv=0x7fff63511008, envp=0x7fff635110d8) at ../softmmu/main.c:49
> 
> 
> /proc/9025/cmdline:
> ./storage-daemon/qemu-storage-daemon --blockdev driver=file,node-name=disk0,filename=qtest.X95rzW --export type=vhost-user-blk,id=disk0,addr.type=unix,addr.path=/tmp/qtest-4212-sock.leKGw1,node-name=disk0,writable=on,num-queues=1
> gstack 9025
> 
> Thread 2 (Thread 0x7f1df77a5700 (LWP 9029)):
> #0  0x00007f1e06d03839 in syscall () from /lib64/libc.so.6
> #1  0x000055d5bd350f93 in qemu_futex_wait (f=0x55d5bd4737f8 <rcu_call_ready_event>, val=4294967295) at /home/claudio/git/qemu-pristine/qemu/include/qemu/futex.h:29
> #2  0x000055d5bd35115a in qemu_event_wait (ev=0x55d5bd4737f8 <rcu_call_ready_event>) at ../util/qemu-thread-posix.c:480
> #3  0x000055d5bd325617 in call_rcu_thread (opaque=0x0) at ../util/rcu.c:258
> #4  0x000055d5bd351314 in qemu_thread_start (args=0x55d5bf4a4270) at ../util/qemu-thread-posix.c:541
> #5  0x00007f1e06fd04f9 in start_thread () from /lib64/libpthread.so.0
> #6  0x00007f1e06d08fbf in clone () from /lib64/libc.so.6
> Thread 1 (Thread 0x7f1e0a367e80 (LWP 9025)):
> #0  0x00007f1e06cfe7d6 in ppoll () from /lib64/libc.so.6
> #1  0x000055d5bd33c593 in qemu_poll_ns (fds=0x55d5bf4aa6c0, nfds=5, timeout=-1) at ../util/qemu-timer.c:336
> #2  0x000055d5bd343abb in os_host_main_loop_wait (timeout=-1) at ../util/main-loop.c:250
> #3  0x000055d5bd343be1 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
> #4  0x000055d5bd1bda5c in main (argc=5, argv=0x7ffcbaf84a28) at ../storage-daemon/qemu-storage-daemon.c:345
> 
> Any idea what could be up?

Seems similar to this one:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg822994.html


