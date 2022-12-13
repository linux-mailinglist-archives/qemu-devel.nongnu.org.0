Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F9164B734
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 15:21:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5690-0000V3-TZ; Tue, 13 Dec 2022 09:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p568f-0000PC-Va
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:20:17 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p568a-0002f8-S6
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:20:07 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 142so10518839pga.1
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 06:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=urT1zTVUnxWt6Zlduxqp8J18epbTSonIDiU4OzqW0Ps=;
 b=U92zEqrOgXwA7MSJoMkaJNCZpieURFBCW9cHiiU5TZIvTEwpPgBKbq8UeQUPhii5at
 kF3tAj5oLVUlPjgL7HParoZ2IqkhpU/TOZ0m9GWnUhi6SPYH10ySs+y3lppT272UjzRH
 pwJCWw5gWSPUi6/nyvfk4fkt8rHPk4Ic0Lfy107pgkjAb2apMzryLSbEbeg28a2ZbKcr
 FP6AKXleJqdcSvqKqHbUi2p1XcsaTcQ0b4FHyrExJ7BzZNst//+0efRIqVJpNPntroOd
 kzEk8VohNaYk8VpBU1ynBF3cZ3d3FhUAMGVN3Ur7srEEyje2rDWRP9hgBZVJy4zXh/j1
 FLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=urT1zTVUnxWt6Zlduxqp8J18epbTSonIDiU4OzqW0Ps=;
 b=sBUKaDMriRxVtw6nO9QgAN1Yem/1rfOdQ3hhYXffStOPzsOoMwiKfZ44zvYzbsrYer
 Pt94uPUIuD80ODLRgNyYcznzUt1HGk6At6MIw9YWp2LY5Y7OUXBKVaWjYaQL1/C2cHeU
 5HWoUm11UdhwsuKTBrgZ6cDYZz16D80LkKkgMyP8sU8KBJqK/dxSX4j/CaI95454v0hL
 4KIkPO18sfk4AM0VklyhThERrtV7thGGbD52nd2CqTZuN6dXOeOqIhhP0WElyhYahbdH
 f7jVFR/GfmhjU16N7uiynAlNt3EPg0YvbMfAkEJjBx+c7dYCKeD/RFKhIhiGe8G0zhZI
 avhQ==
X-Gm-Message-State: ANoB5pk+cABHFWg9p+b6Ozng0ldpl98rJiH2h8zi8VOY7ss4BD6PXU+t
 BVW7rN+8c0GWXCFUCSiRwCOyvH2zJUoh5RTUhic/ag==
X-Google-Smtp-Source: AA0mqf5Z24btAL+ccMzCGC/KXpMSGr6iFb8davDxQHnOTDDADcUckzhs8O0FYYjvr0gYqsRSdyR4b8qxCaQsdjM3nBk=
X-Received: by 2002:a63:c149:0:b0:477:86c1:640f with SMTP id
 p9-20020a63c149000000b0047786c1640fmr558958pgi.231.1670941201755; Tue, 13 Dec
 2022 06:20:01 -0800 (PST)
MIME-Version: 1.0
References: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
 <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
 <CAJSP0QUMRipTMiYMSftQQe+A3aaF553KpJeSgBaS9vY7X4aD0w@mail.gmail.com>
In-Reply-To: <CAJSP0QUMRipTMiYMSftQQe+A3aaF553KpJeSgBaS9vY7X4aD0w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 14:19:50 +0000
Message-ID: <CAFEAcA8S-ixvKuTOHWJVVL8QbtVynhg7gPPhzovJ+rZBn3JtsQ@mail.gmail.com>
Subject: Re: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Mark Burton <mburton@qti.qualcomm.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Brian Cain <bcain@quicinc.com>, 
 Warner Losh <imp@bsdimp.com>, Luc Michel <luc@lmichel.fr>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Alessandro Di Federico <ale@rev.ng>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Anton Johansson <anjo@rev.ng>, Michal Privoznik <mprivozn@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Denis V. Lunev" <den@virtuozzo.com>, Cleber Rosa <cleber@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Dominik Csapak <d.csapak@proxmox.com>,
 Christophe de Dinechin <dinechin@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jagannathan Raman <jag.raman@oracle.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, 
 Dongli Zhang <dongli.zhang@oracle.com>, afaerber@suse.de,
 andrea.arcangeli@redhat.com, 
 bazulay@redhat.com, bbauman@redhat.com, cjia@nvidia.com, cw@f00f.org, 
 digitaleric@google.com, dustin.kirkland@canonical.com, 
 Eric Blake <eblake@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 felipe@nutanix.com, iggy@theiggy.com, Jan Kiszka <jan.kiszka@web.de>,
 Jason Gunthorpe <jgg@nvidia.com>, 
 jidong.xiao@gmail.com, jjherne@linux.vnet.ibm.com, 
 Joao Martins <joao.m.martins@oracle.com>, mburton@qti.qualcom.com,
 mdean@redhat.com, 
 mimu@linux.vnet.ibm.com, z.huo@139.com, zwu.kernel@gmail.com, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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

On Tue, 13 Dec 2022 at 14:17, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Tue, 13 Dec 2022 at 09:08, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
> >
> > On 12/12/22 00:41, Philippe Mathieu-Daud=C3=A9 wrote:
> > > The call will be Tuesday, December 13 at 3pm CET on this Bluejeans li=
nk:
> > > http://bluejeans.com/quintela
> > We moved the call here:
> >
> > https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYt=
OGY5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2
>
> Please use a video conferencing system that allows people to join
> without logging in and works across browsers. I gave up on Teams.

Unfortunately this was a last minute thing, because only Juan
has the code to make the bluejeans meeting work, and he didn't
turn up in the meeting :-(

-- PMM

