Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E81059A287
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 18:39:43 +0200 (CEST)
Received: from localhost ([::1]:51810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP526-0003Xq-Cn
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 12:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oP4zx-0002BG-Kp
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:37:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oP4zu-0006jE-KV
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660927045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=MJTxDE3h9mexLATWeJiKluDv1BLvHAWVxdvTEXkKIbM=;
 b=eccyP4DHlP5LHklRIXEOFMfBQv5H60NwM7ZD+63UZA9gIauvpOJGZoJOsvI5FQAm21J8WJ
 VMKD1/KVoJmZnqC2pIJJuxFv7hysdFsRdKFtfPb3/L5Sqm12KhBlmD6R+gn/PCGtSE/stv
 JouT9a229SelXxvMYJAEWcjhLwvHyMk=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-549-6z1dWobpOXOAsl6T2DhLMQ-1; Fri, 19 Aug 2022 12:37:24 -0400
X-MC-Unique: 6z1dWobpOXOAsl6T2DhLMQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 e25-20020ab031d9000000b0038c6145e078so963703uan.10
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 09:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=MJTxDE3h9mexLATWeJiKluDv1BLvHAWVxdvTEXkKIbM=;
 b=6zVzR/+/eDGOddJ4cmk7kNIs49++zCoqfJ2jRsW42uPrrOc07OnNVC8eqo+JK+AGcK
 RxaG95QpFOAJBMzPec+XVpZfddXaKbbe9BChJgXbw4I049To8PrkpfwFsnxwxTrB/PAt
 +nx8n3hP126qarmjXZuLAZ5hgCXCmn1rvrz6iovepqYp3yklJJQYbm+aaAw9sIAYKl2p
 4esF3ZJBe+FuDiHSSGJFhvx2D2NyqhC9bk56HfxugXybAiN+6Rb5kP4tdh1bBMwuTyPY
 zzQWR34W266R7x8i2/75xkiBsO5NWMTK/QVELSMRDoQ6uh8JLmrACIrjEx6C+RmN4iIE
 Sxjg==
X-Gm-Message-State: ACgBeo1Hr6OYgb0xBcOKmQkcXgKc1KUFoMBoOqXRjddIMxjavA3UrXsC
 /WEClRPccUZvXXGvOjWpceaSNoiRKsHCiuqRdlZCSB74gYTU6mQgSXPXDMUO5YBwXKBRGXFT1x3
 DO5TaOHBJZi0BzNRTn0x+ba8whXqZAco=
X-Received: by 2002:a05:6102:321c:b0:390:217d:df6d with SMTP id
 r28-20020a056102321c00b00390217ddf6dmr1488750vsf.35.1660927043770; 
 Fri, 19 Aug 2022 09:37:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6n4pQOg19wiN69AiuiyH4lmiYCkXBS1Kl4uHNZs496lse5E8DGpBIC/FUKZyqNzP4byV4yv/UlbpcXiOvyY50=
X-Received: by 2002:a05:6102:321c:b0:390:217d:df6d with SMTP id
 r28-20020a056102321c00b00390217ddf6dmr1488739vsf.35.1660927043413; Fri, 19
 Aug 2022 09:37:23 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Fri, 19 Aug 2022 12:37:12 -0400
Message-ID: <CAFn=p-ZaZXKkE57ktFENxhxVLjd3k1Ea9SPpiPZxX4P8kpOoTQ@mail.gmail.com>
Subject: Python test QMP Server implementation / version reply
To: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006bbcbf05e69ab612"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000006bbcbf05e69ab612
Content-Type: text/plain; charset="UTF-8"

Hi Eric:

Once upon a time I mentioned writing a QMP server implementation in Python.
Now that the dust of the fork has (mostly) settled, I've rebased and
uploaded that WIP here:

https://gitlab.com/jsnow/python-qemu-qmp/-/commits/create_server/

Tracking issue: https://gitlab.com/qemu-project/python-qemu-qmp/-/issues/2

It's still in prototype shape, but mostly works (Except the OOB support
...!). I wanted to ask again what you thought about what the version reply
ought to be for this test appliance.

I assume that it will be most helpful if the programmer can set their own
version reply, but it should likely have a default that indicates that it's
the qemu.qmp test server and what version it is. I want to ensure that the
reply is aligned with the QMP spec, but the spec is a little fuzzy on what
the requirements for the version reply are. (I can't find our previous
discussion on the topic right now, but I know it was discussed.)

My intended use case for this appliance is for unit testing the QMP library
itself without relying on QEMU, but it may have other uses for testing
other things, too.

Thanks,
--js

--0000000000006bbcbf05e69ab612
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Eric:<div dir=3D"auto"><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Once upon a time I mentioned writing a QMP server implementa=
tion in Python. Now that the dust of the fork has (mostly) settled, I&#39;v=
e rebased and uploaded that WIP here:</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><a href=3D"https://gitlab.com/jsnow/python-qemu-qmp/-/commits=
/create_server/" target=3D"_blank" rel=3D"noreferrer">https://gitlab.com/js=
now/python-qemu-qmp/-/commits/create_server/</a><br></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Tracking issue:=C2=A0<a href=3D"https://gitlab=
.com/qemu-project/python-qemu-qmp/-/issues/2" target=3D"_blank" rel=3D"nore=
ferrer">https://gitlab.com/qemu-project/python-qemu-qmp/-/issues/2</a></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s still in prototype =
shape, but mostly works (Except the OOB support ...!). I wanted to ask agai=
n what you thought about what the version reply ought to be for this test a=
ppliance.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I assume that =
it will be most helpful if the programmer can set their own version reply, =
but it should likely have a default that indicates that it&#39;s the qemu.q=
mp test server and what version it is. I want to ensure that the reply is a=
ligned with the QMP spec, but the spec is a little fuzzy on what the requir=
ements for the version reply are. (I can&#39;t find our previous discussion=
 on the topic right now, but I know it was discussed.)</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">My intended use case for this appliance is f=
or unit testing the QMP library itself without relying on QEMU, but it may =
have other uses for testing other things, too.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">--js</div><div dir=3D=
"auto"><br></div></div></div>

--0000000000006bbcbf05e69ab612--


