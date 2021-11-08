Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEC8447F30
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 12:59:32 +0100 (CET)
Received: from localhost ([::1]:44332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk3JD-0006pr-EQ
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 06:59:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mk3HZ-0005k3-9u
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 06:57:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mk3HU-00061o-E1
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 06:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636372663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X4RW1zLyughl4DWgQO4RHNdWsaPHQa2528Lym9xiBzo=;
 b=P4+et3qQoPDYZnNox7UlDo5zm7sAgpbBoTIiU9ebiW8jIEb5zGHW5WckCw++PhS/vjrKb2
 RVFVEEYKdzTQK8FpQZTJMleRsg5VibiHnmmpzh1ixueDtiKR2CQb8EaDcrpvo4ppRElioJ
 iXWsLgkrUSEI+3fSQG9dd71AK8VbbXQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-JbOlXh59OVen_KRoFqjFWA-1; Mon, 08 Nov 2021 06:57:40 -0500
X-MC-Unique: JbOlXh59OVen_KRoFqjFWA-1
Received: by mail-pj1-f72.google.com with SMTP id
 x1-20020a17090a294100b001a6e7ba6b4eso6309868pjf.9
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 03:57:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X4RW1zLyughl4DWgQO4RHNdWsaPHQa2528Lym9xiBzo=;
 b=dWfDPwKorpcnwy8XFi7uKuTLuRPsaQujLlaw7FehoImQUUZ3OmWFbTp29+oVBVBdKT
 0bH5bTy9pLka5IXbkUM/9Pc58Ldl75uUysd1bpNx2Yr7z7BD4rGYXAns5G7AII8kVQUP
 MaXufy7kgY1eGGUpirC6Ref7I5+KYiyOGjSql32Jx/dGshwxk0iQF0K22UKXNHFqhElY
 Up8zA+ZYrDsM/3L3DK0modyRHNXs0EbE20tP29/47h5rqh9C5crdP23FvxfRjpGUW/iC
 owGcJL5h33nlqXwJrTJ0x5JQX+alPsUk8CL6ziasrREBaBbbSDSyqzW/NPCK2CghgUP0
 qXwA==
X-Gm-Message-State: AOAM532OHIepWpsLAdatQ1NXmkjr0kYl23o4s8ozoxnsDH2SwAnaHWfK
 ixPVdhYALZfbKl62+zursmXEK7v20bM4yFzl+85r6mnrOffuip0zHBVMh2FfaFJ+DyoM3Hyynhi
 ZmFGi8QLQYEfpY9cOMekp75FkME80GdE=
X-Received: by 2002:a05:6a00:1583:b0:49f:dc1c:a0fe with SMTP id
 u3-20020a056a00158300b0049fdc1ca0femr5315012pfk.46.1636372659328; 
 Mon, 08 Nov 2021 03:57:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyywuL11B1/hN6fhcJ97tqi8viSqSBhMaExd6/sqsV0Drey2zWdLK4ubUGVAgd5pFpqB+PiGTF3FAslaFG3eBQ=
X-Received: by 2002:a05:6a00:1583:b0:49f:dc1c:a0fe with SMTP id
 u3-20020a056a00158300b0049fdc1ca0femr5314971pfk.46.1636372658991; Mon, 08 Nov
 2021 03:57:38 -0800 (PST)
MIME-Version: 1.0
References: <20211105155354.154864-1-willianr@redhat.com>
 <20211105155354.154864-2-willianr@redhat.com>
 <e7d8e96b-cfca-c41f-257c-a70cb899ca9a@redhat.com>
 <YYjsvY3W27a1jUCD@redhat.com>
 <3aae05e7-823e-2761-0442-7fd92f3931c5@redhat.com>
In-Reply-To: <3aae05e7-823e-2761-0442-7fd92f3931c5@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 8 Nov 2021 08:57:13 -0300
Message-ID: <CAKJDGDY8_hvpqFeXfC=KpUHmyCVju1Z-LLdnw9JhibnQ2yeysQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tests/acceptance: introduce new check-avocado
 tartget
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 8, 2021 at 6:49 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 11/8/21 10:24, Daniel P. Berrang=C3=A9 wrote:
> > On Mon, Nov 08, 2021 at 08:59:51AM +0100, Thomas Huth wrote:
> >> On 05/11/2021 16.53, Willian Rampazzo wrote:
> >>> This introduces a new `make` target, `check-avocado`, and adds a
> >>> deprecation message about the `check-acceptance` target. This is
> >>> a preparation for renaming the `tests/acceptance` folder to
> >>>   `tests/avocado`.
> >>>
> >>> The plan is to remove the call to the `check-avocado` target one
> >>> or two months after the release and leave the warning to force
> >>> people to move to the new `check-avocado` target.
> >>>
> >>> Later, the `check-acceptance` target can be removed. The intent
> >>> is to avoid a direct impact during the current soft freeze.
> >>>
> >>> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >>> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> >>> ---
> >>>   docs/about/deprecated.rst | 13 +++++++++++++
> >>>   tests/Makefile.include    | 17 ++++++++++++-----
> >>>   2 files changed, 25 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> >>> index 56f9ad15ab..7bf8da8325 100644
> >>> --- a/docs/about/deprecated.rst
> >>> +++ b/docs/about/deprecated.rst
> >>> @@ -410,3 +410,16 @@ nanoMIPS ISA
> >>>   The ``nanoMIPS`` ISA has never been upstreamed to any compiler tool=
chain.
> >>>   As it is hard to generate binaries for it, declare it deprecated.
> >>> +
> >>> +Testing
> >>> +-------
> >>> +
> >>> +Renaming of the acceptance folder to avocado
> >>> +''''''''''''''''''''''''''''''''''''''''''''
> >>> +
> >>> +The ``tests/acceptance`` folder was never used to store acceptance t=
ests
> >>> +in terms of software engineering. This naming can confuse developers
> >>> +adding tests using the Avocado Framework to this folder. The folder
> >>> +name change to ``tests/avocado`` also changed the ``make`` target fr=
om
> >>> +``check-acceptance`` to ``check-avocado``. In this case, the use of =
the
> >>> +``check-acceptance`` target is deprecated.
> >>
> >> Not sure whether we need  to document this in deprecated.rst, too, sin=
ce
> >> we're normally only listing the things here that affect the users of t=
he
> >> qemu binaries, not the people who want to recompile and run the tests.=
..
> >> OTOH, I don't mind too much either if we list it here... Anybody else =
got an
> >> opinion on this?
> >
> > Deprecations are only things for user facing changes in the apps.
>
> OK.
>
> > For build system changes we don't bother with any deprecation cycle.
> > Just make the change immediately and document it in the release notes.
>
> Understood.
>
> Willian, do you mind updating the release notes?
> https://wiki.qemu.org/ChangeLog/6.2#Testing_and_CI
>

Sure, I can do that, but I think I need to wait for the patch to be
merged, right?


