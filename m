Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAAB56A73E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 17:50:32 +0200 (CEST)
Received: from localhost ([::1]:43630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Tlv-0008Ft-09
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 11:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9TkO-0007Ls-NW
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:48:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9TkM-0001EH-8B
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657208933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNqvYq+tpg2HQISd0fNIQqXLNSXpo4AFUy5vE40ddrA=;
 b=HEGVnz5g/Vj5TH6mdY8YFJmX9Vn5ubORvjD10fmLKDiVtkQLdWFcH4rTB/Cj0Af4BEAijT
 1q767rlI1lKvOtxSZ0t15624WNfgpr83lHIvV+Bi+HzT3Gtad2/AfTwD4r63/cDAoe82ew
 I8K0Mlw71uBkzlVvnRndX41SckO/X04=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240--Nbgrh-VNniOtbcAfXGXeg-1; Thu, 07 Jul 2022 11:48:46 -0400
X-MC-Unique: -Nbgrh-VNniOtbcAfXGXeg-1
Received: by mail-ua1-f69.google.com with SMTP id
 l7-20020ab053c7000000b003791afd560cso5715501uaa.21
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 08:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BNqvYq+tpg2HQISd0fNIQqXLNSXpo4AFUy5vE40ddrA=;
 b=2in8LkZHHhEGoYuxwGVHvllxdKUWx7Gf4WMzA3ziiP56c+iJEBXwp6lf9/XAtrl4hQ
 ezvVTi734T0BjtTTVRcb8vLO24DzFEpuWx3lbOD8+6Yx26gCr42XTYU5Rn5F1iN8XPGm
 qsbgjVE9oN0go3R81fk1jn8Im/Bc9vdFzA5wSP+s3woxjV3x04VGjS8797BOoQw2GyTW
 2mrHnzsDwr85a616fk/knsbyAox4Ef3p13UNz0NWBjmXHh8dLbX3SqshaDE39DfqcW/R
 DEw4EC/8iBGOFVSGCG2ccL2jw0qcXgWv1wG1/pQY0SGzuVw45DevD0Gc9NM625WQ9ILT
 YsUQ==
X-Gm-Message-State: AJIora/JQFT/IZSIpatZKUWH9v6b28K/8mjHtmErPyY6FNF/FF3VyMlG
 xnQ44QMANFszuGvYuJ7KdxzsNZGyHHE01WlIfOShh44SuAYv40wShhkB4rgLgABqCOc8Zjg120E
 3ZZOzNw2zn+h3dngxIaGsyuyj0t+maac=
X-Received: by 2002:a67:dc8c:0:b0:356:c204:fd6 with SMTP id
 g12-20020a67dc8c000000b00356c2040fd6mr12198447vsk.38.1657208926194; 
 Thu, 07 Jul 2022 08:48:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tk699dtB6Oub8RhdOYMAJiYCGUyQ3bDU22OQRmTRWTEDR91INZ70nBL+SwuYIe/iRSPa7W71svh+JOBIqSkUM=
X-Received: by 2002:a67:dc8c:0:b0:356:c204:fd6 with SMTP id
 g12-20020a67dc8c000000b00356c2040fd6mr12198436vsk.38.1657208925922; Thu, 07
 Jul 2022 08:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220707040310.4163682-1-jsnow@redhat.com>
 <20220707040310.4163682-11-jsnow@redhat.com>
 <YsaaOtLYrbQseDaF@redhat.com>
In-Reply-To: <YsaaOtLYrbQseDaF@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 7 Jul 2022 11:48:35 -0400
Message-ID: <CAFn=p-axeGwhgonZR_OV7HiHqcg8BBNr=dOhY1XvrSV96jvrmw@mail.gmail.com>
Subject: Re: [PATCH v3 10/13] tests/vm: Remove docker cross-compile test from
 CentOS VM
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Jul 7, 2022 at 4:33 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, Jul 07, 2022 at 12:03:07AM -0400, John Snow wrote:
> > The fedora container has since been split apart, so there's no suitable
> > nearby target that would support "test-mingw" as it requires both x32
> > and x64 support -- so either fedora-cross-win32 nor fedora-cross-win64
> > would be truly suitable.
> >
> > Just remove this test as superfluous with our current CI infrastructure=
.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  tests/vm/centos | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/tests/vm/centos b/tests/vm/centos
> > index 3a527c47b3d..097a9ca14d3 100755
> > --- a/tests/vm/centos
> > +++ b/tests/vm/centos
> > @@ -28,7 +28,6 @@ class CentosVM(basevm.BaseVM):
> >          tar -xf $SRC_ARCHIVE;
> >          make docker-test-block@centos8 {verbose} J=3D{jobs} NETWORK=3D=
1;
> >          make docker-test-quick@centos8 {verbose} J=3D{jobs} NETWORK=3D=
1;
> > -        make docker-test-mingw@fedora  {verbose} J=3D{jobs} NETWORK=3D=
1;
>
> Well it could have been replaced with two:
>
>       make docker-test-mingw@fedora-cross-win32  {verbose} J=3D{jobs} NET=
WORK=3D1;
>       make docker-test-mingw@fedora-cross-win64  {verbose} J=3D{jobs} NET=
WORK=3D1;

but "test-mingw" expects to see the dependencies from both win32 and
win64, so I'd have to split the test-mingw target, and I am far off
course from what I wanted to be doing as-is.

>
> I don't mind either way though, and feel this is quite poiintless
> anyway, since mingw is trivial to test in containers
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

Thanks :)

--js

>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


