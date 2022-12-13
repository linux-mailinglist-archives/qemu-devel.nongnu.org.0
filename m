Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B833464B9F1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:39:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58Iv-0001yp-Bq; Tue, 13 Dec 2022 11:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p58It-0001tq-17
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:38:51 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p58Iq-0003wB-Ui
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:38:50 -0500
Received: by mail-wr1-x42b.google.com with SMTP id co23so16253738wrb.4
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 08:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3vrZMmcuXuHoUZFq5C3pZCRcyAQsO045vEE9Dg2nvs=;
 b=TelZBdo3AkCEWutz3BIEuUE8WHCDDr4aV7Bv/jRogZ1f7RU0ypW4MT3dnItMZ7rvNY
 oy9d9YrBdXle/V94pAM2HTaLb4FJvFy2rflcw3fhHwQVXJXUcACw11Y9VcGgOa4BxSCr
 /16TWhWP4nd06+IRYZkNDxTfeTW9hEutczp4Vs2CkAQXSPtrImH6lAge+A38chaWgLEU
 wcWjgUZSq5ltvC/eOx58KtZBPDredb7bHf4t7Cy6neB0dpHDCYW6SE1rohSxe1ZAcl8D
 0xkttNYPuH534Ii2iV4bWgsNTRE06L/uY/MLVt1YD4rO+vKRBLPwqTyrkOrkiDC+MJAH
 hf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=k3vrZMmcuXuHoUZFq5C3pZCRcyAQsO045vEE9Dg2nvs=;
 b=Xp8YzKmeJwzyZuWD6JccgPJb9GTAr8zwIXDd1eTaCElGM50qNmCqK/EaxY3dDutt6N
 XDv7Wa2XspjUyloy/u8OeksTL2WQMnIDZ1Gc6nEx8rzaGVPPFDamsn+Y53eevzvjCykU
 KVBf+zCOJks6lRf1uZNISiy/pb2p3nngKjW4ufyh1amc+eFk9O6MMVTsUBFoGHl4+psl
 xdBKIp4HP975/ChAMVVG/91hjqhBPSWqbb94x4LdOZclBnWZddSWCyrq3+n8B+9kpDZ1
 jcG7wWHZepUZVPU6PxF282aqtBxFw/uOwY+8uefwE8mSz5OmVeF/e32d4qrNeCZn18fC
 qnzQ==
X-Gm-Message-State: ANoB5plfGE87GOhIx1bUzNn3PCxwUu/wyOx6A+VEsDnywqfTG41TLcXp
 p7ZPh5q/F41NumVc4ssl+tUTwQ==
X-Google-Smtp-Source: AA0mqf4V2RJoiu+6eFXwQpFQUyFYhlyhC+MZwC9UYN+S1RLXEra59uX4HCU/OPsR2tT6MxCjPEOSkg==
X-Received: by 2002:adf:edc6:0:b0:242:43d1:6d8a with SMTP id
 v6-20020adfedc6000000b0024243d16d8amr14514118wro.59.1670949526995; 
 Tue, 13 Dec 2022 08:38:46 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adffd81000000b0023662d97130sm250561wrr.20.2022.12.13.08.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 08:38:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF3C31FFB7;
 Tue, 13 Dec 2022 16:38:45 +0000 (GMT)
References: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
 <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
 <87sfhjxrwz.fsf@secure.mitica>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: quintela@redhat.com
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>, Mark Burton
 <mburton@qti.qualcomm.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth
 <thuth@redhat.com>, Bernhard Beschow <shentey@gmail.com>, Brian Cain
 <bcain@quicinc.com>, Warner Losh <imp@bsdimp.com>, Luc Michel
 <luc@lmichel.fr>, Paul Walmsley <paul.walmsley@sifive.com>, Alessandro  Di
 Federico <ale@rev.ng>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 LIU Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>, Richard
 Henderson <richard.henderson@linaro.org>, Alistair Francis
 <alistair.francis@wdc.com>, Anton  Johansson <anjo@rev.ng>, Michal
 Privoznik <mprivozn@redhat.com>, Kevin  Wolf <kwolf@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, "Denis V. Lunev" <den@virtuozzo.com>,
 Cleber Rosa <cleber@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?=  Lureau <marcandre.lureau@redhat.com>, Dominik
 Csapak
 <d.csapak@proxmox.com>, Christophe de Dinechin <dinechin@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Jagannathan Raman
 <jag.raman@oracle.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, John
 G Johnson <john.g.johnson@oracle.com>, Dongli Zhang
 <dongli.zhang@oracle.com>, afaerber@suse.de, andrea.arcangeli@redhat.com,
 bazulay@redhat.com, bbauman@redhat.com, cjia@nvidia.com, cw@f00f.org,
 digitaleric@google.com, dustin.kirkland@canonical.com, Eric Blake
 <eblake@redhat.com>, Eric  Auger <eric.auger@redhat.com>,
 felipe@nutanix.com, iggy@theiggy.com, Jan Kiszka <jan.kiszka@web.de>,
 Jason Gunthorpe <jgg@nvidia.com>, jidong.xiao@gmail.com,
 jjherne@linux.vnet.ibm.com, Joao Martins <joao.m.martins@oracle.com>,
 mburton@qti.qualcom.com, mdean@redhat.com, mimu@linux.vnet.ibm.com,
 z.huo@139.com, zwu.kernel@gmail.com, Laurent  Vivier <lvivier@redhat.com>
Subject: Re: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
Date: Tue, 13 Dec 2022 16:13:57 +0000
In-reply-to: <87sfhjxrwz.fsf@secure.mitica>
Message-ID: <87359jl0mi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Juan Quintela <quintela@redhat.com> writes:

> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
>> On 12/12/22 00:41, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Hi,
>>> In the last years we had few discussions on "simplifying" QEMU
>>> (system emulation / virtualization), in particular for the
>>> "management layer".
>>> Some of us are interested in having QEMU able to dynamically create
>>> machine models. Mark Burton's current approach is via a Python script
>>> which generates QMP commands. This is just another case of "management
>>> layer".
>>> Various problems have been raised regarding the current limitations
>>> of
>>> QEMU's APIs. We'd like to remember / get a broader idea on these limits
>>> and look at some ideas / proposals which have been discussed / posted
>>> on this list.
>>> Feel free to complete your thoughts on this public etherpad:
>>> https://etherpad.opendev.org/p/qemu-emulation-bof%402022-12-13
>>> Topic I remember which can be good starters:
>>> - Current limitations of QAPI (& QMP) model (Markus Armbruster)
>>> - Adding a new qemu-runtime-$TARGET / QMP-only binary without
>>> today's
>>>  =C2=A0 limitations (Daniel P. Berrang=C3=A9 & Paolo Bonzini)
>>> - Problem with x-exit-preconfig, reworking MachinePhaseInit state
>>>  =C2=A0 machine (Paolo Bonzini)
>>> Markus / Daniel / Paolo expressed their ideas on the list (the
>>> historical threads are referenced in the etherpad) so reading the
>>> relevant threads before the call will help to get in the topic.
>>> These people don't have to be in the call, but if they can attend
>>> that would be very nice :)
>>> The call will be Tuesday, December 13 at 3pm CET on this Bluejeans
>>> link:
>>> http://bluejeans.com/quintela
>> We moved the call here:
>>
>> https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYtO=
GY5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2
>
> Hi
>
> First of all I am sorry that my calendar/alarm system failed me.

I tried starting as a moderator myself but it needed a login. Is the
pass code personal to you or the meeting? Would it be worth adding the
pass code to the meeting details for the future.

> Once thold that, I have been unable to go from that link to a meet room:
> - on android phone with chrome
> - on android phone with firefox
> - on linux host with firefox (and teams installed)
> - on linux host with chrome (and teams installed)
>
> As everybody says, it got going for indirection to indirection and at
> the end (if lucky) I ended on the teams app without a room name/id.

Mine worked OK with Linux Chrome in web only mode. As a fallback someone
did post:

  https://play.workadventu.re/@/qemu/main/hq

a while back. More traditionally:

  https://meet.jit.si/

allows you to create meetings without sign-up.

>
> Later, Juan.


--=20
Alex Benn=C3=A9e

