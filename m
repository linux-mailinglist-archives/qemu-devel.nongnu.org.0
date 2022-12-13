Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03AE64B817
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 16:10:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p56tg-0006z0-6a; Tue, 13 Dec 2022 10:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p56tb-0006xR-Rx
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:08:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p56tZ-0001P4-Lz
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670944114;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAvikJkc8fZb1oKsfCS4bbJOyfk/BVTnF4sAy2AAs58=;
 b=MkXj4ABOgq1FTGHeODBrXrnbXYEbf/Ln+N4HtAhl4ZGVMVTdRZY2HOUd2KxlF//qe3MqvB
 ZVzTumeOz4NmFeZCEK2qsDzCDKXoY/dSlpExIbMEqpZyx4Q5p6nQTEH0t2b3BQgunHXuxJ
 2RO8mamTIScyKna4yF65k8oVeuvij/s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-80-uYSoMewaNC6JgZVAoA78Yw-1; Tue, 13 Dec 2022 10:08:33 -0500
X-MC-Unique: uYSoMewaNC6JgZVAoA78Yw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i132-20020a1c3b8a000000b003d0f49bc21bso5772705wma.6
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 07:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lAvikJkc8fZb1oKsfCS4bbJOyfk/BVTnF4sAy2AAs58=;
 b=jlU0ga9fE6SUo5fdC4uMmh71lFZUiyNbGTZrF3HfNKRcdVL65tRur4OgLE38gYgjuE
 Mhj0DAtGY4yYh0hGfog+9cptJVC22CX3UUSYry/4NOG/rIwdFsKc60n+9q7b77UKUAwB
 sUx4wSK6nv2hlyIE8/DpnTZ4uMExl6YagpyhuHGfrmMWk9TjGrc7RjTsdvEX+9x1aHcR
 WwVbGiRWSoLo+WKJ02iZq2ksJki6xwq2INwEok0nb17mh1D2Zos+A/5yY65Nc9eTt8jT
 dHPd2bz92u8amqR3OvWEWlBmi2NbmKAmG67X8IAwJrsxekODLVio2TbJe2T+Jbe7RiBm
 s29A==
X-Gm-Message-State: ANoB5pkcH3R48KXy8kqePNa0SFsIaPc0p8J3msnBBCcFZR54Yso+DWa9
 U6VA99XW2gTYpsEaAmmqHPMGddDVCXh0yV8gnbytn17+mYWI/dT01z7fRgvckVUsQWMWXB64zN8
 GSsoB9grViScd4F0=
X-Received: by 2002:a7b:ca49:0:b0:3cf:8b22:76bc with SMTP id
 m9-20020a7bca49000000b003cf8b2276bcmr16173141wml.28.1670944110518; 
 Tue, 13 Dec 2022 07:08:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6+gcZBFHc01vh0y130nxRwzfCWtYMoc4mWSDCvIoAyCGQYCk1CS6yedrsMt5WOAOoETunp6w==
X-Received: by 2002:a7b:ca49:0:b0:3cf:8b22:76bc with SMTP id
 m9-20020a7bca49000000b003cf8b2276bcmr16173086wml.28.1670944110202; 
 Tue, 13 Dec 2022 07:08:30 -0800 (PST)
Received: from redhat.com ([137.101.155.210]) by smtp.gmail.com with ESMTPSA id
 o25-20020a05600c511900b003c6f8d30e40sm14565959wms.31.2022.12.13.07.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 07:08:29 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  John Snow
 <jsnow@redhat.com>,
 Mark Burton <mburton@qti.qualcomm.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,  Thomas Huth
 <thuth@redhat.com>,  Bernhard Beschow <shentey@gmail.com>,  Brian Cain
 <bcain@quicinc.com>,  Warner Losh <imp@bsdimp.com>,  Luc Michel
 <luc@lmichel.fr>,  Paul Walmsley <paul.walmsley@sifive.com>,  Alessandro
 Di Federico <ale@rev.ng>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  LIU Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Jim Shu <jim.shu@sifive.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Alistair Francis
 <alistair.francis@wdc.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Anton
 Johansson <anjo@rev.ng>,  Michal Privoznik <mprivozn@redhat.com>,  Kevin
 Wolf <kwolf@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
 "Denis V. Lunev" <den@virtuozzo.com>,  Cleber Rosa <cleber@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,  Eduardo Habkost
 <ehabkost@redhat.com>,  qemu-devel <qemu-devel@nongnu.org>,  =?utf-8?Q?Ma?=
 =?utf-8?Q?rc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Dominik Csapak
 <d.csapak@proxmox.com>,  Christophe de Dinechin <dinechin@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,  Kashyap Chamarthy
 <kchamart@redhat.com>,  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jagannathan Raman <jag.raman@oracle.com>,  Elena Ufimtseva
 <elena.ufimtseva@oracle.com>,  John G Johnson <john.g.johnson@oracle.com>,
 Dongli Zhang <dongli.zhang@oracle.com>,  afaerber@suse.de,
 andrea.arcangeli@redhat.com,  bazulay@redhat.com,  bbauman@redhat.com,
 cjia@nvidia.com,  cw@f00f.org,  digitaleric@google.com,
 dustin.kirkland@canonical.com,  Eric Blake <eblake@redhat.com>,  Eric
 Auger <eric.auger@redhat.com>,  felipe@nutanix.com,  iggy@theiggy.com,
 Jan Kiszka <jan.kiszka@web.de>,  Jason Gunthorpe <jgg@nvidia.com>,
 jidong.xiao@gmail.com,  jjherne@linux.vnet.ibm.com,  Joao Martins
 <joao.m.martins@oracle.com>,  mburton@qti.qualcom.com,  mdean@redhat.com,
 mimu@linux.vnet.ibm.com,  z.huo@139.com,  zwu.kernel@gmail.com,  Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
In-Reply-To: <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 13 Dec 2022 15:08:53
 +0100")
References: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
 <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Tue, 13 Dec 2022 16:08:28 +0100
Message-ID: <87sfhjxrwz.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> On 12/12/22 00:41, Philippe Mathieu-Daud=C3=A9 wrote:
>> Hi,
>> In the last years we had few discussions on "simplifying" QEMU
>> (system emulation / virtualization), in particular for the
>> "management layer".
>> Some of us are interested in having QEMU able to dynamically create
>> machine models. Mark Burton's current approach is via a Python script
>> which generates QMP commands. This is just another case of "management
>> layer".
>> Various problems have been raised regarding the current limitations
>> of
>> QEMU's APIs. We'd like to remember / get a broader idea on these limits
>> and look at some ideas / proposals which have been discussed / posted
>> on this list.
>> Feel free to complete your thoughts on this public etherpad:
>> https://etherpad.opendev.org/p/qemu-emulation-bof%402022-12-13
>> Topic I remember which can be good starters:
>> - Current limitations of QAPI (& QMP) model (Markus Armbruster)
>> - Adding a new qemu-runtime-$TARGET / QMP-only binary without
>> today's
>>  =C2=A0 limitations (Daniel P. Berrang=C3=A9 & Paolo Bonzini)
>> - Problem with x-exit-preconfig, reworking MachinePhaseInit state
>>  =C2=A0 machine (Paolo Bonzini)
>> Markus / Daniel / Paolo expressed their ideas on the list (the
>> historical threads are referenced in the etherpad) so reading the
>> relevant threads before the call will help to get in the topic.
>> These people don't have to be in the call, but if they can attend
>> that would be very nice :)
>> The call will be Tuesday, December 13 at 3pm CET on this Bluejeans
>> link:
>> http://bluejeans.com/quintela
> We moved the call here:
>
> https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYtOG=
Y5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2

Hi

First of all I am sorry that my calendar/alarm system failed me.

Once thold that, I have been unable to go from that link to a meet room:
- on android phone with chrome
- on android phone with firefox
- on linux host with firefox (and teams installed)
- on linux host with chrome (and teams installed)

As everybody says, it got going for indirection to indirection and at
the end (if lucky) I ended on the teams app without a room name/id.

Later, Juan.


