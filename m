Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C561C54CEFF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:47:41 +0200 (CEST)
Received: from localhost ([::1]:46222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1WBA-0002Dt-EP
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1o1W6s-00081h-Ep
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:43:14 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:42617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1o1W6q-0000mN-5L
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:43:14 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id i186so12297503vsc.9
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 09:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=55wLUZKzSZpnDMHLXpSeA28B4Vol2enGNyu/z+m5cMg=;
 b=tJPI+rwH57dwMUCWcBQ2K78klukAyK/myJMdDYLfBYugaDmBnmauQ9VPkGyp7b8usk
 z9a9MywixdRbte9kd9XR8gy4SEOpVwNw/ftkAXDKuwlP6g0q/wrVeHfi6HDxejMRgsK5
 tRZ7biFpfowWXEQKPyRFKS9tRP1sXPwcv+cvh8Do+W4baVH9ui1gfheXybkvXWw1rGn2
 5P+bZyagFkOGm+woIBUpSdEE1HrPul4lXTDsUATbBu8ysFQ5eBy2hY/W/qzsy6as9nMB
 mMKi7/wsudF8doKzD0PKk3CgYVuoFhHTESssLdhqnzBYxSVq7thqO2YHPLsUYikWcDLn
 fEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=55wLUZKzSZpnDMHLXpSeA28B4Vol2enGNyu/z+m5cMg=;
 b=DuEtLO3O3JFNB5dckIJ8ywyV+YZQNhb4I9CbE0Ha+9zth2aOScroHZJtWzxpItpKWy
 3L4hUgHl8gNzF1LfhDMDsgfcWtEopp+5ts+k0Ie0XMgf/fzEE+xWohiGzKiUo5X/fSsf
 OvMU6XLOSn3f3VTJ+XdFj/z3SPWCmhCBvPy+f0g55e80XAi5QOuYyPeHpScEv0N+r1nQ
 tj/B3mWAWOFQAH5vBl2JEbBMoSJFoa1x79oGom2By46qcQuqrYlvMgCo5cIXof/C9txJ
 7uf2yWiqydybT1zu84lZM8d5mxzg/n4/ZjNOWLFpDKCl0f82lDJ0iSkh7ZLI42HT4Pbu
 6x5g==
X-Gm-Message-State: AJIora9LjUhR6a77POORLDQNCdV9IJAZbIyLko59is6KdHviitaXkKJi
 hCSfUJ2zyNDb6DxVkkGHN5NrxjpshC9XuTNeN0nrtFXW9sjYsQ==
X-Google-Smtp-Source: AGRyM1uaGtpq3LC5SjMuCfswr9BLZ/TEl2mhSHNHi6lGeceBasR9iT/Gr6wmBcpV9lc7SMIZK8m59FL/5pbzZ/7LE7k=
X-Received: by 2002:a05:6102:32c8:b0:34c:2358:1824 with SMTP id
 o8-20020a05610232c800b0034c23581824mr567762vss.65.1655311389824; Wed, 15 Jun
 2022 09:43:09 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 15 Jun 2022 09:42:58 -0700
Message-ID: <CAO=notxhNUkps9_aLKmy=oDKYC8xsUjErrEMAycwJHjUvkWHRA@mail.gmail.com>
Subject: misaligned-pointer-use libslirp/src/tcp_input.c
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Peter Foley <pefoley@google.com>
Content-Type: multipart/alternative; boundary="00000000000062b58205e17f3785"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=venture@google.com; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5, USER_IN_DEF_SPF_WL=-7.5,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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

--00000000000062b58205e17f3785
Content-Type: text/plain; charset="UTF-8"

Hey - I wanted to ask if someone else has seen this or has suggestions on
how to fix it in libslirp / qemu.

libslirp version: 3ad1710a96678fe79066b1469cead4058713a1d9

The blow is line:
https://gitlab.freedesktop.org/slirp/libslirp/-/blob/master/src/tcp_input.c#L310

I0614 13:44:44.304087    2040 bytestream.cc:22] QEMU:
third_party/libslirp/src/tcp_input.c:310:56: runtime error: member access
within misaligned address 0xffff9a4000f4 for type 'struct qlink', which
requires 8 byte alignment
I0614 13:44:44.304156    2040 bytestream.cc:22] QEMU: 0xffff9a4000f4: note:
pointer points here
I0614 13:44:44.304184    2040 bytestream.cc:22] QEMU:   00 00 00 00 00 00
00 02  20 02 0a 00 00 01 42 01  0a 00 02 02 42 01 0a 00  00 01 86 dd 60 02
dd 79
I0614 13:44:44.304204    2040 bytestream.cc:22] QEMU:               ^
I0614 13:44:44.641173    2040 bytestream.cc:22] QEMU:     #0 0xaaaacbe34bd8
in tcp_input third_party/libslirp/src/tcp_input.c:310:56
I0614 13:44:44.641239    2040 bytestream.cc:22] QEMU:     #1 0xaaaacbe22a94
in ip6_input third_party/libslirp/src/ip6_input.c:74:9
I0614 13:44:44.641262    2040 bytestream.cc:22] QEMU:     #2 0xaaaacbe0bbbc
in slirp_input third_party/libslirp/src/slirp.c:1169:13
I0614 13:44:44.641280    2040 bytestream.cc:22] QEMU:     #3 0xaaaacbd55f6c
in net_slirp_receive third_party/qemu/net/slirp.c:136:5
I0614 13:44:44.641296    2040 bytestream.cc:22] QEMU:     #4 0xaaaacbd4e77c
in nc_sendv_compat third_party/qemu/net/net.c
I0614 13:44:44.641323    2040 bytestream.cc:22] QEMU:     #5 0xaaaacbd4e77c
in qemu_deliver_packet_iov third_party/qemu/net/net.c:850:15
I0614 13:44:44.641342    2040 bytestream.cc:22] QEMU:     #6 0xaaaacbd50bfc
in qemu_net_queue_deliver_iov third_party/qemu/net/queue.c:179:11
I0614 13:44:44.641359    2040 bytestream.cc:22] QEMU:     #7 0xaaaacbd50bfc
in qemu_net_queue_send_iov third_party/qemu/net/queue.c:246:11
I0614 13:44:44.641382    2040 bytestream.cc:22] QEMU:     #8 0xaaaacbd4a88c
in qemu_sendv_packet_async third_party/qemu/net/net.c:891:12
I0614 13:44:44.641396    2040 bytestream.cc:22] QEMU:     #9 0xaaaacacb1de0
in virtio_net_flush_tx third_party/qemu/hw/net/virtio-net.c:2586:15
I0614 13:44:44.641416    2040 bytestream.cc:22] QEMU:     #10
0xaaaacacb1580 in virtio_net_tx_bh
third_party/qemu/hw/net/virtio-net.c:2703:11
I0614 13:44:44.641438    2040 bytestream.cc:22] QEMU:     #11
0xaaaacc2bcf64 in aio_bh_call third_party/qemu/util/async.c:142:5
I0614 13:44:44.641463    2040 bytestream.cc:22] QEMU:     #12
0xaaaacc2bcf64 in aio_bh_poll third_party/qemu/util/async.c:170:13
I0614 13:44:44.641477    2040 bytestream.cc:22] QEMU:     #13
0xaaaacc2b8f70 in aio_dispatch third_party/qemu/util/aio-posix.c:420:5
I0614 13:44:44.641495    2040 bytestream.cc:22] QEMU:     #14
0xaaaacc2bf120 in aio_ctx_dispatch third_party/qemu/util/async.c:312:5
I0614 13:44:44.641510    2040 bytestream.cc:22] QEMU:     #15
0xaaaacc3a7690 in g_main_dispatch third_party/glib/glib/gmain.c:3417:27
I0614 13:44:44.641525    2040 bytestream.cc:22] QEMU:     #16
0xaaaacc3a7690 in g_main_context_dispatch
third_party/glib/glib/gmain.c:4135:7
I0614 13:44:44.641546    2040 bytestream.cc:22] QEMU:     #17
0xaaaacc2de3ec in glib_pollfds_poll third_party/qemu/util/main-loop.c:232:9
I0614 13:44:44.641562    2040 bytestream.cc:22] QEMU:     #18
0xaaaacc2de3ec in os_host_main_loop_wait
third_party/qemu/util/main-loop.c:255:5
I0614 13:44:44.641580    2040 bytestream.cc:22] QEMU:     #19
0xaaaacc2de3ec in main_loop_wait third_party/qemu/util/main-loop.c:531:11
I0614 13:44:44.641598    2040 bytestream.cc:22] QEMU:     #20
0xaaaacbd82798 in qemu_main_loop third_party/qemu/softmmu/runstate.c:727:9
I0614 13:44:44.641612    2040 bytestream.cc:22] QEMU:     #21
0xaaaacadacb5c in main

Patrick

--00000000000062b58205e17f3785
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey - I wanted to ask if someone else has seen this or has=
 suggestions on how to fix it in libslirp=C2=A0/ qemu.<div><br></div><div>l=
ibslirp=C2=A0version:=C2=A0<span style=3D"color:rgb(0,136,0);font-family:mo=
nospace;font-size:medium;white-space:pre">3ad1710a96678fe79066b1469cead4058=
713a1d9</span></div><div><font color=3D"#008800" face=3D"monospace" size=3D=
"3"><span style=3D"white-space:pre"><br></span></font></div><div><font colo=
r=3D"#008800" face=3D"monospace" size=3D"3"><span style=3D"white-space:pre"=
>The blow is line: </span></font><a href=3D"https://gitlab.freedesktop.org/=
slirp/libslirp/-/blob/master/src/tcp_input.c#L310">https://gitlab.freedeskt=
op.org/slirp/libslirp/-/blob/master/src/tcp_input.c#L310</a><font color=3D"=
#008800" face=3D"monospace" size=3D"3"><span style=3D"white-space:pre"><br>=
</span></font><div><br></div><div><span style=3D"color:rgb(32,33,36);font-f=
amily:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.=
185714px">I0614 13:44:44.304087 =C2=A0 =C2=A02040 bytestream.cc:22] QEMU: t=
hird_party/libslirp/src/tcp_input.c:310:56: runtime error: member access wi=
thin misaligned address 0xffff9a4000f4 for type &#39;struct qlink&#39;, whi=
ch requires 8 byte alignment</span><br style=3D"color:rgb(32,33,36);font-fa=
mily:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.1=
85714px"><span style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAnd=
Mozilla,monospace;font-size:13px;letter-spacing:0.185714px">I0614 13:44:44.=
304156 =C2=A0 =C2=A02040 bytestream.cc:22] QEMU: 0xffff9a4000f4: note: poin=
ter points here</span><br style=3D"color:rgb(32,33,36);font-family:WorkArou=
ndWebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.185714px"><spa=
n style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,monos=
pace;font-size:13px;letter-spacing:0.185714px">I0614 13:44:44.304184 =C2=A0=
 =C2=A02040 bytestream.cc:22] QEMU: =C2=A0 00 00 00 00 00 00 00 02 =C2=A020=
 02 0a 00 00 01 42 01 =C2=A00a 00 02 02 42 01 0a 00 =C2=A000 01 86 dd 60 02=
 dd 79</span><br style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitA=
ndMozilla,monospace;font-size:13px;letter-spacing:0.185714px"><span style=
=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,monospace;fo=
nt-size:13px;letter-spacing:0.185714px">I0614 13:44:44.304204 =C2=A0 =C2=A0=
2040 bytestream.cc:22] QEMU: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^</span><br style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAn=
dMozilla,monospace;font-size:13px;letter-spacing:0.185714px"><span style=3D=
"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,monospace;font-=
size:13px;letter-spacing:0.185714px">I0614 13:44:44.641173 =C2=A0 =C2=A0204=
0 bytestream.cc:22] QEMU: =C2=A0 =C2=A0 #0 0xaaaacbe34bd8 in tcp_input thir=
d_party/libslirp/src/tcp_input.c:310:56</span><br style=3D"color:rgb(32,33,=
36);font-family:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-=
spacing:0.185714px"><span style=3D"color:rgb(32,33,36);font-family:WorkArou=
ndWebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.185714px">I061=
4 13:44:44.641239 =C2=A0 =C2=A02040 bytestream.cc:22] QEMU: =C2=A0 =C2=A0 #=
1 0xaaaacbe22a94 in ip6_input third_party/libslirp/src/ip6_input.c:74:9</sp=
an><br style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,=
monospace;font-size:13px;letter-spacing:0.185714px"><span style=3D"color:rg=
b(32,33,36);font-family:WorkAroundWebKitAndMozilla,monospace;font-size:13px=
;letter-spacing:0.185714px">I0614 13:44:44.641262 =C2=A0 =C2=A02040 bytestr=
eam.cc:22] QEMU: =C2=A0 =C2=A0 #2 0xaaaacbe0bbbc in slirp_input third_party=
/libslirp/src/slirp.c:1169:13</span><br style=3D"color:rgb(32,33,36);font-f=
amily:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.=
185714px"><span style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAn=
dMozilla,monospace;font-size:13px;letter-spacing:0.185714px">I0614 13:44:44=
.641280 =C2=A0 =C2=A02040 bytestream.cc:22] QEMU: =C2=A0 =C2=A0 #3 0xaaaacb=
d55f6c in net_slirp_receive third_party/qemu/net/slirp.c:136:5</span><br st=
yle=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,monospace=
;font-size:13px;letter-spacing:0.185714px"><span style=3D"color:rgb(32,33,3=
6);font-family:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-s=
pacing:0.185714px">I0614 13:44:44.641296 =C2=A0 =C2=A02040 bytestream.cc:22=
] QEMU: =C2=A0 =C2=A0 #4 0xaaaacbd4e77c in nc_sendv_compat third_party/qemu=
/net/net.c</span><br style=3D"color:rgb(32,33,36);font-family:WorkAroundWeb=
KitAndMozilla,monospace;font-size:13px;letter-spacing:0.185714px"><span sty=
le=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,monospace;=
font-size:13px;letter-spacing:0.185714px">I0614 13:44:44.641323 =C2=A0 =C2=
=A02040 bytestream.cc:22] QEMU: =C2=A0 =C2=A0 #5 0xaaaacbd4e77c in qemu_del=
iver_packet_iov third_party/qemu/net/net.c:850:15</span><br style=3D"color:=
rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,monospace;font-size:13=
px;letter-spacing:0.185714px"><span style=3D"color:rgb(32,33,36);font-famil=
y:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.1857=
14px">I0614 13:44:44.641342 =C2=A0 =C2=A02040 bytestream.cc:22] QEMU: =C2=
=A0 =C2=A0 #6 0xaaaacbd50bfc in qemu_net_queue_deliver_iov third_party/qemu=
/net/queue.c:179:11</span><br style=3D"color:rgb(32,33,36);font-family:Work=
AroundWebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.185714px">=
<span style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,m=
onospace;font-size:13px;letter-spacing:0.185714px">I0614 13:44:44.641359 =
=C2=A0 =C2=A02040 bytestream.cc:22] QEMU: =C2=A0 =C2=A0 #7 0xaaaacbd50bfc i=
n qemu_net_queue_send_iov third_party/qemu/net/queue.c:246:11</span><br sty=
le=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,monospace;=
font-size:13px;letter-spacing:0.185714px"><span style=3D"color:rgb(32,33,36=
);font-family:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-sp=
acing:0.185714px">I0614 13:44:44.641382 =C2=A0 =C2=A02040 bytestream.cc:22]=
 QEMU: =C2=A0 =C2=A0 #8 0xaaaacbd4a88c in qemu_sendv_packet_async third_par=
ty/qemu/net/net.c:891:12</span><br style=3D"color:rgb(32,33,36);font-family=
:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.18571=
4px"><span style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozi=
lla,monospace;font-size:13px;letter-spacing:0.185714px">I0614 13:44:44.6413=
96 =C2=A0 =C2=A02040 bytestream.cc:22] QEMU: =C2=A0 =C2=A0 #9 0xaaaacacb1de=
0 in virtio_net_flush_tx third_party/qemu/hw/net/virtio-net.c:2586:15</span=
><br style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,mo=
nospace;font-size:13px;letter-spacing:0.185714px"><span style=3D"color:rgb(=
32,33,36);font-family:WorkAroundWebKitAndMozilla,monospace;font-size:13px;l=
etter-spacing:0.185714px">I0614 13:44:44.641416 =C2=A0 =C2=A02040 bytestrea=
m.cc:22] QEMU: =C2=A0 =C2=A0 #10 0xaaaacacb1580 in virtio_net_tx_bh third_p=
arty/qemu/hw/net/virtio-net.c:2703:11</span><br style=3D"color:rgb(32,33,36=
);font-family:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-sp=
acing:0.185714px"><span style=3D"color:rgb(32,33,36);font-family:WorkAround=
WebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.185714px">I0614 =
13:44:44.641438 =C2=A0 =C2=A02040 bytestream.cc:22] QEMU: =C2=A0 =C2=A0 #11=
 0xaaaacc2bcf64 in aio_bh_call third_party/qemu/util/async.c:142:5</span><b=
r style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,monos=
pace;font-size:13px;letter-spacing:0.185714px"><span style=3D"color:rgb(32,=
33,36);font-family:WorkAroundWebKitAndMozilla,monospace;font-size:13px;lett=
er-spacing:0.185714px">I0614 13:44:44.641463 =C2=A0 =C2=A02040 bytestream.c=
c:22] QEMU: =C2=A0 =C2=A0 #12 0xaaaacc2bcf64 in aio_bh_poll third_party/qem=
u/util/async.c:170:13</span><br style=3D"color:rgb(32,33,36);font-family:Wo=
rkAroundWebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.185714px=
"><span style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla=
,monospace;font-size:13px;letter-spacing:0.185714px">I0614 13:44:44.641477 =
=C2=A0 =C2=A02040 bytestream.cc:22] QEMU: =C2=A0 =C2=A0 #13 0xaaaacc2b8f70 =
in aio_dispatch third_party/qemu/util/aio-posix.c:420:5</span><br style=3D"=
color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,monospace;font-s=
ize:13px;letter-spacing:0.185714px"><span style=3D"color:rgb(32,33,36);font=
-family:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-spacing:=
0.185714px">I0614 13:44:44.641495 =C2=A0 =C2=A02040 bytestream.cc:22] QEMU:=
 =C2=A0 =C2=A0 #14 0xaaaacc2bf120 in aio_ctx_dispatch third_party/qemu/util=
/async.c:312:5</span><br style=3D"color:rgb(32,33,36);font-family:WorkAroun=
dWebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.185714px"><span=
 style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,monosp=
ace;font-size:13px;letter-spacing:0.185714px">I0614 13:44:44.641510 =C2=A0 =
=C2=A02040 bytestream.cc:22] QEMU: =C2=A0 =C2=A0 #15 0xaaaacc3a7690 in g_ma=
in_dispatch third_party/glib/glib/gmain.c:3417:27</span><br style=3D"color:=
rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,monospace;font-size:13=
px;letter-spacing:0.185714px"><span style=3D"color:rgb(32,33,36);font-famil=
y:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.1857=
14px">I0614 13:44:44.641525 =C2=A0 =C2=A02040 bytestream.cc:22] QEMU: =C2=
=A0 =C2=A0 #16 0xaaaacc3a7690 in g_main_context_dispatch third_party/glib/g=
lib/gmain.c:4135:7</span><br style=3D"color:rgb(32,33,36);font-family:WorkA=
roundWebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.185714px"><=
span style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,mo=
nospace;font-size:13px;letter-spacing:0.185714px">I0614 13:44:44.641546 =C2=
=A0 =C2=A02040 bytestream.cc:22] QEMU: =C2=A0 =C2=A0 #17 0xaaaacc2de3ec in =
glib_pollfds_poll third_party/qemu/util/main-loop.c:232:9</span><br style=
=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,monospace;fo=
nt-size:13px;letter-spacing:0.185714px"><span style=3D"color:rgb(32,33,36);=
font-family:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-spac=
ing:0.185714px">I0614 13:44:44.641562 =C2=A0 =C2=A02040 bytestream.cc:22] Q=
EMU: =C2=A0 =C2=A0 #18 0xaaaacc2de3ec in os_host_main_loop_wait third_party=
/qemu/util/main-loop.c:255:5</span><br style=3D"color:rgb(32,33,36);font-fa=
mily:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.1=
85714px"><span style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAnd=
Mozilla,monospace;font-size:13px;letter-spacing:0.185714px">I0614 13:44:44.=
641580 =C2=A0 =C2=A02040 bytestream.cc:22] QEMU: =C2=A0 =C2=A0 #19 0xaaaacc=
2de3ec in main_loop_wait third_party/qemu/util/main-loop.c:531:11</span><br=
 style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,monosp=
ace;font-size:13px;letter-spacing:0.185714px"><span style=3D"color:rgb(32,3=
3,36);font-family:WorkAroundWebKitAndMozilla,monospace;font-size:13px;lette=
r-spacing:0.185714px">I0614 13:44:44.641598 =C2=A0 =C2=A02040 bytestream.cc=
:22] QEMU: =C2=A0 =C2=A0 #20 0xaaaacbd82798 in qemu_main_loop third_party/q=
emu/softmmu/runstate.c:727:9</span><br style=3D"color:rgb(32,33,36);font-fa=
mily:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.1=
85714px"><span style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAnd=
Mozilla,monospace;font-size:13px;letter-spacing:0.185714px">I0614 13:44:44.=
641612 =C2=A0 =C2=A02040 bytestream.cc:22] QEMU: =C2=A0 =C2=A0 #21 0xaaaaca=
dacb5c in main</span><br></div><div><span style=3D"color:rgb(32,33,36);font=
-family:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-spacing:=
0.185714px"><br></span></div><div><span style=3D"color:rgb(32,33,36);font-f=
amily:WorkAroundWebKitAndMozilla,monospace;font-size:13px;letter-spacing:0.=
185714px">Patrick</span></div></div></div>

--00000000000062b58205e17f3785--

