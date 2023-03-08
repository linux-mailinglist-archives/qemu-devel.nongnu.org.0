Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648346AFF2D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 07:58:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZnkQ-0005wH-Mo; Wed, 08 Mar 2023 01:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZnkL-0005w4-Mm
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 01:57:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZnkJ-0003LU-Nu
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 01:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678258674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=drxGmX9PbefFjg4Geb0j3yCZvDf6ju87+Da1AT51tPE=;
 b=O9b3zCODv1Dh/EbKab1KYUppA6GUVqTlLTf7lJRStSfDJ1f/e+5AuYrFLkFFpEaosYVfLS
 89nKlc6EApr+OnXA3eSimtCl8YKYVuYZ3twphtCPa3E8jB0CBnexiRNeHEXfmo+EaYmjgh
 eA75GAgj3oCYBMJEYtqCsm97xRiwORs=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-YTTPahx_NCiABIBqYNcVbw-1; Wed, 08 Mar 2023 01:57:53 -0500
X-MC-Unique: YTTPahx_NCiABIBqYNcVbw-1
Received: by mail-ot1-f72.google.com with SMTP id
 s21-20020a056830149500b0069455bb5d96so5898752otq.23
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 22:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678258672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=drxGmX9PbefFjg4Geb0j3yCZvDf6ju87+Da1AT51tPE=;
 b=1kfZQ0xdB2Ciz6P5omqfe7X3Ttg6tCHHS9szdcHAyRCVvh5te8dao6L+whdlH+BMqq
 h0Fi/2XwD47+5M76rnbCfOv9CgsP7Hb+TgIZi15J7Cf1Xp3dmPjE538BMyFbSGX0mKCI
 oRGIOIDRQH8v2nDKWlb4Ke3zJzzJTP26L7hRNrjRj1F3wZ8GG9dBxWVCqTzyz8SWJO8+
 oW/fe6+dads/PDGHR0bEH1QsOE40UBz6O0rcolFFcDSUOiHL4ysjmpKbhmwPvsRVY/SK
 Im/xC6cmJ+z7QCquWbJO71fqdrA6o0eHuT5TsGKEi+Lbb5phN5avLHX1GETYb14ZSYi/
 ZIgA==
X-Gm-Message-State: AO0yUKVlRulK6YmNyaVEryv5+2s3sX+bWkRQkXE4f6igHw4FbszPoVYI
 3Fs98uHyzc1C1k/TBoVjWb1rl7DiR36XAcwkuc9stsei5NxeVOCnAlnQxond08konY7QFyEKJQn
 G/0aW4l8CzbqfxJIkBv3pz3rVeNlKxxU=
X-Received: by 2002:a9d:6147:0:b0:690:e27e:503c with SMTP id
 c7-20020a9d6147000000b00690e27e503cmr5651648otk.4.1678258672652; 
 Tue, 07 Mar 2023 22:57:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9lGKdOQPhV1uV7VpST6r+KZ+9gj7ZGlNmFgWy04Hh+meeeIsPvJ/Juk6EWkqArfsxkzrJP/eVUgnI58qG5wHA=
X-Received: by 2002:a9d:6147:0:b0:690:e27e:503c with SMTP id
 c7-20020a9d6147000000b00690e27e503cmr5651645otk.4.1678258672440; Tue, 07 Mar
 2023 22:57:52 -0800 (PST)
MIME-Version: 1.0
References: <20230307070816.34833-1-jasowang@redhat.com>
 <CAFEAcA_Pctm1m30Cm2Q2cpyp9JmNgej5nB0ovZGtjfFHU2R9SQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_Pctm1m30Cm2Q2cpyp9JmNgej5nB0ovZGtjfFHU2R9SQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 8 Mar 2023 14:57:41 +0800
Message-ID: <CACGkMEtNYvkiXGe1y70_zWSvXiYP6k5WKVEAZNOexy6G5aGH8w@mail.gmail.com>
Subject: Re: [PULL 00/51] Net patches
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Wed, Mar 8, 2023 at 1:01=E2=80=AFAM Peter Maydell <peter.maydell@linaro.=
org> wrote:
>
> On Tue, 7 Mar 2023 at 07:08, Jason Wang <jasowang@redhat.com> wrote:
> >
> > The following changes since commit 817fd33836e73812df2f1907612b57750fcb=
9491:
> >
> >   Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lureau=
/qemu into staging (2023-03-06 14:06:06 +0000)
> >
> > are available in the git repository at:
> >
> >   https://github.com/jasowang/qemu.git tags/net-pull-request
> >
> > for you to fetch changes up to c19b566a3898510ec2b3e881b3fb78614b240414=
:
> >
> >   hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by EEPRO100() (2023=
-03-07 14:55:39 +0800)
> >
> > ----------------------------------------------------------------
> >
> > ----------------------------------------------------------------
>
> Fails to build on Windows:
> https://gitlab.com/qemu-project/qemu/-/jobs/3889073853
> https://gitlab.com/qemu-project/qemu/-/jobs/3889073855
> https://gitlab.com/qemu-project/qemu/-/jobs/3889073780
> https://gitlab.com/qemu-project/qemu/-/jobs/3889073778
>
> ../tests/qtest/igb-test.c: In function 'data_test_init':
> ../tests/qtest/igb-test.c:219:15: error: implicit declaration of
> function 'socketpair'; did you mean 'socket_uri'?
> [-Werror=3Dimplicit-function-declaration]
> 219 | int ret =3D socketpair(PF_UNIX, SOCK_STREAM, 0, test_sockets);
> | ^~~~~~~~~~
> | socket_uri
> ../tests/qtest/igb-test.c:219:15: error: nested extern declaration of
> 'socketpair' [-Werror=3Dnested-externs]

Will add ifndef to make sure windows won't try to compile the related test.

>
> build-oss-fuzz failed on something involving fuzzing eepro100:
> https://gitlab.com/qemu-project/qemu/-/jobs/3889073821
>
> The 'crash-test' jobs failed with an assertion
> "qemu-system-i386: -device igb: MSI-X is not supported by interrupt contr=
oller":
> https://gitlab.com/qemu-project/qemu/-/jobs/3889073868
> https://gitlab.com/qemu-project/qemu/-/jobs/3889073873

This is because we use error_abort for msix/msi_init(). I think we can
gracefully fail in those cases.

Will send a new version of pull request.

Thanks

>
> thanks
> -- PMM
>


