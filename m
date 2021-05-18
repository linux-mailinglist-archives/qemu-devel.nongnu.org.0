Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD53387A2B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:40:43 +0200 (CEST)
Received: from localhost ([::1]:53850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizxi-0002oi-Gc
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scrameta@googlemail.com>)
 id 1liwRU-0003sh-4p
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:55:13 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <scrameta@googlemail.com>)
 id 1liwRR-00085v-MH
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:55:11 -0400
Received: by mail-ej1-x635.google.com with SMTP id et19so6533947ejc.4
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QVYlsTxQGwPD4KFOdb0oyTd46JzRptwWRHCzXnNQY0A=;
 b=N7jT4JxQabgHnO4p+Y4fGy025DEYpNOeLd5AW0b6wXm9c1LR8IBZUucNGZ+maZfv5X
 N/AyMg/k/Thgx8NP7bOtpKJBrgQQWdTsIZyIxMX8oc0qWA1ZRagN4oxv/uYrzwMeMQaP
 qUrpsqN2AlUmP73xiXmRRP1hsVBJqcn3PRrr57KYKVlvo7J26jcV7QPNK2d4LI6gB+4F
 4/rFZezLpgJW44H6yvlWAQJZxlQb3yi5lVO/ITxFyr6WDB/fMuzBoA/HQnZmI+zHZTaU
 qiWnlnjLlwYSl1qCIB9Ipjj/3fQ3QUoy8VicL96rCaL+jkuRqdwpKFduUqj1tNy6B0qv
 KjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QVYlsTxQGwPD4KFOdb0oyTd46JzRptwWRHCzXnNQY0A=;
 b=TnRpbpE558s2o1qhorVEHvzZy9lsceipbmALEQcyoMQMUvXvvK/igVKygb6AhH70O4
 LJlGx0Fx9Z422IJgBgFLUUjXRJIS6Ysw4C3vUg+6iYSD9XdjOayZX2A0fVEvpX+9W42G
 Rp53CwN1ZbrJ0+4nzJM/XANO+2hvXugjLwNgdfYE2lDCAu/xsBIvzE9dDEIH9jSl4TJl
 P3JH8WaKwud2VNHfbBdwynOuON8l1PZybc/DWORbEFjJiAngMoWE8TWMN9JmwAOxfDsF
 yRsl2k2rIIov7LLc6sep+e9ZtIA+khLVrgItZ+OFnCB293zQHGTSoCeKcQKkx3Lz1EOi
 G8eA==
X-Gm-Message-State: AOAM531eb060LJ9lSDJW+BJeYM5Wq76T6qAe1L1ii6DWikbcn+VwLu4X
 HAS3IAfs4RXlXJRdPGeBT/bcpxLzcHPInbnDeLePtt1Nq8hkiQ==
X-Google-Smtp-Source: ABdhPJwu1ZviXAn/agvUnlBXdvZdRxgTZluw0IDLGUtQc5GZvJBdx7wOsMatB8Ru2v0C7bF6PWFgMbCd7N+ncaEm9So=
X-Received: by 2002:a17:906:15cc:: with SMTP id
 l12mr5130691ejd.104.1621331706722; 
 Tue, 18 May 2021 02:55:06 -0700 (PDT)
MIME-Version: 1.0
From: Mark Watson <scrameta@googlemail.com>
Date: Tue, 18 May 2021 11:54:55 +0200
Message-ID: <CAOG2ctwMt9hpqu425+J5cCR_KCt1d2iSxMcbx6ENB41BNMqZ6g@mail.gmail.com>
Subject: notdirty_write thrashing in simple for loop
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000713f4305c297b471"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=scrameta@googlemail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 May 2021 09:39:06 -0400
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

--000000000000713f4305c297b471
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm trying to implement my own machine for amiga emulation using a software
cpu and fpga hardware. For this I have built my own machine which consists
of a large malloced ram block and some fpga hardware mmapped elsewhere into
the memory space.

I'm using qemu to emulate a 68040 on an arm cortex a9 host in system mode.

It is working, though I'm investigating a strange performance issue.

I'm looking for advice on where to look next in debugging this from the
specialist(s) of accel/tcg/cputlb.c please.

To investigate the performance issue I tried to break it down to the
simplest possible case. I can reproduce it with a simple for loop (compiled
without optimisation).
        for (int i=0;i!=0xffffff;++i)
{
if ((i&0xffff)==0)
{
}
}
Running it in user mode on the same host it takes ~0.6 seconds. In the
built-in 'virtual' m68k machine running linux it takes 1.3 seconds.
However in my machine under amigaos I'm seeing it typically taking 5 and a
half minutes! Occasionally it seems to run at the correct speed of <2
seconds, though I have yet to identify why. These are the logs of the
captured code before it goes into the main chain loop.
qemu_slow_stuck_fragment.log
<http://www.64kib.com/qemu_slow_stuck_fragment.log>
I have verified that this performance change is not due to slow fpga memory
area access, i.e. there are no accesses to that memory region during this.

I took a look in gdb while running this loop to see what is going on.
Initially I was surprised that I didn't find the code in 'OUT:', however I
guess it makes sense that it has to call into the framework for memory
access. I noticed that a lot of calls to glib are made and see
g_tree_lookup called a lot. This is caused by notdirty_write being called
'000s of times and each time going into the page_collection_lock and
tb_invalidate_phys_page_fast. I presume this is happening each time that
"i" is incremented on the stack, which clearly has a huge overhead.

Even being able to get a proper stack trace from gdb would be very helpful
to understand this. I tried to configure qemu with '--enable-debug' but
still do not get a proper stack if i attach to it. I'm not sure if this is
the case due to it running dynamically compiled code before calling into
this.

Thanks,
Mark

--000000000000713f4305c297b471
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m =
trying to implement my own machine for amiga emulation using a software cpu=
 and fpga hardware. For this I have built my own machine which consists of =
a large malloced ram block and some fpga hardware mmapped elsewhere into th=
e memory space.</div><div><br></div><div><div style=3D"color:rgb(0,0,0)">I&=
#39;m using qemu to emulate a 68040 on an arm cortex a9 host in system mode=
.</div></div><div style=3D"color:rgb(0,0,0)"><br></div>It is working, thoug=
h I&#39;m investigating a strange performance issue.<br><br>I&#39;m looking=
 for advice on where to look next in debugging this from the specialist(s) =
of accel/tcg/cputlb.c please.</div><div dir=3D"ltr">=C2=A0=C2=A0<div>To inv=
estigate the=C2=A0performance issue I tried to break it down to the simples=
t possible case. I can reproduce it with a simple for loop (compiled withou=
t optimisation).</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i=3D0;i!=3D=
0xffffff;++i)</div><div><span class=3D"gmail-Apple-tab-span" style=3D"white=
-space:pre">	</span>{</div><div><span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">		</span>if ((i&amp;0xffff)=3D=3D0)</div><div><span cl=
ass=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span>{</div><div=
><span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span>}<=
/div><div><span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	<=
/span>}</div><div>Running it in user mode on the same host it takes ~0.6 se=
conds. In the built-in &#39;virtual&#39; m68k machine running linux it take=
s 1.3 seconds.</div><div>However in my machine under amigaos I&#39;m seeing=
 it typically taking 5 and a half minutes! Occasionally it seems to run at =
the correct speed of &lt;2 seconds,=C2=A0though I have yet to identify why.=
 These are the logs of the captured code before it goes into the main chain=
 loop.</div><div><a href=3D"http://www.64kib.com/qemu_slow_stuck_fragment.l=
og">qemu_slow_stuck_fragment.log</a></div><div>I have verified that this pe=
rformance change is not due to slow fpga memory area access, i.e. there are=
 no=C2=A0accesses to that memory region during this.</div><div><br></div>I =
took a look in gdb while running this loop to see what is going on. Initial=
ly I was surprised that I didn&#39;t find the code in &#39;OUT:&#39;, howev=
er I guess it makes sense that it has to call into the framework for memory=
 access. I noticed that a lot of calls to glib are made and see g_tree_look=
up called a lot. This is caused by notdirty_write being called &#39;000s of=
 times and each time going into the page_collection_lock and tb_invalidate_=
phys_page_fast. I presume this is happening each time that &quot;i&quot; is=
 incremented on the stack, which clearly has a huge overhead.</div><div dir=
=3D"ltr"><br>Even being able to get a proper stack trace from gdb would be =
very helpful to understand this. I tried to configure qemu with &#39;--enab=
le-debug&#39; but still do not get a proper stack if i attach to it. I&#39;=
m not sure if this is the case due to it running dynamically compiled code =
before calling into this.<br><br>Thanks,<div>Mark</div><div></div></div></d=
iv></div></div></div></div></div>

--000000000000713f4305c297b471--

