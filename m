Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6001B41C733
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:49:25 +0200 (CEST)
Received: from localhost ([::1]:50356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVatg-0004ST-CW
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mVarF-00022A-91
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:46:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mVarC-0001j8-BV
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:46:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632926809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QNiKmsOE1X0vR290YJlatZ79D1I3j1R8rGdIGlTgrbA=;
 b=AlIIO/w6bjasV3iszx+PhQyLirg/VHdtDGT1pC4UDrLye0HuqE8ua9KI2TU++o8H2WaClw
 oIVrDMxoX7DGAgJr8uPZYRu+EQr/KtIXThn9zebzo2EPijKcbXfkQaWPB0cNq3/pQ7fKpD
 HzA80b1FVt5ScMDhbHZB1fRQf7WybiA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-chgMdelwMKOq_Iry5rAFog-1; Wed, 29 Sep 2021 10:46:48 -0400
X-MC-Unique: chgMdelwMKOq_Iry5rAFog-1
Received: by mail-ed1-f72.google.com with SMTP id
 c7-20020a05640227c700b003d27f41f1d4so2638172ede.16
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 07:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QNiKmsOE1X0vR290YJlatZ79D1I3j1R8rGdIGlTgrbA=;
 b=IHirCgFLQ1Voe8QUd6lK/Kh7LS1AnTSTokhbZomDAa5LdkvsznVQ3+1F1kE8gjPo/+
 uWL/HpvS25gzft5Fd0eHai7VBnFrbXYn35xumlcxBjt6OWyrUO07p3kW8LnAiWqY31o0
 pmRs/D7qp1Pjg3ewp7OzdS5ZAZgA2VoHwZ3URr3S0NfuSny12UFE8dGVXBFxkv+lNxQa
 +M4UdWS+fiwv5EEQL/J6Q8/k/xTZjfOjE/N868O1IV72bkBGO3UMcyc1DIxDKZ2yZq7L
 v9TEFgOv9faZRAY+BF6GLhw4P/arurOB/VAf8mG+pxTmzT780rub6VlQAo5BJAj3WqwC
 p9Ig==
X-Gm-Message-State: AOAM533q6pdQgwWJywY+g0RfzcMkDRghStWiaAa4/axoZ/zDPpB8tkb7
 G/jKmFkEMNnBrRAV14MyvzKmFoMNKHS8/a5IUdc3BViNCpIY2Mb+71DarP3Bv7jC/xe84Xcmtc6
 PEsd930+1RhIE3sg=
X-Received: by 2002:a17:906:8152:: with SMTP id
 z18mr88719ejw.153.1632926807259; 
 Wed, 29 Sep 2021 07:46:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiFY1vf3Cca7gX59ut23tjRd5ZCOR9XoyTYy71iJ46h7FI4W2OZmAneqGFthranJ+PoIN61Q==
X-Received: by 2002:a17:906:8152:: with SMTP id
 z18mr88688ejw.153.1632926806985; 
 Wed, 29 Sep 2021 07:46:46 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id p14sm40715ejn.65.2021.09.29.07.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 07:46:46 -0700 (PDT)
Date: Wed, 29 Sep 2021 16:46:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [External] Re: [PATCH] hostmem: change default prealloc threads
 number
Message-ID: <20210929164645.5a770110@redhat.com>
In-Reply-To: <YVQwX3RHcafMwMgy@redhat.com>
References: <20210927131951.1810823-1-user@n248-145-203>
 <b14aebb1-489b-b15b-f9eb-047073920175@redhat.com>
 <e1a98460-ad0a-9b9c-5958-bb39635886ec@bytedance.com>
 <20210929110531.0724f911@redhat.com> <YVQwX3RHcafMwMgy@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mikughoull@gmail.com, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, ehabkost@redhat.com,
 Nan Wang <wangnan.light@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Sep 2021 10:22:39 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Wed, Sep 29, 2021 at 11:05:31AM +0200, Igor Mammedov wrote:
> > On Tue, 28 Sep 2021 00:47:01 +0800
> > Nan Wang <wangnan.light@bytedance.com> wrote:
> >  =20
> > > On 2021/9/27 11:16, David Hildenbrand wrote: =20
> > > > On 27.09.21 15:19, Nan Wang wrote:   =20
> > > >> From: "wangnan.light" <wangnan.light@bytedance.com>
> > > >>
> > > >> the default number of prealloc threads is 1, for huge memory backe=
nd
> > > >> file, single thread touch page is really slow.
> > > >> We can adjust thread number by prealloc-threads property, but if t=
he
> > > >> default value updated to MachineState::smp::cpus may be better.
> > > >> For example, old version of qemu(prealloc-threads have not been
> > > >> introduced yet), the value of threads num is MachineState::smp::cp=
us,
> > > >> so if someone use the same commandline to start current verion of =
qemu
> > > >> and old version of qemu which will lead to different behaviors.   =
=20
> > > >=20
> > > > The introducing patch mentions:
> > > >=20
> > > > commit ffac16fab33bb42f17e47624985220c1fd864e9d
> > > > Author: Igor Mammedov <imammedo@redhat.com>
> > > > Date:=C2=A0=C2=A0 Wed Feb 19 11:09:50 2020 -0500
> > > >=20
> > > >  =C2=A0=C2=A0=C2=A0 hostmem: introduce "prealloc-threads" property
> > > >=20
> > > >  =C2=A0=C2=A0=C2=A0 the property will allow user to specify number =
of threads to use
> > > >  =C2=A0=C2=A0=C2=A0 in pre-allocation stage. It also will allow to =
reduce implicit
> > > >  =C2=A0=C2=A0=C2=A0 hostmem dependency on current_machine.
> > > >  =C2=A0=C2=A0=C2=A0 On object creation it will default to 1, but vi=
a machine
> > > >  =C2=A0=C2=A0=C2=A0 compat property it will be updated to MachineSt=
ate::smp::cpus
> > > >  =C2=A0=C2=A0=C2=A0 to keep current behavior for hostmem and main R=
AM (which is
> > > >  =C2=A0=C2=A0=C2=A0 now also hostmem based).
> > > >=20
> > > > So it looks like we want to do the latter via compat properties eve=
ntually.
> > > >=20
> > > > However, I'd like to note that more prealloc threads might be good =
for=20
> > > > large backends, and might be bad for small backends. To me, it feel=
s=20
> > > > like a workload that relies on this should really do this manually.=
 So I=20
> > > > am still not sure if this is the right thing to do.   =20
> > > Yes, I agree with you "more prealloc threas are good for large backen=
ds,=20
> > > and bad for small backends". But I think most situation large backend=
s=20
> > > always with large vcpu numbers and small backens always with small vc=
pu=20
> > > numbers, because most users will not create a vm with large vcpu numb=
ers=20
> > > with small memory.
> > >=20
> > >  =20
> > > >=20
> > > > Note that qapi/qom.json:
> > > >=20
> > > > "@prealloc-threads: number of CPU threads to use for prealloc (defa=
ult:=20
> > > > 1", so that doc would be wrong now.
> > > >=20
> > > > Why exactly can't workload that cares not simply set this manually?=
=20
> > > > Performance tuning smells like something to be done manually for a=
=20
> > > > specific workload.
> > > >   =20
> > > It is a simply way that let workload set the prealloc threads manuall=
y.=20
> > > For example, for large backends it set many prealloc threads, and set=
 1=20
> > > prealloc threads manually for small backends. Yes, workload can=20
> > > `maunally` set prealloc thread to 1, rather than use `default` value =
1.
> > > So when workload want to(or maybe just forget specify the=20
> > > prealloc-threads property) use the default value, I think the=20
> > > MachineState::smp::cpus maybe better than 1. =20
> >=20
> > as commit mentioned by David states, it creates implicit dependency
> > on Machine and we were working getting rid of such dependencies
> > where it's possible.
> >=20
> > So if you have to change prealloc-threads to a larger number,
> > you can try to use specific machine compat properties to do it,
> > instead of pushing machine to generic backend code. But 'good'
> > default for your workload doesn't guaranties it's a good one
> > another.
> >=20
> > My preference is that user (mgmt layer) should set property
> > explicitly if it cares. It's leads to more stable VM config,
> > as opposed to using defaults which could change over time and
> > unexpectedly 'regress' such VMs, and can factor in host/workload
> > specific nuances without need to change QEMU. =20
>=20
> Setting prealloc_threads to match vCPUs count feels like it is making
> an assumption that if we've allowed 4 vCPUs, it is OK for the prealloc
> to consume 4 host CPUs. This assumption could be tricky when QEMU is
> strictly pinned to host CPUs, as vCPU threads are pinned to some pCPUs
> but emulator threads might be pinned differently.
>=20
> Would there still be a performance advantage to prealloc_threads > 1,
> if all non-vCPU threads are pinned to the same single host CPU ?

I'd imagine it will only introduce unnecessary task contention.
Current conservative default (1) is the best we can do without
knowing workload/host configuration, since it affects host and
already running VMs less than higher number of pre-allocation
threads.
=20

>=20
>=20
> Regards,
> Daniel


