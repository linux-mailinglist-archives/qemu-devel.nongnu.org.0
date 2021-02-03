Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E69830D526
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 09:24:36 +0100 (CET)
Received: from localhost ([::1]:58588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7DSl-0005Hf-5i
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 03:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l7DQa-0004B5-Rs
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 03:22:20 -0500
Received: from mail.ispras.ru ([83.149.199.84]:38098)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l7DQY-0000uk-FM
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 03:22:20 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id C2209407626A;
 Wed,  3 Feb 2021 08:22:05 +0000 (UTC)
Subject: Re: [PATCH] char: don't fail when client is not connected
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <161224971122.79781.8594358970645859667.stgit@pasha-ThinkPad-X280>
 <CAMxuvax4eUGGfLH4sQpS4ocD43bsMVFjiFsv2xcywwbXZ0-JJA@mail.gmail.com>
 <1a5d134b-c826-9620-094e-48fc6bb931b0@ispras.ru>
 <CAMxuvay_mLwsLB51Ar4-Usu610QnC7VAzD95BFmvL=VumCcRtA@mail.gmail.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <3f9e991e-da3b-1df5-5124-06dc2e1b7e18@ispras.ru>
Date: Wed, 3 Feb 2021 11:22:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvay_mLwsLB51Ar4-Usu610QnC7VAzD95BFmvL=VumCcRtA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.155,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 03.02.2021 11:13, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Feb 2, 2021 at 11:33 AM Pavel Dovgalyuk 
> <pavel.dovgalyuk@ispras.ru <mailto:pavel.dovgalyuk@ispras.ru>> wrote:
> 
>     On 02.02.2021 10:27, Marc-André Lureau wrote:
>      > Hi
>      >
>      > On Tue, Feb 2, 2021 at 11:18 AM Pavel Dovgalyuk
>      > <pavel.dovgalyuk@ispras.ru <mailto:pavel.dovgalyuk@ispras.ru>
>     <mailto:pavel.dovgalyuk@ispras.ru
>     <mailto:pavel.dovgalyuk@ispras.ru>>> wrote:
>      >
>      >     This patch checks that ioc is not null before
>      >     using it in tcp socket tcp_chr_add_watch function.
>      >
>      >     Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru
>     <mailto:Pavel.Dovgalyuk@ispras.ru>
>      >     <mailto:Pavel.Dovgalyuk@ispras.ru
>     <mailto:Pavel.Dovgalyuk@ispras.ru>>>
>      >
>      >
>      > Do you have a backtrace or a reproducer when this happens?
>      > thanks
> 
>     Here is the backtrace:
> 
>     Thread 4 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
>     [Switching to Thread 0x7ffff2506700 (LWP 64988)]
>     object_get_class (obj=obj@entry=0x0) at ../qom/object.c:999
>     999         return obj->class;
>     (gdb) bt
>     #0  object_get_class (obj=obj@entry=0x0) at ../qom/object.c:999
>     #1  0x0000555555b70e26 in QIO_CHANNEL_GET_CLASS (obj=0x0) at
>     /home/pasha/ispras/qemu-test/include/io/channel.h:29
>     #2  qio_channel_create_watch (ioc=0x0, condition=(G_IO_OUT | G_IO_HUP))
>     at ../io/channel.c:281
>     #3  0x0000555555c1bf9b in qemu_chr_fe_add_watch
>           (be=be@entry=0x555556981648, cond=cond@entry=(G_IO_OUT |
>     G_IO_HUP),
>     func=func@entry=0x55555597f170 <serial_watch_cb>,
>     user_data=user_data@entry=0x5555569815a0)
>           at /home/pasha/ispras/qemu-test/include/chardev/char.h:229
>     #4  0x000055555597f042 in serial_xmit (s=s@entry=0x5555569815a0) at
>     ../hw/char/serial.c:265
>     #5  0x000055555597f437 in serial_ioport_write (opaque=0x5555569815a0,
>     addr=<optimized out>, val=91, size=<optimized out>) at
>     ../hw/char/serial.c:359
> 
> 
> Thanks, I don't understand how this could happen.
> 
> serial_xmit:
>             int rc = qemu_chr_fe_write(&s->chr, &s->tsr, 1);
> 
>              if ((rc == 0 ||
>                   (rc == -1 && errno == EAGAIN)) &&
>                  s->tsr_retry < MAX_XMIT_RETRY) {
>                  assert(s->watch_tag == 0);
>                  s->watch_tag =
>                      qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP,
>                                            serial_watch_cb, s);
> 
> The watch is added only if fe_write() returned 0 || -1 with EAGAIN.
> 
> But tcp_chr_write() should return -1 with EIO if the state is 
> disconnected (and ioc is NULL), or other errors on disconnect.
> 
> Can you provide a reproducer?


That was a record/replay scenario. I've used Fedora cloudinit images, 
that are used in acceptance tests:

qemu-system-x86_64 \
  -display none -vga none -machine pc -smp 1 -m 1024 \
  -monitor tcp:127.0.0.1:8081,server,nowait \
  -serial tcp:127.0.0.1:8082,server,nowait \
  -object filter-replay,id=replay,netdev=hub0port0 \
  -drive 
file=Fedora-Cloud-Base-31-1.9.x86_64.qcow2,snapshot,id=disk0,if=none \
  -drive driver=blkreplay,id=disk0-rr,if=none,image=disk0 \
  -device virtio-blk-pci,drive=disk0-rr,ioeventfd=false \
  -icount shift=1,rr=record,rrfile=replay.bin \
  -drive file=cloudinit.iso,snapshot,id=disk1,if=none \
  -drive driver=blkreplay,id=disk1-rr,if=none,image=disk1 \
  -device virtio-blk-pci,drive=disk1-rr,ioeventfd=false


The failure occurred on replay stage:

qemu-system-x86_64 \
  -display none -vga none -machine pc -smp 1 -m 1024 \
  -monitor tcp:127.0.0.1:8081,server,nowait \
  -serial tcp:127.0.0.1:8082,server,nowait \
  -object filter-replay,id=replay,netdev=hub0port0 \
  -drive 
file=Fedora-Cloud-Base-31-1.9.x86_64.qcow2,snapshot,id=disk0,if=none \
  -drive driver=blkreplay,id=disk0-rr,if=none,image=disk0 \
  -device virtio-blk-pci,drive=disk0-rr,ioeventfd=false \
  -icount shift=1,rr=replay,rrfile=replay.bin \
  -drive file=cloudinit.iso,snapshot,id=disk1,if=none \
  -drive driver=blkreplay,id=disk1-rr,if=none,image=disk1 \
  -device virtio-blk-pci,drive=disk1-rr,ioeventfd=false

> 
> thanks
> 
> 
>      >
>      >     ---
>      >       chardev/char-socket.c |    3 +++
>      >       1 file changed, 3 insertions(+)
>      >
>      >     diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>      >     index 213a4c8dd0..cef1d9438f 100644
>      >     --- a/chardev/char-socket.c
>      >     +++ b/chardev/char-socket.c
>      >     @@ -385,6 +385,9 @@ static ssize_t tcp_chr_recv(Chardev *chr,
>     char
>      >     *buf, size_t len)
>      >       static GSource *tcp_chr_add_watch(Chardev *chr,
>     GIOCondition cond)
>      >       {
>      >           SocketChardev *s = SOCKET_CHARDEV(chr);
>      >     +    if (!s->ioc) {
>      >     +        return NULL;
>      >     +    }
>      >           return qio_channel_create_watch(s->ioc, cond);
>      >       }
>      >
>      >
> 


