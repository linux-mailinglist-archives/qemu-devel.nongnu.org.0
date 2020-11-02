Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806C12A3514
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 21:27:09 +0100 (CET)
Received: from localhost ([::1]:47092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZgQ0-0001cl-37
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 15:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kZgOc-0001Cw-Rz
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 15:25:42 -0500
Received: from indium.canonical.com ([91.189.90.7]:57866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kZgOY-0005sz-VU
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 15:25:42 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kZgOX-00061F-4Q
 for <qemu-devel@nongnu.org>; Mon, 02 Nov 2020 20:25:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1EC6E2E804B
 for <qemu-devel@nongnu.org>; Mon,  2 Nov 2020 20:25:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2020 20:16:38 -0000
From: "Dr. David Alan Gilbert" <1902470@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h yanjin
X-Launchpad-Bug-Reporter: Yan Jin (yanjin)
X-Launchpad-Bug-Modifier: Dr. David Alan Gilbert (dgilbert-h)
References: <160428587851.31102.18083040677647005532.malonedeb@gac.canonical.com>
Message-Id: <20201102201638.GD4845@work-vm>
Subject: Re: [Bug 1902470] Re: migration with TLS-MultiFD is stuck when the
 dst-libvirtd service restarts
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="96ff31b88b65a0d0ea73b89333fe7c4a2669d8fb"; Instance="production"
X-Launchpad-Hash: 4615470550ac94400cb78c10c6b453c73d0c248d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 15:25:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1902470 <1902470@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* zhengchuan (zhengchuan@huawei.com) wrote:
> Anyone who could help this would be appreciated since we have stuck for t=
hree days:(
> =

> IIUC, the client (Src) has sent first hello message to sever(Dst), howeve=
r due to something happened while restarted libvirtd,
> The messages is lost, and both of them are waiting which leading to hang =
forever, but I could find out how for now.

If you need to un-break things, I suggest killing the destination might
free it; but I'm not sure.

An interesting question is if we can make migration-cancel work in this
case.

Dave

> -----Original Message-----
> From: Qemu-devel [mailto:qemu-devel-bounces+zhengchuan=3Dhuawei.com@nongn=
u.org] On Behalf Of Yan Jin
> Sent: 2020=E5=B9=B411=E6=9C=882=E6=97=A5 11:12
> To: qemu-devel@nongnu.org
> Subject: [Bug 1902470] Re: migration with TLS-MultiFD is stuck when the d=
st-libvirtd service restarts
> =

> ** Description changed:
> =

>   hi,
>   =

>   I found that the multi-channel TLS-handshake will be stuck when the dst-
>   libvirtd restarts, both the src and dst sockets are blocked in recvmsg.
>   In the meantime, live_migration thread is blocked in
>   multifd_send_sync_main, so migration cannot be cancelled though src-
>   libvirt has delivered the QMP command.
>   =

>   Is there any way to exit migration when the multi-channel TLS-handshake
> - is stuck? Does setting TLS handshake timeout function take effect?
> + is stuck? Does setting TLS-handshake timeout function take effect?
>   =

>   The stack trace are as follows:
>   =

>   =3D=3D=3D=3D=3Dsrc qemu-system-aar stack=3D=3D=3D=3D=3D:
>   #0  0x0000ffff87d6f28c in recvmsg () from target:/usr/lib64/libpthread.=
so.0
>   #1  0x0000aaaae3817424 in qio_channel_socket_readv (ioc=3D0xaaaae9e30a3=
0, iov=3D0xffffdb58e8a8, niov=3D1, fds=3D0x0, nfds=3D0x0, errp=3D0x0) at ..=
/io/channel-socket.c:502
>   #2  0x0000aaaae380f468 in qio_channel_readv_full (ioc=3D0xaaaae9e30a30,=
 iov=3D0xffffdb58e8a8, niov=3D1, fds=3D0x0, nfds=3D0x0, errp=3D0x0) at ../i=
o/channel.c:66
>   #3  0x0000aaaae380f9e8 in qio_channel_read (ioc=3D0xaaaae9e30a30, buf=
=3D0xaaaaea204e9b "\026\003\001\001L\001", buflen=3D5, errp=3D0x0) at ../io=
/channel.c:217
>   #4  0x0000aaaae380e7d4 in qio_channel_tls_read_handler (buf=3D0xaaaaea2=
04e9b "\026\003\001\001L\001", len=3D5, opaque=3D0xfffd38001190) at ../io/c=
hannel-tls.c:53
>   #5  0x0000aaaae3801114 in qcrypto_tls_session_pull (opaque=3D0xaaaae99d=
5700, buf=3D0xaaaaea204e9b, len=3D5) at ../crypto/tlssession.c:89
>   #6  0x0000ffff8822ed30 in _gnutls_stream_read (ms=3D0xffffdb58eaac, pul=
l_func=3D0xfffd38001870, size=3D5, bufel=3D<synthetic pointer>, session=3D0=
xaaaae983cd60) at buffers.c:346
>   #7  _gnutls_read (ms=3D0xffffdb58eaac, pull_func=3D0xfffd38001870, size=
=3D5, bufel=3D<synthetic pointer>, session=3D0xaaaae983cd60) at buffers.c:4=
26
>   #8  _gnutls_io_read_buffered (session=3Dsession@entry=3D0xaaaae983cd60,=
 total=3D5, recv_type=3Drecv_type@entry=3D4294967295, ms=3D0xffffdb58eaac) =
at buffers.c:581
>   #9  0x0000ffff88224954 in recv_headers (ms=3D<optimized out>, record=3D=
0xffff883cd000 <gnutls_x509_ext_export_name_constraints@got.plt>, htype=3D6=
5535, type=3D2284006288, record_params=3D0xaaaae9e22a60, session=3D0xaaaae9=
83cd60) at record.c:1163
>   #10 _gnutls_recv_in_buffers (session=3Dsession@entry=3D0xaaaae983cd60, =
type=3D2284006288, type@entry=3DGNUTLS_HANDSHAKE, htype=3D65535, htype@entr=
y=3DGNUTLS_HANDSHAKE_HELLO_RETRY_REQUEST, ms=3D<optimized out>, ms@entry=3D=
0) at record.c:1302
>   #11 0x0000ffff88230568 in _gnutls_handshake_io_recv_int (session=3Dsess=
ion@entry=3D0xaaaae983cd60, htype=3Dhtype@entry=3DGNUTLS_HANDSHAKE_HELLO_RE=
TRY_REQUEST, hsk=3Dhsk@entry=3D0xffffdb58ec38, optional=3Doptional@entry=3D=
1) at buffers.c:1445
>   #12 0x0000ffff88232b90 in _gnutls_recv_handshake (session=3Dsession@ent=
ry=3D0xaaaae983cd60, type=3Dtype@entry=3DGNUTLS_HANDSHAKE_HELLO_RETRY_REQUE=
ST, optional=3Doptional@entry=3D1, buf=3Dbuf@entry=3D0x0) at handshake.c:15=
34
>   #13 0x0000ffff88235b40 in handshake_client (session=3Dsession@entry=3D0=
xaaaae983cd60) at handshake.c:2925
>   #14 0x0000ffff88237824 in gnutls_handshake (session=3D0xaaaae983cd60) a=
t handshake.c:2739
>   #15 0x0000aaaae380213c in qcrypto_tls_session_handshake (session=3D0xaa=
aae99d5700, errp=3D0xffffdb58ee58) at ../crypto/tlssession.c:493
>   #16 0x0000aaaae380ea40 in qio_channel_tls_handshake_task (ioc=3D0xfffd3=
8001190, task=3D0xaaaaea61d4e0, context=3D0x0) at ../io/channel-tls.c:161
>   #17 0x0000aaaae380ec60 in qio_channel_tls_handshake (ioc=3D0xfffd380011=
90, func=3D0xaaaae3394d20 <multifd_tls_outgoing_handshake>, opaque=3D0xaaaa=
ea189c30, destroy=3D0x0, context=3D0x0) at ../io/channel-tls.c:239
>   #18 0x0000aaaae3394e78 in multifd_tls_channel_connect (p=3D0xaaaaea189c=
30, ioc=3D0xaaaae9e30a30, errp=3D0xffffdb58ef28) at ../migration/multifd.c:=
782
>   #19 0x0000aaaae3394f30 in multifd_channel_connect (p=3D0xaaaaea189c30, =
ioc=3D0xaaaae9e30a30, error=3D0x0) at ../migration/multifd.c:804
>   #20 0x0000aaaae33950b8 in multifd_new_send_channel_async (task=3D0xaaaa=
ea6855a0, opaque=3D0xaaaaea189c30) at ../migration/multifd.c:858
>   #21 0x0000aaaae3810cf8 in qio_task_complete (task=3D0xaaaaea6855a0) at =
../io/task.c:197
>   #22 0x0000aaaae381096c in qio_task_thread_result (opaque=3D0xaaaaea6855=
a0) at ../io/task.c:112
>   #23 0x0000ffff88701df8 in ?? () from target:/usr/lib64/libglib-2.0.so.0
>   #24 0x0000ffff88705a7c in g_main_context_dispatch () from target:/usr/l=
ib64/libglib-2.0.so.0
>   #25 0x0000aaaae3a5a29c in glib_pollfds_poll () at ../util/main-loop.c:2=
21
>   #26 0x0000aaaae3a5a324 in os_host_main_loop_wait (timeout=3D0) at ../ut=
il/main-loop.c:244
>   #27 0x0000aaaae3a5a444 in main_loop_wait (nonblocking=3D0) at ../util/m=
ain-loop.c:520
>   #28 0x0000aaaae3696b20 in qemu_main_loop () at ../softmmu/vl.c:1677
>   #29 0x0000aaaae30949e4 in main (argc=3D81, argv=3D0xffffdb58f2c8, envp=
=3D0xffffdb58f558) at ../softmmu/main.c:50
>   =

>   =3D=3D=3D=3D=3Dsrc live_migration stack=3D=3D=3D=3D=3D:
>   #0  0x0000ffff87d6a5d8 in pthread_cond_wait () from target:/usr/lib64/l=
ibpthread.so.0
>   #1  0x0000aaaae3a5f3ec in qemu_sem_wait (sem=3D0xaaaaea189d40) at ../ut=
il/qemu-thread-posix.c:328
>   #2  0x0000aaaae3394838 in multifd_send_sync_main (f=3D0xaaaae983f0e0) a=
t ../migration/multifd.c:638
>   #3  0x0000aaaae37de310 in ram_save_setup (f=3D0xaaaae983f0e0, opaque=3D=
0xaaaae4198708 <ram_state>) at ../migration/ram.c:2588
>   #4  0x0000aaaae31cf7ac in qemu_savevm_state_setup (f=3D0xaaaae983f0e0) =
at ../migration/savevm.c:1176
>   #5  0x0000aaaae3248360 in migration_thread (opaque=3D0xaaaae9829f20) at=
 ../migration/migration.c:3521
>   #6  0x0000aaaae3a5f8fc in qemu_thread_start (args=3D0xaaaaea513ee0) at =
../util/qemu-thread-posix.c:521
>   #7  0x0000ffff87d647ac in ?? () from target:/usr/lib64/libpthread.so.0
>   #8  0x0000ffff87cba6ec in ?? () from target:/usr/lib64/libc.so.6
>   =

>   =3D=3D=3D=3D=3Ddst qemu-system-aar stack=3D=3D=3D=3D=3D:
>   #0  0x0000ffff7f17d28c in recvmsg () from target:/usr/lib64/libpthread.=
so.0
>   #1  0x0000aaaae263a424 in qio_channel_socket_readv (ioc=3D0xaaaaf998a80=
0, iov=3D0xfffff5d22f78, niov=3D1, fds=3D0x0, nfds=3D0x0, errp=3D0x0) at ..=
/io/channel-socket.c:502
>   #2  0x0000aaaae2632468 in qio_channel_readv_full (ioc=3D0xaaaaf998a800,=
 iov=3D0xfffff5d22f78, niov=3D1, fds=3D0x0, nfds=3D0x0, errp=3D0x0) at ../i=
o/channel.c:66
>   #3  0x0000aaaae26329e8 in qio_channel_read (ioc=3D0xaaaaf998a800, buf=
=3D0xaaaafa926dbb "q\024\335\365=C8=A3'\221,\\\357\246w\253\242=D1=A0=D8=B5=
I\247(N(K=3D\256\316DH\227QNf\371\"\271\017\226^\223\026\373\245z\255\227\0=
25R.\244\205\254\002\031T\033\312:h\226\a=DD=94\204=D4=AA\324\351K\341\365\=
247\032\354+\277\005O'*l\301cXx\340~?\346\b\324k\225\223D\276\252\376\257_0=
\036\223\022\006\212D|7h\257\226\300&n','\005zL\203M=CD=86\023\213\237(o\27=
2\025_\305s\372\362\351\002\367Ph\016\347\371E\n\030Y\340\002\r\362^&`\021\=
203}\353\324A\340=D2=B3(\207]\300l}h\026\037H\372\n=3D\"C\024\t\200\325\334=
&=3D\333>\212=C6=8FE\214]_\372\264]"..., buflen=3D5, errp=3D0x0) at ../io/c=
hannel.c:217
>   #4  0x0000aaaae26317d4 in qio_channel_tls_read_handler (buf=3D0xaaaafa9=
26dbb "q\024\335\365=C8=A3'\221,\\\357\246w\253\242=D1=A0=D8=B5I\247(N(K=3D=
\256\316DH\227QNf\371\"\271\017\226^\223\026\373\245z\255\227\025R.\244\205=
\254\002\031T\033\312:h\226\a=DD=94\204=D4=AA\324\351K\341\365\247\032\354+=
\277\005O'*l\301cXx\340~?\346\b\324k\225\223D\276\252\376\257_0\036\223\022=
\006\212D|7h\257\226\300&n','\005zL\203M=CD=86\023\213\237(o\272\025_\305s\=
372\362\351\002\367Ph\016\347\371E\n\030Y\340\002\r\362^&`\021\203}\353\324=
A\340=D2=B3(\207]\300l}h\026\037H\372\n=3D\"C\024\t\200\325\334&=3D\333>\21=
2=C6=8FE\214]_\372\264]"..., len=3D5, opaque=3D0xaaaaf9c4c400) at ../io/cha=
nnel-tls.c:53
>   #5  0x0000aaaae2624114 in qcrypto_tls_session_pull (opaque=3D0xaaaafa4a=
3d90, buf=3D0xaaaafa926dbb, len=3D5) at ../crypto/tlssession.c:89
>   #6  0x0000ffff7f63cd30 in _gnutls_stream_read (ms=3D0xfffff5d2317c, pul=
l_func=3D0xaaaafa81a380, size=3D5, bufel=3D<synthetic pointer>, session=3D0=
xaaaafa58b9d0) at buffers.c:346
>   #7  _gnutls_read (ms=3D0xfffff5d2317c, pull_func=3D0xaaaafa81a380, size=
=3D5, bufel=3D<synthetic pointer>, session=3D0xaaaafa58b9d0) at buffers.c:4=
26
>   #8  _gnutls_io_read_buffered (session=3Dsession@entry=3D0xaaaafa58b9d0,=
 total=3D5, recv_type=3Drecv_type@entry=3D4294967295, ms=3D0xfffff5d2317c) =
at buffers.c:581
>   #9  0x0000ffff7f632954 in recv_headers (ms=3D<optimized out>, record=3D=
0x1ee2a9fa78, htype=3D65535, type=3D2137262992, record_params=3D0xaaaafa4b7=
1a0, session=3D0xaaaafa58b9d0) at record.c:1163
>   #10 _gnutls_recv_in_buffers (session=3Dsession@entry=3D0xaaaafa58b9d0, =
type=3D2137262992, type@entry=3DGNUTLS_HANDSHAKE, htype=3D65535, htype@entr=
y=3DGNUTLS_HANDSHAKE_CLIENT_HELLO, ms=3D<optimized out>, ms@entry=3D0) at r=
ecord.c:1302
>   #11 0x0000ffff7f63e568 in _gnutls_handshake_io_recv_int (session=3Dsess=
ion@entry=3D0xaaaafa58b9d0, htype=3Dhtype@entry=3DGNUTLS_HANDSHAKE_CLIENT_H=
ELLO, hsk=3Dhsk@entry=3D0xfffff5d23308, optional=3Doptional@entry=3D0) at b=
uffers.c:1445
>   #12 0x0000ffff7f640b90 in _gnutls_recv_handshake (session=3Dsession@ent=
ry=3D0xaaaafa58b9d0, type=3Dtype@entry=3DGNUTLS_HANDSHAKE_CLIENT_HELLO, opt=
ional=3Doptional@entry=3D0, buf=3Dbuf@entry=3D0x0) at handshake.c:1534
>   #13 0x0000ffff7f645f18 in handshake_server (session=3D<optimized out>) =
at handshake.c:3351
>   #14 gnutls_handshake (session=3D0xaaaafa58b9d0) at handshake.c:2742
>   #15 0x0000aaaae262513c in qcrypto_tls_session_handshake (session=3D0xaa=
aafa4a3d90, errp=3D0xfffff5d23478) at ../crypto/tlssession.c:493
>   #16 0x0000aaaae2631a40 in qio_channel_tls_handshake_task (ioc=3D0xaaaaf=
9c4c400, task=3D0xaaaafa70e600, context=3D0x0) at ../io/channel-tls.c:161
>   #17 0x0000aaaae2631c60 in qio_channel_tls_handshake (ioc=3D0xaaaaf9c4c4=
00, func=3D0xaaaae20d4b58 <migration_tls_incoming_handshake>, opaque=3D0x0,=
 destroy=3D0x0, context=3D0x0) at ../io/channel-tls.c:239
>   #18 0x0000aaaae20d4ca8 in migration_tls_channel_process_incoming (s=3D0=
xaaaaf9b2ef20, ioc=3D0xaaaaf998a800, errp=3D0xfffff5d23548) at ../migration=
/tls.c:103
>   #19 0x0000aaaae20f9f7c in migration_channel_process_incoming (ioc=3D0xa=
aaaf998a800) at ../migration/channel.c:42
>   #20 0x0000aaaae1f484a8 in socket_accept_incoming_migration (listener=3D=
0xffff64007a40, cioc=3D0xaaaaf998a800, opaque=3D0x0) at ../migration/socket=
.c:130
>   #21 0x0000aaaae2638570 in qio_net_listener_channel_func (ioc=3D0xaaaafa=
410600, condition=3DG_IO_IN, opaque=3D0xffff64007a40) at ../io/net-listener=
.c:54
>   #22 0x0000aaaae263ac4c in qio_channel_fd_source_dispatch (source=3D0xaa=
aafa81a380, callback=3D0xaaaae26384f8 <qio_net_listener_channel_func>, user=
_data=3D0xffff64007a40) at ../io/channel-watch.c:84
>   #23 0x0000ffff7fb13a7c in g_main_context_dispatch () from target:/usr/l=
ib64/libglib-2.0.so.0
>   #24 0x0000aaaae287d29c in glib_pollfds_poll () at ../util/main-loop.c:2=
21
>   #25 0x0000aaaae287d324 in os_host_main_loop_wait (timeout=3D571000000) =
at ../util/main-loop.c:244
>   #26 0x0000aaaae287d444 in main_loop_wait (nonblocking=3D0) at ../util/m=
ain-loop.c:520
>   #27 0x0000aaaae24b9b20 in qemu_main_loop () at ../softmmu/vl.c:1677
>   #28 0x0000aaaae1eb79e4 in main (argc=3D83, argv=3D0xfffff5d238c8, envp=
=3D0xfffff5d23b68) at ../softmmu/main.c:50
> =

> --
> You received this bug notification because you are a member of qemu- deve=
l-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1902470
> =

> Title:
>   migration with TLS-MultiFD is stuck when the dst-libvirtd service
>   restarts
> =

> Status in QEMU:
>   New
> =

> Bug description:
>   hi,
> =

>   I found that the multi-channel TLS-handshake will be stuck when the
>   dst-libvirtd restarts, both the src and dst sockets are blocked in
>   recvmsg. In the meantime, live_migration thread is blocked in
>   multifd_send_sync_main, so migration cannot be cancelled though src-
>   libvirt has delivered the QMP command.
> =

>   Is there any way to exit migration when the multi-channel TLS-
>   handshake is stuck? Does setting TLS-handshake timeout function take
>   effect?
> =

>   The stack trace are as follows:
> =

>   =3D=3D=3D=3D=3Dsrc qemu-system-aar stack=3D=3D=3D=3D=3D:
>   #0  0x0000ffff87d6f28c in recvmsg () from target:/usr/lib64/libpthread.=
so.0
>   #1  0x0000aaaae3817424 in qio_channel_socket_readv (ioc=3D0xaaaae9e30a3=
0, iov=3D0xffffdb58e8a8, niov=3D1, fds=3D0x0, nfds=3D0x0, errp=3D0x0) at ..=
/io/channel-socket.c:502
>   #2  0x0000aaaae380f468 in qio_channel_readv_full (ioc=3D0xaaaae9e30a30,=
 iov=3D0xffffdb58e8a8, niov=3D1, fds=3D0x0, nfds=3D0x0, errp=3D0x0) at ../i=
o/channel.c:66
>   #3  0x0000aaaae380f9e8 in qio_channel_read (ioc=3D0xaaaae9e30a30, buf=
=3D0xaaaaea204e9b "\026\003\001\001L\001", buflen=3D5, errp=3D0x0) at ../io=
/channel.c:217
>   #4  0x0000aaaae380e7d4 in qio_channel_tls_read_handler (buf=3D0xaaaaea2=
04e9b "\026\003\001\001L\001", len=3D5, opaque=3D0xfffd38001190) at ../io/c=
hannel-tls.c:53
>   #5  0x0000aaaae3801114 in qcrypto_tls_session_pull (opaque=3D0xaaaae99d=
5700, buf=3D0xaaaaea204e9b, len=3D5) at ../crypto/tlssession.c:89
>   #6  0x0000ffff8822ed30 in _gnutls_stream_read (ms=3D0xffffdb58eaac, pul=
l_func=3D0xfffd38001870, size=3D5, bufel=3D<synthetic pointer>, session=3D0=
xaaaae983cd60) at buffers.c:346
>   #7  _gnutls_read (ms=3D0xffffdb58eaac, pull_func=3D0xfffd38001870, size=
=3D5, bufel=3D<synthetic pointer>, session=3D0xaaaae983cd60) at buffers.c:4=
26
>   #8  _gnutls_io_read_buffered (session=3Dsession@entry=3D0xaaaae983cd60,=
 total=3D5, recv_type=3Drecv_type@entry=3D4294967295, ms=3D0xffffdb58eaac) =
at buffers.c:581
>   #9  0x0000ffff88224954 in recv_headers (ms=3D<optimized out>, record=3D=
0xffff883cd000 <gnutls_x509_ext_export_name_constraints@got.plt>, htype=3D6=
5535, type=3D2284006288, record_params=3D0xaaaae9e22a60, session=3D0xaaaae9=
83cd60) at record.c:1163
>   #10 _gnutls_recv_in_buffers (session=3Dsession@entry=3D0xaaaae983cd60, =
type=3D2284006288, type@entry=3DGNUTLS_HANDSHAKE, htype=3D65535, htype@entr=
y=3DGNUTLS_HANDSHAKE_HELLO_RETRY_REQUEST, ms=3D<optimized out>, ms@entry=3D=
0) at record.c:1302
>   #11 0x0000ffff88230568 in _gnutls_handshake_io_recv_int (session=3Dsess=
ion@entry=3D0xaaaae983cd60, htype=3Dhtype@entry=3DGNUTLS_HANDSHAKE_HELLO_RE=
TRY_REQUEST, hsk=3Dhsk@entry=3D0xffffdb58ec38, optional=3Doptional@entry=3D=
1) at buffers.c:1445
>   #12 0x0000ffff88232b90 in _gnutls_recv_handshake (session=3Dsession@ent=
ry=3D0xaaaae983cd60, type=3Dtype@entry=3DGNUTLS_HANDSHAKE_HELLO_RETRY_REQUE=
ST, optional=3Doptional@entry=3D1, buf=3Dbuf@entry=3D0x0) at handshake.c:15=
34
>   #13 0x0000ffff88235b40 in handshake_client (session=3Dsession@entry=3D0=
xaaaae983cd60) at handshake.c:2925
>   #14 0x0000ffff88237824 in gnutls_handshake (session=3D0xaaaae983cd60) a=
t handshake.c:2739
>   #15 0x0000aaaae380213c in qcrypto_tls_session_handshake (session=3D0xaa=
aae99d5700, errp=3D0xffffdb58ee58) at ../crypto/tlssession.c:493
>   #16 0x0000aaaae380ea40 in qio_channel_tls_handshake_task (ioc=3D0xfffd3=
8001190, task=3D0xaaaaea61d4e0, context=3D0x0) at ../io/channel-tls.c:161
>   #17 0x0000aaaae380ec60 in qio_channel_tls_handshake (ioc=3D0xfffd380011=
90, func=3D0xaaaae3394d20 <multifd_tls_outgoing_handshake>, opaque=3D0xaaaa=
ea189c30, destroy=3D0x0, context=3D0x0) at ../io/channel-tls.c:239
>   #18 0x0000aaaae3394e78 in multifd_tls_channel_connect (p=3D0xaaaaea189c=
30, ioc=3D0xaaaae9e30a30, errp=3D0xffffdb58ef28) at ../migration/multifd.c:=
782
>   #19 0x0000aaaae3394f30 in multifd_channel_connect (p=3D0xaaaaea189c30, =
ioc=3D0xaaaae9e30a30, error=3D0x0) at ../migration/multifd.c:804
>   #20 0x0000aaaae33950b8 in multifd_new_send_channel_async (task=3D0xaaaa=
ea6855a0, opaque=3D0xaaaaea189c30) at ../migration/multifd.c:858
>   #21 0x0000aaaae3810cf8 in qio_task_complete (task=3D0xaaaaea6855a0) at =
../io/task.c:197
>   #22 0x0000aaaae381096c in qio_task_thread_result (opaque=3D0xaaaaea6855=
a0) at ../io/task.c:112
>   #23 0x0000ffff88701df8 in ?? () from target:/usr/lib64/libglib-2.0.so.0
>   #24 0x0000ffff88705a7c in g_main_context_dispatch () from target:/usr/l=
ib64/libglib-2.0.so.0
>   #25 0x0000aaaae3a5a29c in glib_pollfds_poll () at ../util/main-loop.c:2=
21
>   #26 0x0000aaaae3a5a324 in os_host_main_loop_wait (timeout=3D0) at ../ut=
il/main-loop.c:244
>   #27 0x0000aaaae3a5a444 in main_loop_wait (nonblocking=3D0) at ../util/m=
ain-loop.c:520
>   #28 0x0000aaaae3696b20 in qemu_main_loop () at ../softmmu/vl.c:1677
>   #29 0x0000aaaae30949e4 in main (argc=3D81, argv=3D0xffffdb58f2c8, envp=
=3D0xffffdb58f558) at ../softmmu/main.c:50
> =

>   =3D=3D=3D=3D=3Dsrc live_migration stack=3D=3D=3D=3D=3D:
>   #0  0x0000ffff87d6a5d8 in pthread_cond_wait () from target:/usr/lib64/l=
ibpthread.so.0
>   #1  0x0000aaaae3a5f3ec in qemu_sem_wait (sem=3D0xaaaaea189d40) at ../ut=
il/qemu-thread-posix.c:328
>   #2  0x0000aaaae3394838 in multifd_send_sync_main (f=3D0xaaaae983f0e0) a=
t ../migration/multifd.c:638
>   #3  0x0000aaaae37de310 in ram_save_setup (f=3D0xaaaae983f0e0, opaque=3D=
0xaaaae4198708 <ram_state>) at ../migration/ram.c:2588
>   #4  0x0000aaaae31cf7ac in qemu_savevm_state_setup (f=3D0xaaaae983f0e0) =
at ../migration/savevm.c:1176
>   #5  0x0000aaaae3248360 in migration_thread (opaque=3D0xaaaae9829f20) at=
 ../migration/migration.c:3521
>   #6  0x0000aaaae3a5f8fc in qemu_thread_start (args=3D0xaaaaea513ee0) at =
../util/qemu-thread-posix.c:521
>   #7  0x0000ffff87d647ac in ?? () from target:/usr/lib64/libpthread.so.0
>   #8  0x0000ffff87cba6ec in ?? () from target:/usr/lib64/libc.so.6
> =

>   =3D=3D=3D=3D=3Ddst qemu-system-aar stack=3D=3D=3D=3D=3D:
>   #0  0x0000ffff7f17d28c in recvmsg () from target:/usr/lib64/libpthread.=
so.0
>   #1  0x0000aaaae263a424 in qio_channel_socket_readv (ioc=3D0xaaaaf998a80=
0, iov=3D0xfffff5d22f78, niov=3D1, fds=3D0x0, nfds=3D0x0, errp=3D0x0) at ..=
/io/channel-socket.c:502
>   #2  0x0000aaaae2632468 in qio_channel_readv_full (ioc=3D0xaaaaf998a800,=
 iov=3D0xfffff5d22f78, niov=3D1, fds=3D0x0, nfds=3D0x0, errp=3D0x0) at ../i=
o/channel.c:66
>   #3  0x0000aaaae26329e8 in qio_channel_read (ioc=3D0xaaaaf998a800, buf=
=3D0xaaaafa926dbb "q\024\335\365=C8=A3'\221,\\\357\246w\253\242=D1=A0=D8=B5=
I\247(N(K=3D\256\316DH\227QNf\371\"\271\017\226^\223\026\373\245z\255\227\0=
25R.\244\205\254\002\031T\033\312:h\226\a=DD=94\204=D4=AA\324\351K\341\365\=
247\032\354+\277\005O'*l\301cXx\340~?\346\b\324k\225\223D\276\252\376\257_0=
\036\223\022\006\212D|7h\257\226\300&n','\005zL\203M=CD=86\023\213\237(o\27=
2\025_\305s\372\362\351\002\367Ph\016\347\371E\n\030Y\340\002\r\362^&`\021\=
203}\353\324A\340=D2=B3(\207]\300l}h\026\037H\372\n=3D\"C\024\t\200\325\334=
&=3D\333>\212=C6=8FE\214]_\372\264]"..., buflen=3D5, errp=3D0x0) at ../io/c=
hannel.c:217
>   #4  0x0000aaaae26317d4 in qio_channel_tls_read_handler (buf=3D0xaaaafa9=
26dbb "q\024\335\365=C8=A3'\221,\\\357\246w\253\242=D1=A0=D8=B5I\247(N(K=3D=
\256\316DH\227QNf\371\"\271\017\226^\223\026\373\245z\255\227\025R.\244\205=
\254\002\031T\033\312:h\226\a=DD=94\204=D4=AA\324\351K\341\365\247\032\354+=
\277\005O'*l\301cXx\340~?\346\b\324k\225\223D\276\252\376\257_0\036\223\022=
\006\212D|7h\257\226\300&n','\005zL\203M=CD=86\023\213\237(o\272\025_\305s\=
372\362\351\002\367Ph\016\347\371E\n\030Y\340\002\r\362^&`\021\203}\353\324=
A\340=D2=B3(\207]\300l}h\026\037H\372\n=3D\"C\024\t\200\325\334&=3D\333>\21=
2=C6=8FE\214]_\372\264]"..., len=3D5, opaque=3D0xaaaaf9c4c400) at ../io/cha=
nnel-tls.c:53
>   #5  0x0000aaaae2624114 in qcrypto_tls_session_pull (opaque=3D0xaaaafa4a=
3d90, buf=3D0xaaaafa926dbb, len=3D5) at ../crypto/tlssession.c:89
>   #6  0x0000ffff7f63cd30 in _gnutls_stream_read (ms=3D0xfffff5d2317c, pul=
l_func=3D0xaaaafa81a380, size=3D5, bufel=3D<synthetic pointer>, session=3D0=
xaaaafa58b9d0) at buffers.c:346
>   #7  _gnutls_read (ms=3D0xfffff5d2317c, pull_func=3D0xaaaafa81a380, size=
=3D5, bufel=3D<synthetic pointer>, session=3D0xaaaafa58b9d0) at buffers.c:4=
26
>   #8  _gnutls_io_read_buffered (session=3Dsession@entry=3D0xaaaafa58b9d0,=
 total=3D5, recv_type=3Drecv_type@entry=3D4294967295, ms=3D0xfffff5d2317c) =
at buffers.c:581
>   #9  0x0000ffff7f632954 in recv_headers (ms=3D<optimized out>, record=3D=
0x1ee2a9fa78, htype=3D65535, type=3D2137262992, record_params=3D0xaaaafa4b7=
1a0, session=3D0xaaaafa58b9d0) at record.c:1163
>   #10 _gnutls_recv_in_buffers (session=3Dsession@entry=3D0xaaaafa58b9d0, =
type=3D2137262992, type@entry=3DGNUTLS_HANDSHAKE, htype=3D65535, htype@entr=
y=3DGNUTLS_HANDSHAKE_CLIENT_HELLO, ms=3D<optimized out>, ms@entry=3D0) at r=
ecord.c:1302
>   #11 0x0000ffff7f63e568 in _gnutls_handshake_io_recv_int (session=3Dsess=
ion@entry=3D0xaaaafa58b9d0, htype=3Dhtype@entry=3DGNUTLS_HANDSHAKE_CLIENT_H=
ELLO, hsk=3Dhsk@entry=3D0xfffff5d23308, optional=3Doptional@entry=3D0) at b=
uffers.c:1445
>   #12 0x0000ffff7f640b90 in _gnutls_recv_handshake (session=3Dsession@ent=
ry=3D0xaaaafa58b9d0, type=3Dtype@entry=3DGNUTLS_HANDSHAKE_CLIENT_HELLO, opt=
ional=3Doptional@entry=3D0, buf=3Dbuf@entry=3D0x0) at handshake.c:1534
>   #13 0x0000ffff7f645f18 in handshake_server (session=3D<optimized out>) =
at handshake.c:3351
>   #14 gnutls_handshake (session=3D0xaaaafa58b9d0) at handshake.c:2742
>   #15 0x0000aaaae262513c in qcrypto_tls_session_handshake (session=3D0xaa=
aafa4a3d90, errp=3D0xfffff5d23478) at ../crypto/tlssession.c:493
>   #16 0x0000aaaae2631a40 in qio_channel_tls_handshake_task (ioc=3D0xaaaaf=
9c4c400, task=3D0xaaaafa70e600, context=3D0x0) at ../io/channel-tls.c:161
>   #17 0x0000aaaae2631c60 in qio_channel_tls_handshake (ioc=3D0xaaaaf9c4c4=
00, func=3D0xaaaae20d4b58 <migration_tls_incoming_handshake>, opaque=3D0x0,=
 destroy=3D0x0, context=3D0x0) at ../io/channel-tls.c:239
>   #18 0x0000aaaae20d4ca8 in migration_tls_channel_process_incoming (s=3D0=
xaaaaf9b2ef20, ioc=3D0xaaaaf998a800, errp=3D0xfffff5d23548) at ../migration=
/tls.c:103
>   #19 0x0000aaaae20f9f7c in migration_channel_process_incoming (ioc=3D0xa=
aaaf998a800) at ../migration/channel.c:42
>   #20 0x0000aaaae1f484a8 in socket_accept_incoming_migration (listener=3D=
0xffff64007a40, cioc=3D0xaaaaf998a800, opaque=3D0x0) at ../migration/socket=
.c:130
>   #21 0x0000aaaae2638570 in qio_net_listener_channel_func (ioc=3D0xaaaafa=
410600, condition=3DG_IO_IN, opaque=3D0xffff64007a40) at ../io/net-listener=
.c:54
>   #22 0x0000aaaae263ac4c in qio_channel_fd_source_dispatch (source=3D0xaa=
aafa81a380, callback=3D0xaaaae26384f8 <qio_net_listener_channel_func>, user=
_data=3D0xffff64007a40) at ../io/channel-watch.c:84
>   #23 0x0000ffff7fb13a7c in g_main_context_dispatch () from target:/usr/l=
ib64/libglib-2.0.so.0
>   #24 0x0000aaaae287d29c in glib_pollfds_poll () at ../util/main-loop.c:2=
21
>   #25 0x0000aaaae287d324 in os_host_main_loop_wait (timeout=3D571000000) =
at ../util/main-loop.c:244
>   #26 0x0000aaaae287d444 in main_loop_wait (nonblocking=3D0) at ../util/m=
ain-loop.c:520
>   #27 0x0000aaaae24b9b20 in qemu_main_loop () at ../softmmu/vl.c:1677
>   #28 0x0000aaaae1eb79e4 in main (argc=3D83, argv=3D0xfffff5d238c8, envp=
=3D0xfffff5d23b68) at ../softmmu/main.c:50
> =

> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1902470/+subscriptions
> =

-- =

Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1902470

Title:
  migration with TLS-MultiFD is stuck when the dst-libvirtd service
  restarts

Status in QEMU:
  New

Bug description:
  hi,

  I found that the multi-channel TLS-handshake will be stuck when the
  dst-libvirtd restarts, both the src and dst sockets are blocked in
  recvmsg. In the meantime, live_migration thread is blocked in
  multifd_send_sync_main, so migration cannot be cancelled though src-
  libvirt has delivered the QMP command.

  Is there any way to exit migration when the multi-channel TLS-
  handshake is stuck? Does setting TLS-handshake timeout function take
  effect?

  The stack trace are as follows:

  =3D=3D=3D=3D=3Dsrc qemu-system-aar stack=3D=3D=3D=3D=3D:
  #0  0x0000ffff87d6f28c in recvmsg () from target:/usr/lib64/libpthread.so=
.0
  #1  0x0000aaaae3817424 in qio_channel_socket_readv (ioc=3D0xaaaae9e30a30,=
 iov=3D0xffffdb58e8a8, niov=3D1, fds=3D0x0, nfds=3D0x0, errp=3D0x0) at ../i=
o/channel-socket.c:502
  #2  0x0000aaaae380f468 in qio_channel_readv_full (ioc=3D0xaaaae9e30a30, i=
ov=3D0xffffdb58e8a8, niov=3D1, fds=3D0x0, nfds=3D0x0, errp=3D0x0) at ../io/=
channel.c:66
  #3  0x0000aaaae380f9e8 in qio_channel_read (ioc=3D0xaaaae9e30a30, buf=3D0=
xaaaaea204e9b "\026\003\001\001L\001", buflen=3D5, errp=3D0x0) at ../io/cha=
nnel.c:217
  #4  0x0000aaaae380e7d4 in qio_channel_tls_read_handler (buf=3D0xaaaaea204=
e9b "\026\003\001\001L\001", len=3D5, opaque=3D0xfffd38001190) at ../io/cha=
nnel-tls.c:53
  #5  0x0000aaaae3801114 in qcrypto_tls_session_pull (opaque=3D0xaaaae99d57=
00, buf=3D0xaaaaea204e9b, len=3D5) at ../crypto/tlssession.c:89
  #6  0x0000ffff8822ed30 in _gnutls_stream_read (ms=3D0xffffdb58eaac, pull_=
func=3D0xfffd38001870, size=3D5, bufel=3D<synthetic pointer>, session=3D0xa=
aaae983cd60) at buffers.c:346
  #7  _gnutls_read (ms=3D0xffffdb58eaac, pull_func=3D0xfffd38001870, size=
=3D5, bufel=3D<synthetic pointer>, session=3D0xaaaae983cd60) at buffers.c:4=
26
  #8  _gnutls_io_read_buffered (session=3Dsession@entry=3D0xaaaae983cd60, t=
otal=3D5, recv_type=3Drecv_type@entry=3D4294967295, ms=3D0xffffdb58eaac) at=
 buffers.c:581
  #9  0x0000ffff88224954 in recv_headers (ms=3D<optimized out>, record=3D0x=
ffff883cd000 <gnutls_x509_ext_export_name_constraints@got.plt>, htype=3D655=
35, type=3D2284006288, record_params=3D0xaaaae9e22a60, session=3D0xaaaae983=
cd60) at record.c:1163
  #10 _gnutls_recv_in_buffers (session=3Dsession@entry=3D0xaaaae983cd60, ty=
pe=3D2284006288, type@entry=3DGNUTLS_HANDSHAKE, htype=3D65535, htype@entry=
=3DGNUTLS_HANDSHAKE_HELLO_RETRY_REQUEST, ms=3D<optimized out>, ms@entry=3D0=
) at record.c:1302
  #11 0x0000ffff88230568 in _gnutls_handshake_io_recv_int (session=3Dsessio=
n@entry=3D0xaaaae983cd60, htype=3Dhtype@entry=3DGNUTLS_HANDSHAKE_HELLO_RETR=
Y_REQUEST, hsk=3Dhsk@entry=3D0xffffdb58ec38, optional=3Doptional@entry=3D1)=
 at buffers.c:1445
  #12 0x0000ffff88232b90 in _gnutls_recv_handshake (session=3Dsession@entry=
=3D0xaaaae983cd60, type=3Dtype@entry=3DGNUTLS_HANDSHAKE_HELLO_RETRY_REQUEST=
, optional=3Doptional@entry=3D1, buf=3Dbuf@entry=3D0x0) at handshake.c:1534
  #13 0x0000ffff88235b40 in handshake_client (session=3Dsession@entry=3D0xa=
aaae983cd60) at handshake.c:2925
  #14 0x0000ffff88237824 in gnutls_handshake (session=3D0xaaaae983cd60) at =
handshake.c:2739
  #15 0x0000aaaae380213c in qcrypto_tls_session_handshake (session=3D0xaaaa=
e99d5700, errp=3D0xffffdb58ee58) at ../crypto/tlssession.c:493
  #16 0x0000aaaae380ea40 in qio_channel_tls_handshake_task (ioc=3D0xfffd380=
01190, task=3D0xaaaaea61d4e0, context=3D0x0) at ../io/channel-tls.c:161
  #17 0x0000aaaae380ec60 in qio_channel_tls_handshake (ioc=3D0xfffd38001190=
, func=3D0xaaaae3394d20 <multifd_tls_outgoing_handshake>, opaque=3D0xaaaaea=
189c30, destroy=3D0x0, context=3D0x0) at ../io/channel-tls.c:239
  #18 0x0000aaaae3394e78 in multifd_tls_channel_connect (p=3D0xaaaaea189c30=
, ioc=3D0xaaaae9e30a30, errp=3D0xffffdb58ef28) at ../migration/multifd.c:782
  #19 0x0000aaaae3394f30 in multifd_channel_connect (p=3D0xaaaaea189c30, io=
c=3D0xaaaae9e30a30, error=3D0x0) at ../migration/multifd.c:804
  #20 0x0000aaaae33950b8 in multifd_new_send_channel_async (task=3D0xaaaaea=
6855a0, opaque=3D0xaaaaea189c30) at ../migration/multifd.c:858
  #21 0x0000aaaae3810cf8 in qio_task_complete (task=3D0xaaaaea6855a0) at ..=
/io/task.c:197
  #22 0x0000aaaae381096c in qio_task_thread_result (opaque=3D0xaaaaea6855a0=
) at ../io/task.c:112
  #23 0x0000ffff88701df8 in ?? () from target:/usr/lib64/libglib-2.0.so.0
  #24 0x0000ffff88705a7c in g_main_context_dispatch () from target:/usr/lib=
64/libglib-2.0.so.0
  #25 0x0000aaaae3a5a29c in glib_pollfds_poll () at ../util/main-loop.c:221
  #26 0x0000aaaae3a5a324 in os_host_main_loop_wait (timeout=3D0) at ../util=
/main-loop.c:244
  #27 0x0000aaaae3a5a444 in main_loop_wait (nonblocking=3D0) at ../util/mai=
n-loop.c:520
  #28 0x0000aaaae3696b20 in qemu_main_loop () at ../softmmu/vl.c:1677
  #29 0x0000aaaae30949e4 in main (argc=3D81, argv=3D0xffffdb58f2c8, envp=3D=
0xffffdb58f558) at ../softmmu/main.c:50

  =3D=3D=3D=3D=3Dsrc live_migration stack=3D=3D=3D=3D=3D:
  #0  0x0000ffff87d6a5d8 in pthread_cond_wait () from target:/usr/lib64/lib=
pthread.so.0
  #1  0x0000aaaae3a5f3ec in qemu_sem_wait (sem=3D0xaaaaea189d40) at ../util=
/qemu-thread-posix.c:328
  #2  0x0000aaaae3394838 in multifd_send_sync_main (f=3D0xaaaae983f0e0) at =
../migration/multifd.c:638
  #3  0x0000aaaae37de310 in ram_save_setup (f=3D0xaaaae983f0e0, opaque=3D0x=
aaaae4198708 <ram_state>) at ../migration/ram.c:2588
  #4  0x0000aaaae31cf7ac in qemu_savevm_state_setup (f=3D0xaaaae983f0e0) at=
 ../migration/savevm.c:1176
  #5  0x0000aaaae3248360 in migration_thread (opaque=3D0xaaaae9829f20) at .=
./migration/migration.c:3521
  #6  0x0000aaaae3a5f8fc in qemu_thread_start (args=3D0xaaaaea513ee0) at ..=
/util/qemu-thread-posix.c:521
  #7  0x0000ffff87d647ac in ?? () from target:/usr/lib64/libpthread.so.0
  #8  0x0000ffff87cba6ec in ?? () from target:/usr/lib64/libc.so.6

  =3D=3D=3D=3D=3Ddst qemu-system-aar stack=3D=3D=3D=3D=3D:
  #0  0x0000ffff7f17d28c in recvmsg () from target:/usr/lib64/libpthread.so=
.0
  #1  0x0000aaaae263a424 in qio_channel_socket_readv (ioc=3D0xaaaaf998a800,=
 iov=3D0xfffff5d22f78, niov=3D1, fds=3D0x0, nfds=3D0x0, errp=3D0x0) at ../i=
o/channel-socket.c:502
  #2  0x0000aaaae2632468 in qio_channel_readv_full (ioc=3D0xaaaaf998a800, i=
ov=3D0xfffff5d22f78, niov=3D1, fds=3D0x0, nfds=3D0x0, errp=3D0x0) at ../io/=
channel.c:66
  #3  0x0000aaaae26329e8 in qio_channel_read (ioc=3D0xaaaaf998a800, buf=3D0=
xaaaafa926dbb "q\024\335\365=C8=A3'\221,\\\357\246w\253\242=D1=A0=D8=B5I\24=
7(N(K=3D\256\316DH\227QNf\371\"\271\017\226^\223\026\373\245z\255\227\025R.=
\244\205\254\002\031T\033\312:h\226\a=DD=94\204=D4=AA\324\351K\341\365\247\=
032\354+\277\005O'*l\301cXx\340~?\346\b\324k\225\223D\276\252\376\257_0\036=
\223\022\006\212D|7h\257\226\300&n','\005zL\203M=CD=86\023\213\237(o\272\02=
5_\305s\372\362\351\002\367Ph\016\347\371E\n\030Y\340\002\r\362^&`\021\203}=
\353\324A\340=D2=B3(\207]\300l}h\026\037H\372\n=3D\"C\024\t\200\325\334&=3D=
\333>\212=C6=8FE\214]_\372\264]"..., buflen=3D5, errp=3D0x0) at ../io/chann=
el.c:217
  #4  0x0000aaaae26317d4 in qio_channel_tls_read_handler (buf=3D0xaaaafa926=
dbb "q\024\335\365=C8=A3'\221,\\\357\246w\253\242=D1=A0=D8=B5I\247(N(K=3D\2=
56\316DH\227QNf\371\"\271\017\226^\223\026\373\245z\255\227\025R.\244\205\2=
54\002\031T\033\312:h\226\a=DD=94\204=D4=AA\324\351K\341\365\247\032\354+\2=
77\005O'*l\301cXx\340~?\346\b\324k\225\223D\276\252\376\257_0\036\223\022\0=
06\212D|7h\257\226\300&n','\005zL\203M=CD=86\023\213\237(o\272\025_\305s\37=
2\362\351\002\367Ph\016\347\371E\n\030Y\340\002\r\362^&`\021\203}\353\324A\=
340=D2=B3(\207]\300l}h\026\037H\372\n=3D\"C\024\t\200\325\334&=3D\333>\212=
=C6=8FE\214]_\372\264]"..., len=3D5, opaque=3D0xaaaaf9c4c400) at ../io/chan=
nel-tls.c:53
  #5  0x0000aaaae2624114 in qcrypto_tls_session_pull (opaque=3D0xaaaafa4a3d=
90, buf=3D0xaaaafa926dbb, len=3D5) at ../crypto/tlssession.c:89
  #6  0x0000ffff7f63cd30 in _gnutls_stream_read (ms=3D0xfffff5d2317c, pull_=
func=3D0xaaaafa81a380, size=3D5, bufel=3D<synthetic pointer>, session=3D0xa=
aaafa58b9d0) at buffers.c:346
  #7  _gnutls_read (ms=3D0xfffff5d2317c, pull_func=3D0xaaaafa81a380, size=
=3D5, bufel=3D<synthetic pointer>, session=3D0xaaaafa58b9d0) at buffers.c:4=
26
  #8  _gnutls_io_read_buffered (session=3Dsession@entry=3D0xaaaafa58b9d0, t=
otal=3D5, recv_type=3Drecv_type@entry=3D4294967295, ms=3D0xfffff5d2317c) at=
 buffers.c:581
  #9  0x0000ffff7f632954 in recv_headers (ms=3D<optimized out>, record=3D0x=
1ee2a9fa78, htype=3D65535, type=3D2137262992, record_params=3D0xaaaafa4b71a=
0, session=3D0xaaaafa58b9d0) at record.c:1163
  #10 _gnutls_recv_in_buffers (session=3Dsession@entry=3D0xaaaafa58b9d0, ty=
pe=3D2137262992, type@entry=3DGNUTLS_HANDSHAKE, htype=3D65535, htype@entry=
=3DGNUTLS_HANDSHAKE_CLIENT_HELLO, ms=3D<optimized out>, ms@entry=3D0) at re=
cord.c:1302
  #11 0x0000ffff7f63e568 in _gnutls_handshake_io_recv_int (session=3Dsessio=
n@entry=3D0xaaaafa58b9d0, htype=3Dhtype@entry=3DGNUTLS_HANDSHAKE_CLIENT_HEL=
LO, hsk=3Dhsk@entry=3D0xfffff5d23308, optional=3Doptional@entry=3D0) at buf=
fers.c:1445
  #12 0x0000ffff7f640b90 in _gnutls_recv_handshake (session=3Dsession@entry=
=3D0xaaaafa58b9d0, type=3Dtype@entry=3DGNUTLS_HANDSHAKE_CLIENT_HELLO, optio=
nal=3Doptional@entry=3D0, buf=3Dbuf@entry=3D0x0) at handshake.c:1534
  #13 0x0000ffff7f645f18 in handshake_server (session=3D<optimized out>) at=
 handshake.c:3351
  #14 gnutls_handshake (session=3D0xaaaafa58b9d0) at handshake.c:2742
  #15 0x0000aaaae262513c in qcrypto_tls_session_handshake (session=3D0xaaaa=
fa4a3d90, errp=3D0xfffff5d23478) at ../crypto/tlssession.c:493
  #16 0x0000aaaae2631a40 in qio_channel_tls_handshake_task (ioc=3D0xaaaaf9c=
4c400, task=3D0xaaaafa70e600, context=3D0x0) at ../io/channel-tls.c:161
  #17 0x0000aaaae2631c60 in qio_channel_tls_handshake (ioc=3D0xaaaaf9c4c400=
, func=3D0xaaaae20d4b58 <migration_tls_incoming_handshake>, opaque=3D0x0, d=
estroy=3D0x0, context=3D0x0) at ../io/channel-tls.c:239
  #18 0x0000aaaae20d4ca8 in migration_tls_channel_process_incoming (s=3D0xa=
aaaf9b2ef20, ioc=3D0xaaaaf998a800, errp=3D0xfffff5d23548) at ../migration/t=
ls.c:103
  #19 0x0000aaaae20f9f7c in migration_channel_process_incoming (ioc=3D0xaaa=
af998a800) at ../migration/channel.c:42
  #20 0x0000aaaae1f484a8 in socket_accept_incoming_migration (listener=3D0x=
ffff64007a40, cioc=3D0xaaaaf998a800, opaque=3D0x0) at ../migration/socket.c=
:130
  #21 0x0000aaaae2638570 in qio_net_listener_channel_func (ioc=3D0xaaaafa41=
0600, condition=3DG_IO_IN, opaque=3D0xffff64007a40) at ../io/net-listener.c=
:54
  #22 0x0000aaaae263ac4c in qio_channel_fd_source_dispatch (source=3D0xaaaa=
fa81a380, callback=3D0xaaaae26384f8 <qio_net_listener_channel_func>, user_d=
ata=3D0xffff64007a40) at ../io/channel-watch.c:84
  #23 0x0000ffff7fb13a7c in g_main_context_dispatch () from target:/usr/lib=
64/libglib-2.0.so.0
  #24 0x0000aaaae287d29c in glib_pollfds_poll () at ../util/main-loop.c:221
  #25 0x0000aaaae287d324 in os_host_main_loop_wait (timeout=3D571000000) at=
 ../util/main-loop.c:244
  #26 0x0000aaaae287d444 in main_loop_wait (nonblocking=3D0) at ../util/mai=
n-loop.c:520
  #27 0x0000aaaae24b9b20 in qemu_main_loop () at ../softmmu/vl.c:1677
  #28 0x0000aaaae1eb79e4 in main (argc=3D83, argv=3D0xfffff5d238c8, envp=3D=
0xfffff5d23b68) at ../softmmu/main.c:50

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1902470/+subscriptions

