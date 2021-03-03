Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FF332B6B3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:36:15 +0100 (CET)
Received: from localhost ([::1]:43394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOrW-0003Ci-BK
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lHOqL-0002lc-VK
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:35:02 -0500
Received: from mail.ispras.ru ([83.149.199.84]:33786)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lHOqJ-0007Eq-FD
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:35:01 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 90F2B4076263;
 Wed,  3 Mar 2021 10:34:50 +0000 (UTC)
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: kvmvapic post_load
To: QEMU Developers <qemu-devel@nongnu.org>, pbonzini@redhat.com,
 richard.henderson@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Message-ID: <af069743-501d-2915-cac8-9ec07a318289@ispras.ru>
Date: Wed, 3 Mar 2021 13:34:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've got the following issue while testing reverse debugging functions.

kvmvapic stalls in vapic_enable_tpr_reporting function, which is called 
at post_load phase.

Does anyone have an idea how to fix this issue?




Here is the backtrace for main thread, which loadvm and post_load functions.

#0  futex_wait_cancelable (private=<optimized out>, expected=0, 
futex_word=0x55e7c9c3ce48 <qemu_work_cond+40>) at 
../sysdeps/nptl/futex-internal.h:183
#1  __pthread_cond_wait_common (abstime=0x0, clockid=0, 
mutex=0x55e7c9c59040 <qemu_global_mutex>, cond=0x55e7c9c3ce20 
<qemu_work_cond>) at pthread_cond_wait.c:508
#2  __pthread_cond_wait (cond=cond@entry=0x55e7c9c3ce20 
<qemu_work_cond>, mutex=mutex@entry=0x55e7c9c59040 <qemu_global_mutex>) 
at pthread_cond_wait.c:638
#3  0x000055e7c973c6b2 in qemu_cond_wait_impl (cond=0x55e7c9c3ce20 
<qemu_work_cond>, mutex=0x55e7c9c59040 <qemu_global_mutex>, 
file=0x55e7c97d0571 "../cpus-common.c", line=154)
     at ../util/qemu-thread-posix.c:174
#4  0x000055e7c9428f04 in do_run_on_cpu (cpu=cpu@entry=0x55e7cba9fa70, 
func=func@entry=0x55e7c948a7f0 <vapic_do_enable_tpr_reporting>, 
data=..., mutex=mutex@entry=0x55e7c9c59040 <qemu_global_mutex>)
     at ../cpus-common.c:154
#5  0x000055e7c95a5880 in run_on_cpu (cpu=cpu@entry=0x55e7cba9fa70, 
func=func@entry=0x55e7c948a7f0 <vapic_do_enable_tpr_reporting>, 
data=..., data@entry=...) at ../softmmu/cpus.c:385
#6  0x000055e7c948a77b in vapic_enable_tpr_reporting 
(enable=enable@entry=true) at ../hw/i386/kvmvapic.c:512
#7  0x000055e7c948ab9a in vapic_prepare (s=s@entry=0x55e7cb85ec00) at 
../hw/i386/kvmvapic.c:634
#8  0x000055e7c948ac10 in vapic_post_load (opaque=0x55e7cb85ec00, 
version_id=<optimized out>) at ../hw/i386/kvmvapic.c:790
#9  0x000055e7c933387f in vmstate_load_state (f=f@entry=0x55e7cbcbc000, 
vmsd=0x55e7c9b24c00 <vmstate_vapic>, opaque=<optimized out>, 
version_id=1) at ../migration/vmstate.c:168
#10 0x000055e7c9318ea5 in vmstate_load (f=0x55e7cbcbc000, 
se=0x55e7cb9154a0) at ../migration/savevm.c:910
#11 0x000055e7c931913b in qemu_loadvm_section_start_full 
(f=f@entry=0x55e7cbcbc000, mis=0x55e7cb897400) at ../migration/savevm.c:2433
#12 0x000055e7c931c958 in qemu_loadvm_state_main 
(f=f@entry=0x55e7cbcbc000, mis=mis@entry=0x55e7cb897400) at 
../migration/savevm.c:2619
#13 0x000055e7c931df5d in qemu_loadvm_state (f=f@entry=0x55e7cbcbc000) 
at ../migration/savevm.c:2698
#14 0x000055e7c931e81a in load_snapshot (name=name@entry=0x55e7ccfd9630 
"tm8", vmstate=vmstate@entry=0x0, has_devices=has_devices@entry=false, 
devices=devices@entry=0x0, errp=errp@entry=0x7fff716272a0)
     at ../migration/savevm.c:3056
#15 0x000055e7c934d65c in replay_seek (errp=0x7fff716272a0, 
callback=0x55e7c934d6e0 <replay_continue_stop>, icount=12282095933) at 
../replay/replay-debugging.c:199
#16 replay_seek (icount=12282095933, callback=0x55e7c934d6e0 
<replay_continue_stop>, errp=0x7fff716272a0) at 
../replay/replay-debugging.c:184
#17 0x000055e7c934dc00 in replay_reverse_continue () at 
../replay/replay-debugging.c:301
#18 0x000055e7c95a328d in handle_backward (gdb_ctx=0x7fff71627340, 
user_ctx=0x0) at ../gdbstub.c:1911
#19 handle_backward (gdb_ctx=gdb_ctx@entry=0x7fff71627340, 
user_ctx=user_ctx@entry=0x0) at ../gdbstub.c:1896
#20 0x000055e7c95a075f in process_string_cmd 
(data=data@entry=0x55e7c9c57e04 <gdbserver_state+36> "bc", 
cmds=cmds@entry=0x55e7c9b31680 <backward_cmd_desc>, 
num_cmds=num_cmds@entry=1, user_ctx=0x0)
     at ../gdbstub.c:1509
#21 0x000055e7c95a4870 in run_cmd_parser (data=0x55e7c9c57e04 
<gdbserver_state+36> "bc", cmd=0x55e7c9b31680 <backward_cmd_desc>) at 
../gdbstub.c:1527
#22 gdb_handle_packet (line_buf=0x55e7c9c57e04 <gdbserver_state+36> 
"bc") at ../gdbstub.c:2734
#23 gdb_read_byte (ch=53 '5') at ../gdbstub.c:3070
#24 gdb_chr_receive (opaque=<optimized out>, buf=<optimized out>, 
size=<optimized out>) at ../gdbstub.c:3367
#25 0x000055e7c9612e07 in tcp_chr_read (chan=<optimized out>, 
cond=<optimized out>, opaque=<optimized out>) at 
../chardev/char-socket.c:557
#26 0x00007f22af018e6e in g_main_context_dispatch () at 
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#27 0x000055e7c972d4b8 in glib_pollfds_poll () at ../util/main-loop.c:232
#28 os_host_main_loop_wait (timeout=<optimized out>) at 
../util/main-loop.c:255
#29 main_loop_wait (nonblocking=nonblocking@entry=0) at 
../util/main-loop.c:531
#30 0x000055e7c95d3e01 in qemu_main_loop () at ../softmmu/runstate.c:725
#31 0x000055e7c926f0e2 in main (argc=<optimized out>, argv=<optimized 
out>, envp=<optimized out>) at ../softmmu/main.c:50


Pavel Dovgalyuk

