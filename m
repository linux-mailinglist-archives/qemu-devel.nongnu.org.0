Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAB9583E66
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 14:13:01 +0200 (CEST)
Received: from localhost ([::1]:42048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH2Nw-0001Ot-CH
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 08:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH2C5-00027M-3I
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:00:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH2C3-0002JI-56
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659009642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNEhgI3RYTlVQuhabd9H2P9wS7SiApQP2A7A3ILkBoU=;
 b=fgXUCzugAakrnTqtxn/5rwYYrFac8IZMofSgrH1fslPjije0Q1E5H399uuwHbkLBLVB55H
 TcDzf9vNR1eseliiz5BQ5l0CWzb/C+SMT9g999A42aIBe2/CMGyqYKXIVGXjS3pkZPT1Eo
 5+S7IR7ZsTAlvVlkDwAM1SSCrOfSm8I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-S3aoNT1sP8apK2h2p4X1ZQ-1; Thu, 28 Jul 2022 08:00:41 -0400
X-MC-Unique: S3aoNT1sP8apK2h2p4X1ZQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 ga9-20020a1709070c0900b0072b4d787f5dso549854ejc.21
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 05:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oNEhgI3RYTlVQuhabd9H2P9wS7SiApQP2A7A3ILkBoU=;
 b=lumoUu096Ur5LAAYhds9F9qrEfcFBI5pgKAtThRZei8Oj5Q6oK04z0qYIh2XhPGiQT
 5lFpeeBt7i1jxjbbU5Pg8NQbeJnXuqtdRZbsl+fOZmUN+IXMf8jpCi4NhncNZKQDQ/L/
 6cXEy53MBdl34g8MHWDRBIPGmpsvlwoJYLYcxOjDyM2XfsFGlyUrvtpHld+lCF8Z8MEw
 WwYRyIyoZd1D1LDrWHhYTEshdd+hsDQA711e6OoX+suq3lui/De7f7JqMUBODhqMytau
 2HiDwU12Ng0qPc/F3N272tahXGZQE39KvWmFwZqQ0B/pMMtCiEo4Fmov5A4Xvah7r8N5
 r3wA==
X-Gm-Message-State: AJIora//IrPgvJZYGNuXcXC+guWvRTxM+ngIaIvzupVSsLalAadJMGRh
 ibrUXLPuYnie5mzg+6yTXKWIrdPp472O10JPZbylqumqfrIhTKiNJhojyFVv1T/pzkFGUutK6NC
 w3Uj/PR5WrkadRRQ=
X-Received: by 2002:a17:907:9809:b0:72f:817:d433 with SMTP id
 ji9-20020a170907980900b0072f0817d433mr20999285ejc.483.1659009640033; 
 Thu, 28 Jul 2022 05:00:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v/2yWRl8fdtH/xv4TpwqjvCI+LPUtJarhmTwJwtt2x+PBUfB+OY6gqCNVRorPMlhc490rSZA==
X-Received: by 2002:a17:907:9809:b0:72f:817:d433 with SMTP id
 ji9-20020a170907980900b0072f0817d433mr20999273ejc.483.1659009639750; 
 Thu, 28 Jul 2022 05:00:39 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b12-20020aa7df8c000000b0043ba0cf5dbasm590158edy.2.2022.07.28.05.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 05:00:39 -0700 (PDT)
Date: Thu, 28 Jul 2022 14:00:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 mst@redhat.com, t0rr3sp3dr0@gmail.com, alex.bennee@linaro.org,
 dgilbert@redhat.com, agraf@suse.de
Subject: Re: [PATCH for-7.1] applesmc: silence invalid key warning in case
 default one is used
Message-ID: <20220728140037.4b1456ae@redhat.com>
In-Reply-To: <YuJjhHLzQEx4Ui1J@redhat.com>
References: <20220728093558.1163751-1-imammedo@redhat.com>
 <YuJbaxMbqNF+Cw65@redhat.com>
 <CAFEAcA85qvEjV53XMs3uDWKqzY4vrLqxfLKjZ_qfbrYMmfkx=Q@mail.gmail.com>
 <YuJjhHLzQEx4Ui1J@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jul 2022 11:23:00 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Thu, Jul 28, 2022 at 11:05:13AM +0100, Peter Maydell wrote:
> > On Thu, 28 Jul 2022 at 10:48, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote: =20
> > >
> > > On Thu, Jul 28, 2022 at 05:35:58AM -0400, Igor Mammedov wrote: =20
> > > > QEMU probably can't carry OSK key[1] for legal reasons so it
> > > > can't supply the valid default key. However when tests are run
> > > > applesmc will pollute test log with distracting warning,
> > > > silence that warning so it won't distract maintainers/CI. =20
> > >
> > > What test is causing this problem ? =20
> >=20
> > bios-tables-test -- see here for the relevant bit of the log:
> >=20
> > https://lore.kernel.org/qemu-devel/CAFEAcA8u8jm7b+JD_t0qMNMy+WSJPOw=3Dq=
xqptZpwTp=3DTkcXrhg@mail.gmail.com/ =20
>=20
> The right fix is for bios-tables-tests to pass an explicit 'osk' value
> then. As its a test it doesn't have to be a genuine OSK, jsut any old
> 64-byte string
>=20
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index 359916c228..f6b5adf200 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1632,7 +1632,7 @@ static void test_acpi_q35_applesmc(void)
>          .variant =3D ".applesmc",
>      };
> =20
> -    test_acpi_one("-device isa-applesmc", &data);
> +    test_acpi_one("-device isa-applesmc,osk=3Diamalsonottherealoskimjust=
heretostopbiostablestestspammingstderr", &data);
>      free_test_data(&data);
>  }

that will work, care tho send a formal patch or should I take over?

However we still have bogus default_osk, yes it will cause warning which
typically nobody will see and end user will still end up with upset guest.
Right thing would be to require osk explicitly and drop default completely.
Users who actually run MacOS guest must be providing OSK explicitly already
so they won't be affected and anyone else using default is broken anyways
(whether QEMU started directly or through mgmt layer)

>=20
>=20
> With regards,
> Daniel


