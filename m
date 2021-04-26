Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1536B247
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 13:19:36 +0200 (CEST)
Received: from localhost ([::1]:58938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lazH5-0006hg-AG
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 07:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralph.schmieder@gmail.com>)
 id 1lazCj-0004k2-G2
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 07:15:05 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralph.schmieder@gmail.com>)
 id 1lazCa-0003yA-5B
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 07:15:05 -0400
Received: by mail-ej1-x629.google.com with SMTP id ja3so7943122ejc.9
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 04:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=GTCEGN3nhkiYGfZIHf3vFmRCk2fmoee5kNjg7eFUQkU=;
 b=srJ1ZNN2PBSj3Dt67UpZ7Xa7C6WAtXtU5AerM2YnFmLOhkQZigOxuJHnGMCNhsVFki
 dEvjYhDac9mV/qrXJCU8xrUlrwveeYxYCHfyMZgnIz4jXCiRTfgiMHBAMkS4dVdrRjP+
 t4Si4mfAyo5jV5n/W94tT9lZt2483HCVMd4jI8K/pp5FUvXWnyaxMbBK2evvcc8AoEGj
 c9+6XxI+EOcqih1xLIvybEM3sNcdQUuCTKNESDswqJUC8EVlqnTHefc7ojV09PI7B+8/
 18SApAUemkIaqmZ3whtGU6fuvlyimkO+g822XjxFvs3IvvUKChQmGUYTJT+D/choscLE
 iRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=GTCEGN3nhkiYGfZIHf3vFmRCk2fmoee5kNjg7eFUQkU=;
 b=ZwM8BS/f7nAQx0a9+F5ejZpMpqiVl4SBZ4J2t9YRismGKOORrdvPY+ySEnf7NgujEx
 N5++87vgCRABXB4SeGjDDijDgagKtoiNhHi+ap/BVhiGIVvOAzEA+luKGLrooazo3dBu
 2ntfcF0Ra6eFIOnAHSW4Aas3O4dNiDJIHh6nHWpLnGUnrnSCaog86ebVtKs+v6vvQcA0
 /xsN6lZ+R5fd23ax9Pd2CqZJqWh97OoUhKzx0n5oDePEIfOZNBpcVnfXbOyHTwKlLj+t
 rAzol4UMgGOg3QyX0le6KV+D2yB478kBHTKdheeALv8mRnXWZ63JlNgTT4OUkdzAswl0
 clEw==
X-Gm-Message-State: AOAM532FaIvJkJCbjD7DeBNBpIm2ovKYYtxBgt3dbUfm2NqVKUMrDnQz
 NVwX2/M9yoXL+lmqn6hAsoQ=
X-Google-Smtp-Source: ABdhPJyB0vBtgwCFYUgpaFYPpWx3t6f58mrHknj6tcAjKp7eNvUVOMvNFOatpSGnmzYSEXojK8UR6w==
X-Received: by 2002:a17:906:cb11:: with SMTP id
 lk17mr18185225ejb.517.1619435690109; 
 Mon, 26 Apr 2021 04:14:50 -0700 (PDT)
Received: from ?IPv6:2001:470:1f0b:bcf:fd39:b1d0:730d:5edb?
 ([2001:470:1f0b:bcf:fd39:b1d0:730d:5edb])
 by smtp.gmail.com with ESMTPSA id c12sm15446996edx.54.2021.04.26.04.14.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Apr 2021 04:14:49 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: socket.c added support for unix domain socket datagram transport
From: Ralph Schmieder <ralph.schmieder@gmail.com>
In-Reply-To: <20210423183901.12a71759@redhat.com>
Date: Mon, 26 Apr 2021 13:14:48 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <2DC6F891-4F28-4044-A055-0CDAB45A3C24@gmail.com>
References: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
 <20210423172940.14f48b49@elisabeth>
 <F0191BF0-7C7A-4587-8B94-BACA7E1F911F@gmail.com>
 <20210423183901.12a71759@redhat.com>
To: Stefano Brivio <sbrivio@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=ralph.schmieder@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Apr 23, 2021, at 18:39, Stefano Brivio <sbrivio@redhat.com> wrote:
>=20
> On Fri, 23 Apr 2021 17:48:08 +0200
> Ralph Schmieder <ralph.schmieder@gmail.com> wrote:
>=20
>> Hi, Stefano... Thanks for the detailed response... inline
>> Thanks,
>> -ralph
>>=20
>>=20
>>> On Apr 23, 2021, at 17:29, Stefano Brivio <sbrivio@redhat.com>
>>> wrote:
>>>=20
>>> Hi Ralph,
>>>=20
>>> On Fri, 23 Apr 2021 08:56:48 +0200
>>> Ralph Schmieder <ralph.schmieder@gmail.com> wrote:
>>>=20
>>>> Hey...  new to this list.  I was looking for a way to use Unix
>>>> domain sockets as a network transport between local VMs.
>>>>=20
>>>> I'm part of a team where we run dozens if not hundreds of VMs on a
>>>> single compute instance which are highly interconnected.
>>>>=20
>>>> In the current implementation, I use UDP sockets (e.g. something
>>>> like=20
>>>>=20
>>>> -netdev
>>>> id=3Dbla,type=3Dsocket,udp=3Dlocalhost:1234,localaddr=3Dlocalhost:567=
8)=20
>>>>=20
>>>> which works great.
>>>>=20
>>>> The downside of this approach is that I need to keep track of all
>>>> the UDP ports in use and that there's a potential for clashes.
>>>> Clearly, having Unix domain sockets where I could store the
>>>> sockets in the VM's directory would be much easier to manage.
>>>>=20
>>>> However, even though there is some AF_UNIX support in net/socket.c,
>>>> it's
>>>>=20
>>>> - not configurable
>>>> - it doesn't work =20
>>>=20
>>> I hate to say this, but I've been working on something very similar
>>> just in the past days, with the notable difference that I'm using
>>> stream-oriented AF_UNIX sockets instead of datagram-oriented.
>>>=20
>>> I have a similar use case, and after some experiments I picked a
>>> stream-oriented socket over datagram-oriented because:
>>>=20
>>> - overhead appears to be the same
>>>=20
>>> - message boundaries make little sense here -- you already have a
>>> 32-bit vnet header with the message size defining the message
>>> boundaries
>>>=20
>>> - datagram-oriented AF_UNIX sockets are actually reliable and
>>> there's no packet reordering on Linux, but this is not "formally"
>>> guaranteed
>>>=20
>>> - it's helpful for me to know when a qemu instance disconnects for
>>> any reason
>>>=20
>>=20
>> IMO, dgram is the right tool for this as it is symmetrical to using a
>> UDP transport... Since I need to pick up those packets from outside
>> of Qemu (inside of a custom networking fabric) I'd have to make
>> assumptions about the data and don't know the length of the packet in
>> advance.
>=20
> Okay, so it doesn't seem to fit your case, but this specific point is
> where you actually have a small advantage using a stream-oriented
> socket. If you receive a packet and have a smaller receive buffer, you
> can read the length of the packet from the vnet header and then read
> the rest of the packet at a later time.
>=20
> With a datagram-oriented socket, you would need to know the maximum
> packet size in advance, and use a receive buffer that's large enough =
to
> contain it, because if you don't, you'll discard data.

For me, the maximum packet size is a jumbo frame (e.g. 9x1024) anyway -- =
everything must fit into an atomic write of that size.

>=20
> The same reasoning applies to a receive buffer that's larger than the
> maximum packet size you can get -- you can then read multiple packets =
at
> a time, filling your buffer, partially reading a packet at the end of
> it, and reading the rest later.
>=20
> With a datagram-oriented socket you need to resort to recvmmsg() to
> receive multiple packets with one syscall (nothing against it, it's
> just slightly more tedious).
>=20
>> Using the datagram approach fits nicely into this concept.
>> So, yes, in my instance the transport IS truly connectionless and VMs
>> just keep sending packets if the fabric isn't there or doesn't pick
>> up their packets.
>=20
> I see, in that case I guess you really need a datagram-oriented
> socket... even though what happens with my patch (just like with the
> existing TCP support) is that your fabric would need to be there when
> qemu starts, but if it disappears later, qemu will simply close the
> socket. Indeed, it's not "hotplug", which is probably what you need.

That's the point.  This is peer-to-peer/point-to-point and not =
client/server.

>=20
>> And maybe there's use for both, as there's currently already support
>> for connection oriented (TCP) and connectionless (UDP) inet
>> transports.=20
>=20
> Yes, I think so.
>=20
>>>> As a side note, I tried to pass in an already open FD, but that
>>>> didn't work either. =20
>>>=20
>>> This actually worked for me as a quick work-around, either with:
>>> 	https://github.com/StevenVanAcker/udstools
>>>=20
>>> or with a trivial C implementation of that, that does essentially:
>>>=20
>>> 	fd =3D strtol(argv[1], NULL, 0);
>>> 	if (fd < 3 || fd > INT_MAX || errno)
>>> 		usage(argv[0]);
>>>=20
>>> 	s =3D socket(AF_UNIX, SOCK_STREAM, 0);
>>> 	if (s < 0) {
>>> 		perror("socket");
>>> 		exit(EXIT_FAILURE);
>>> 	}
>>>=20
>>> 	if (connect(s, (const struct sockaddr *)&addr, sizeof(addr)) < =
0) {
>>> 		perror("connect");
>>> 		exit(EXIT_FAILURE);
>>> 	}
>>>=20
>>> 	if (dup2(s, (int)fd) < 0) {
>>> 		perror("dup");
>>> 		exit(EXIT_FAILURE);
>>> 	}
>>>=20
>>> 	close(s);
>>>=20
>>> 	execvp(argv[2], argv + 2);
>>> 	perror("execvp");
>>>=20
>>> where argv[1] is the socket number you pass in the qemu command line
>>> (-net socket,fd=3DX) and argv[2] is the path to qemu.
>>=20
>> As I was looking for dgram support I didn't even try with a stream
>> socket ;)
>=20
> Mind that it also works with a SOCK_DGRAM ;) ...that was my original
> attempt, actually.
>=20
>>>> So, I added some code which does work for me... e.g.
>>>>=20
>>>> - can specify the socket paths like -netdev
>>>> id=3Dbla,type=3Dsocket,unix=3D/tmp/in:/tmp/out
>>>> - it does forward packets between two Qemu instances running
>>>> back-to-back
>>>>=20
>>>> I'm wondering if this is of interest for the wider community and,
>>>> if so, how to proceed.
>>>>=20
>>>> Thanks,
>>>> -ralph
>>>>=20
>>>> Commit
>>>> =
https://github.com/rschmied/qemu/commit/73f02114e718ec898c7cd8e855d0d5d5d7=
abe362
>>>>=20
>>>=20
>>> I think your patch could be a bit simpler, as you could mostly reuse
>>> net_socket_udp_init() for your initialisation, and perhaps rename
>>> it to net_socket_dgram_init(). =20
>>=20
>> Thanks... I agree that my code can likely be shortened... it was just
>> a PoC that I cobbled together yesterday and it still has a lot of
>> to-be-removed lines.
>=20
> I'm not sure if it helps, but I guess you could "conceptually" recycle
> my patch and in some sense "extend" the UDP parts to a generic =
datagram
> interface, just like mine extends the TCP implementation to a generic
> stream interface.
>=20
> About command line and documentation, I guess it's clear that
> "connect=3D" implies something stream-oriented, so I would prefer to
> leave it like that for a stream-oriented AF_UNIX socket -- it behaves
> just like TCP.
>=20
> On the other hand, you can't recycle the current UDP "mcast=3D" stuff
> because it's not multicast (AF_UNIX multicast support for Linux was
> proposed some years ago, https://lwn.net/Articles/482523/, but not
> merged), and of course not "udp=3D"... would "unix_dgram=3D" make =
sense
> to you?
>=20
> On a side note, I wonder why you need two named sockets instead of
> one -- I mean, they're bidirectional...


Hmm... each peer needs to send unsolicited frames/packets to the other =
end... and thus needs to bind to their socket.  Pretty much for the same =
reason as the UDP transport requires you to specify a local and a remote =
5-tuple.  Even though for AF_INET, the local port does not have to be =
specified, the OS would assign an ephemeral port to make it unique. Am I =
missing something?

Another thing: on Windows, there's a AF_UNIX/SOCK_STREAM =
implementation... So, technically it should be possible to use that code =
path on Windows, too.  Not a windows guy, though... So, can't say =
whether it would simply work or not:

https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/



>=20
> --=20
> Stefano
>=20


