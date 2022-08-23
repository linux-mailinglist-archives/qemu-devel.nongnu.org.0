Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C9C59E513
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 16:24:07 +0200 (CEST)
Received: from localhost ([::1]:57322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQUp4-00061e-13
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 10:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oQUlc-0002Ng-12
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 10:20:32 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:41852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oQUlY-00071Y-KD
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 10:20:30 -0400
Received: by mail-qv1-xf36.google.com with SMTP id j1so10607196qvv.8
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc;
 bh=YJsQhDZSB8ben0NC08oWIOOtq70Uvv83QFOXglECIzM=;
 b=HkCKxsdS/lA1Sl5KWw+vBBVT2zV0GLMkKttWWRZjBVOhoHrbFGB8wVGdmVoODjDyTc
 ImG4qIEQZ+lwGHVYZO5VjaOPhF6okRaJYq8wOiZEfvUUGCp1Zb69hFG0i20r1u9pbfoJ
 rlWIajJUa/+2M5cvKh5CbplL32Q1VBPQQoYtYXWWqs7OpxDKjExkWKaePAv1ihp88VEr
 h0GC/kAvyoYWijZ6ttJ9BjgqMLC2zaqh6kN5Xp37vg9PGjrapyf8E1Bt++qDbGJkYXVO
 xWBWCvFjUMrbLv/NEywg+k/gqLWX2qft1WwzxpctdorTmwh3yZwsgszwVsARmjkmRqmC
 m6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc;
 bh=YJsQhDZSB8ben0NC08oWIOOtq70Uvv83QFOXglECIzM=;
 b=6rrPo19RZQxAlxMpdFD68YvGNbEjXWUsZzgCz6sIn0+k5QPVD+LSt2T/JTH70MgS/W
 5knuSnAzhZZ8B1iizNHQ1ruNlrAghq3GomlO0fXwX8pYyBFjfiz4up2fnbthlR8IWKvD
 AK5BzFxX9GcQVXUXjB6q8avOC5Hie/4is79chPaILyaL4qZPHlz8Cr7TVPHYR/g8k7yp
 uiZHQLi5BhmDL7d4gQ+4fx86idApkQFSFrWsZOWb4d7YDDf6X8GBcxOa+7lxFiIrV3Nb
 Ij6W0VrnjdIN0FUldQK5vQnWgFD+EDKN7eJeNXCRAOGb+IZggT9uS6Zb6dLzprnvu6WC
 c5kQ==
X-Gm-Message-State: ACgBeo1hefeuWaUqkqqB8587P5Cl5RdmFGM+oAFDoC24cIHuUGLUjVP2
 FvgcX695lxV8y7Z+ZYMe17ufgRixfDL18hCWPCkDNWC1ISRIvw==
X-Google-Smtp-Source: AA6agR7wB7KgW458KJC2JOd/fVfAYmPLdlfl+HGhNxYb2S6oZque05fV/c/HZ+A2xvTUh0a9B8kQcJClB6drahcSlwE=
X-Received: by 2002:a0c:cb0d:0:b0:496:bf04:3555 with SMTP id
 o13-20020a0ccb0d000000b00496bf043555mr18957262qvk.130.1661264423486; Tue, 23
 Aug 2022 07:20:23 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Tue, 23 Aug 2022 16:20:12 +0200
Message-ID: <CAJ307Ejfq=8n8O3SB73YNPp+7Nht3d9oibSdgjSN8vEHYjp_6w@mail.gmail.com>
Subject: Issues related to the polling system on Windows
To: qemu-devel@nongnu.org, pbonzini@redhat.com
Cc: Fabien Chouteau <chouteau@adacore.com>,
 =?UTF-8?Q?C=C3=A9dric_Landet?= <landet@adacore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=chigot@adacore.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

I've been struggling with a bug which seems to be linked to several issues
in the polling system on Windows hosts.

When connecting gdb to a qemu-system (it happens with all the emulations
I've tried), I've discovered that sometimes a latency appears. It happens
with all the commands but it is really noticeable with "call" commands. It =
can
take more than 20s to complete.

While investigating it seems that the polling system misses some events and
thus waits for the timeout of g_poll (1s) before handling them. It can be s=
een
with any program launched with gdbstub_io_command traces.
$ gdb-system-arm -s -S
...
gdbstub_io_command Received: m422650,8
gdbstub_io_command Received: m422650,8
     Freeze for less than one second
gdbstub_io_command Received: P1f=3Dd09fca0000000000
gdbstub_io_command Received: m422650,8
....

This is random but pretty obvious when the freeze happens.

An important note is that it's triggered by newer versions of glib. We have
a qemu-6 built with glib-2.54 where everything is fine, but when rebuilding
it with glib-2.60 this problem appears. I didn't check yet with glib
2.56 or 2.58
because it's still using the autoconf approach instead of meson.
Anyway, I didn't find any obvious glib commits which could have introduced =
this
issue. If anyone more experienced with glib has an idea, I'm interested.

Afterwards, I've dug into qemu core and how it sets up the connection betwe=
en
gdb and qemu. And I have several questions / ideas about what is happening.

IIUC, the gdb connection is handled using an io/channel-watch. This adds a
GSource for our given socket (-S being a tcp connection) to be polled
by the main
loop.
For Windows, qio_channel_socket_source_check is the function used for the
check operation. In this function, we are both calling WSAEnumNetworkEvents
and select. The first one seems here only to reset the events while the sec=
ond
retrieves them. However, it's not an atomic operation. So my guess is that =
some
events are lost during these two operations. I've tried several
solutions around that
move WSAEnumNetworkEvents after select, replace it with WSAResetEvent, use
auto/manual reset in CreateEvent. None of them worked.

Afterwards, I've tried to replace select by just WSAEnumNetworkEvents which
is supposed to be enough.  But I've faced another issue.
We have two sources connected to the same socket. These two sources have
different conditions G_IO_HUP vs G_IO_IN + G_IO_OUT + ... It's fine on Linu=
x
but on Windows, it seems to be problematic as I'm getting the Read event on=
 the
GSource having just G_IO_HUP. It's kind of logical as Windows API only know=
s
about HANDLE which is the same in both cases. I've made a quick attempt to
create another HANDLE for the second GSource. But it didn't work.

The GSource with G_IO_HUP is created by:
#0  qio_channel_create_socket_watch (... condition=3DG_IO_HUP) at
io/channel-watch.c
#1  qio_channel_create_watch at io/channel.c
#2  update_ioc_handlers at chardev/char-socket.c
#3  tcp_chr_connect at chardev/char-socket.c
#4  tcp_chr_new_client at chardev/char-socket.c
#5  qio_net_listener_channel_func at io/net-listener.c
#6  g_main_dispatch at glib/gmain.c
#7  g_main_context_dispatch at glib/gmain.c
#8  os_host_main_loop_wait at util/main-loop.c:480
...

The other is made during the poll_prepare and added as a child_source of
the first one.
#0  qio_channel_create_socket_watch (..., condition=3D(G_IO_IN |
G_IO_OUT | G_IO_ERR | G_IO_HUP | G_IO_NVAL)) at io/channel-watch.c
#1  qio_channel_create_watch at io/channel.c
#2  io_watch_poll_prepare at chardev/char-io.c
#3  io_watch_poll_prepare at chardev/char-io.c
#4  g_main_context_prepare at glib/gmain.c
#5  os_host_main_loop_wait at util/main-loop.c
...

I'm not familiar enough with glib to know if these child_source are working
fine on Windows.

I'm currently trying to change the approach and instead of creating a
new source,
I want to update the previous one. But it needs some important modification=
s.
As I'm a bit taken by the time, I'm looking for a workaround and any
advice on that.
For now, the only workaround I've found is to reduce the timeout in g_poll =
to
catch the missed events earlier...

@Paolo, you were the one implementing the part in io/channel-watch in
a5897205677, do you have any ideas or suggestions ?

I'll try to send an update with a reproducer. But I didn't have time
to create it
yet.

Thanks in advance
Cl=C3=A9ment

