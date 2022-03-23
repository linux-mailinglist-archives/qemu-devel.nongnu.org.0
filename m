Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74514E5AA6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 22:26:56 +0100 (CET)
Received: from localhost ([::1]:46016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX8VL-0000Nr-NE
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 17:26:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nX8UG-0007r1-SS
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nX8UD-0006xP-SN
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648070744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEG95kjlFzJCEwR6ny5hxy+EaHoVDgAK2gPgtMr/eYU=;
 b=ODPj+oV6Dyr1cUmoJuaBYTPzQwoJvK6ogYK31DSchNHvsX99rtle+n5sFR2ZstWJB5Fjkg
 XxsOmDzbB+WtrPQaXVeFApWWMPWqiiw5B2H2v4FDM98Jc04n5yXIGM4Mo4FAkHEhyFgK8l
 NaGsyJFLUbJgpeZpgmMIPBu18ocVlJk=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642--Em2jvVSPrmc221i3ZHZjw-1; Wed, 23 Mar 2022 17:25:41 -0400
X-MC-Unique: -Em2jvVSPrmc221i3ZHZjw-1
Received: by mail-ua1-f69.google.com with SMTP id
 l6-20020ab04386000000b0034c80915685so797788ual.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 14:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IEG95kjlFzJCEwR6ny5hxy+EaHoVDgAK2gPgtMr/eYU=;
 b=MFs83Jc9Q+Qp960IjPKAneQGxYoZUodSz/nuoDi+HppS7j+xx0HEpymJQD4YveVOU6
 PCdmHxPmjXMJsY75gEYBBiJXYC0wbI8ZMxLtjYrWfQWVrA6KKDkf4yyd7LkMc+CXDT+m
 FUDT6c1vhLEhSHWdacFbS//Gk7XgZdhNyqHdNfUdupMw82CSXJqDTf4V/ItZlFY3ERjm
 qgOinYtqSbCcMk/LblckB0nRe2N2qWLWWNl++3BT9GuWgjRxtw8BWmQeA1lqDGBPlghE
 xvjpNDEhcSViNXmAzleqgKTIDKtbJMOd77XKIW92kNO/2XDuDI28p8BDIWU5dqh6e3Iw
 r6Cg==
X-Gm-Message-State: AOAM532tCKT4KF2Rfqe5S5Nubd0c/zYpL6gAlI6NAhoo/mSeQoc61N4p
 iAnx27uBQTgKeuXUlPppxr3FcdT90dEGiZx6uQfBPcT17tmqIJVpQVOY70bRVXlzJOK0fbVLfbO
 0Ks89UkRWFSi03ZIqi4k2EkPHhEupyPY=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr1169289vst.11.1648070740754; 
 Wed, 23 Mar 2022 14:25:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2fD3bzulcSh20HiLtOf2AIR55H0wzvbT4kwwwfU5Y9I/YV0AaJ+1ETTMLv9uOgXwdhyKGSvj7DKeCGJ+tzHs=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr1169282vst.11.1648070740531; Wed, 23
 Mar 2022 14:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220321210847.914787-1-jsnow@redhat.com>
 <20220321210847.914787-10-jsnow@redhat.com>
 <072109ff-8c30-e1cf-d979-d75c682d5385@redhat.com>
In-Reply-To: <072109ff-8c30-e1cf-d979-d75c682d5385@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 23 Mar 2022 17:25:29 -0400
Message-ID: <CAFn=p-bwXxvZKmJq0A+ca_0JB7+dJ4zcpqmmNUG2JoE8ASN1Bg@mail.gmail.com>
Subject: Re: [PATCH 09/10] python: rename qemu.aqmp to qemu.qmp
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 2:20 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 21.03.22 22:08, John Snow wrote:
> > Now that we are fully switched over to the new QMP library, move it bac=
k
> > over the old namespace. This is being done primarily so that we may
> > upload this package simply as "qemu.qmp" without introducing confusion
> > over whether or not "aqmp" is a new protocol or not.
> >
> > The trade-off is increased confusion inside the QEMU developer
> > tree. Sorry!
> >
> > Note: the 'private' member "_aqmp" in legacy.py also changes to "_qmp";
> > not out of necessity, but just to remove any traces of the "aqmp"
> > name.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Reviewed-by: Beraldo Leal <bleal@redhat.com>
> > ---
>
> I guess this is the one for which I=E2=80=99m CC-ed?

Probably.

>
> [...]
>
> > diff --git a/scripts/render_block_graph.py b/scripts/render_block_graph=
.py
> > index b33fb70d5e..8f731a5cfe 100755
> > --- a/scripts/render_block_graph.py
> > +++ b/scripts/render_block_graph.py
> > @@ -25,8 +25,8 @@
> >   from graphviz import Digraph
> >
> >   sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python=
'))
> > -from qemu.aqmp import QMPError
> > -from qemu.aqmp.legacy import QEMUMonitorProtocol
> > +from qemu.qmp import QMPError
> > +from qemu.qmp.legacy import QEMUMonitorProtocol
> >
> >
> >   def perm(arr):
> > diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simpleben=
ch/bench_block_job.py
> > index af9d1646a4..56191db44b 100755
> > --- a/scripts/simplebench/bench_block_job.py
> > +++ b/scripts/simplebench/bench_block_job.py
> > @@ -27,7 +27,7 @@
> >
> >   sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', '=
python'))
> >   from qemu.machine import QEMUMachine
> > -from qemu.aqmp import ConnectError
> > +from qemu.qmp import ConnectError
> >
> >
> >   def bench_block_job(cmd, cmd_args, qemu_args):
> > diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests=
.py
> > index 8760e2c310..9563749709 100644
> > --- a/tests/qemu-iotests/iotests.py
> > +++ b/tests/qemu-iotests/iotests.py
> > @@ -38,7 +38,7 @@
> >   from contextlib import contextmanager
> >
> >   from qemu.machine import qtest
> > -from qemu.aqmp.legacy import QMPMessage, QEMUMonitorProtocol
> > +from qemu.qmp.legacy import QMPMessage, QEMUMonitorProtocol
>
> (Rebasing will change the order of imports; you fixed the (alphabetic)
> ordering in 2882ccf86a9, now you=E2=80=99re going to have to restore the
> original ordering here :))

I'll probably just fix stuff like this on merge when I go to send my
PR for this. Too fiddly otherwise.

>
> >   # Use this logger for logging messages directly from the iotests modu=
le
> >   logger =3D logging.getLogger('qemu.iotests')
> > diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iot=
ests/tests/mirror-top-perms
> > index 223f3c1620..d538579961 100755
> > --- a/tests/qemu-iotests/tests/mirror-top-perms
> > +++ b/tests/qemu-iotests/tests/mirror-top-perms
> > @@ -99,7 +99,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
> >           self.vm_b.add_device('virtio-blk,drive=3Ddrive0,share-rw=3Don=
')
> >           try:
> >               # Silence AQMP logging errors temporarily.
>
> Probably should just be =E2=80=9CQMP=E2=80=9D now, too.  Anyway:

Yep, oops. I didn't refresh this series as much as I should have. It
was good the last time I checked it, I swear! ... three months ago.

>
> Acked-by: Hanna Reitz <hreitz@redhat.com>

Thanks.

>
> > -            with change_log_level('qemu.aqmp'):
> > +            with change_log_level('qemu.qmp'):
> >                   self.vm_b.launch()
> >                   print('ERROR: VM B launched successfully, '
> >                         'this should not have happened')
>


