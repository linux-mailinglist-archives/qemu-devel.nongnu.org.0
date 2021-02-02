Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570DD30B8A9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 08:34:47 +0100 (CET)
Received: from localhost ([::1]:49274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6qD0-0006Tx-EW
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 02:34:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l6qBp-00063I-Q0
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 02:33:33 -0500
Received: from mail.ispras.ru ([83.149.199.84]:56836)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l6qBn-0007A4-9Z
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 02:33:33 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 574AE40D4004;
 Tue,  2 Feb 2021 07:33:22 +0000 (UTC)
Subject: Re: [PATCH] char: don't fail when client is not connected
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <161224971122.79781.8594358970645859667.stgit@pasha-ThinkPad-X280>
 <CAMxuvax4eUGGfLH4sQpS4ocD43bsMVFjiFsv2xcywwbXZ0-JJA@mail.gmail.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <1a5d134b-c826-9620-094e-48fc6bb931b0@ispras.ru>
Date: Tue, 2 Feb 2021 10:33:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvax4eUGGfLH4sQpS4ocD43bsMVFjiFsv2xcywwbXZ0-JJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.02.2021 10:27, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Feb 2, 2021 at 11:18 AM Pavel Dovgalyuk 
> <pavel.dovgalyuk@ispras.ru <mailto:pavel.dovgalyuk@ispras.ru>> wrote:
> 
>     This patch checks that ioc is not null before
>     using it in tcp socket tcp_chr_add_watch function.
> 
>     Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru
>     <mailto:Pavel.Dovgalyuk@ispras.ru>>
> 
> 
> Do you have a backtrace or a reproducer when this happens?
> thanks

Here is the backtrace:

Thread 4 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7ffff2506700 (LWP 64988)]
object_get_class (obj=obj@entry=0x0) at ../qom/object.c:999
999	    return obj->class;
(gdb) bt
#0  object_get_class (obj=obj@entry=0x0) at ../qom/object.c:999
#1  0x0000555555b70e26 in QIO_CHANNEL_GET_CLASS (obj=0x0) at 
/home/pasha/ispras/qemu-test/include/io/channel.h:29
#2  qio_channel_create_watch (ioc=0x0, condition=(G_IO_OUT | G_IO_HUP)) 
at ../io/channel.c:281
#3  0x0000555555c1bf9b in qemu_chr_fe_add_watch
     (be=be@entry=0x555556981648, cond=cond@entry=(G_IO_OUT | G_IO_HUP), 
func=func@entry=0x55555597f170 <serial_watch_cb>, 
user_data=user_data@entry=0x5555569815a0)
     at /home/pasha/ispras/qemu-test/include/chardev/char.h:229
#4  0x000055555597f042 in serial_xmit (s=s@entry=0x5555569815a0) at 
../hw/char/serial.c:265
#5  0x000055555597f437 in serial_ioport_write (opaque=0x5555569815a0, 
addr=<optimized out>, val=91, size=<optimized out>) at 
../hw/char/serial.c:359
#6  0x0000555555ab95e0 in memory_region_write_accessor 
(mr=mr@entry=0x555556981700, addr=0, value=value@entry=0x7ffff2504fc8, 
size=size@entry=1, shift=<optimized out>, mask=mask@entry=255, attrs=...)
     at ../softmmu/memory.c:491
#7  0x0000555555ab807e in access_with_adjusted_size
     (addr=addr@entry=0, value=value@entry=0x7ffff2504fc8, 
size=size@entry=1, access_size_min=<optimized out>, 
access_size_max=<optimized out>, access_fn=access_fn@entry=
     0x555555ab9550 <memory_region_write_accessor>, mr=0x555556981700, 
attrs=...) at ../softmmu/memory.c:552
#8  0x0000555555abb947 in memory_region_dispatch_write 
(mr=mr@entry=0x555556981700, addr=0, data=<optimized out>, 
data@entry=91, op=op@entry=MO_8, attrs=attrs@entry=...) at 
../softmmu/memory.c:1501
#9  0x0000555555a721d8 in address_space_stb (as=<optimized out>, 
addr=<optimized out>, val=91, attrs=..., result=0x0) at 
/home/pasha/ispras/qemu-test/memory_ldst.c.inc:382
#10 0x00007fffa8b63022 in code_gen_buffer ()
#11 0x0000555555b10ab0 in cpu_tb_exec (tb_exit=<synthetic pointer>, 
itb=<optimized out>, cpu=0x7fffa8635b00 <code_gen_buffer+73620179>) at 
../accel/tcg/cpu-exec.c:188
#12 cpu_loop_exec_tb (tb_exit=<synthetic pointer>, last_tb=<synthetic 
pointer>, tb=<optimized out>, cpu=0x7fffa8635b00 
<code_gen_buffer+73620179>) at ../accel/tcg/cpu-exec.c:700
#13 cpu_exec (cpu=cpu@entry=0x5555566b4350) at ../accel/tcg/cpu-exec.c:811
#14 0x0000555555b0ce97 in tcg_cpus_exec (cpu=cpu@entry=0x5555566b4350) 
at ../accel/tcg/tcg-cpus.c:57
#15 0x0000555555abfa73 in rr_cpu_thread_fn 
(arg=arg@entry=0x5555566b4350) at ../accel/tcg/tcg-cpus-rr.c:217
#16 0x0000555555c80573 in qemu_thread_start (args=<optimized out>) at 
../util/qemu-thread-posix.c:521
#17 0x00007ffff6302609 in start_thread (arg=<optimized out>) at 
pthread_create.c:477
#18 0x00007ffff6229293 in clone () at 
../sysdeps/unix/sysv/linux/x86_64/clone.S:95


> 
>     ---
>       chardev/char-socket.c |    3 +++
>       1 file changed, 3 insertions(+)
> 
>     diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>     index 213a4c8dd0..cef1d9438f 100644
>     --- a/chardev/char-socket.c
>     +++ b/chardev/char-socket.c
>     @@ -385,6 +385,9 @@ static ssize_t tcp_chr_recv(Chardev *chr, char
>     *buf, size_t len)
>       static GSource *tcp_chr_add_watch(Chardev *chr, GIOCondition cond)
>       {
>           SocketChardev *s = SOCKET_CHARDEV(chr);
>     +    if (!s->ioc) {
>     +        return NULL;
>     +    }
>           return qio_channel_create_watch(s->ioc, cond);
>       }
> 
> 


