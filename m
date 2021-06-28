Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4603B66FE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:50:19 +0200 (CEST)
Received: from localhost ([::1]:35222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxuSg-0003sl-3k
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lxuRM-0002i2-8R
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:48:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lxuRI-0001t7-4Y
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624898931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wtv+1jOTLA1rUD1PdAxSkYiwMgEWWZCu3V8KFjGbwWc=;
 b=Chq8XN9BTCbkWCc4Llrum+IDd3s0sTxpVaaZDv9mb1s7UHCwGy04t3gOvUuzWAYeqafRUr
 eszXXqIaYQskROvd34FKRTetkjlNwaQcKtNe2WJ2lopx3R6Nqtxfp3EnKHlGoRy4N0QK8C
 U6zFS2WTNDDeTAefIpiBZtXqkqLkaBA=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-D5Q4bSOHO5KxFVRV_a-7PQ-1; Mon, 28 Jun 2021 12:48:49 -0400
X-MC-Unique: D5Q4bSOHO5KxFVRV_a-7PQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 k11-20020a056830242bb0290400324955afso13506686ots.14
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wtv+1jOTLA1rUD1PdAxSkYiwMgEWWZCu3V8KFjGbwWc=;
 b=HT9xdknONrDZ18sV8x7Eyi89s4Y9rZjeC/MfwLDufIgDDsH3OJWie9AsJM1PwAOd0n
 e8YMyHeM0899S43DZBAk7mawbnukQga0WNmKw9QSXiLxiHf+stVnlMLT5p1SWneqvxac
 eqDPWw8d3IXWiZFOk1h5S4ppYePk2tzt4ei09STyx9sTV/AXmL66MNVlLzZ7YvnUS3Pm
 03wlAzXfOv/dcsaPqQJZH7lRITxG38puBA8KyLu60SnfZMb23tx5Wa77Gg7oBJJSTl5k
 x1HXCURkYdAqj6/HQP5KZtCJiCiCGXgZJzNBmDqfndi7ASVrYPTwyzLQRfS+jmY+GWaw
 lcrQ==
X-Gm-Message-State: AOAM532c0X1Hp41plWtftBD3EoAlbaoyUbM1IiSdzBj11w6iLj9i5fkF
 PotFzutW8FOkVlPuCcawsXz+Flw6afmTP3sBnlRERkAimA7HqJwLY4ZC/QwK6+Ic/iH+7IOArYw
 DaL77Y1ZbV2UXfLrxt9mFmJXtHme3Kgc=
X-Received: by 2002:a9d:20a2:: with SMTP id x31mr397638ota.263.1624898928501; 
 Mon, 28 Jun 2021 09:48:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYweseqT2tQIuQ6FJ2Gjp+Uf+qMiRl+JP2gQWS/HdvciPqAWuLoAun8ISQZtLY+T5qkAeiGGyaCtIvN+f8VTo=
X-Received: by 2002:a9d:20a2:: with SMTP id x31mr397610ota.263.1624898928322; 
 Mon, 28 Jun 2021 09:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210628123150.56567-1-eesposit@redhat.com>
In-Reply-To: <20210628123150.56567-1-eesposit@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 28 Jun 2021 12:48:37 -0400
Message-ID: <CAFn=p-ZS3TO6rPAGxS3o7HMXtuOV-2ptwRBhRhQY3Pm4UKZ1Tg@mail.gmail.com>
Subject: Re: [PATCH v7 00/16] qemu_iotests: improve debugging options
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006b3b8d05c5d643c9"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006b3b8d05c5d643c9
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 8:32 AM Emanuele Giuseppe Esposito <
eesposit@redhat.com> wrote:

> This series adds the option to attach gdbserver and valgrind
> to the QEMU binary running in qemu_iotests.
> It also allows to redirect QEMU binaries output of the python tests
> to the stdout, instead of a log file.
>
> Patches 1-9 introduce the -gdb option to both python and bash tests,
> 10-14 extend the already existing -valgrind flag to work also on
> python tests, and patch 15-16 introduces -p to enable logging to stdout.
>
> In particular, patches 1,6,11 focus on extending the QMP socket timers
> when using gdb/valgrind, otherwise the python tests will fail due to
> delays in the QMP responses.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>

Don't forget that you have my Acked-By on patches 1-3, I'm content with a
Block maintainer staging this entire series.

--js


> ---
> v7:
> * While using debugging tests with gdb, I found out that there is a
>   timer also in bash scripts (common.qemu). Modify patch 8 to remove
>   the timer when gdb is used.
>
> Emanuele Giuseppe Esposito (15):
>   python: qemu: add timer parameter for qmp.accept socket
>   python: qemu: pass the wrapper field from QEMUQtestmachine to
>     QEMUMachine
>   docs/devel/testing: add debug section to the QEMU iotests chapter
>   qemu-iotests: add option to attach gdbserver
>   qemu-iotests: delay QMP socket timers
>   qemu_iotests: insert gdbserver command line as wrapper for qemu binary
>   qemu-iotests: add gdbserver option to script tests too
>   docs/devel/testing: add -gdb option to the debugging section of QEMU
>     iotests
>   qemu-iotests: extend the check script to prepare supporting valgrind
>     for python tests
>   qemu-iotests: extend QMP socket timeout when using valgrind
>   qemu-iotests: allow valgrind to read/delete the generated log file
>   qemu-iotests: insert valgrind command line as wrapper for qemu binary
>   docs/devel/testing: add -valgrind option to the debug section of QEMU
>     iotests
>   qemu-iotests: add option to show qemu binary logs on stdout
>   docs/devel/testing: add -p option to the debug section of QEMU iotests
>
> John Snow (1):
>   python: Reduce strictness of pylint's duplicate-code check
>
>  docs/devel/testing.rst         | 30 +++++++++++++++++++++
>  python/qemu/machine/machine.py | 16 +++++++----
>  python/qemu/machine/qtest.py   |  9 ++++---
>  python/setup.cfg               |  5 ++++
>  tests/qemu-iotests/check       | 15 ++++++++---
>  tests/qemu-iotests/common.qemu |  7 ++++-
>  tests/qemu-iotests/common.rc   |  8 +++++-
>  tests/qemu-iotests/iotests.py  | 49 ++++++++++++++++++++++++++++++++--
>  tests/qemu-iotests/testenv.py  | 23 ++++++++++++++--
>  9 files changed, 144 insertions(+), 18 deletions(-)
>
> --
> 2.31.1
>
>

--0000000000006b3b8d05c5d643c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 28, 2021 at 8:32 AM Emanu=
ele Giuseppe Esposito &lt;<a href=3D"mailto:eesposit@redhat.com">eesposit@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">This series adds the option to attach gdbserver and valgrind<br>
to the QEMU binary running in qemu_iotests.<br>
It also allows to redirect QEMU binaries output of the python tests<br>
to the stdout, instead of a log file.<br>
<br>
Patches 1-9 introduce the -gdb option to both python and bash tests, <br>
10-14 extend the already existing -valgrind flag to work also on <br>
python tests, and patch 15-16 introduces -p to enable logging to stdout.<br=
>
<br>
In particular, patches 1,6,11 focus on extending the QMP socket timers<br>
when using gdb/valgrind, otherwise the python tests will fail due to<br>
delays in the QMP responses.<br>
<br>
Signed-off-by: Emanuele Giuseppe Esposito &lt;<a href=3D"mailto:eesposit@re=
dhat.com" target=3D"_blank">eesposit@redhat.com</a>&gt;<br></blockquote><di=
v><br></div><div>Don&#39;t forget that you have my Acked-By on patches 1-3,=
 I&#39;m content with a Block maintainer staging this entire series.</div><=
div><br></div><div>--js<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
---<br>
v7:<br>
* While using debugging tests with gdb, I found out that there is a<br>
=C2=A0 timer also in bash scripts (common.qemu). Modify patch 8 to remove<b=
r>
=C2=A0 the timer when gdb is used.<br>
<br>
Emanuele Giuseppe Esposito (15):<br>
=C2=A0 python: qemu: add timer parameter for qmp.accept socket<br>
=C2=A0 python: qemu: pass the wrapper field from QEMUQtestmachine to<br>
=C2=A0 =C2=A0 QEMUMachine<br>
=C2=A0 docs/devel/testing: add debug section to the QEMU iotests chapter<br=
>
=C2=A0 qemu-iotests: add option to attach gdbserver<br>
=C2=A0 qemu-iotests: delay QMP socket timers<br>
=C2=A0 qemu_iotests: insert gdbserver command line as wrapper for qemu bina=
ry<br>
=C2=A0 qemu-iotests: add gdbserver option to script tests too<br>
=C2=A0 docs/devel/testing: add -gdb option to the debugging section of QEMU=
<br>
=C2=A0 =C2=A0 iotests<br>
=C2=A0 qemu-iotests: extend the check script to prepare supporting valgrind=
<br>
=C2=A0 =C2=A0 for python tests<br>
=C2=A0 qemu-iotests: extend QMP socket timeout when using valgrind<br>
=C2=A0 qemu-iotests: allow valgrind to read/delete the generated log file<b=
r>
=C2=A0 qemu-iotests: insert valgrind command line as wrapper for qemu binar=
y<br>
=C2=A0 docs/devel/testing: add -valgrind option to the debug section of QEM=
U<br>
=C2=A0 =C2=A0 iotests<br>
=C2=A0 qemu-iotests: add option to show qemu binary logs on stdout<br>
=C2=A0 docs/devel/testing: add -p option to the debug section of QEMU iotes=
ts<br>
<br>
John Snow (1):<br>
=C2=A0 python: Reduce strictness of pylint&#39;s duplicate-code check<br>
<br>
=C2=A0docs/devel/testing.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 30 ++++++++=
+++++++++++++<br>
=C2=A0python/qemu/machine/machine.py | 16 +++++++----<br>
=C2=A0python/qemu/machine/qtest.py=C2=A0 =C2=A0|=C2=A0 9 ++++---<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 5 ++++<br>
=C2=A0tests/qemu-iotests/check=C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 ++++++++---<b=
r>
=C2=A0tests/qemu-iotests/common.qemu |=C2=A0 7 ++++-<br>
=C2=A0tests/qemu-iotests/common.rc=C2=A0 =C2=A0|=C2=A0 8 +++++-<br>
=C2=A0tests/qemu-iotests/iotests.py=C2=A0 | 49 ++++++++++++++++++++++++++++=
++++--<br>
=C2=A0tests/qemu-iotests/testenv.py=C2=A0 | 23 ++++++++++++++--<br>
=C2=A09 files changed, 144 insertions(+), 18 deletions(-)<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--0000000000006b3b8d05c5d643c9--


