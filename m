Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9151B6F67C6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 10:50:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puUeb-0002O4-KA; Thu, 04 May 2023 04:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puUeZ-0002Nv-6d
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puUeX-0006gW-F0
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683190168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htEUoH+5lnl6ejMPMq5/cLoCz2Tf4PuSGcGsktFseiE=;
 b=hKEniu3QpOCOfrqZpHscg1iEdCx5NV1pnYnp1HtXlxag1p9szF05VpZxTzWNz+gNjsHblI
 1UJW1apQgi+EqBiQoR2tBmIbRklaXRFpBk+9trc4NpmtakrJYTeW+xI7Mg0loTv0CptEoC
 4gcI9WX2mbmW7C/XX/jVUWbC3asZAyM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-qm0Y3ARsPjeepF1wYnKyMw-1; Thu, 04 May 2023 04:49:27 -0400
X-MC-Unique: qm0Y3ARsPjeepF1wYnKyMw-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1aafb2766e0so749505ad.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 01:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683190166; x=1685782166;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=htEUoH+5lnl6ejMPMq5/cLoCz2Tf4PuSGcGsktFseiE=;
 b=dA/DJbP3HqC/f6eqN5rveVfEsg+rgAKrqDZsBS0dEcQhezXPqh/E/qJOZikui1/AZp
 EXJylVRq9FFMHtzhiyTc9kcxkIiB8WDkso8Bekg+npNczQvYgqf20ugXfd6Eopo3XHgj
 opr8FWMh7wnEdpEQD0nDHfME7n+deu9G/wp8MMybNsF7djd41d25mJRIx8A/9uK2nLAe
 dzQY/n5rgyyvXG4mC/CXFE3065zTL+yqV9AzdQnpBHnVNVBMUfojrw982i805hOtlfLY
 SsMAYdV7SUu09aU7I9wA8lb3AvNkc128xqcYc1vGLEnfMSYbwJNLVXJ4b9V9uPfz4PHh
 nMzw==
X-Gm-Message-State: AC+VfDy43tpRLXhP8HARdVkYebqD1+gL9NH8DPfi41pvSKBi/2bcNZZv
 GnOTy+OqtaAvjeRLPlhcvsVo1ViXew94jlAo4XtT0SdO16KHw+gZTXx9gIWZzvrEWCRXDvx3SZP
 vZkVkd7OAkpl4YZsxjyGcHBg=
X-Received: by 2002:a17:902:da8c:b0:1a6:3b9c:7fea with SMTP id
 j12-20020a170902da8c00b001a63b9c7feamr3691681plx.36.1683190166353; 
 Thu, 04 May 2023 01:49:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6CU7/TVQCXWARlFwIzqjoqgB0sCi8dC4F+8CMRH6zngREfWDtNjRSZanAcQbZGJJOAT7lz7w==
X-Received: by 2002:a17:902:da8c:b0:1a6:3b9c:7fea with SMTP id
 j12-20020a170902da8c00b001a63b9c7feamr3691665plx.36.1683190166062; 
 Thu, 04 May 2023 01:49:26 -0700 (PDT)
Received: from smtpclient.apple ([115.96.136.25])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a1709028a8500b001ab0d815dbbsm4526989plo.23.2023.05.04.01.49.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 May 2023 01:49:25 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH 0/2] Add mformat and xorriso dependencies in containers
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <ZFNmhT9Fosay1bee@redhat.com>
Date: Thu, 4 May 2023 14:19:21 +0530
Cc: Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org, philmd@linaro.org,
 wainersm@redhat.com, bleal@redhat.com, qemu-devel@nongnu.org,
 mst@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <550DF0FD-701E-408D-924B-C33ABC0BFF10@redhat.com>
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
> It looks like this series wasn't tested, because it doesn't even =
install
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

Wait, it seems xorriso package also provides geninsoimage?

xorriso-1.5.4-4.el9.x86_64 : ISO-9660 and Rock Ridge image manipulation =
tool
Repo        : @System
Matched from:
Filename    : /usr/bin/genisoimage

xorriso-1.5.4-4.el9.x86_64 : ISO-9660 and Rock Ridge image manipulation =
tool
Repo        : rhel-9-for-x86_64-appstream-rpms
Matched from:
Filename    : /usr/bin/genisoimage

$ rpm -ql  xorriso-1.5.4-4.el9.x86_64 | grep bin
/usr/bin/cdrecord
/usr/bin/genisoimage
/usr/bin/mkisofs
/usr/bin/osirrox
/usr/bin/wodim
/usr/bin/xorrecord
/usr/bin/xorriso
/usr/bin/xorriso-dd-target
/usr/bin/xorrisofs



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


