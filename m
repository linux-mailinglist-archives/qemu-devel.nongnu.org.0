Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076416F672E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 10:23:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puUEi-00085x-F7; Thu, 04 May 2023 04:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puUEh-00085Q-7A
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:22:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puUEf-0008Ln-FA
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:22:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683188564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mXznZeEUzuNve/gG42E2V4al8vjK9SatPXcIO/sRg9Y=;
 b=To6hG3fgpCoztUh08diMONRAH6uRfyJamfJxk3mVVmLAcetnB6JH1DJStqcXrlyiKMX/IM
 20+h9WFHiotPmcK/crHb0/epY9VA9xEwdsBCkMLwFfRPaNmtKA5C2dbbtTh7Qjute6qbUW
 Y0OZgCiXD0z/6TV9bb8bbMztIkaP2OU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-LA6bIzDDO4uqXIZZlQkmew-1; Thu, 04 May 2023 04:22:43 -0400
X-MC-Unique: LA6bIzDDO4uqXIZZlQkmew-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-64388ab2864so146263b3a.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 01:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683188562; x=1685780562;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mXznZeEUzuNve/gG42E2V4al8vjK9SatPXcIO/sRg9Y=;
 b=hHbpAgRInK/pY5e3nqkJlBgoSAFOsxR8UqUsyvszPF6nOdkzEofO3deOXZVP3hQoiE
 jvUydTFdontzbmPeUZFpfbPKZXp8gYo9OmgsqA27PN5MZMVg+YnJ8rivBex9Nm3H92t4
 5nuFLWQ4u1eLVsA2qAqZQfq/UudIyrqkiNEseeenK7Cu3uNfdaeGGmuvc3PvOSSVkSnG
 YM5SrOSoEj8kytJd6zERuMLoyS5mADEZAhiNtv7tmT+xa8J8uzlren4orVrmOxrqG9XT
 t6zsEvBy59nVTXD7B0Ji3yxkYpXoRf4TvDN6S+2eWLOlUVX6NgPy0ZvSHoLVJ3UPdA1x
 /bDQ==
X-Gm-Message-State: AC+VfDzQwRYuLlywSi6jBpOpn4GlA6+1ZOT5r4GNSB5lN3pA91pDODT1
 y8H0VOL6zBZ1zCr8KWmJyIVUZrJPK1VGG5Vt1f/i7laSY8Ve8sZGrxAOxrJ2Vv2MdJKn2N/0SkI
 SnNSjjemPCy+70LI=
X-Received: by 2002:a05:6a20:54a1:b0:f0:a556:4777 with SMTP id
 i33-20020a056a2054a100b000f0a5564777mr1867025pzk.3.1683188562570; 
 Thu, 04 May 2023 01:22:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7qQk9/Z02oiaaPY6LWhK20sL7cb+SCQwS0GYvphzjCU/Jyg6Xagv8qe1qQ89Un5dirJx8pEg==
X-Received: by 2002:a05:6a20:54a1:b0:f0:a556:4777 with SMTP id
 i33-20020a056a2054a100b000f0a5564777mr1867008pzk.3.1683188562252; 
 Thu, 04 May 2023 01:22:42 -0700 (PDT)
Received: from smtpclient.apple ([115.96.136.25])
 by smtp.gmail.com with ESMTPSA id
 136-20020a63008e000000b0051806da5cd6sm21216069pga.60.2023.05.04.01.22.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 May 2023 01:22:41 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH 0/2] Add mformat and xorriso dependencies in containers
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <ZFNmhT9Fosay1bee@redhat.com>
Date: Thu, 4 May 2023 13:52:36 +0530
Cc: Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org, philmd@linaro.org,
 wainersm@redhat.com, bleal@redhat.com, qemu-devel@nongnu.org,
 mst@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <82B950B9-1C97-483F-A5A5-C755BEA1B727@redhat.com>
References: <20230503145547.202251-1-anisinha@redhat.com>
 <8d7e46ec-95c0-5c4a-a843-20106576e9ba@redhat.com>
 <ZFNmhT9Fosay1bee@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



> On 04-May-2023, at 1:32 PM, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> On Thu, May 04, 2023 at 08:35:53AM +0200, Thomas Huth wrote:
>> On 03/05/2023 16.55, Ani Sinha wrote:
>>> mformat and xorriso tools are needed by biosbits avocado tests. This =
patchset
>>> adds those two tools in the docker container images.
>>=20
>> tests/qtest/cdrom-test.c already uses genisoimage to create ISO =
images, and
>> the containers already have that tool installed. Could you maybe =
switch the
>> biosbits test to use that tool? Or the other way round? ... at least =
having
>> two tools to create ISO images in our containers sounds IMHO =
excessive.
>=20
> It looks like this series wasn't tested,

Oh I wasn=E2=80=99t sure which tests I were to run to verify this =
because https://www.qemu.org/docs/master/devel/testing.html does not =
mention any specific tests to run after:

	=E2=80=A2 Once the merge request is accepted, go back to QEMU =
and update the tests/lcitool/libvirt-ci submodule to point to a commit =
that contains the mappings.yml update. Then add the prerequisite and run =
make lcitool-refresh.

Is it =E2=80=9Cmake docker-all-tests=E2=80=9D ? Maybe we can update the =
doc. This is the first time me updating the docker images with new =
packages and I doing not touch this infrastructure part at all.

> because it doesn't even install
> the alpine image:
>=20
> ERROR: unable to select packages:
>  cdrkit-1.1.11-r3:
>    conflicts: xorriso-1.5.4-r2[cmd:mkisofs=3D1.1.11-r3]
>    satisfies: world[cdrkit]
>  xorriso-1.5.4-r2:
>    conflicts: cdrkit-1.1.11-r3[cmd:mkisofs=3D1.5.4-r2]
>    satisfies: world[xorriso]
>=20
>=20
> We definitely need to have either biosbits or cdrom-test.c changed to
> use the same tool.

=46rom what I found out so far, xorriso has more fine grained options =
and can be run with "-as mkisofs=E2=80=9D to generate the bootable iso. =
But it requires more experimentation.=20

> We can't be requiring deps that are conflicting at
> install time.
>=20
> With regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    =
https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            =
https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    =
https://www.instagram.com/dberrange :|
>=20


