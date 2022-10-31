Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7CE6132BA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 10:30:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opR7D-0003aq-7i; Mon, 31 Oct 2022 05:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1opR7B-0003ah-9f
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:29:53 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1opR79-0006DZ-QL
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:29:53 -0400
Received: by mail-lj1-x22b.google.com with SMTP id z24so16000792ljn.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 02:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tjuEZK/uRpRwxOAygZ9EFV9AvskXYKOIFSrIHZGz9PI=;
 b=j6i5s/G1N2zrLndCm1n8/0mEOxMd4kKi5/K9Dexk5YSWqDZ265ibE2XH3epLhEEZNl
 AdVBbOerH4xiMSVW2aNADPgp9g9m7G5S0aMZ7JYOuiiDrK0jivzhaXse8xsoNcA8pTdC
 nsObgBQ5oJlICrRtZWkxIHAJZ5pdvAqWCWq/j4mA5wrTBBxGLrh65pRuNeXfntoAg1F0
 cnMnIfIWEJwwiuwVgH4IqlbRiAKAnbrWLO05uG4Ed2AQepiYLF3TZtJtf0fw5a3zER1B
 wJSqpa8kv0juQJZB73SHfWy2nTGDlFZ0qcIdPunszp7jzenCutk723X8tmgGpxg2j1Qa
 fAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tjuEZK/uRpRwxOAygZ9EFV9AvskXYKOIFSrIHZGz9PI=;
 b=X3DuMpfoxIg5Inq6ronFx5C37nBaklj6HfdpSCBD8gwIfUrnsWVUyYfUKWKusK9c0O
 vtIh1biLsyE3W5HjHi8w1GYuxVdmrSOnqEsrrMBKLiEYShrmU2iBCaTP//pVyp2ZORqH
 aoh5iZTJaWikAHFforKZYOaxb+kq3xdTBZ/T8T/c/YPLwBMeGpLjYCVmphbyyxPZnr5g
 Ir8HYWriQ95UppTYlNtbzX7GP24uY4ajRVk+KkAmbUksYZHQoMBCEJDZld2aO2AMVHQO
 fSAoIlblKlEF/VWZEezxDnKz3StqypNLTDzn/onvTU/zW2YQ8ZkPTZp5EeVEOPfY1PMC
 XRHw==
X-Gm-Message-State: ACrzQf360eXTk73JdADhUqV0ZFlXwApRK/gWyShn19wxmq19VZ/Ldkk7
 QtnUNArBDRrAyWNT7wHIA+jWjTWbYcM0uLCdspc=
X-Google-Smtp-Source: AMsMyM6lb7H9zoogtnU4GdLOespVRAghU/WVZCKuuKC16rUejP5ru7r3vfpDT8qTs8tMbluhDM/dURp1bdf/64H6cPo=
X-Received: by 2002:a05:651c:14f:b0:277:3f46:a034 with SMTP id
 c15-20020a05651c014f00b002773f46a034mr4216077ljd.529.1667208589323; Mon, 31
 Oct 2022 02:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <CAEUhbmVvxoZD7dJbMGud5LLp3fmZTyovgXUvEEdyuneg=K_LUg@mail.gmail.com>
 <1013abdd-1e46-1121-21f5-522cb9bb5cd1@redhat.com>
 <CAEUhbmX=pVTK1VdCz6XcpYdUb8_4Og2T2BXGWEs2znpxp9c6mw@mail.gmail.com>
 <573aea01-ecac-25ef-7dfc-6a4ce5a8f89b@redhat.com>
 <c84bcda5-4927-03f9-c95f-900278a84e2b@weilnetz.de>
In-Reply-To: <c84bcda5-4927-03f9-c95f-900278a84e2b@weilnetz.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 31 Oct 2022 13:29:37 +0400
Message-ID: <CAJ+F1CJWExeG=QFhtKiTUZd5ctTtdqn9GSC6KsRWzmkW=b713g@mail.gmail.com>
Subject: Re: [PATCH 0/7] nsis: gitlab-ci: Improve QEMU Windows installer
 packaging
To: Stefan Weil <sw@weilnetz.de>
Cc: Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Stefan

On Mon, Oct 31, 2022 at 1:27 PM Stefan Weil via <qemu-devel@nongnu.org> wro=
te:
>
> Am 31.10.22 um 07:52 schrieb Thomas Huth:
>
> > On 29/10/2022 15.45, Bin Meng wrote:
> >> Stefan has reviewed / tested patch 1-3. Not sure who is going to queue
> >> these 3 patches?
> >
> > If Stefan has time for a pull request, I think he would be the best
> > fit. Stefan?
> >
> > Otherwise, maybe Marc-Andr=C3=A9 could take those patches, since he
> > apparently wrote that nsis.py script?
> >
> > (By the way, should we have an entry for that script in MAINTAINERS?
> > ... likely in the W32/W64 section?)
> >
> >  Thomas
>
>
> Thanks. I have sent a pull request now.
>
> Please excuse that some of you got that pull request e-mails twice.
>
> I used Peter's make-pullreq script for the first time and had to learn
> how it works.

Could you send a MAINTAINERS patch to add scripts/nsis.py to w32/w64?
thanks

--=20
Marc-Andr=C3=A9 Lureau

