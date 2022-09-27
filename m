Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411C95EC7E8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:35:10 +0200 (CEST)
Received: from localhost ([::1]:41548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCc0-0005xw-Q0
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odBru-0003mr-3E
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:47:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odBrs-0003rK-Fu
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:47:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664290047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q2bFtW0WFJ7hKsy9k1EsaICM1QganR5+3T4+6nwlsRE=;
 b=Vr5dF7+0RVKyFoUCYENPdld5XJjmgZhPtnqTZh6CXuOmC0nO72QMhZ4QLM5wOm4EkNoFl1
 cMPSSQNyUDw2zxK5ZXexxmTi4v3UjPozXE2ugm/u26WbLkTJCKIwqPqQAyd8ybDyQ5ar6B
 Z9KYYvZFeYorhMiTBvgdB6fg279BFTk=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-mQPAeYuXMf2lK9BoQwdOmw-1; Tue, 27 Sep 2022 10:47:23 -0400
X-MC-Unique: mQPAeYuXMf2lK9BoQwdOmw-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-127a225f703so3682738fac.9
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=q2bFtW0WFJ7hKsy9k1EsaICM1QganR5+3T4+6nwlsRE=;
 b=GvDlea4+/wCDN+ubi63nw5WWohgd/XTPuI9DykI4tEhPad39L7Xqcqe31W6lyqZv/4
 sHd7dhK9sacRQelQ+FUnJooReqV8V+nfkw0FFd0lv9z3edhShVisMquZyzSxUFugrZ6V
 O8bW89/jojvcnr00RYyIcPZU+RnmLeL/52IuEKU8GqxpFyrBvsXUwBTJw+nQmIwiJkQE
 DHEdNWEfAF99X9/a7uoH2S32Ymhj7iB17fWiZH0cBkDhTFFFiAAq3kHp9gjkB3d23XMu
 ToUqOQYy+YfGo/XXtJiUZ0P3l8JMWAXZTBWMHvUweddHYttv1YrVEagu2IA88W3Sa7hB
 Z7EA==
X-Gm-Message-State: ACrzQf2Tuwm1dln1f2DhRHW3CcdXcoz87o7Owg1h6d8ngEuzNkBXMO2D
 f/ug+ytYHFG9DD0QveiFWJJKf46ktZH7NWbn9gAPcI+IJaP7qenEv4w+C6rCzRd54LaY5tJu6tD
 tGNdu0WzbPfXzVqxUmxyUA9oxNkwxztQ=
X-Received: by 2002:a05:6808:1687:b0:347:cbd3:3dcf with SMTP id
 bb7-20020a056808168700b00347cbd33dcfmr1997672oib.53.1664290043063; 
 Tue, 27 Sep 2022 07:47:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM55LNdQoZMo2O5+VXf9Gpu/QGmYNpfqTRyamn7/xVaVspaqmN6xYx81afHXi2LMmgSSZ0Ze10kEW120sA+hGMI=
X-Received: by 2002:a05:6808:1687:b0:347:cbd3:3dcf with SMTP id
 bb7-20020a056808168700b00347cbd33dcfmr1997668oib.53.1664290042865; Tue, 27
 Sep 2022 07:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-51-bmeng.cn@gmail.com>
 <CAMxuvazWXg+qpNvhR6bDcS5XwrDN_2zd-6KDmQvGS7TPa+hTNA@mail.gmail.com>
 <CAEUhbmUjgt7WnYFmxiN2JmitOxa9fCYs7A8dPWou81dANJRMAw@mail.gmail.com>
In-Reply-To: <CAEUhbmUjgt7WnYFmxiN2JmitOxa9fCYs7A8dPWou81dANJRMAw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 18:47:11 +0400
Message-ID: <CAMxuvaxi=znkyZXKz8DVu2inKVdLFzEnP=_vOWdzBVtPew+04A@mail.gmail.com>
Subject: Re: [PATCH v4 50/54] tests/qtest: migration-test: Skip running some
 TLS cases for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 27, 2022 at 6:38 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Sep 27, 2022 at 10:33 PM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > On Tue, Sep 27, 2022 at 3:09 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Some migration test cases use TLS to communicate, but they fail on
> > > Windows with the following error messages:
> > >
> > >   qemu-system-x86_64: TLS handshake failed: Insufficient credentials =
for that request.
> > >   qemu-system-x86_64: TLS handshake failed: Error in the pull functio=
n.
> > >   query-migrate shows failed migration: TLS handshake failed: Error i=
n the pull function.
> > >
> > > Disable them temporarily.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > > I am not familar with the gnutls and simply enabling the gnutls debug
> > > output does not give me an immedidate hint on why it's failing on
> > > Windows. Disable these cases for now until someone or maintainers
> > > who may want to test this on Windows.
> > >
> > > (no changes since v1)
> >
> > Please use g_test_skip() instead of #if blocks.
> >
>
> Is there a QEMU API to detect OS?

You can use #ifdef WIN32 for that, but don't comment out code that
compiles and should be "fixed".

>
> Regards,
> Bin
>


