Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FC464B778
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 15:36:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p56Nb-0001af-07; Tue, 13 Dec 2022 09:35:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1p56NW-0001W4-E4
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:35:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1p56NU-0007pp-H4
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:35:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670942128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ckg6OFFTrxLS19ROYQuBZZw5ILkw1pqHo18bpp0uHSM=;
 b=dPGQlOXzTaXWzskpWvTeLnN5pyP1EczMKYaz/DOYaRwKshW1xWWSSbeHrhsecVy0/oagdS
 bzNB0n2fMi4BqeTb2DCXx/rj/0SvYP8xRY50oQnexkbMRm2LzTOhzPMK7oGbi+Enac37qu
 99tib9BTns+ocN59Xtcj1xp8ubHjjrw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-382-5LdErJhNPsOJRi3qiZeJ2Q-1; Tue, 13 Dec 2022 09:35:26 -0500
X-MC-Unique: 5LdErJhNPsOJRi3qiZeJ2Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 r129-20020a1c4487000000b003d153a83d27so4934410wma.0
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 06:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ckg6OFFTrxLS19ROYQuBZZw5ILkw1pqHo18bpp0uHSM=;
 b=lglYGL36vAMuA0AlJ6AGRgFGC3TBsl3uXgmAHSdQwMrcIV3a2ZUvHO1w8iLWBM+JmQ
 Hyg5Bv2FIiw478W/+6mbBwfbrhyWgGnIHPN+9hUkQqVV7MjIkP8PgFyN02duNyIL38mM
 CAHrw4Klw8X5e8dgMbkDJtJsWszn9GoAqpif97GDqxmLdKqF3HNIJeECMl5om2CsJyZ8
 vuwWOP1fNVIrM9t7uUQ4NZ5Rncgnpzks/tc9qVcNshxUKbUFRPbbN8Z4GmK52l30rBEP
 2vlsDiSxd8ctA/oPivgw/nZAPzR48+D7iWdvErKALdvaQS2uf7oMBC3lxM9c1qKl/+rS
 eaMw==
X-Gm-Message-State: ANoB5pnOVmyWhLSnkIeY34yBBq5SzLV1xu5eBVqtonjpHiomM7Orthuw
 oTY9w0DXbOWGabIN/Vx0TqzwbZE9br0QdJzUblhOTfup8tdnwoh5p9jXzEeFD5GjY9Wv9v0/PFr
 6w84niSDw0iMRUbE=
X-Received: by 2002:adf:d84f:0:b0:242:219b:614 with SMTP id
 k15-20020adfd84f000000b00242219b0614mr11585643wrl.65.1670942125366; 
 Tue, 13 Dec 2022 06:35:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6WRaJHYdK630hmdbBmiSZnWCUSBWPs2sJgAI5rSPGs21eKczGdR8sK51YkyHr8EE3Axf7PjA==
X-Received: by 2002:adf:d84f:0:b0:242:219b:614 with SMTP id
 k15-20020adfd84f000000b00242219b0614mr11585570wrl.65.1670942125082; 
 Tue, 13 Dec 2022 06:35:25 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-u.redhat.com.
 [213.175.37.12]) by smtp.gmail.com with ESMTPSA id
 x9-20020a5d54c9000000b00241cfa9333fsm11805637wrv.5.2022.12.13.06.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 06:35:24 -0800 (PST)
Date: Tue, 13 Dec 2022 15:35:21 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, John Snow
 <jsnow@redhat.com>, Mark Burton <mburton@qti.qualcomm.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth
 <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>, Bernhard Beschow
 <shentey@gmail.com>, Brian Cain <bcain@quicinc.com>, Warner Losh
 <imp@bsdimp.com>, Luc Michel <luc@lmichel.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, LIU Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>, Richard
 Henderson <richard.henderson@linaro.org>, Alistair Francis
 <alistair.francis@wdc.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>, Michal Privoznik
 <mprivozn@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Denis V. Lunev" <den@virtuozzo.com>, Cleber
 Rosa <cleber@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>, Eduardo
 Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Dominik
 Csapak <d.csapak@proxmox.com>, Christophe de Dinechin
 <dinechin@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Kashyap Chamarthy
 <kchamart@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jagannathan Raman <jag.raman@oracle.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, John G Johnson <john.g.johnson@oracle.com>,
 Dongli Zhang <dongli.zhang@oracle.com>, afaerber@suse.de,
 andrea.arcangeli@redhat.com, bazulay@redhat.com, bbauman@redhat.com,
 cjia@nvidia.com, cw@f00f.org, digitaleric@google.com,
 dustin.kirkland@canonical.com, Eric Blake <eblake@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, felipe@nutanix.com, iggy@theiggy.com, Jan Kiszka
 <jan.kiszka@web.de>, Jason Gunthorpe <jgg@nvidia.com>,
 jidong.xiao@gmail.com, jjherne@linux.vnet.ibm.com, Joao Martins
 <joao.m.martins@oracle.com>, mburton@qti.qualcom.com, mdean@redhat.com,
 mimu@linux.vnet.ibm.com, z.huo@139.com, zwu.kernel@gmail.com, Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
Message-ID: <20221213153521.692553be@imammedo.users.ipa.redhat.com>
In-Reply-To: <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
References: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
 <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 13 Dec 2022 15:08:53 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> On 12/12/22 00:41, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi,
> >=20
> > In the last years we had few discussions on "simplifying" QEMU (system=
=20
> > emulation / virtualization), in particular for the "management layer".
> >=20
> > Some of us are interested in having QEMU able to dynamically create
> > machine models. Mark Burton's current approach is via a Python script
> > which generates QMP commands. This is just another case of "management
> > layer".
> >=20
> > Various problems have been raised regarding the current limitations of
> > QEMU's APIs. We'd like to remember / get a broader idea on these limits
> > and look at some ideas / proposals which have been discussed / posted
> > on this list.
> >=20
> > Feel free to complete your thoughts on this public etherpad:
> > https://etherpad.opendev.org/p/qemu-emulation-bof%402022-12-13
> >=20
> > Topic I remember which can be good starters:
> >=20
> > - Current limitations of QAPI (& QMP) model (Markus Armbruster)
> >=20
> > - Adding a new qemu-runtime-$TARGET / QMP-only binary without today's
> >  =C2=A0 limitations (Daniel P. Berrang=C3=A9 & Paolo Bonzini)
> >=20
> > - Problem with x-exit-preconfig, reworking MachinePhaseInit state
> >  =C2=A0 machine (Paolo Bonzini)
> >=20
> > Markus / Daniel / Paolo expressed their ideas on the list (the
> > historical threads are referenced in the etherpad) so reading the
> > relevant threads before the call will help to get in the topic.
> > These people don't have to be in the call, but if they can attend
> > that would be very nice :)
> >=20
> > The call will be Tuesday, December 13 at 3pm CET on this Bluejeans link:
> > http://bluejeans.com/quintela =20
> We moved the call here:
>=20
> https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYtOG=
Y5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2

this one, required to login after which it throws out some license error wh=
atever.


